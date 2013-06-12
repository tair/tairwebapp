<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family";
	String highlight = "3";
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

<!-- Content goes here //-->
<h2><i>Arabidopsis</i> Phytocyanin Superfamily</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><li><b>Mashiguchi, K., Asami, T., Suzuki, Y.</b> (2009) <A HREF="/servlets/TairObject?type=publication&id=501735486">Genome-wide identification, structure and expression studies, and mutant collection of 22 early nodulin-like protein genes in Arabidopsis</A> <i>BIOSCIENCE, BIOTECHNOLOGY, AND BIOCHEMISTRY</i> <b>73:2452</b></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>A genome-wide characterization of the ENODL protein family was performed by phylogenetic analysis, bioinformatic analysis of the protein structure and gene expression analysis</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=1501426590 target=new>Kiyoshi Mashiguchi</A></td></tr></table><p>

  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR>
   <TH><B>Gene Sub Family<BR>Name:</B></TH>

   <TH><B>Gene Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>similar sequence/domain:</B></TH>

         </TR>

   <tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g53870 target="new">At5g53870</A></td>

       <td valign=top><b>PF02298</b></td>
       

   </tr>

   <tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g27520 target="new">At4g27520</A></td>

       <td valign=top><b>PF02298</b></td>

   </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g28365 target="new">At4g28365</A></td>

       <td valign=top><b>PF02298</b></td>

       </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL4</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g32490 target="new">At4g32490</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL5</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g18590 target="new">At3g18590</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL6</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g48940 target="new">At1g48940</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL7</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g79800 target="new">At1g79800</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL8</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g64640 target="new">At1g64640</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL9</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g20570 target="new">At3g20570</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL10</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g57920 target="new">At5g57920</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL11</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g23990 target="new">At2g23990</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL12</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g30590 target="new">At4g30590</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL13</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g25090 target="new">At5g25090</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL14</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g25060 target="new">At2g25060</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL15</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g31840 target="new">At4g31840</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>


<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL16</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g01070 target="new">At3g01070</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL17</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g15350 target="new">At5g15350</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL18</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g08500 target="new">At1g08500</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL19</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g12880 target="new">At4g12880</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL20</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g27035 target="new">At2g27035</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL21</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g14345 target="new">At5g14345</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>

<tr class="alt">
       <td valign=top><b>Early nodulin-like protein family</b></td>

       <td>AtENODL22</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g17800 target="new">At1g17800</A></td>

       <td valign=top><b>PF02298</b></td>

        </tr>


</table><P>
<center>Last modified on April 2, 2009</center>        

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
