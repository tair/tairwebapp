<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR -Clones/DNA Resources-Gateway License";
String highlight = "7";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/clonesSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>


<div id="rightcolumn">
<!--CONTENT IN HERE -->
<span class="mainheader">Agreement that applies to clones in Gateway&trade;vectors</span>

<h2>Limited Use Label License</h2>


<P>This product and its use is the subject of one or more of U.S.
Patent Nos. 5,888,732, 6,143,557, 6,171,861, 6,270,969, and 6,277,608
and/or other pending U.S. and foreign patent applications owned by
Invitrogen Corporation. The purchase of this product conveys to the
buyer the non-transferable right to use the purchased amount of the
product and components of the product in research conducted by the
buyer (whether the buyer is an academic or for profit entity). The
purchase of this product does not convey a license under any method
claims in the foregoing patents or patent applications, or to use
this product with any recombination sites other than those purchased
from Invitrogen Corporation or its authorized distributor. The right
to use methods claimed in the foregoing patents or patent
applications with this product for research purposes only can only be
acquired by the use of Clonase&trade; purchased from Invitrogen
Corporation or its authorized distributors. The buyer cannot modify
the recombination sequence(s) contained in this product for any
purpose. The buyer cannot sell or otherwise transfer (a) this
product, (b) its components, or (c) materials made by the employment
of this product or its components to a third party or otherwise use
this product or its components or materials made with this product or
its components for Commercial Purposes. The buyer may transfer
information or materials made through the use of this product,
provided that such transfer is not for any Commercial Purpose, and
that such collaborator agrees in writing (a) not to transfer such
materials to any third party, and (b) to use such transferred
materials and/or information solely for research and not for
Commercial Purposes. Transfer of such materials and/or information to
collaborators does not convey rights to practice any methods claimed
in the foregoing patents or patent applications. Commercial Purposes
means any activity by a party for consideration and may include, but
is not limited to: (1) use of the product or its components in
manufacturing; (2) use of the product or its components to provide a
service, information, or data; (3) use of the product or its
components for therapeutic, diagnostic or prophylactic purposes; or
(4) resale of the product or its components, whether or not such
product or its components are resold for use in research. Invitrogen
Corporation will not assert a claim against the buyer of infringement
of the above patents based upon the manufacture, use or sale of a
therapeutic, clinical diagnostic, vaccine or prophylactic product
developed in research by the buyer in which this product or its
components was employed, provided that none of (i) this product, (ii)
any of its components, or (iii) a method claim of the foregoing
patents, was used in the manufacture of such product. Invitrogen
Corporation will not assert a claim against the buyer of infringement
of the above patents based upon the use of this product to
manufacture a protein for sale, provided that no method claim in the
above patents was used in the manufacture of such protein. For
information on purchasing a license to use this product for purposes
other than those permitted above, contact Licensing Department,
Invitrogen Corporation, 1600 Faraday Avenue, Carlsbad, California
92008. Phone (760) 603-7200.</P>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
