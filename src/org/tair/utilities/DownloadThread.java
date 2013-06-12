// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2006/04/01 00:09:58 $
// ------------------------------------------------------------------------------

package org.tair.utilities;


import java.sql.SQLException;
import java.util.Random;
import java.io.IOException;
import java.io.File;
import java.io.FileWriter;

import org.tair.utilities.DownloadAllHandler;
import org.tair.utilities.Debugger;


/**
 * 
 * <p>
 * Thread to handle requests for downloading all the results from a search;
 * called from the search's handler
 * 
 * within the handler a file has already been created and the contents of that
 * file state to the user that the contents are not yet ready; in the menatime
 * this thread will popultae the contents of a temp file and when the query is
 * complete then the temp file will be renamed to the file created in the
 * handler and the user will then have access to the query results
 * 
 * <p>
 * This class uses an interface for use by the search handlers to ensure a
 * consistent method for this class to call to get the download content right
 * now it is specific to a particular class -- as search types provide download
 * all capability this could become a pain -- so if we have an interface that
 * declares the method and any class that then wants to provide the new download
 * capability it would need to implement the interface and provide concrete code
 * for the method
 */

public class DownloadThread extends Thread {

  // DownloadAllHandler is the interface that type specific
  // searches that provide download all capabilities will
  // implement
  private DownloadAllHandler handler;

  // search type, default is Gene the first serch that used this function
  private String searchType = "Gene";

  // array of ids for download
  private Long[] ids;

  // email address
  private String emailAddress = null;

  // download content written to file
  private String content;

  // email content sent to user concerning download
  private String emailContent;

  // download filename
  private String downloadFilename;

  // temporary ( until results from query are gathered ) download file
  private File tempFile;

  // search criteria to place inside the email
  private String searchCriteria;

  /**
   */
  public DownloadThread() {
  }

  /**
   * Main run method for the thread.
   */
  public void run() {

    try {
      setDownloadFilename();
      File f =
          new File(WebApp.getAbsDynImageDir() + getDownloadFilename());
      FileWriter fileWriter = new FileWriter(f);
      if (getIds() != null) {
        setContent(getHandler().populateDownloadContent(getIds()));
        fileWriter.write(getContent());
        fileWriter.close();
        f.renameTo(getTempFile());
        Debugger.println(Debugger.logMsg(this, "searchCriteria "
                                               + getSearchCriteria()));
        setEmailContent(getSearchCriteria() + " can be downloaded from this "
             + WebApp.getServerURL() + WebApp.getDynImageDir() + getTempFile().getName()
             + " location. This location will expire in 24 hours.");
      } else {
        setEmailContent(getSearchCriteria()
                        + " failed. Please retry your query. ");
      }
    } catch (SQLException se) {
      setEmailContent(getSearchCriteria() + " failed. "
                      + " SQL Exception in download thread: " + se.getMessage());
      System.err
          .println("SQL Exception in download thread: " + se.getMessage());
      se.printStackTrace();
    } catch (IOException se) {
      setEmailContent(getSearchCriteria() + " failed. "
                      + " IO Exception in download thread: " + se.getMessage());
      System.err.println("IO Exception in download thread: " + se.getMessage());
      se.printStackTrace();
    } finally {
      sendEmail();
    }

  }

  // sets the search type from the calling program
  public void setSearchType(String type) {
    this.searchType = type;
  }

  // returns the search type
  private String getSearchType() {
    return searchType;
  }

  // sets the Handler object
  public void setHandler(DownloadAllHandler handler) {
    this.handler = handler;
  }

  // returns the Handler object
  private DownloadAllHandler getHandler() {
    return handler;
  }

  // sets the list of ids that represent the object ids for download
  public void setIds(Long[] ids) {
    this.ids = ids;
  }

  // gets the list of ids that represent the object ids for download
  private Long[] getIds() {
    return ids;
  }

  // sets the email address
  public void setEmailAddress(String email) {
    emailAddress = email;
  }

  // returns the email address
  private String getEmailAddress() {
    return emailAddress;
  }

  // sets the file content ( download content )
  private void setContent(String content) {
    this.content = content;
  }

  // returns the file content
  private String getContent() {
    return content;
  }

  // sets the email content ( download content )
  private void setEmailContent(String emailContent) {
    this.emailContent = emailContent;
  }

  // returns the email content
  private String getEmailContent() {
    return emailContent;
  }

  // sets the download filename; this file is populated with the query results
  private void setDownloadFilename() {
    // need a random ID for the file name
    Random generator = new Random(System.currentTimeMillis());
    int fileID = generator.nextInt();
    downloadFilename = fileID + "_download.txt";
  }

  // returns the download file name; this file is populated with the query
  // results
  private String getDownloadFilename() {
    return downloadFilename;
  }

  // sets the temporary file; this file is populated with a message to the user
  // that the contents of the file is not ready yet
  public void setTempFile(File tempFile) {
    this.tempFile = tempFile;
  }

  // returns the temporary download file name; this file is populated with a
  // message to the user
  // that the contents of the file is not ready yet
  private File getTempFile() {
    return tempFile;
  }

  // sets the search criteria that generated the download results
  public void setSearchCriteria(String searchCriteria) {
    this.searchCriteria = searchCriteria;
  }

  // gets the search criteria that generated the download results
  private String getSearchCriteria() {
    return searchCriteria;
  }

  // sends email with information about the location
  // of the file that has the download content written to it
  private void sendEmail() {
    try {
      if (getEmailAddress() != null && getEmailContent() != null) {
        EMail.send(WebApp.getProperty("MAIL_HOST"), WebApp
            .getProperty("FROM_ADDRESS"), getEmailAddress(),
                   getSearchType() + " Download Results", getEmailContent());
      }
    } catch (Exception e) { // print to STDERR
      System.err.println("Could not send email to: " + getEmailAddress());
      System.err.println("Message: " + e.getMessage());
      e.printStackTrace();
    }
  }
}
