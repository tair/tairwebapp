<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/search.css";
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

<span class="mainheader">World-wide <I>Arabidopsis</I> Reverse Genetic Stocks
</span>

<p>Prepared by the Reverse Genetic Stocks subcommittee of 
MASC at its meeting on December 14, 2002. 

<p>

<A HREF="/portals/masc/RGStable.xls">
Download
</A> this table in Excel format.
</p>
</td>
</tr>
</table>
<p>
<table width="750" align="center" border="0" cellspacing="1">


<tr bgcolor="#D5D9DD">
<td class="sm" valign="top">
<b>Project
</b>
</td>
<td class="sm" valign="top">
<b>End Date
</b>
</td>
<td class="sm" valign="top">
<b>Ecotype
</b>
</td>
<td class="sm" valign="top">
<b>Project Goal
</b>
</td>
<td class="sm" valign="top">
<b>Current Status
</b>
</td>
<td class="sm" valign="top">
<b>Availability
</b>
</td>
<td class="sm" valign="top">
<b>Restrictions
</b>
</td>
</tr>


<tr bgcolor="#F5F9FF">
<td valign="top">
<A HREF="http://www.agrikola.org/">
AGRIKOLA - RNAi
</A>
</td>
<td valign="top">
2005
</td>
<td valign="top">
Col
</td>
<td valign="top">
1. Hairpin constructs for 20-25,000 genes in constitutive and inducible promoters (2 collections)
<br>2. 5,000 of these used to make transgenic RNAi lines
<br>&nbsp;
</td>
<td valign="top">
begun 11/2002
</td>
<td valign="top">
none yet;
<br>plasmids will go to 
<A HREF="http://www.atcc.org/">
ATCC
</A>, 
<A HREF="http://www.rzpd.de/">
RZPD
</A>, seeds to 
<A HREF="http://arabidopsis.info/">
NASC
</A>
</td>
<td valign="top">
MTA through Invitrogen; no restrictions for academic use
</td>
</tr>



<tr bgcolor="#D5D9DD">
<td valign="top">
Amasino/Sussman 2010 Project
<br>
<A HREF="https://www.fastlane.nsf.gov/servlet/showaward?award=0116945">
Abstract
</A>
<br>&nbsp;
</td>
<td valign="top">
2004
</td>
<td valign="top">
Col
</td>
<td valign="top">
50,000 Launchpad lines with cre/lox for deletions, Ds for attacking tandem genes
</td>
<td valign="top">
50,000 lines created, not sequenced
</td>
<td valign="top">
none yet
</td>
<td valign="top">
none
</td>
</tr>



<tr bgcolor="#F5F9FF">
<td valign="top">
<A HREF="http://atidb.cshl.org">
CSHL
</A>
</td>
<td valign="top">
&nbsp;
</td>
<td valign="top">
Ler
</td>
<td valign="top">
30,000 Ds gene/enhancer trap lines
<br>&nbsp;
</td>
<td valign="top">
~15,000 sequenced
</td>
<td valign="top">
All, through CSHL
</td>
<td valign="top">
<A HREF="http://genetrap.cshl.org/genetrap_mta2.pdf">
MTA
</A>; disclaimer, no IP restrictions
</td>
</tr>



<tr bgcolor="#D5D9DD">
<td valign="top">
<A HREF="http://signal.salk.edu/tabout.html">
Ecker 2010 Project
</A>
</td>
<td valign="top">
2003
</td>
<td valign="top">
Col
</td>
<td valign="top">
120,000 TDNA lines with flanking sequence
<br>&nbsp;
</td>
<td valign="top">
102,000 done
</td>
<td valign="top">
100,000 seq online, seeds at 
<A HREF="/abrc/">
ABRC
</A>
</td>
<td valign="top">
none
</td>
</tr>



<tr bgcolor="#F5F9FF">
<td valign="top">
<A HREF="http://flagdb-genoplante-info.infobiogen.fr/projects/fst/">
FST Project
</A>
<br>
(
<A HREF="http://www.evry.inra.fr/public/projects/fst/fst.html">
INRA, URGV
</A>)
</td>
<td valign="top">
6/2003
</td>
<td valign="top">
WS
</td>
<td valign="top">
35,000 FSTs
</td>
<td valign="top">
30,000
</td>
<td valign="top">
<A HREF="http://flagdb-genoplante-info.infobiogen.fr/projects/fst/DocsIntro/Demande_LigneesPublic.html">
12,300 from INRA Versailles
</A>
</td>
<td valign="top">
<A HREF="http://flagdb-genoplante-info.infobiogen.fr/projects/fst/DocsIntro/MTA-FSTpublic.pdf">
MTA
</A> signed at each order; no IP strings
<sup>A
</sup>; 200 Euro/line
<br>&nbsp;
</td>
</tr>



<tr bgcolor="#D5D9DD">
<td valign="top">
<A HREF="http://www.mpiz-koeln.mpg.de/GABI-Kat">
GABI-Kat
</A>
</td>
<td valign="top">
2003
<br>(pos. ext. to 2007)
</td>
<td valign="top">
Col
</td>
<td valign="top">
78,000 lines (70K T-DNA, 8K ZIGIA)
</td>
<td valign="top">
78,000, not all FST-analysed yet
</td>
<td valign="top">
26,350 in 
<A HREF="http://www.mpiz-koeln.mpg.de/GABI-Kat/db/">
Simple Search
</A>,
<br>8,230 gene hits (in CDSi
<sup>C
</sup>)
<br>&nbsp;
</td>
<td valign="top">
<A HREF="http://www.mpiz-koeln.mpg.de/GABI-Kat/GABI-Kat_Download/MTA-GABIkat_20020606.rtf">
MTA
</A> signed at each order; No IP strings
<sup>A,B
</sup>; 500 Euro/confirmed line
</td>
</tr>



<tr bgcolor="#F5F9FF">
<td valign="top">
<A HREF="http://atidb.cshl.org">
GARNet Project
</A>
</td>
<td valign="top">
7/2003
</td>
<td valign="top">
Col
</td>
<td valign="top">
27,000 Ds/Spm lines, expecting 5,000 KOs
</td>
<td valign="top">
15,000 sequenced
</td>
<td valign="top">
15,000 through 
<A HREF="http://arabidopsis.info/">
NASC
</A>
, require bulking
<br>&nbsp;
</td>
<td valign="top">
none
</td>
</tr>



<tr bgcolor="#D5D9DD">
<td valign="top">
<A HREF="http://atidb.cshl.org">
GARNet Project
</A>
</td>
<td valign="top">
7/2003
</td>
<td valign="top">
Ler
</td>
<td valign="top">
30,000 Ds Gene-trap lines
</td>
<td valign="top">
24,000 made, 4,000 sequenced
</td>
<td valign="top">
4,000 through 
<A HREF="/">
NASC
</A>
, require bulking
</td>
<td valign="top">
None; some lines will remain inside a Euro consortium until the end of the project, 7/2003
<br>&nbsp;
</td>
</tr>



<tr bgcolor="#F5F9FF">
<td valign="top">
<A HREF="http://pfgweb.gsc.riken.go.jp/projects/acds.html">
RIKEN
</A>
</td>
<td valign="top">
2004
</td>
<td valign="top">
No-0
</td>
<td valign="top">
15,000 Transposon (Ac/Ds) lines
</td>
<td valign="top">
10,000 collected,
<br>10,000 sequenced
<br>&nbsp;
</td>
<td valign="top">
1,000 deposited to 
<A HREF="http://www.brc.riken.go.jp/lab/epd/Eng/index.html">
RIKEN BRC
</A>
<br>(5,000 more in 2003)
</td>
<td valign="top">
MTA; includes IP restrictions
</td>
</tr>



<tr bgcolor="#D5D9DD">
<td valign="top">
<A HREF="http://pfgweb.gsc.riken.go.jp/projects/actv.html">
RIKEN
</A>
</td>
<td valign="top">
2004
</td>
<td valign="top">
Col
</td>
<td valign="top">
60,000 Activation trap lines
</td>
<td valign="top">
50,000 collected,
<br>1,000 sequenced
<br>&nbsp;
</td>
<td valign="top">
none yet
</td>
<td valign="top">
MTA; includes IP restrictions
</td>
</tr>



<tr bgcolor="#F5F9FF">
<td valign="top">
<A HREF="http://tmri.org/pages/collaborations/garlic_files/">
TMRI
</A>
<br>SAIL lines, formerly GARLIC lines
</td>
<td valign="top">
done
</td>
<td valign="top">
Col
</td>
<td valign="top">
100,000 TDNA
</td>
<td valign="top">
100,000 collected,
<br>~53,000 sequenced
<br>&nbsp;
</td>
<td valign="top">
All, through Syngenta
</td>
<td valign="top">
<A HREF="http://tmri.org/pages/collaborations/garlic_files/SAIL_MTA.pdf">
MTA
</A>
</td>
</tr>



<tr bgcolor="#D5D9DD">
<td valign="top">
<A HREF="http://atidb.cshl.org">
UK-Transposon lines
</A>
<br>&nbsp;
</td>
<td valign="top">
7/2003
</td>
<td valign="top">
Ler
</td>
<td valign="top">
5,000 Activation trap lines
</td>
<td valign="top">
500 sequenced
</td>
<td valign="top">
500 through 
<A HREF="http://arabidopsis.info/">
NASC
</A>
, require bulking
</td>
<td valign="top">
None
</td>
</tr>



<tr bgcolor="#F5F9FF">
<td valign="top">
<A HREF="http://www.biotech.wisc.edu/Arabidopsis/">
Wisconsin Knock-Out Project
</A>
<br>&nbsp;
<br>&nbsp;
</td>
<td valign="top">
2004
</td>
<td valign="top">
WS
</td>
<td valign="top">
130,000 TDNA lines
</td>
<td valign="top">
130,000 lines
</td>
<td valign="top">
130,000 lines (no flanking sequence), seeds at 
<A HREF="/abrc/">
ABRC
</A>
</td>
<td valign="top">
none; charge for screening ($500 for 2 rounds)
</td>
</tr>
</table>
<table width="750" align="center" border="0" cellspacing="0" cellpadding="2">
<tr bgcolor="#D5D9DD">
<td width="700" valign="top">
<p>
<sup>A
</sup>MTA for liability and responsibility for the care of 
the transgenic material
<br>
<sup>B
</sup>MTA allows distribution to third parties but not sale of 
material
<br>
<sup>C
</sup>CDSi = Coding Sequence including Introns
</p>
</td>
</tr>
</table>

<table width="602" align="center" border="0" cellspacing="0" cellpadding="2">
<tr>
<td width="602">
<p>


<A HREF="/portals/masc/Subcommittees.jsp#revgen">
Return to Reverse Genetic Stocks Subcommittee Page
</A>


<p>
<center>Last modified on April 13, 2004
</center>
</p>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


