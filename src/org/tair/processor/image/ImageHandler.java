/*
* Servlet written to handle the UploadBean to store images
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*
* @author tair
*/

package org.tair.processor.image;

import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;

import org.tair.community.*;
import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

import javazoom.upload.*;
import javazoom.upload.parsing.*;

/**
* This servlet uses UploadBean to upload a file to a folder.
* Default folder is $WEBAPP_HOME/WEB-INF/
*/

public class ImageHandler implements RequestHandler {

    private String searchForm = "/jsp/abrc/image/image_upload.jsp";
    private String uploadConfirm = "/jsp/abrc/image/load_confirm.jsp";
    private String linkConfirm = "/jsp/abrc/image/image_link_confirm.jsp";

    public RequestHandlerResponse process(HttpServletRequest request )
    throws InvalidLoginException, InvalidParameterException, SQLException, InvalidFormException, UnauthorizedRequestException {
        
        String updateAction = null;
        RequestHandlerResponse response = null;
        
        updateAction = request.getParameter( "update_action" );
        try {
            if ( updateAction == null ) {
                response = new RequestHandlerResponse();
                response.setPage ( searchForm );
            } else if ( updateAction.equals( "upload_files" ) ) {
                response = upload_files( request );
            } else if ( updateAction.equals("replace_image") ){
                response = replace_image( request, false);
            } else if (updateAction.equals("replace_image_links") ){
                response = replace_image( request, true);
            } else if (updateAction.equals("make_link") ){
                response = edit_link( request, "make" );
            } else if (updateAction.equals("update_links") ){
                response = update_links( request );
            } else if (updateAction.equals("delete_link") ){
                response = edit_link ( request, "delete" );
            } else {
                throw new InvalidParameterException ( "Invalid action requested: " + updateAction );
            } 
        } catch (UploadException e) {
            throw new InvalidFormException (" Upload exception " + e );
        } catch (IOException e) {
            throw new InvalidFormException ( "IOException " + e );
        }
        
        return response;
    }
    
    private RequestHandlerResponse edit_link(HttpServletRequest request, String mode) 
    throws SQLException, InvalidParameterException {
        
        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setPage( linkConfirm );

        Long tair_object_id = null; 
        String image_name = null;
        String link_type = "";
        String link_name = "";
        String clone_vec = "";
        String clone_ins = "";
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        String error = null; 

        //variables of session stored attributes
        Hashtable unstored_links = new Hashtable();
        Hashtable stored_links = new Hashtable();
        if (request.getSession().getAttribute("unstored_links") != null) {
            unstored_links = (Hashtable) request.getSession().getAttribute("unstored_links"); 
        }
        if (request.getSession().getAttribute("stored_links") != null) {
            stored_links = (Hashtable) request.getSession().getAttribute("stored_links"); 
        }
        if (request.getParameter("link_type") != null ) {
            link_type = (String) request.getParameter("link_type");
        }
        if (request.getParameter("link_name") != null ) {
            link_name = (String) request.getParameter("link_name");
        }
        if (request.getParameter("image_name") != null) {
            image_name = (String) request.getParameter("image_name");
        }
        if (request.getParameter("clone_vec") != null ) {
            clone_vec = (String) request.getParameter("clone_vec");
        }
        if (request.getParameter("clone_ins") != null ) {
            clone_ins = (String) request.getParameter("clone_ins");
        }
        if (request.getParameter("tair_object_id") != null ) {
            try {
                tair_object_id = new Long( request.getParameter("tair_object_id"));
            } catch (NumberFormatException e) {
                error = "ERROR : tair_object_id : " + request.getParameter("tair_object_id") + " is not a valid id number";
            }
        }   
        
        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.get_connection();
            if ( image_name == null ) {
                throw new InvalidParameterException( "image_name does not exist");
            } else {
                Image image = new Image( conn, image_name );
                String accepted = null;
                if (mode.equals("make") ){
                    if (link_type.equals("") || link_name.equals("") ){
                        accepted = "ERROR: cannot make link\nPlease enter a valid link name.";
                    }else{
                        if (link_type.equalsIgnoreCase("Clone") ){
                            accepted = image.make_clone_link(conn, link_type, link_name, clone_vec, clone_ins);
                        }else{
                            accepted = image.make_link(conn, link_type, link_name);
                        }
                    }
                } else if (mode.equals("delete") && tair_object_id != null){
                    // these things are not actually stored by tair object, but sometimes is element_id
                    // for linking. change it back to tair_object_id for deleting
                    if (link_type.equalsIgnoreCase("Clone") ){
                        TfcClone clone = new TfcClone(conn, tair_object_id);
                        tair_object_id = clone.get_tair_object_id();
                    }else if (link_type.equalsIgnoreCase("Vector") ){
                        TfcVector vector = new TfcVector(conn, tair_object_id);
                        tair_object_id = vector.get_tair_object_id();
                    }else if (link_type.equalsIgnoreCase("Stock") ){
                        TfcStock stock = new TfcStock(conn, tair_object_id);
                        tair_object_id = stock.get_tair_object_id();
                    }else if (link_type.equalsIgnoreCase("Library") ){
                        TfcLibrary lib = new TfcLibrary(conn, tair_object_id);
                        tair_object_id = lib.get_tair_object_id();
                    }else if (link_type.equalsIgnoreCase("Host_Strain") ){
                        TfcHostStrain host = new TfcHostStrain(conn, tair_object_id);
                        tair_object_id = host.get_tair_object_id();
                    }
                    accepted = image.delete_link(conn, tair_object_id);
                } 
                if ( accepted.equals("inserted") || accepted.equals("deleted") ){
                    Hashtable linksTable = image.get_links( conn );
                    stored_links.put( image_name, linksTable );
                } else {
                    error = accepted;
                }
            }
        
        } finally {
            connectionPool.return_connection(conn);
        }
        
        if ( stored_links != null ) {
            response.setAttribute("stored_links", stored_links);
        }
        if (unstored_links != null ) {
            response.setAttribute("unstored_links", unstored_links);
        }
        if (error != null ) {
            response.setAttribute("error", error);
            System.out.println("error : " + error);
        }
        
        return response;
    }
    private RequestHandlerResponse update_links(HttpServletRequest request) throws SQLException{
        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setPage( linkConfirm );
        
        DBReadManager connectionPool = null;
        DBconnection conn = null;
        
        //variables of session stored attributes
        Hashtable unstored_links = new Hashtable();
        Hashtable stored_links = new Hashtable();

        try {
            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();
            String[] links = null;
            if (request.getParameter("links") != null ) {
                links = ( (String) request.getParameter("links") ).split("\n");
            }
            
            for (int i=0; i<links.length; i++) { 
                String image_name = links[i].trim();
                System.out.println("image name : " + image_name + "...");
                try {
                    Image image = new Image( conn, image_name );
                    Hashtable linksTable = image.get_links( conn );
                    System.out.println(image_name + " : " + linksTable.size());
                    stored_links.put( image_name, linksTable );
                } catch (RecordNotFoundException rnfe) {
                    unstored_links.put (image_name, "Image not found in Image Database");
                }
            }
        
        } finally {
            connectionPool.return_connection(conn);
        }
        
        if ( stored_links != null ) {
            response.setAttribute("stored_links", stored_links);
        }
        if (unstored_links != null ) {
            response.setAttribute("unstored_links", unstored_links);
        }
        
        return response;
    }
    
    private RequestHandlerResponse replace_image(HttpServletRequest request, boolean remove_links)
    throws SQLException, IOException, InvalidParameterException, UploadException {
        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setPage( uploadConfirm );
        
        ImageUploadBean upBean = new ImageUploadBean();
        String filename = null;
        int filenumber = -1;
        //MultipartFormDataRequest mrequest = null;
        Vector unstored = null;
        Vector unstored_errors = null;
        Hashtable map = null;

        if ( request.getParameter("filename") != null ) { filename = (String) request.getParameter("filename"); }
        if ( request.getParameter("filenumber") != null ) { filenumber = Integer.parseInt( request.getParameter("filenumber") ); } 
        if ( request.getSession().getAttribute("upBean") != null ) { upBean = (ImageUploadBean) request.getSession().getAttribute("upBean"); }   
        if ( request.getSession().getAttribute("unstored") != null ) { unstored = (Vector) request.getSession().getAttribute("unstored"); } 
        if ( request.getSession().getAttribute("unstored_errors") != null ) { unstored_errors = (Vector) request.getSession().getAttribute("unstored_errors"); } 
        if ( request.getSession().getAttribute("mrequest_files") != null ) { map = (Hashtable) request.getSession().getAttribute("mrequest_files"); }
        
        if (filename == null || upBean == null || map == null || filenumber < 0) {
            throw new InvalidParameterException("Error in Image Handler: missing upload bean or filename. Your session may have timed out. Please go "+
            "go back to the file upload page and try again." );
        } else {
        
            /*
            * do a replace on the image
            */
            for (Enumeration e = map.keys(); e.hasMoreElements(); ){
                String fileKey = (String) e.nextElement();
                UploadFile file = (UploadFile) map.get(fileKey);
                if (file.getFileName() != null && file.getFileName().equals(filename) ){
                    upBean.replaceImage(file); 
                    unstored_errors.set(filenumber, "image_replaced"); 
                    
                    /*
                    * if replace links is true, also delete all the links
                    */
                    if (remove_links == true ) {
                        upBean.removeLinks(file);
                    }
                }
            
            }
            
            /*
            * pass on the variables in the request as an attribute
            */
            if (unstored != null) {
                response.setAttribute( "unstored" , unstored);
            }
            if (unstored_errors != null) {
                response.setAttribute( "unstored_errors" , unstored_errors);
            } 
            if (upBean != null) {
                response.setAttribute ("upBean" , upBean);
            }
            if (map != null ) {
                response.setAttribute ("mrequest_files", map);
            }
            return response;
        }
    }
    

    private RequestHandlerResponse upload_files(HttpServletRequest request) 
    throws SQLException, UploadException, IOException {
        
        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setPage( uploadConfirm ); 
        
        /*
        * variables we want to pass on in session
        */
        Vector unstored = new Vector();
        Vector unstored_errors = new Vector();
        ImageUploadBean upBean = new ImageUploadBean();
        MultipartFormDataRequest mrequest = null;
        
        /*
        * set up the database store implementation
        */
        Properties props = new Properties();
        upBean.setDatabasestoreimplementation("org.tair.processor.image.ImageStore");
        try {
            upBean.setDatabasestore("com.sybase.jdbc2.jdbc.SybDriver",
                "jdbc:jtds:sybase://scotland:4100/tairtest", props);
        } catch (java.lang.Exception e) {
            System.out.println( "LANG EXCEPTION CONNECTING TO NULL DB" );
        }
        
        /*
        * find files that can be store, and store them. otherwise add them into the
        * unstored vector, as well as the error message
        */
        if (MultipartFormDataRequest.isMultipartFormData(request)){
            mrequest = new MultipartFormDataRequest(request);
            
            //put in map variables
            Map upload_map = new HashMap();
            if (mrequest.getParameter("description") != null) {
                upload_map.put("description", mrequest.getParameter("description") );
            }else {
                upload_map.put("description", "");
            }
            upload_map.put("image_type", mrequest.getParameter("image_type") );

            Hashtable map = mrequest.getFiles();
            for (Enumeration e = map.keys(); e.hasMoreElements(); ){
                String fileKey = (String) e.nextElement();
                UploadFile file = (UploadFile) map.get(fileKey);
                if (file != null && file.getFileName() != null) {
                    String error = upBean.checkFile(file);
                    if (error != null) {
                        unstored.add(file);
                        unstored_errors.add(error);
                    }else{
                        upBean.store(mrequest, fileKey, upload_map);
                    }   
                }
            }
        }
        
        /*
        * pass on the variables in the request as an attribute
        */
        if (unstored != null) {
            response.setAttribute( "unstored" , unstored);
        }
        if (unstored_errors != null) {
            response.setAttribute( "unstored_errors" , unstored_errors);
        } 
        if (upBean != null) {
            response.setAttribute ("upBean" , upBean);
        }
        if (mrequest != null ) {
            response.setAttribute ("mrequest", mrequest);
        }
        return response;
    }
}

