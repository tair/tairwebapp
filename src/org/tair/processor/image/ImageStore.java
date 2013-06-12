/**
 *================================================================================
 * THIS SOFTWARE IS PROVIDED BY JAVAZOOM "AS IS".
 * JAVAZOOM DISCLAIMS ANY OTHER WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT
 * LIMITED TO, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE AND NONINFRINGEMENT.
 *================================================================================
 */
package org.tair.processor.image;

import java.io.Serializable;
import java.io.ByteArrayInputStream;
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

import javazoom.upload.DBStore;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;

import org.tair.tfc.TfcImage;
import org.tair.tfc.TfcTairObjectType;
import org.tair.tfc.DBconnection;
import org.tair.tfc.DBWriteManager;
import org.tair.utilities.WebApp;

/**
 * This class implements a DBStore for Oracle with Lob (Blob or Clob).
 * @author JavaZOOM
 * @version 1.1
 */
public class ImageStore extends DBStore implements Serializable
{
  public static boolean BLOBENABLED = true;
  
  public String EMPTYBLOB = "empty_blob()";
  public String EMPTYCLOB = "empty_clob()";

  public ImageStore()
  {
    super();
  }

  public Connection getConnection()
  {
    return super.getConnection();
  }

  /**
   * Do nothing at connect. We want to connect using DBconnection instead of the UpBean
   * implementation
   */
  public void connect (Object p1, Object p2, Object p3) throws UploadException
  {
  }

  /**
   * Counts database entries.
   * @return number of entries in database store
   * @throws UploadException
   */
  public int countFiles() throws UploadException
  {
    return 0;
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

        String query = "SELECT image_id form Image WHERE upper(name) =upper('" + file.getFileName() + "')";
        System.out.println("query : " + query);
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
        query = "UPDATE Image SET filesize = " + filesize + ", pixel_width = " + bi.getWidth() + ", pixel_height " + bi.getHeight() 
            + " WHERE image_id = " + image_id;
        System.out.println(query); 
        conn.setQuery( query );
        int rowsAffected = conn.executeUpdate();
        
       //Insert into ImageData table
       query = "UPDATE ImageData SET image_data = ? WHERE image_id = " + image_id;
       conn.setQuery( query );
       conn.setQueryVariable(1, file.getInpuStream(), (int)file.getFileSize() );  
       System.out.println( query );
       rowsAffected = conn.executeUpdate();
       
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
       conn.releaseResources();
       
    
    } catch (SQLException e){
        throw new UploadException(e);
    }finally {
        connectionPool.return_connection( conn );
    }
  } 
  
  /**
   * Depending on overwrite state, inserts or updates file in store.
   * @param file input file
   * @param overwrite enables/disables overwrite
   * @throws UploadException
   */
  public void store(UploadFile file, boolean overwrite, Map extra) throws UploadException
  {
    DBconnection conn = null;
    DBWriteManager connectionPool = null;
    BufferedImage bi = null;
    Long tair_object_id = null; 
    Long image_id = null;
    String filetype = null;
    String image_type = (String) extra.get("image_type");
    String description = (String) extra.get("description");

    int filesize;
    
    //get default DBconnection
    try {
        connectionPool = DBWriteManager.getInstance();
        conn = connectionPool.get_connection();
        ResultSet results = null;
        //get image information
        
        try {
            bi = ImageIO.read(file.getInpuStream() );
        } catch (IOException e) {
            throw new UploadException("IS NOT AN IMAGE : " + e);
        }
        int count=0;
        String query = "SELECT COUNT(*) as image_count from Image WHERE name = '" + file.getFileName() +"'";
        conn.setQuery( query );
        results = conn.getResultSet();
        if ( results.next() ){
            count = results.getInt("image_count");
        }
        if (count < 1 && bi != null){
            filesize = (int) (file.getFileSize() / 1000);
            
            Long tair_object_type_id = TfcTairObjectType.idForTable("Image");
 
            // Insert into TairObject table
            query = "INSERT INTO TairObject(tair_object_id, tair_object_type_id, obsolete_original_name, obsolete_tair_name, obsolete_is_obsolete)" 
                + "VALUES (TAIROBJECT_SEQ.NEXTVAL, " + tair_object_type_id + ", '" + file.getFileName() + "', '" + file.getFileName() + "', 'F')";
            conn.setInsertQuery( query, "tair_object_id" );
            tair_object_id = conn.executeInsert();
            
            if (file.getContentType().equals("image/jpeg") || file.getContentType().equals("image/pjpeg") ) {
                filetype = "JPEG";
            }else if (file.getContentType().equals("image/gif") ) {
                filetype = "GIF";
            }else if (file.getContentType().equals("application/pdf") ){
                filetype = "PDF";
            }else if (file.getContentType().equals("image/tiff") ){
                filetype = "TIFF";
            }else if (file.getContentType().equals("application/octet-stream") ){
                filetype = "BMP";
            }
            
            //Insert into Image table 
            query = "INSERT INTO Image(image_id, name, image_type, tair_object_id, image_size, file_format, pixel_width, pixel_height, original_name, description)"
                + " VALUES(IMAGE_SEQ.NEXTVAL, '" + file.getFileName().toUpperCase() + "', '" + image_type + "', " + tair_object_id + ", " + filesize + ", '" + filetype + "', " 
                + bi.getWidth() + ", " + bi.getHeight() + ", '" +file.getFileName() + "', '" + description +"')";
            System.out.println(query);
            conn.setInsertQuery( query, "image_id" );
            image_id = conn.executeInsert();
            
            //Insert into ImageData table
            query = "INSERT INTO ImageData(image_id, image_data)" 
                + " VALUES (" + image_id + ", ?)"; 
            conn.setQuery( query );
            conn.setQueryVariable(1, file.getInpuStream(), (int)file.getFileSize() );  
            conn.executeUpdate();
            System.out.println(query);
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
                    query = "INSERT INTO ImageThumbnail(image_id, image_data, pixel_width, pixel_height)" 
                        + " VALUES(" + image_id + ", ?, " + thumbnail.getWidth() + ", " + thumbnail.getHeight() + ")";
                    conn.setQuery( query );
                    conn.setQueryVariable(1, thumbnail_in, (int)thumbnail_file.length());
                    conn.executeUpdate();
                } catch (IOException e) {
                    throw new UploadException("COULD NOT MAKE THUMBNAIL IMAGE : " + e);
                } finally {
                    thumbnail_file.delete();
                }
            } else { 
                query = "INSERT INTO ImageThumbnail(image_id, image_data, pixel_width, pixel_height)"
                + " VALUES(" + image_id + ", ?, " + bi.getWidth() + ", " + bi.getHeight() + ")";
                conn.setQuery( query );
                conn.setQueryVariable(1, file.getInpuStream(), (int)file.getFileSize() );
                conn.executeUpdate();
            }
            bi.flush(); 
        }
    } catch (SQLException e){
        throw new UploadException(e);
    }finally {
        connectionPool.return_connection( conn );
    }
  }

  /**
   * Insert a new file as BLOB.
   * We have to use 2 steps :<br>
   * Step 1 : Insert an empty blob.<br>
   * Step 2 : Select for update the blob.<br>
   * @param file UploadFile to insert.
   * @throws UploadException
   */
  private void insert(UploadFile file) throws UploadException
  {
    // Insert an empty blob.
    Connection c = getConnection();
    String sql = null;
    //if (BLOBENABLED == false) sql = "INSERT INTO "+UploadBean.SQLUPLOADTABLE+" ("+UploadBean.SQLUPLOADID+","+UploadBean.SQLUPLOADFILENAME+","+UploadBean.SQLUPLOADFILE+") VALUES (?,?,"+EMPTYCLOB+")";
    //else sql = "INSERT INTO "+UploadBean.SQLUPLOADTABLE+" ("+UploadBean.SQLUPLOADID+","+UploadBean.SQLUPLOADFILENAME+","+UploadBean.SQLUPLOADFILE+") VALUES (?,?,"+EMPTYBLOB+")";
    sql = "INSERT INTO "+UploadBean.SQLUPLOADTABLE+" ("+UploadBean.SQLUPLOADID+","+UploadBean.SQLUPLOADFILENAME+","+UploadBean.SQLUPLOADFILE+") VALUES (?,?,"+EMPTYBLOB+")";
	PreparedStatement ps = null;
	ResultSet r = null;
	try 
	{
		ps = c.prepareStatement(sql);
		int id = (int) System.currentTimeMillis();
		ps.setInt(1,id);
		ps.setString(2,file.getFileName());
		int modified = ps.executeUpdate();
		// Selects the lob for update.
		sql = "SELECT "+UploadBean.SQLUPLOADFILE+" FROM "+UploadBean.SQLUPLOADTABLE+" WHERE "+UploadBean.SQLUPLOADID+" = ? FOR UPDATE";
		ps = c.prepareStatement(sql);
		ps.setInt(1,id);
		r = ps.executeQuery();
		OutputStream os = null;
		//int lobsize = 0;
		long lobsize = 0;
            // Blob support.
			Blob b = null;
			while (r.next())
			{
			  b = (Blob) r.getBlob(1);
			}
			os = b.setBinaryStream(0);
			lobsize = b.length();	
        /*
        }
		*/
        // Updates lob.
		ByteArrayInputStream is = new ByteArrayInputStream( file.getData() );
		byte[] buffer = new byte[(int)lobsize];
		int bytesRead = 0;
		while( ( bytesRead = is.read( buffer ) ) != -1 ) os.write( buffer, 0, bytesRead );
		os.close();
		is.close();			
		c.commit();
	} catch (SQLException e) 
	{
		throw new UploadException(e);
	} catch (IOException e) 
	{
		throw new UploadException(e);
	}
	finally
	{
	  closeResultSet(r);
	  closeStatement(ps);
	}	
  }

  /**
   * Updates file content.
   * @param file UploadFile to update.
   * @throws UploadException
   */
  private void update(UploadFile file) throws UploadException
  {
    Connection c = getConnection();
    // Selects the lob for update.
    String sql = "SELECT "+UploadBean.SQLUPLOADFILE+" FROM "+UploadBean.SQLUPLOADTABLE+" WHERE "+UploadBean.SQLUPLOADFILENAME+" = ? FOR UPDATE";
	PreparedStatement ps = null;
	ResultSet r = null;
	try 
	{
		ps = c.prepareStatement(sql);
		ps.setString(1,file.getFileName());
		r = ps.executeQuery();
		//int lobsize = 0;
		long lobsize = 0;
        OutputStream os = null;
		/*
        if (BLOBENABLED == false)
		{
			// Clob support.
			oracle.sql.CLOB b = null;
			while (r.next())
			{
			  b = (oracle.sql.CLOB) r.getClob(1);
			}
			os = b.getAsciiOutputStream();
			lobsize =  b.getBufferSize();			
		}
		else
		{
		*/
            // Blob support.
			Blob b = null;
			while (r.next())
			{
			  b = (Blob) r.getBlob(1);
			}
			os = b.setBinaryStream(0);
			lobsize =  b.length();			
		/*
        }
		*/
        // Updates lob.
		ByteArrayInputStream is = new ByteArrayInputStream( file.getData() );
		byte[] buffer = new byte[(int)lobsize];
		int bytesRead = 0;
		while( ( bytesRead = is.read( buffer ) ) != -1 ) os.write( buffer, 0, bytesRead );
		os.close();
		is.close();
		c.commit();
	} catch (SQLException e) {
		throw new UploadException(e);
	} catch (IOException e) {
		throw new UploadException(e);
	}
	finally
	{
	  closeResultSet(r);
	  closeStatement(ps);
	}	
  }

  /**
   * Deletes one or many files matching to a filename.
   * @param file UploadFile to delete.
   * @throws UploadException
   */
  private void delete(UploadFile file) throws UploadException
  {
    String sql = "DELETE FROM "+UploadBean.SQLUPLOADTABLE+" WHERE "+UploadBean.SQLUPLOADFILENAME+" = ?";
	PreparedStatement ps = null;
	try 
	{
		ps = getConnection().prepareStatement(sql);
		ps.setString(1,file.getFileName());
		int modified = ps.executeUpdate();
		getConnection().commit();
	} catch (SQLException e) {
		throw new UploadException(e);
	}
	finally
	{
		closeStatement(ps);
	}
  }

  /**
   * Deletes entries in database store.
   * @throws UploadException
   */
  public void reset() throws UploadException
  {
    /*
    if (getConnection() != null)
    {
      String delete = "DELETE FROM "+UploadBean.SQLUPLOADTABLE;
	  Statement s = null;
	  try 
	  {
		  s = getConnection().createStatement();
		  int deleted = s.executeUpdate(delete);
		  getConnection().commit();
	  } catch (SQLException e) {
		throw new UploadException(e);
	  }
	  finally
	  {
	  	closeStatement(s);
	  }
    }
  */
  }
}
