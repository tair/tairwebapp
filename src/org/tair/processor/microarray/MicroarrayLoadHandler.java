//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2004/11/18 20:39:42 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jxl.Sheet;
import jxl.Workbook;

import org.tair.community.LoginChecker;
import org.tair.handler.MultipartRequestHandler;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.processor.microarray.data.InsertLogger;
import org.tair.processor.microarray.data.LoadableExpressionSet;
import org.tair.processor.microarray.data.factory.MasterFactory;
import org.tair.processor.microarray.excel.DataSheet;
import org.tair.processor.microarray.excel.EnvCondSheet;
import org.tair.processor.microarray.excel.ExcelLogger;
import org.tair.processor.microarray.excel.ExcelRowTracker;
import org.tair.processor.microarray.excel.ExperimentSheet;
import org.tair.processor.microarray.excel.GermplasmSheet;
import org.tair.processor.microarray.excel.ReplicateSetSheet;
import org.tair.processor.microarray.excel.SamplesSheet;
import org.tair.processor.microarray.excel.SlidesSheet;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcExpressionSet;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;

import com.oreilly.servlet.MultipartRequest;


/**
 * MicroarrayLoadHandler handles the uploading, conversion, validation and
 * loading into the database of microarray data submitted through Excel
 * spreadsheets.
 */


public class MicroarrayLoadHandler 
    implements RequestHandler, MultipartRequestHandler {
  
    
    /**
     * Multipart request version of process method. This is needed to handle
     * the uploading of Excel data file through the multipart request. The
     * only action possible through this method is to upload the Excel file.
     * 
     * @param httpRequest HttpServletRequestnull 
     * @param multipartRequest Multipart request object containnull ing submitted
     * params and file handle for uploaded file.
     * @return RequestHandlerResponse containing: URL of JSP to forward to and 
     *  freshly set response attributes 
     * @throws SQLException thrown if a database error occurs while searching
     */ 
    
    public RequestHandlerResponse process( HttpServletRequest httpRequest, 
                                           MultipartRequest multipartRequest )

        throws InvalidFormException, InvalidLoginException, SQLException,
	       UnauthorizedRequestException {

	
	checkLogin( httpRequest );

	// parse and validate file and redirect user to page for confirming
	// data load
	RequestHandlerResponse response = confirmFile( httpRequest, 
						       multipartRequest );

        return response;
    }


    /**
     * Processes all requests associated with loading Excel datasheets into
     * the database except for the actual uploading of the file (which must
     * be handled in the multipart version of the process method).
     *
     * <p>
     * This method relies on a request parameter called "update_action" to 
     * determine what stage of the process user is currently in.  Valid values
     * for update_action are:
     *
     * <ul>
     * <li>new - Redirects user to page for uploading Excel spreadsheet</li>
     * <li>store - Loads data previously uploaded and validated into the database
     * </li>
     * </ul>
     * 
     * All actions require that user be logged in as TAIR curator
     * 
     * @param request HttpServletRequest
     * @return RequestHandlerResponse containing URL to forward user to 
     * @throws InvalidLoginException thrown if user is not logged in
     * @throws SQLException thrown if a database error occurs
     * @throws InvalidParameter exception thrown if invalid update action 
     * received
     * @throws InvalidFormException thrown if invalid or incomplete form 
     * data is received
     * @throws UnauthorizedRequestException throws if user is not a TAIR curator
     */
    public RequestHandlerResponse process( HttpServletRequest request ) 
        throws InvalidLoginException, InvalidParameterException, SQLException, 
               InvalidFormException, UnauthorizedRequestException, 
	       InvalidActionException {
	
        RequestHandlerResponse response = new RequestHandlerResponse();

	// check login before continuing - will throw exception if 
	// user not logged in or not curator
	checkLogin( request );

	// determine requested action and pass of to appropriate method
	String uploadAction = request.getParameter( "upload_action" );
	
	// if starting new load, redirect to page where curator can upload
	// Excel file
	if ( uploadAction == null || uploadAction.equals( "new" ) ) {
	    response = new RequestHandlerResponse();
	    String page = "/jsp/processor/microarray/excel/upload_excel.jsp";
	    response.setPage( page );

	    // parse previously loaded file again and store to db if any
	    // errors occurred.
	} else if ( uploadAction.equals( "store" ) ) {
	    response = store( request );
	} else if ( uploadAction.equals( "searchStart" ) ) {
	    response = searchStart( request );
	} else if ( uploadAction.equals( "search" ) ) {
	    response = search( request );
	}else if ( uploadAction.equals( "delete" ) ) {
	    response = delete ( request );
	    // else invalid action requested
	}else {
	    throw new InvalidParameterException( "Invalid update action: " +
						 uploadAction );
	}

	return response;
    }

    /**
     * Checks to make sure that user is logged in as curator. Exceptions
     * thrown if user is not logged in, or is not curator
     *
     * @param request Servlet request for accessing user's session
     * @throws InvalidLoginException if user is not logged in
     * @throws UnauthorizedRequestException if user is not a TAIR curator
     */
    private void checkLogin( HttpServletRequest request ) 
	throws InvalidLoginException, UnauthorizedRequestException {

        if ( !LoginChecker.isLoggedIn( request ) ) {
	    throw new InvalidLoginException( "User not logged in" );

        } else if ( !LoginChecker.isTairCurator( request ) ) {
	    throw new UnauthorizedRequestException( "Not authorized for " +
						    "this resource" );
	}
    }


    /**
     * Retrieves updloaded file, parses file and creates response to redirect 
     * curator to page where she can view the results of parsing.
     *
     * @return Response containing LoadableExpressionSet populated with data
     * from file, error logger containing error and warning messages from
     * parsing and row tracker containing objects parsed for each row of
     * data along with URL of JSP to use for displaying results
     * @throws InvalidFormException if an invalid file name is submitted
     * @throws SQLException if a database error occurs while validating
     * file contents
     */
    private RequestHandlerResponse confirmFile( HttpServletRequest request, 
						MultipartRequest multipartRequest ) 
	throws InvalidFormException, SQLException {
	
	File file = getUploadedFile( multipartRequest );

	// create new expression set to populate with data from file
	LoadableExpressionSet expressionSet = new LoadableExpressionSet();

	// initialize logging object to track all parsing errors
	// and warnings 
	ExcelLogger logger = new ExcelLogger();

	// initialize row tracker object to record data objects
	// in the order submitted in data sheets so results display
	// matches input as closely as possible
	ExcelRowTracker rowTracker = new ExcelRowTracker();

	// parse file and populate expression set w/data
	parseFile( file, expressionSet, logger, rowTracker );

	// create response to redirect user to confirmation page
	RequestHandlerResponse response = new RequestHandlerResponse();
	response.setPage( "/jsp/processor/microarray/excel/confirm_excel.jsp" );

	// add expression set, logger and row tracker to request for
	// use in displaying parsing results
	response.setAttribute( "expressionSet", expressionSet );
	response.setAttribute( "logger", logger );
	response.setAttribute( "rowTracker", rowTracker );

	// save objects in session so we can skip parsing when store action
	// is selected
	HttpSession session = request.getSession();
	session.setAttribute( "expressionSet", expressionSet );
	session.setAttribute( "logger", logger );
	session.setAttribute( "rowTracker", rowTracker );

	return response;
    }


    /**
     * Retrieves uploaded Excel file from multipart request and returns
     * as a File object that can be used for parsing and validating data.
     *
     * @param multipartRequest MultipartRequest object containg uploaded
     * file data
     * @return File object representing uploaded file in tmp directory
     * @throws InvalidFormException if no uploaded file can be retrieved
     * from request
     */
    private File getUploadedFile( MultipartRequest multipartRequest ) 
	throws InvalidFormException {

	// multipart request allows for multiple files, but there
	// should never be more than one
	Enumeration files = multipartRequest.getFileNames();
            
	if ( files == null || !files.hasMoreElements() ) {
	    throw new InvalidFormException( "No file uploaded" );
	} 

	String name = (String) files.nextElement();
	File uploadedFile = multipartRequest.getFile( name );
                    
	return uploadedFile;
    }

	    
    /**
     * Parses submitted Excel data file and populates submitted 
     * LoadableExpressionSet with data from file.  As data is loaded, it is
     * validated and transformed into valid TAIR database objects as possible.
     * Errors and warnings encountered during parsing are added to submitted
     * logger object; rowTracker records data submitted on each row of file
     * to allow for displaying data back to user in the order it was submitted
     * in the file (which object oriented data structure makes difficult
     * otherwise).
     *
     * <p>
     * Parsing Excel data is done using concrete classes that extend DataSheet
     * abstract class. Each concrete class contains the logic to parse data
     * from that specific data sheet in the excel file.
     *
     * @param File Excel file to be parsed
     * @param expressionSet Expression set to populate with file's contents
     * @param logger Logging object to track parsing errors and warnings
     * @param rowTracker Object to record data objects in the order submitted
     * in data sheets
     * @throws InvalidFormException if an error occurs while trying to read
     * data from submitted file
     * @throws SQLException if a database error occurs
     */
    private void parseFile( File file,
			    LoadableExpressionSet expressionSet,
			    ExcelLogger logger,
			    ExcelRowTracker rowTracker ) 

	throws InvalidFormException, SQLException {

	// create DataSheet objects to handle excel file parsing
	DataSheet[] sheets = createDataSheets();

	// initialize data object factories that handle population,
	// validation and caching of data objects
	MasterFactory masterFactory = new MasterFactory();
	
	// create WorkBook object that represents Excel file
	Workbook workbook = getWorkbook( file );

	DBconnection conn = null;
	DBReadManager connectionPool = null;

	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
	    
	    // for each data sheet, retrieve data from workbook as a Sheet
	    // object that contains submitted data from Excel file, then 
	    // use appropriate DataSheet object to parse data and populate
	    // expression set object
	    Sheet sheet = null;
	    for ( int i = 0; i < sheets.length; i++ ) {

		sheet = workbook.getSheet( sheets[ i ].getSheetName() );
		
		if ( sheet != null ) {
		    // set reference to expression set, sheet, factory
		    // error/warning message logger, and row data tracker 
		    // for visibility throughout all sheets while parsing
		    sheets[ i ].setSheet( sheet );
		    sheets[ i ].setExpressionSet( expressionSet );
		    sheets[ i ].setMasterFactory( masterFactory );
		    sheets[ i ].setLogger( logger );
		    sheets[ i ].setRowTracker( rowTracker );
		
		    sheets[ i ].parseSheet( conn );
		}
	    }
	    
	} finally {
	    connectionPool.return_connection( conn );
	}
    }


    /** 
     * Retrieves Workbook object that represents data from Excel file
     * in a more manageable form.
     *
     * @param file Excel file to transform into Workbook
     * @return Workbook object containing individual data sheets of Excel file
     * @throws InvalidFormException if any errors encountered while getting
     * workbook from submitted file
     */
    private Workbook getWorkbook( File file ) throws InvalidFormException {
	Workbook workbook = null;

	try {
	    workbook = Workbook.getWorkbook( file );

	    // catch any exceptions from reading file (should be either 
	    // IOException or jxl.read.biff.BiffException) and throw as
	    // InvalidForm
	} catch ( Exception e ) {
	    throw new InvalidFormException( "Error loading worksheet: " +
					    e.getMessage() );
	}

	return workbook;
    }


    /**
     * Create DataSheet objects to handle parsing of 6 different data sheets 
     * in excel file -- sheets must be parsed in the order they are listed in
     * array in order for inter-sheet dependencies to be properly resolved
     *
     * @return Array of DataSheet objects to be used for parsing individual
     * data sheets in excel file
     */
    private DataSheet[] createDataSheets() {

	DataSheet[] sheets = new DataSheet[ 6 ];

	// create each sheet with literal name of sheet as it appears
	// in excel workbook
	sheets[ 0 ] = new ExperimentSheet( "experiment" );
	sheets[ 1 ] = new ReplicateSetSheet( "replicate_hybs" );
	// sheets[ 1 ] = new ReplicateSetSheet( "replicate_hybs" );
	sheets[ 2 ] = new SlidesSheet( "slides" );
	sheets[ 3 ] = new SamplesSheet( "samples" );
	sheets[ 4 ] = new GermplasmSheet( "germplasm" );
	sheets[ 5 ] = new EnvCondSheet( "env_cond" );

	return sheets;
    }

    /**
     * Retrieves expression set previously populated with data file data
     * from session. Retrieves submission number submitted for expression
     * set and ensures it uniqueness along with status (active|new) to
     * store for newly created expression set. If no parsing errors exist, and
     * submission number is unique, data is stored to the database.  If
     * any parsing errors are found, user is redirected back to confirmation
     * page to correct errors.
     *
     * @param request Servlet request
     */
    private RequestHandlerResponse store( HttpServletRequest request ) 
	throws InvalidFormException, InvalidActionException, SQLException {

	// get expression set and logger stored in session previously
	HttpSession session = request.getSession();
	LoadableExpressionSet expressionSet = 
	    (LoadableExpressionSet) session.getAttribute( "expressionSet" );

	ExcelLogger logger = (ExcelLogger) session.getAttribute( "logger" );
	
	// if logger contains no fatal errors, store to db, otherwise
	// return to confirm page to show errors
	RequestHandlerResponse response = new RequestHandlerResponse();
	if ( !logger.hasErrors() ) {
	    DBconnection conn = null;
	    DBWriteManager connectionPool = DBWriteManager.getInstance();

	    try {
		conn  = connectionPool.get_connection();

		// get submission number submitted for experiment and do
		// quick check to ensure unique value - will throw exception
		// if not unique
		String number = getSubmissionNumber( request, conn );
		expressionSet.set_submission_number( number );

		// set status for expression set
                String status = getExperimentStatus( request );
		expressionSet.set_status( status );

		expressionSet.store( conn );

		// send email to notify users that loading occurred
		Long id = expressionSet.get_tair_object_id();
		InsertLogger.sendLoadMessage( id );
		
		// remove objects from session
		session.removeAttribute( "expressionSet" );
		session.removeAttribute( "logger" );
		session.removeAttribute( "rowTracker" );

	    } finally {
		connectionPool.return_connection( conn );
	    }

	    response.setAttribute( "expressionSet", expressionSet );
	    String page = "/jsp/processor/microarray/excel/excel_stored.jsp";
	    response.setPage( page );

	    // return to confirmation page until errors are corrected
	} else {
	    String page = "/jsp/processor/microarray/excel/confirm_excel.jsp";
	    response.setPage( page );

	    // only need row tracker if returning to confirmation page
	    ExcelRowTracker rowTracker = 
		(ExcelRowTracker)  session.getAttribute( "rowTracker" );
	
	    
	    // add expression set, logger and row tracker to request for
	    // use in displaying parsing results
	    response.setAttribute( "expressionSet", expressionSet );
	    response.setAttribute( "logger", logger );
	    response.setAttribute( "rowTracker", rowTracker );
	}
	return response;
    }

    /**
     * Deletes expression set from data base
     *
     * @param request Servlet request
     */	    
    private RequestHandlerResponse delete ( HttpServletRequest request ) 
	throws InvalidFormException,  SQLException {	
        RequestHandlerResponse response = new RequestHandlerResponse(); 
        String tair_object_id =  request.getParameter("delete_tair_id");
        Long expression_set_tair_id = null ;
        if ( TextConverter.isEmpty( tair_object_id )  ) {
	    throw new InvalidFormException( "No delete expression set number submitted" );
	}
        expression_set_tair_id = new Long (tair_object_id); 
        DBconnection conn = null;
	DBWriteManager connectionPool = DBWriteManager.getInstance();

	try {
	    conn  = connectionPool.get_connection();

	    LoadableExpressionSet expressionSet = new LoadableExpressionSet( conn, expression_set_tair_id );
	    expressionSet .delete( conn ); 
	} finally {
	    connectionPool.return_connection( conn );
	}

        String page = "/jsp/processor/microarray/delete_success.jsp";
        response.setPage( page );
        return response; 
    }

    /**
     * Forward user to expression search page
     * @param request Servlet request
     */
     private RequestHandlerResponse searchStart( HttpServletRequest request ) {	
        RequestHandlerResponse response = new RequestHandlerResponse(); 
        String page = "/jsp/processor/microarray/search_start.jsp";
        response.setPage( page );
        return response; 
    }
   /**
     * Retrieves experiment submission number submitted for expression set
     * to be deleted from the database
     * @param request Servlet request
     * @param conn An active connection to the database
     * @throws InvalidFormException if submission number is missing
     * @throws SQLException if a database error occurs
     */
    private RequestHandlerResponse search( HttpServletRequest request ) 
	throws InvalidFormException, SQLException {	
        RequestHandlerResponse response = new RequestHandlerResponse();
        String submission_number =  request.getParameter("search_sub_no");

        if ( TextConverter.isEmpty(submission_number )) {
	    throw new InvalidFormException( "No Search parameter provided" );
	}

        DBconnection conn = null;
	DBWriteManager connectionPool = DBWriteManager.getInstance();
        HashMap expressionsets  =  new HashMap ();
	try {
	    conn  = connectionPool.getSearchConnection();
            String query = "select tair_object_id, name from ExpressionSet where  submission_number=" + 
                TextConverter.dbQuote(submission_number);
            ResultSet rset = null;
            conn.setQuery(query );
            rset = conn.getResultSet();
            while (rset.next()) {
		String id = rset.getString( "tair_object_id");
		String name =  rset.getString("name");
                expressionsets.put ( id, name );
            }
 	} finally {
	    connectionPool.return_connection( conn );
	}

        String page = "/jsp/processor/microarray/delete_expressionset.jsp";
        response.setPage( page );
        response.setAttribute ( "expressionSets", expressionsets );
        return response; 
    }

    /**
     * Retrieves experiment submission number submitted for expression set
     * to be loaded to the database and checks to ensure that no expression
     * set already exists with that number.
     *
     * @param request Servlet request
     * @param conn An active connection to the database
     * @return Unique submission number to use for expression set
     * @throws InvalidFormException if submission number already exists
     * in the database, or if submission number has not been submitted
     * @throws SQLException if a database error occurs
     */
    private String getSubmissionNumber( HttpServletRequest request,
					DBconnection conn )
	throws InvalidFormException, SQLException {
	
	String number = request.getParameter( "submission_number" );

	if ( TextConverter.isEmpty( number ) ) {
	    throw new InvalidFormException( "No submission number submitted" );
	}

	// make sure number doesn't already exist
	if ( TfcExpressionSet.submissionNumberExists( conn, number ) ) {
	    throw new InvalidFormException( "Submission number " + number +
					    " already exists. Enter a new " +
					    "number" );
	}

	return number;
    }

    /**
     * Retrieves status submitted for expression set to be loaded to the 
     * database
     *
     * @param request Servlet request
     * @return Status submitted for expression set
     * @throws InvalidFormException if no status submitted for expression
     * set.
     */
    private String getExperimentStatus( HttpServletRequest request )
	throws InvalidFormException {

	String status = request.getParameter( "status" );

	if ( TextConverter.isEmpty( status ) ) {
	    throw new InvalidFormException( "Invalid status submitted" );
	}

	return status;
    }

}
