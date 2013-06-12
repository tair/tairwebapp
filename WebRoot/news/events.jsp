<!DOCTYPE  HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - News - Meetings/Events";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1430" />
</jsp:include>

<jsp:include page="/jsp/includes/newsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Conferences and Events"/>  
</jsp:include>


<div id="rightcolumn">


<span class="mainheader">Conferences and Events</span>
<p>
<i>Please send suggestions for details of conferences, meetings,
etc. of interest to Arabidopsis folks to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>
</i></p>

<dl>

<dt><a href="http://agsci.psu.edu/plant-bio">International Cellulose Symposium</a></dt>
<dd>Penn State University, University Park, PA, USA, May 16-18, 2013</dd>

<dt><a href="http://abrc.sinica.edu.tw/20130524">2013 International Symposium on Agricultural Biotechnology: Emerging Topics on Plant Stress Biology</a></dt>
<dd>Taipei, Taiwan, May 24-25, 2013</dd>

<dt><a href="http://ipg.missouri.edu/symposium/index.cfm">30th Annual IPG Symposium - Root Biology</a></dt>
<dd>Columbia, MO, USA, May 29-31, 2013</dd>

<dt><a href="http://www.epay.ed.ac.uk/browse/extra_info.asp?compid=1&modid=2&prodid=711&d">International Symposium of Plant Photobiology (ISPP)</a></dt>
<dd>Edinburgh Scotland UK, June 3-6, 2013</dd>

<dt><a href="http://ipgsa2013.sippe.ac.cn">21st Conference of the International Plant Growth Substances Association (IPGSA)</a></dt>
<dd>Shanghai International Convention Center, Shanghai, China, June 18-22, 2013</dd>

<dt><a href="http://www.brachy2013.unimore.it">1st International Brachypodium Conference</a></dt>
<dd>Modena, Italy, June 19-21, 2013</dd>

<dt><a href="http://bio13.iopconfs.org ">Physics of Emergent Behaviour 2013</a></dt>
<dd>Brighton, UK, June 24-26, 2013</dd>

<dt><a href="http://www.sallyjayconferences.com.au/icar2013">ICAR 2013</a></dt>
<dd>Sydney Convention & Exhibition Centre, Sydney, Australia, June 24-28, 2013</dd>

<dt><a href="https://www.jacobs-university.de/ncRNA2013">Non-coding RNA in plants</a></dt>
<dd>Leucorea Wittenberg, Germany, July 10-12, 2013</dd>

<dt><a href="http://www.jcvi.org/cgi-bin/medicago/workshop.cgi">Plant Bioinformatics Workshop</a></dt>
<dd>J. Craig Venter Institute, Rockville, MD, USA, July 15-19, 2013</dd>

<dt><a href="http://my.aspb.org/?page=ME_Index">ASPB Plant Biology 2013</a></dt>
<dd>Providence, RI, USA July 20-24, 2013</dd>

<dt><a href="http://my.aspb.org/page/PGRP2013">ASPB Satellite meeting on Post-transcriptional Gene Regulation in Plants</a></dt>
<dd>Providence, RI, USA, July 25-26, 2013</dd>

<dt><a href="http://pvb2013.org">Plant Vascular Biology 2013</a></dt>
<dd>Helsinki, Finland, July 26-30, 2013</dd>

<dt><a href="http://www.faseb.org/Science-Research-Conferences.aspx">FASEB: Mechanisms in Plant Development</a></dt>
<dd>Saxtons River, VT, USA, August 11-16, 2013</dd>

<dt><a href="http://www.plantgenomeevolution.com">Plant Genome Evolution 2013</a></dt>
<dd>Amsterdam, The Netherlands, September 8-10, 2013</dd>

<dt><a href="http://www.botanikertagung2013.de">International Congress of the German Botanical Society</a></dt>
<dd>Tuebingen, Germany, September 29-October 4, 2013</dd>

<dt><a href="http://www.plantreproduction.no">European Frontiers of Plant Reproduction Research</a></dt>
<dd>Oslo, Norway, October 2-4, 2013</dd>

<dt><a href="http://www.dormancy2013.com">Plant Dormancy Symposium 2013</a></dt>
<dd>Auckland, New Zealand, November 4-7, 2013</dd>

<dt><a href="http://www.intpbc.org">International Plant Breeding Congress</a></dt>
<dd>Antalya, Turkey, November 10-14, 2013</dd>

<dt><a href="http://www.nitrogen2013.cl">Second International Symposium on the Nitrogen Nutrition of Plants</a></dt>
<dd>Puerto Varas, Chile, November 18-22, 2013</dd>

<dt><a href="http://my.aspb.org/?page=ME_Index">ASPB Plant Biology 2014</a></dt>
<dd>Portland, OR, USA, July 12-16, 2014</dd>

<dt><a href="http://www.bio.net/bionet/mm/arab-gen/2012-July/012881.html">ICAR 2014</a></dt>
<dd>University of British Columbia, Vancouver, Canada, July 28-August 1, 2014</dd>
</dl>

<center>Last modified on April 17, 2013</center>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
