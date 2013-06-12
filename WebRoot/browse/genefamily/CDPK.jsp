<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR- Calcium Dependent Protein Kinase Gene Family";
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
<h2><i>Arabidopsis</i> Calcium Dependent Protein Kinase Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>

<TR><TD valign=top><B>Source:</B></TD>
<TD><li><b>Cheng, S.-H., Willmann, M. R., Chen, H.-C. and Sheen. J.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501681567">Calcium Signaling through Protein Kinases: The Arabidopsis Calcium-Dependent Protein Kinase Gene Family.</a> Plant Physiology <b>129: </b>500-515
<br><li><b>Cheng, S.-H., Sheen, J., Gerrish, C., and Bolwell, G.P.</b> (2001) <a href="/servlets/TairObject?type=publication&id=501680629">Molecular identification of phenylalanine ammonia-lyaseasa substrate of a specific constitutively active Arabidopsis CDPK expressed in maize protoplasts.</a> FEBS Lett. <b>503: </b>185-188
<br><li><b>Sheen, J.</B> (1996) <a href="/servlets/TairObject?type=publication&id=3521" target=new>Specific Ca2+-dependent protein kinase in stress signal transduction.</a> Science <b>274: </b>1900-1902
<br><li><a href="http://genetics.mgh.harvard.edu/sheenweb/" target=new>The Sheen Lab Web Page</A>
</td></tr>

<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Please refer to the papers above for more details.
</td></tr>

<TR><TD valign=top><B>Contact:</b></td>
<td>

<A HREF=/servlets/Community?action=view&type=person&communityID=6184 target="new">Jen Sheen</A>

<br><a href="/servlets/Community?type=person&action=view&communityID=5286" target=new>Shu-Hua Cheng</A>
 
<br><a href="/servlets/Community?type=person&action=view&communityID=10986" target=new>Matthew Willmann</A>

<BR><A href="/servlets/Community?action=view&type=person&communityID=218" target=new>Yanxia Liu</A>

<BR><A href=/servlets/Community?type=person&action=view&communityID=1113137 target=new>Huei-Chi Chen</A>

</td></tr></table><p>




<TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=34 valign=top><b>Calcium Dependent Protein Kinase</b></td>

       <td>CPK1 (AK1)</td>

       <td>MUK11.19<br><a href=/servlets/TairObject?type=locus&name=At5g04870 target="new">At5g04870</A></td>

       <td>BAB08991</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04870 target="new">calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK2</td>

       <td>F13M14.5<br><a href=/servlets/TairObject?type=locus&name=At3g10660 target="new">At3g10660</A></td>

       <td>AAF76372</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10660 target="new">calmodulin-domain protein kinase CDPK isoform 2</A></td>

        </tr>
<tr class="alt">

       <td>CPK3 (CDPK6)</td>

       <td>F9D16.120<br><a href=/servlets/TairObject?type=locus&name=At4g23650 target="new">At4g23650</A></td>

       <td>AAK60302</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g23650 target="new">calcium-dependent protein kinase (CDPK6) </A></td>

        </tr>
<tr class="alt">

       <td>CPK4</td>

       <td>T25P22.10<br><a href=/servlets/TairObject?type=locus&name=At4g09570 target="new">At4g09570</A></td>

       <td>CAB82124</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g09570 target="new">calmodulin-domain protein kinase CDPK isoform 4 (CPK4) </A></td>

        </tr>
<tr class="alt">

       <td>CPK5</td>

       <td>F23E12130<br><a href=/servlets/TairObject?type=locus&name=At4g35310 target="new">At4g35310</A></td>

       <td>CAB80248</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g35310 target="new">calmodulin-domain protein kinase CDPK isoform 5 (CPK5)</A></td>

        </tr>
<tr class="alt">

       <td>CPK6 (ATCDPK3)</td>

       <td>F5J6.13<br><a href=/servlets/TairObject?type=locus&name=At2g17290 target="new">At2g17290</A></td>

       <td>AAB86506</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17290 target="new">putative calmodulin-domain protein kinase CPK6</A></td>

        </tr>
<tr class="alt">

       <td>CPK7</td>

       <td>T2L20<br><a href=/servlets/TairObject?type=locus&name=At5g12480 target="new">At5g12480</A></td>

       <td>AAK32802</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g12480 target="new">calcium-dependent protein kinase-like protein</A></td>

        </tr>
<tr class="alt">

       <td>CPK8 (CDPK19)</td>

       <td>F7K24.200<br><a href=/servlets/TairObject?type=locus&name=At5g19450 target="new">At5g19450</A></td>

       <td>AAA67658</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19450 target="new">calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK9</td>

       <td>MQC12.17<br><a href=/servlets/TairObject?type=locus&name=At3g20410 target="new">At3g20410</A></td>

       <td>BAB02824</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g20410 target="new">calmodulin-domain protein kinase CDPK isoform 9</A></td>

        </tr>
<tr class="alt">

       <td>CPK10 (ATCDPK1)</td>

       <td>F6A14.1<br><a href=/servlets/TairObject?type=locus&name=At1g18890 target="new">At1g18890</A></td>

       <td>AAF27092</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18890 target="new">calcium-dependent protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>CPK11 (ATCDPK2)</td>

       <td>F15O4.8<br><a href=/servlets/TairObject?type=locus&name=At1g35670 target="new">At1g35670</A></td>

       <td>BAA04830</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g35670 target="new">calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK12 (CDPK9)</td>

       <td>MQM1.15<br><a href=/servlets/TairObject?type=locus&name=At5g23580 target="new">At5g23580</A></td>

       <td>BAA97242</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23580 target="new">calcium-dependent protein kinase (pir||S71196)</A></td>

        </tr>
<tr class="alt">

       <td>CPK13</td>

       <td>ORF10<br><a href=/servlets/TairObject?type=locus&name=At3g51850 target="new">At3g51850</A></td>

       <td>AAC14412</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51850 target="new">calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK14</td>

       <td>T6D20.24 <br><a href=/servlets/TairObject?type=locus&name=At2g41860 target="new">At2g41860</A></td>

       <td>AAB63555</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41860 target="new">putative calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK15</td>

       <td>T8O5.150<br><a href=/servlets/TairObject?type=locus&name=At4g21940 target="new">At4g21940</A></td>

       <td>AAK59500</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21940 target="new">calcium-dependent protein kinase - like protein</A></td>

        </tr>
<tr class="alt">

       <td>CPK16</td>

       <td>T13L16.9<br><a href=/servlets/TairObject?type=locus&name=At2g17890 target="new">At2g17890</A></td>

       <td>AAD03569</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17890 target="new">putative Ca2+-dependent ser/thr protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK17</td>

       <td>MXC9.14<br><a href=/servlets/TairObject?type=locus&name=At5g12180 target="new">At5g12180</A></td>

       <td>BAB10036</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g12180 target="new">calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK18</td>

       <td>T19K4.200<br><a href=/servlets/TairObject?type=locus&name=At4g36070 target="new">At4g36070</A></td>

       <td>CAB81516</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36070 target="new">Calcium-dependent serine/threonine protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK19</td>

       <td>F8K4.26<br><a href=/servlets/TairObject?type=locus&name=At1g61950 target="new">At1g61950</A></td>

       <td>AAC28510</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61950 target="new">calcium-dependent protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>CPK20</td>

       <td>T7F6.8<br><a href=/servlets/TairObject?type=locus&name=At2g38910 target="new">At2g38910</A></td>

       <td>AAC79604</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38910 target="new">putative calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK21</td>

       <td>T4B21.13<br><a href=/servlets/TairObject?type=locus&name=At4g04720 target="new">At4g04720</A></td>

       <td>CAB80837</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04720 target="new">putative calcium dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK22</td>

       <td>T4B21.12<br><a href=/servlets/TairObject?type=locus&name=At4g04710 target="new">At4g04710</A></td>

       <td>CAB80836</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04710 target="new">putative calcium dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK23</td>

       <td>T4B21.15<br><a href=/servlets/TairObject?type=locus&name=At4g04740 target="new">At4g04740</A></td>

       <td>CAB80839</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04740 target="new">putative calcium dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK24</td>

       <td>T9H9.2<br><a href=/servlets/TairObject?type=locus&name=At2g31500 target="new">At2g31500</A></td>

       <td>AAD24851</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31500 target="new">putative calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK25</td>

       <td>F11F19.20<br><a href=/servlets/TairObject?type=locus&name=At2g35890 target="new">At2g35890</A></td>

       <td>AAD21468</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35890 target="new">putative calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK26</td>

       <td>F20D10.350<br><a href=/servlets/TairObject?type=locus&name=At4g38230 target="new">At4g38230</A></td>

       <td>CAB80488</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38230 target="new">calcium-dependent protein kinase -like protein</A></td>

        </tr>
<tr class="alt">

       <td>CPK27</td>

       <td>T4B21.11<br><a href=/servlets/TairObject?type=locus&name=At4g04700 target="new">At4g04700</A></td>

       <td>CAB80835</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04700 target="new">putative calcium dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK28</td>

       <td>K2A18.29<br><a href=/servlets/TairObject?type=locus&name=At5g66210 target="new">At5g66210</A></td>

       <td>BAB10426</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66210 target="new">calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK29</td>

       <td>T4O12.25<br><a href=/servlets/TairObject?type=locus&name=At1g76040 target="new">At1g76040</A></td>

       <td>AAF26765</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76040 target="new">calcium-dependent protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>CPK30(CDPK1a)</td>

       <td>F25A4.29<br><a href=/servlets/TairObject?type=locus&name=At1g74740 target="new">At1g74740</A></td>

       <td>AAF27092</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74740 target="new">calcium-dependent protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>CPK31</td>

       <td>T19J18.7<br><a href=/servlets/TairObject?type=locus&name=At4g04695 target="new">At4g04695</A></td>

       <td>AAF27092</td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK32</td>

       <td>T8H10.130<br><a href=/servlets/TairObject?type=locus&name=At3g57530 target="new">At3g57530</A></td>

       <td>CAB66110</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57530 target="new">calcium-dependent protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>CPK33</td>

       <td>F17J6.22<br><a href=/servlets/TairObject?type=locus&name=At1g50700 target="new">At1g50700</A></td>

       <td>AAG51192</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50700 target="new">calcium-dependent protein kinase </A></td>

        </tr>
<tr class="alt">

       <td>CPK34</td>

       <td>F7K24.110<br><a href=/servlets/TairObject?type=locus&name=At5g19360 target="new">At5g19360</A></td>

       <td>BAB10036</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19360 target="new">calcium-dependent protein kinase - like</A></td>

        </tr>
</table><P>
<center>Last modified on January 20, 2004</center>   
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>