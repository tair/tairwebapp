<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
		
		<!--
		
			Content goes here
			
		//-->



<tr>
    <td> 
              <span class="header">TAIR Database Release Notes</span>
            <center><BR>
              August 29, 2000&nbsp; <br>
            <BR>
            </center>
<A href="/search/">Go to new database</A><br><BR>
            We are pleased to announce a beta version of TAIR database. 
              This version will allow you to search the database for genes, genetic 
              markers, clones, and maps. Each data type has advanced search pages, 
              where you will be able to search using more parameters including 
              map positions. 
              <p> <b>Please note that this is still under development, and there 
                may be some glitches. Please let us know if you find any glitches 
                in the interface, suggestions for improvement, and/or any errors 
                in the data. You can contact us at: <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>.</b> 
              <p> The following things are currently being fixed: 
              <ul>
                <li>The attribution type 'described by' for 19 people are not 
                  being displayed. 
                <li>Some attributions are not being displayed. 
                <li>AGI clone information is currently not displayed. 
              </ul>
              <hr>
              The following things will be in place for our next release: 
              <ul>
                <li>Link to Help documentation 
                <li>New web site for easier navigation through the information 
                  available at TAIR 
                <li>On-line documentation of the database schema and conceptual 
                  data model for this version 
                <li>Searching for Community (People, labs, etc.), Reference (Arabidopsis 
                  articles, books, etc.), and Sequence data 
                <li>Position searching (between and around two points) will be 
                  implemented for all map types. 
                <li>Community registration and updating using a login process 
                  will be implemented. 
                <li>Browsing and downloading data will be implemented. 
              </ul>
		
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
