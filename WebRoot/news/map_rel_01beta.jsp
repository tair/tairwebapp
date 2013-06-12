<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR: Map Viewer Release Notes") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
		
		<!--
		
			Content goes here
			
		//-->
<span class="header">Map Viewer Release Notes</span><BR>
<CENTER><BR>
August 29, 2000<BR>
</CENTER>
<p>We are pleased to announce the first version of TAIR's comprehensive 
                <a href="/servlets/mapper/">Map Viewer</a>. This version will 
                allow you to search, browse, and align any map elements and maps 
                on each chromosome, available from TAIR's database. Each map element 
                is hyperlinked to a detail page from the database. A detailed 
                Help document on what is available and how to navigate this tool 
                is available: <a href="/mapViewer/help/tairmaps.jsp">TAIR Map 
                Viewer Help</a> </p>
              <p> <b>Please note that this is a first version and we are working 
                on improving functionalities for our next version. Please let 
                us know if you find any glitches in the interface, suggestions 
                for improvement, and/or any errors in the data. You can contact 
                us at: <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>.</b> 
              <p> The following things are currently being implemented: 
              <ul>
                <li>The ORFs on the AGI map clones will be displayed. 
                <li>The visibility rank for Reference Sequence Map markers will 
                  be updated. 
              </ul>
              <hr>
              The following things will be in place for our next release: 
              <ul>
                <li>Reference Sequence Map for chromosomes 1, 3, and 5 when the 
                  data are released. 
                <li>Searching through aliases 
                <li>Reference Sequence Map zoomable down to nucleotide level and 
                  more entities placed (insertion sites, transcripts, experimentally 
                  studied genes) 
                <li>Color coding of different marker types 
              </ul>
		
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
