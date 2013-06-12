//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/02/12 21:42:53 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.io.File;

/**
 * ExpressionSearchSession is a class to encapsulate expression search 
 * attributes that are saved in user's HttpSession.  In order to facilitate
 * the show/hide functionality for different sections of the expression search
 * form, the user actually submits the form each time a new form view is 
 * requested.  This is fine, except when user specifies a file to upload
 * as part of the form, since file will automatically be uploaded the first
 * time user requests a new page view.  To avoid confusion as well as uploading
 * the file multiple times, the File object and accompanying information
 * will be saved in user's session as part of ExpressionSearchSession 
 * object.  Then, on subsequent page view, user will see feedback to 
 * confirm that the file was uploaded, but will not be able to  alter
 * the upload without starting a new search process.
 */


public class ExpressionSearchSession {

    private File uploadedFile;
    private String originalFileName;
   

    /**
     * Creates an instance of ExpressionSearchSession to store submitted
     * file data
     *
     * @param uploadedFile File instance representing uploaded file data
     * @param originalName Original name of file as it appears on user's 
     *  file system
     */
    public ExpressionSearchSession( File uploadedFile, String originalName ) {
        this.uploadedFile = uploadedFile;
        this.originalFileName = originalName;
        
    }
    
    /**
     * Determines if expression search session has an uploaded file within
     * it. Technically, since constructor requires it, this should always
     * return true if user has an instance of ExpressionSearchSession
     * in session, but this method is offered for making an explicit check
     * (as well as to allow for future params to be held here)
     *
     * @return <code>true</code> if expression search session contains a non-null
     *  File object; <code>false</code> if no File object contained in session
     *  object.
     */
    public boolean hasUploadedFile() {
        return uploadedFile != null;
    }

    /**
     * Retrieves uploaded file stored in expression search session instance
     * as a File object
     *
     * @return File stored in session 
     */
    public File getUploadedFile() {
        return uploadedFile;
    }

    /**
     * Retrieves the name of uploaded file as it appears on user's file system.
     * This value may be somewhat variable depending on browser, but is just
     * needed for giving user some confirmation of what file was uploaded.
     *
     * @return Name of uploaded file as it appears on user's file system.
     */
    public String getOriginalFileName() {
        return originalFileName;
    }


}
