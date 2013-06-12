/*
* Servlet written to handle the GBrowse pop up balloon pages
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*
* @author tair
*/

package org.tair.processor.gbrowse;

import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;

import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.querytools.gbrowse.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
* This servlet handles all requests to view detail pages that are shown
* in the gbrowse pop up descriptions. 
*/
public class GBrowseHandler implements RequestHandler {

    private String geneDetail = "/jsp/gbrowse/gene_details.jsp";

    public RequestHandlerResponse process(HttpServletRequest request )
    throws InvalidLoginException, InvalidParameterException, SQLException, 
    InvalidFormException, UnauthorizedRequestException {
        
        String updateAction = null;
        RequestHandlerResponse response = null;
        
        updateAction = request.getParameter( "update_action" );
        if ( updateAction.equals( "gene_detail" ) ) {
            response = show_detail( request );
        } else { 
            throw new InvalidParameterException ( "Invalid action requested: " + updateAction );
        } 
        
        return response;
    }
    
    private RequestHandlerResponse show_detail( HttpServletRequest request ) 
    throws SQLException, InvalidParameterException {
        
        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setPage( geneDetail );
        
        String name = null;
        DBReadManager connectionPool = null;
        DBconnection conn = null;
        GBrowseGeneModel gene = null;

        //variables of session stored attributes
        if (request.getParameter("name") != null) {
            name = (String) request.getParameter("name");
        }
        
        try {
            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();
            if ( name == null ) {
                throw new InvalidParameterException( "This gene name " + name + " does not exist.");
            } else {
                Long id = TfcGene.retrieveGeneID( conn, name );
                gene = new GBrowseGeneModel( conn, id );
            }
        
        } finally {
            connectionPool.return_connection(conn);
        }
        
        if ( gene != null ) {
            response.setAttribute("gene", gene);
        }
        
        return response;
    }
}

