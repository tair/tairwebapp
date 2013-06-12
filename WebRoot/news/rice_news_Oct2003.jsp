<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR News") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<span class="header">TAIR News</span>
<BR>
<jsp:include page="/jsp/includes/newsminiheader.jsp" flush ="true">
<jsp:param name="link" value="TAIR News" />
</jsp:include>
<P>
Are you interested in rice genetic stocks and genomic resources? If so
please read on.
<P>
Rice is rapidly becoming established as the model or reference grass
plant
for genomics research. Three meetings
sponsored by NSF have identified a
need for a US Rice Resource center

<a href="http://www.ars-grin.gov/ars/PacWest/Aberdeen/RiceWorkshopReportFeb182003.pdf">Buell and Sundaresan Plant Physiology 132: 1137</a>
 that would provide
access to public materials, including seeds, tissue culture, DNA pools,
and libraries as well as comprehensive bioinformatics support.
As a primary or secondary user of rice genetic materials we seek
information
about your needs for rice information and materials. Please take a few
moments to respond to a small survey form. Please open the <a href="http://www.tigr.org/tdb/e2k1/osa1/rice.survey.shtml">Rice Survey Form</a>
and complete the survey now, but not later than November 15. We will report the results in a
proposal to the National Science Foundation seeking support to launch
the US
<P>
Rice Genomic Resources Center

<P><center>Last modified on October 9, 2003</center>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
