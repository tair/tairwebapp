<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - About Arabidopsis";
String highlight = "4";
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
<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="About Arabidopsis" />  
</jsp:include>

<div id="rightcolumn">
<span class="mainheader">Timeline of Arabidopsis Growth Stages</span>

<table>
<TR><TD>The data for this table was taken from Table 1 of Growth-stage Based Phenotypic Analysis of Arabidopsis: A Model for High Throughout Functional Genomics in Plants. Boyes, et. al. (2001) The Plant Cell 1499-1510. <a href="/info/ontologies/boyes2001.pdf">[PDF]</a></TD></TR>
<TR><TD>The following stages and timeline are for plants grown under the following conditions:<br />
Columbia ecotype plants were grown in soil at in 16 hour days/ 8 hour nights with temperatures of 22C during the day and 20 C at night. Lighting was provided with fluorescent bulbs giving an average light intensity of 175 micromoles/meter 2 second. Seeds were cold treated (stratification) for 3 days at 4C after imbibition to synchronize germination. Days til each stage are approximate and will vary according to your own growth conditions and gentetic background. Approximate dates given include the three day stratification.
</TD></TR></table>
<p>

<table>
<TR><TD>Stage Number</TD><TD>Approx.number of days <font class="emphasis">*</font></TD><TD>Description</TD></TR>
<TR><TD>0.0</TD><TD>&nbsp;</TD><TD>Seed germination</TD></TR>
<TR><TD>0.1</TD><TD>3.0 (on plates)</TD><TD>Seed imbibition</TD></TR>
<TR><TD>0.5</TD><TD>4.3 (on plates)</TD><TD>Radicle emerges from seed coat</TD></TR>
<TR><TD>0.7</TD><TD>5.5 (on plates)</TD><TD>Hypocotyl and cotyledon emerge from seed coat</TD></TR>
<TR><TD>1</TD><TD>&nbsp;</TD><TD>Rosette growth</TD></TR>
<TR><TD>1.0</TD><TD>6.0 (on plates)</TD><TD>Cotyledons fully open</TD></TR>
<TR><TD>1.02</TD><TD>10.3 (on plates) 12.5</TD><TD>2 rosette leaves are greater than 1 mm in length</TD></TR>
<TR><TD>1.03</TD><TD>14.4 (on plates) 15.9</TD><TD>3 rosette leaves are greater than 1 mm in length</TD></TR>
<TR><TD>1.04</TD><TD>16.5</TD><TD>4 rosette leaves are greater than 1mm in length</TD></TR>
<TR><TD>1.05</TD><TD>17.7</TD><TD>5 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.06</TD><TD>18.4</TD><TD>6 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.07</TD><TD>19.4</TD><TD>7 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.08</TD><TD>20.0</TD><TD>8 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.09</TD><TD>21.1</TD><TD>9 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.10</TD><TD>21.6</TD><TD>10 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.11</TD><TD>22.2</TD><TD>11 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.12</TD><TD>23.3</TD><TD>12  rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.13</TD><TD>24.8</TD><TD>13 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>1.14</TD><TD>25.5</TD><TD>14 rosette leaves are greater than 1mm</TD></TR>
<TR><TD>3</TD><TD>&nbsp;</TD><TD>Rosette Growth</TD></TR>
<TR><TD>3.20</TD><TD>18.9</TD><TD>Rosette is 20% of final size</TD></TR>
<TR><TD>3.50</TD><TD>24.0</TD><TD>Rosette is 50% final size</TD></TR>
<TR><TD>3.70</TD><TD>27.4</TD><TD>Rosette is 70% final size</TD></TR>
<TR><TD>3.90</TD><TD>29.3</TD><TD>Rosette growth is complete</TD></TR>
<TR><TD>5</TD><TD>&nbsp;</TD><TD>Inflorescence emergence</TD></TR>
<TR><TD>5.10</TD><TD>26.0</TD><TD>First flower buds are visible in the rosette, plant has not yet bolted</TD></TR>
<TR><TD>6</TD><TD>&nbsp;</TD><TD>Flower production</TD></TR>
<TR><TD>6.00</TD><TD>31.8</TD><TD>First flower is open, petals are at 90 degree angle to the pistil</TD></TR>
<TR><TD>6.10</TD><TD>35.9</TD><TD>10% flowers to be produced are open</TD></TR>
<TR><TD>6.30</TD><TD>40.1</TD><TD>30% flowers to be produced are open</TD></TR>
<TR><TD>6.50</TD><TD>43.5</TD><TD>50 % flowers to be produced are open</TD></TR>
<TR><TD>6.90</TD><TD>49.4</TD><TD>Flowering complete, flowers are no longer produced.</TD></TR>
<TR><TD>8</TD><TD>&nbsp;</TD><TD>Silique or fruit ripening. Seed pods become brown and then shatter.</TD></TR>
<TR><TD>8.00</TD><TD>48.0</TD><TD>First silique or seed pod shatters.</TD></TR>
<TR><TD>9</TD><TD>&nbsp;</TD><TD>Whole Plant Senescence begins. Plant starts to lose, pigment becoming brownish.  </TD></TR>
<TR><TD>9.70</TD><TD>&nbsp;</TD><TD>Senescense complete</TD></TR>

</TABLE>
<p>
<center><font class ="emphasis">*</font> indicates approximate number of days after sowing.</p>


<center>Last modified on May 26, 2006</center>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>