<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR WU-BLAST 2.0 Form") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("/Blast/BLAST_help.jsp") %>' />
</jsp:include>



<B><FONT COLOR="red">NOTE:</FONT> We are testing the hardware for WU-BLAST2 for faster searching. Please note that the server has been taken offline for maintenance. Please use our other <A HREF="/Blast">BLAST</A> service.</B><BR><BR>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
