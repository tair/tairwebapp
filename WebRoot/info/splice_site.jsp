<<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Arabidopsis Splice Sites and Mutations") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("3") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<span class="header">Arabidopsis Splice Sites and  Mutations</span><BR>
 
<p>
<font color="red">NOTE</font>:The pages containing information about Arabidopsis Splice Sites including Mutations and Exceptions (non-standard) splice site junctions are no longer actively maintained.More recent data regarding splice variants  can be found at <a href="http://www.tigr.org/tdb/e2k1/ath1/altsplicing/splicing_variations.shtml">TIGR Arabidopsis Splice Variants</a> and in TIGR's <a href="http://www.tigr.org/tdb/e2k1/ath1/Arabidopsis_nonconsensus_splice_sites.shtml"> List of Non-consensus splice sites found in Arabidopsis genes.</a></p>
	
<p>You can download the data from the old pages as PDF documents. Click on the <img src="/images/pdf.jpg">PDF icon to begin downloading the page. You will need software such as Adobe Reader to open and read these files. Click to download Adobe Reader<a href=http://www.adobe.com/products/acrobat/readstep2.html"><img src="/images/getacro.gif"></a>.</p>
<p><a href="splice_site.pdf"><img src="/images/pdf.jpg" border=0></a>List of known Arabidopsis Splice Sites</p>
<p><a href="splice_site_excep.pdf"><img src="/images/pdf.jpg" border=0></a>List of exceptions to consensus splice junctions in Arabidopsis.</p>
<p><a href="splice_site_mut.pdf"><img src="/images/pdf.jpg" border=0></a>List of Arabidopsis alleles with mutations in splice junctions.For more up to date information about mutations in splice junctions, please use the <a href="/servlets/Search?action=new_search&type=polyallele">Polymorphism/Allele Search</a> to search the database for alleles with polymorphisms in splice junctions.</p>

<p>Last updated April 14, 2004</p>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
