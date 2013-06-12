// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.clustalw;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;

import org.apache.oro.text.perl.Perl5Util;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.TextConverter;

/**
 * ClustalWHandler handles requests to send FASTA sequences to the European
 * Bioinformatics Institute (EBI) ClustalW  for multiple sequence alignment.
 */
public class ClustalWHandler implements RequestHandler {

    // JSP page for displaying EBI ClustalW
    private String clustalWPage = "/jsp/processor/clustalw/ebi_clustalw.jsp";
    // JSP remote error page
    private String remErrorPage = "/jsp/processor/clustalw/remote_error.jsp";

    /**
     * Processes all requests to send FASTA sequences to the EBI ClustalW tool
     * for multiple sequence alignment.  This method relies on a request
     * parameter called "sequences" to provide the FASTA sequences to send to
     * EBI ClustalW.
     *
     * @param request HttpServletRequest that contains the "sequences"
     * parameter
     * @return RequestHandlerResponse object that contains the URL to forward
     * user to as well as any data objects needed for display on the following
     * page
     * @exception InvalidParameterException if the "sequences" parameter is
     * null
     */
    public RequestHandlerResponse process(HttpServletRequest request)
	throws  InvalidParameterException {

        // 
        // Get the sequences to send to EBI ClustalW
        //
        String sequences = "";
        if (!(TextConverter.isEmpty(request.getParameter("sequences")))) {
            sequences = request.getParameter("sequences");
        }
	else {
	    throw new InvalidParameterException("No sequences received.");
	}
        //
        // Get the html source of EBI's ClustalW site and convert relative
        // links to hard links.  If there are FASTA sequences to paste in
        // the ClustalW site's text area, it is done here.
        //
        String pageSrc = getWebSource("http://www.ebi.ac.uk/Tools/msa/clustalw2/");
       //String pageSrc = "ooops";
        RequestHandlerResponse response = new RequestHandlerResponse();
	if (pageSrc != null) {
	    pageSrc = convertLinks(pageSrc, sequences);
	    response.setPage(clustalWPage);
	    request.setAttribute("html_source", pageSrc);
	}
	else { // a network error has occurred
	    response.setPage(remErrorPage);
	}
	return response;
    }

   /**
    * Method to get the source code of a website
    * @param httpUrl the url of the website to retrieve
    * @return the source code of the requested website as a string
    */
   private String getWebSource(String httpUrl) {
       try {
           URL url = new URL(httpUrl);
	   URLConnection connection = url.openConnection();
	   InputStream stream = 
	       new BufferedInputStream(connection.getInputStream());
	   StringBuffer buffer = new StringBuffer();
	   int ch;
	   while ((ch = stream.read()) != -1) {
	       buffer.append((char)ch);
	   }
	   return buffer.toString();
	}
	catch (IOException e) {
	   return null;
	}
    }

    /**
     * Method that converts the relative links in the HTML source code from
     * EBI to hard links.
     * @param htmlSrc the HTML source code from EBI
     * @param seqs the FASTA sequences to send to EBI ClustalW
     * @return the new HTML source code with the relative links converted to
     * hard links
     */
    private String convertLinks(String htmlSrc, String seqs) {

    String regularExpression = "s#\\.\\./\\.\\./#http://www.ebi.ac.uk/Tools/#g";
	htmlSrc = substitute(htmlSrc, regularExpression);
	regularExpression = 
	    "s#href\\s*=\\s*\"\\s*/#href=\"http://www.ebi.ac.uk/#g";
	htmlSrc = substitute(htmlSrc, regularExpression);
	regularExpression = 
	    "s#src\\s*=\\s*\"\\s*/#src=\"http://www.ebi.ac.uk/#g";
	htmlSrc = substitute(htmlSrc, regularExpression);
        if (!(seqs.equals(""))) {
	    regularExpression = "s#</textarea>#" + seqs + "</textarea>#";
	    htmlSrc = substitute(htmlSrc, regularExpression);
        }
	return htmlSrc;
    }	
    
    /**
     * Method that performs a regular expression substitution function.
     * @param originalString the string that this method will operate on
     * @param regularExpression the s/// substitution regular expression
     * operation to perform on orignalString
     * @return the result of performing the s/// operation on originalString
     */
    private String substitute(String originalString, 
			      String regularExpression) {
	Perl5Util perlUtil = new Perl5Util();
	String result = perlUtil.substitute(regularExpression, originalString);
	return result;
    }
}
       
