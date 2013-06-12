<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%!
String pageName = "Clone Search";
String highlight = "1";
%>

<%@ page import="org.tair.utilities.*" %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%"> 
	 <b><font size="+1">TAIR Clone Search</font></b> <br>  
	
	  <p>	    TAIR Clone search <B>has been replaced</B> by our new <a href="/servlets/Search?action=new_search&type=dna">DNA search</a> which includes more options for searching for clones and allows searching of other DNA-related objects such as clone ends, libraries, vectors, dna stocks, pooled genomic DNA, and filters. Please try the new <a href="/servlets/Search?action=new_search&type=dna">DNA search</a>.

	  
	</td>
      </tr>
    </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
