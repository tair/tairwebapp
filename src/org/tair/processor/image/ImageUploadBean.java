
/**
* This class extends Javazoom's UploadBean. We use it to check the restrictions on ABRC's Images to make
* sure that there are no duplicates and that it's in the format we want for download. 
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
* 
* @author tair 
*/
package org.tair.processor.image;

import java.io.Serializable;
import java.util.Hashtable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.Properties;
import java.sql.Blob;
import java.io.BufferedInputStream;
import java.io.InputStream;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.geom.AffineTransform;
import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import java.io.FileInputStream;

import javazoom.upload.UploadBean;
import javazoom.upload.UploadFile;
import javazoom.upload.UploadException;

import org.tair.utilities.AccessionManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.utilities.WebApp;
import org.tair.querytools.Image;

import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class ImageUploadBean extends UploadBean implements Serializable
{
    public ImageUploadBean() {
        super();
    }

    /*
    * This functin will find all the links that belong to a particular Image with the image
    * name of the parameter. It will return null if no links belong. And return a Hashtable  of 
    * the links stored by keys tair_object_id
    */
    public Hashtable findImageLinks(String filename) throws SQLException {
        DBconnection conn = null;
        DBReadManager connectionPool = null;
        ResultSet results;
        ResultSet results2;
        Hashtable table = new Hashtable();
        try {
            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();
            Image image = new Image(conn, filename);
            table = image.get_links(conn);
        } catch ( SQLException e ){
            System.out.println(" * Error on checking for duplicate image links ** ");
            throw e;
        } finally {
            connectionPool.return_connection( conn );
        }
        return table;
    }

    public void removeLinks(UploadFile file) throws UploadException {
        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.get_connection();
            
            Long image_id = null;
            ResultSet results = null;
            String query = "SELECT image_id FROM Image WHERE upper(name) =upper('" + file.getFileName() + "')";
            conn.setQuery( query );
            results = conn.getResultSet();
            if ( results.next() ){
                image_id = results.getLong("image_id");
            }

            query = "DELETE From TairObject_Image WHERE image_id = " + image_id;
            System.out.println(query);
            conn.setQuery( query );
            int rowsAffected = conn.executeUpdate();

        } catch (SQLException e){
            throw new UploadException(e);
        } finally {
            connectionPool.return_connection( conn );
        }
    }

    public void replaceImage(UploadFile file) throws UploadException{
        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.get_connection();
            int filesize = (int) (file.getFileSize() / 1000);
            BufferedImage bi = null;
            Long image_id = null;
            ResultSet results = null;
            String query = "SELECT image_id FROM Image WHERE upper(name) =upper('" + file.getFileName() + "')";
            conn.setQuery( query );
            results = conn.getResultSet();
            if ( results.next() ){
                image_id = results.getLong("image_id");
            }
            try {
                bi = ImageIO.read(file.getInpuStream() );
            } catch (IOException e) {
                throw new UploadException("IS NOT AN IMAGE : " + e);
            }
    
            //Insert into Image table 
            query = "UPDATE Image SET image_size = " + filesize + ", pixel_width = " + bi.getWidth() + ", pixel_height = " + bi.getHeight()
            + " WHERE image_id = " + image_id;
            System.out.println(query);
            conn.setQuery( query );
            int rowsAffected = conn.executeUpdate();
    
            //Insert into ImageData table
            query = "UPDATE ImageData SET image_data = ? WHERE image_id = " + image_id;
            System.out.println( query );
            conn.setQuery( query );
            conn.setQueryVariable(1, file.getInpuStream(), (int)file.getFileSize() );
            rowsAffected = conn.executeUpdate();
            conn.releaseResources();

            //Insert into ImageThumbnail table
            if (bi.getHeight() > 100) {
                double scale = 100/((double)bi.getHeight() );
                int new_height = 100;
                double new_width_d = (double)bi.getWidth() * scale;
                System.out.println("double bi.getWidth : " + bi.getWidth() + " and double is " + (double)bi.getWidth());
                System.out.println("after scale multiplication : " + new_width_d);
                System.out.println("scale : " + scale);
                int new_width = (int) new_width_d;
                System.out.println("new_width : " + new_width);
                BufferedImage thumbnail_bi = new BufferedImage(new_width, new_height, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = thumbnail_bi.createGraphics();
                AffineTransform at = AffineTransform.getScaleInstance((double)new_width/bi.getWidth(), (double)new_height/bi.getHeight());
                g.drawRenderedImage(bi, at);
                String filename = WebApp.getAppRoot() + "/tmp/" + file.getFileName();
                File thumbnail_file = new File(filename);
                try {
                    ImageIO.write(thumbnail_bi,"JPG", thumbnail_file);
                    BufferedImage thumbnail = ImageIO.read(thumbnail_file);
                    InputStream thumbnail_in = new BufferedInputStream( new FileInputStream(filename));
                    //ImageInputStream thumbnail_in = ImageIO.createImageInputStream(thumbnail_file);
                    System.out.println("file is : " + thumbnail.getWidth() + " and " + thumbnail.getHeight());
                    query = "UPDATE ImageThumbnail SET image_data = ?, pixel_width = " + thumbnail.getWidth() + ", pixel_height = " + thumbnail.getHeight()
                    + " WHERE image_id = " + image_id;
                    conn.setQuery( query );
                    conn.setQueryVariable(1, thumbnail_in, (int)thumbnail_file.length());
                    conn.executeUpdate();
                } catch (IOException e) {
                    throw new UploadException("COULD NOT MAKE THUMBNAIL IMAGE : " + e);
                } finally {
                    thumbnail_file.delete();
                }
            } else { 
                query = "UPDATE ImageThumbnail SET image_data = ?, pixel_width = " + bi.getWidth() + ", pixel_height = " + bi.getHeight()
                + " WHERE image_id = " + image_id;
                conn.setQuery( query );
                conn.setQueryVariable(1, file.getInpuStream(), (int)file.getFileSize() );
                conn.executeUpdate();
            }
            bi.flush();
        
        } catch (SQLException e){
            throw new UploadException(e);
        } finally {
            connectionPool.return_connection( conn );
        }
    }
    
    /*
    * This function checks the UploadFile to see if the file is legit to add into the database
    * if it is not, it returns a String that tells what the error is. If it's legit, it will 
    * return null
    */
    public String checkFile(UploadFile file) throws SQLException {
        if (file == null) {
            return null;
        }else{
            String statement = null;
            
            /*
            * Check to make sure content type is gif, pdf or jpeg
            */
            System.out.println("CONENT TYPE : " + file.getContentType());
            if (! (file.getContentType().equals("image/jpeg") || file.getContentType().equals("image/gif") || file.getContentType().equals("application/pdf")  
                || file.getContentType().equals("image/tiff") || file.getContentType().equals("application/octet-stream") || file.getContentType().equals("image/pjpeg")) ){
                statement = "file_format";
            
            /*
            * File format is correct, so now check to see if the image name is in there already
            */
            } else {
                DBconnection conn = null;
                DBReadManager connectionPool = null;
                try {
                    connectionPool = DBReadManager.getInstance();
                    conn = connectionPool.get_connection();
                    int count = 0;
                    ResultSet results = null;
                    String query = "SELECT COUNT(*) as image_count from Image WHERE upper(name) = upper('" + file.getFileName() +"')";
                    conn.setQuery( query );
                    results = conn.getResultSet();
                    if (results.next() ){
                        count = results.getInt("image_count");
                    }
                    if (count > 0) {
                        statement = "already_exists";
                    }
                    conn.releaseResources();
                } catch ( SQLException e ){
                    System.out.println(" * Error on checking for duplicate image filename ** ");
                    throw e;
                } finally {
                    connectionPool.return_connection( conn );
                }
            }
            return statement;
        }
    }

}
