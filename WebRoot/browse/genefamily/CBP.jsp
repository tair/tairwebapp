<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR- Calmodulin-binding Proteins Gene Family";
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
<h2><i>Arabidopsis</i> Calmodulin-binding Proteins</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><b>Vaka S Reddy, Gul S Ali, ASN Reddy.</b> (2002) <A HREF=/servlets/TairObject?type=publication&id=1546140 target=new>Genes Encoding Calmodulin-binding Proteins in the <i>Arabidopsis</i> Genome</A> <i>JOURNAL OF BIOLOGICAL CHEMISTRY</i> 22;277(12):9840-52


</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>protein-protein interaction approach to identify calmodulin-binding
proteins in Arabidopsis</td></tr>

<TR><TD valign=top><B>Contact:</b></td>
<td>
<li><a href=/servlets/Community?action=view&type=person&communityID=711946 target=new>Vaka S Reddy</A><br>
<li><a href=/servlets/Community?action=view&type=person&communityID=1313553 target=new>Gul Shad Ali</A><br>
<li><a href=/servlets/Community?action=view&type=person&communityID=5935 target=new>ASN Reddy</A><br>
</td></tr>
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2 align=center><b><i>Arabidopsis</i> genes encoding CBPs that were either identified by screening expression libraries with labeled calmodulin or identified
based on sequence similarity to characterized CBPs</b></td></tr></table>
<p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

         </TR>

<tr class="alt"><td rowspan=11 valign=top><b>Single gene-encoded CBPs<br></b></td>

       <td>Hypothetical</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g04020 target="new">At5g04020</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414427&dopt=GenBank>NM_120484</A><br>(GI:18414427)</td>

        </tr>

<tr class="alt">
<td>PKC substrate-like</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g56360 target="new">At5g56360</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423855&dopt=GenBank>NM_125019</A><br>(GI:18423855)</td>

        </tr>


<tr class="alt">
<td>Photosystem I-N</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g64040 target="new">At5g64040</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424780&dopt=GenBank>NM_125800</A><br>(GI:18424780)</td>

        </tr>


<tr class="alt">
<td>Hypothetical</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g38800 target="new">At2g38800</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404862&dopt=GenBank>NM_129437</A><br>(GI:18404862)</td>

        </tr>


<tr class="alt">
<td>KCBP</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g65930 target="new">At5g65930</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18425008&dopt=GenBank>NM_125990</A><br>(GI:18425008)</td>

        </tr>


<tr class="alt">
<td>ATPase</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g56690 target="new">At3g56690</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18410554&dopt=GenBank>NM_115528</A><br>(GI:18410554)</td>

        </tr>


<tr class="alt">
<td>Chaperonin 10</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g20720 target="new">At5g20720</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420295&dopt=GenBank>NM_122079</A><br>(GI:18420295)</td>

        </tr>


<tr class="alt">
<td>Glyoxalase</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g08110 target="new">At1g08110</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18390855&dopt=GenBank>NM_100687</A><br>(GI:18390855)</td>

        </tr>


<tr class="alt">
<td>Apyrase</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g04080 target="new">At3g04080</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396762&dopt=GenBank>NM_111279</A><br>(GI:18396762)</td>

        </tr>


<tr class="alt">
<td>Multidrug-resistant-like</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g36910 target="new">At2g36910</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404272&dopt=GenBank>NM_129247</A><br>(GI:18404272)</td>

        </tr>


<tr class="alt">
<td>Ser/Thr phosphatase PP7</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g63870 target="new">At5g63870</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424757&dopt=GenBank>NM_125782</A><br>(GI:18424757)</td>

        </tr>


<tr><td rowspan=5 valign=top><b>SAURs</b></td>
<td>SAUR.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g43120 target="new">At3g43120</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407445&dopt=GenBank>NM_114180</A><br>(GI:18407445)</td>

        </tr>


<tr>
<td>SAUR.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g20810 target="new">At5g20810</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420318&dopt=GenBank>NM_122088</A><br>(GI:18420318)</td>

        </tr>

<tr>
<td> SAUR.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g31320 target="new">At4g31320</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417783&dopt=GenBank>NM_119281</A><br>(GI:18417783)</td>

        </tr>


<tr>
<td>SAUR.d</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g24400 target="new">At2g24400</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18400535&dopt=GenBank>NM_128001</A><br>(GI:18400535)</td>

        </tr>

<tr>
<td>SAUR.e</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g34750 target="new">At4g34750</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18418507&dopt=GenBank>NM_119641</A><br>(GI:18418507)</td>

        </tr>


<tr class="alt"><td rowspan=2 valign=top><b>Hypothetical proteins</b></td>
<td>Hypothetical.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g25030 target="new">At3g25030</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404388&dopt=GenBank>NM_113407</A><br>(GI:18404388)</td>

        </tr>

<tr class="alt">
<td>Hypothetical.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g13100 target="new">At4g13100</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413925&dopt=GenBank>NM_117379</A><br>(GI:18413925)</td>

        </tr>


<tr><td rowspan=7 valign=top><b>Calmodulin-binding protein 60s (ACBP60s)</b></td>
<td>ACBP60-like.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g62570 target="new">At5g62570</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424604&dopt=GenBank>NM_125651</A><br>(GI:18424604)</td>

        </tr>

<tr>
<td>ACBP60-like.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g57580 target="new">At5g57580</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423995&dopt=GenBank>NM_125139</A><br>(GI:18423995)</td>

        </tr>


<tr>
<td>ACBP60-like.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g18750 target="new">At2g18750</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398835&dopt=GenBank>NM_127431</A><br>(GI:18398835)</td>

        </tr>

<tr>
<td>ACBP60-like.d</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g25800 target="new">At4g25800</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416621&dopt=GenBank>NM_118712</A><br>(GI:18416621)</td>

        </tr>


<tr>
<td>ACBP60-like.e</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g24300 target="new">At2g24300</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18400512&dopt=GenBank>NM_127992</A><br>(GI:18400512)</td>

        </tr>


<tr>
<td>ACBP60-like.f</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g31000 target="new">At4g31000</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417718&dopt=GenBank>NM_119250</A><br>(GI:18417718)</td>

        </tr>


<tr>
<td>ACBP60-like.g</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g26920 target="new">At5g26920</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421060&dopt=GenBank>NM_122574</A><br>(GI:18421060)</td>

        </tr>

<tr class="alt"><td rowspan=20 valign=top><b>CNGCs</b></td>
<td>CNGC1.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g53130 target="new">At5g53130</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423474&dopt=GenBank>NM_124692</A><br>(GI:18423474)</td>

        </tr>


<tr class="alt">
<td>CNGC2.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g15410 target="new">At5g15410</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417659&dopt=GenBank>NM_121545</A><br>(GI:18417659)</td>

        </tr>

<tr class="alt">
<td>CNGC3.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g46430 target="new">At2g46430</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407072&dopt=GenBank>NM_130207</A><br>(GI:18407072)</td>

        </tr>

<tr class="alt">
<td>CNGC4.d</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g54250 target="new">At5g54250</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423607&dopt=GenBank>NM_124805</A><br>(GI:18423607)</td>

        </tr>


<tr class="alt">
<td>CNGC5.e</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g57940 target="new">At5g57940</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424047&dopt=GenBank>NM_125179</A><br>(GI:18424047)</td>

        </tr>

<tr class="alt">
<td>CNGC6.f</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g23980 target="new">At2g23980</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18400425&dopt=GenBank>NM_127960</A><br>(GI:18400425)</td>

        </tr>


<tr class="alt">
<td>CNGC-like.g</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g01340 target="new">At1g01340</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18378826&dopt=GenBank>NM_100016</A><br>(GI:18378826)</td>

        </tr>

<tr class="alt">
<td>CNGC-like.h</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g46440 target="new">At2g46440</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407076&dopt=GenBank>NM_130208</A><br>(GI:18407076)</td>

        </tr>

<tr class="alt">
<td>CNGC-like.i</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g24610 target="new">At2g24610</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18400590&dopt=GenBank>NM_128022</A><br>(GI:18400590)</td>



        </tr>


<tr class="alt">
<td>CNGC-like.j</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g28260 target="new">At2g28260</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401686&dopt=GenBank>NM_128386</A><br>(GI:18401686)</td>



        </tr>

<tr class="alt">
<td>CNGC-like.k</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g48010 target="new">At3g48010</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408558&dopt=GenBank>NM_114670</A><br>(GI:18408558)</td>



        </tr>


<tr class="alt">
<td>CNGC-like.l</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g01010 target="new">At4g01010</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411506&dopt=GenBank>NM_116329</A><br>(GI:18411506)</td>



        </tr>

<tr class="alt">
<td>CNGC-like.m</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g30360 target="new">At4g30360</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417578&dopt=GenBank>NM_119182</A><br>(GI:18417578)</td>



        </tr>


<tr class="alt">
<td>CNGC-like.n</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g30560 target="new">At4g30560</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417619&dopt=GenBank>NM_119202</A><br>(GI:18417619)</td>



        </tr>

<tr class="alt">
<td>CNGC-like.o</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g14870 target="new">At5g14870</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417497&dopt=GenBank>NM_121491</A><br>(GI:18417497)</td>



        </tr>


<tr class="alt">
<td>CNGC-like.p</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g15990 target="new">At1g15990</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394308&dopt=GenBank>NM_101467</A><br>(GI:18394308)</td>



        </tr>

<tr class="alt">
<td>CNGC-like.q</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g19780 target="new">At1g19780</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394784&dopt=GenBank>NM_101834</A><br>(GI:18394784)</td>



        </tr>


<tr class="alt">
<td>CNGC-like.r</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g46450 target="new">At2g46450</A></td>

       <td>&nbsp;</td>



        </tr>

<tr class="alt">
<td>CNGC-like.s</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g17690 target="new">At3g17690</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401604&dopt=GenBank>NM_112650</A><br>(GI:18401604)</td>



        </tr>


<tr class="alt">
<td>CNGC-like.t</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g17700 target="new">At3g17700</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401605&dopt=GenBank>NM_112651</A><br>(GI:18401605)</td>



        </tr>

<tr><td rowspan=6 valign=top><b>EICBPs</b></td>
<td>EICBP.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g22300 target="new">At2g22300</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18399931&dopt=GenBank>NM_127795</A><br>(GI:18399931)</td>



        </tr>


<tr>
<td>EICBP.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g09410 target="new">At5g09410</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18415969&dopt=GenBank>NM_120978</A><br>(GI:18415969)</td>



        </tr>

<tr>
<td>EICBP.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g64220 target="new">At5g64220</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424801&dopt=GenBank>NM_125818</A><br>(GI:18424801)</td>



        </tr>


<tr>
<td>EICBP.d</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g67310 target="new">At1g67310</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408737&dopt=GenBank>NM_105399</A><br>(GI:18408737)</td>



        </tr>

<tr>
<td>EICBP.e</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g16940 target="new">At3g16940</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401309&dopt=GenBank>NM_112570</A><br>(GI:18401309)</td>



        </tr>


<tr>
<td>EICBP.f</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g16150 target="new">At4g16150</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414601&dopt=GenBank>NM_117710</A><br>(GI:18414601)</td>



        </tr>


<tr class="alt"><td rowspan=4 valign=top><b>Pirin-like proteins</b></td>
<td>Pirin-like.a</td>
<td>&nbsp;</td>

       <td>&nbsp;</td>



        </tr>

<tr class="alt">
<td>Pirin-like.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g59220 target="new">At3g59220</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411120&dopt=GenBank>NM_115784</A><br>(GI:18411120)</td>



        </tr>


<tr class="alt">
<td>Pirin-like.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g59260 target="new">At3g59260</A></td>

       <td>&nbsp;</td>



        </tr>

<tr class="alt">
<td>Pirin-like.d</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g50590 target="new">At1g50590</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403130&dopt=GenBank>NM_103941</A><br>(GI:18403130)</td>



        </tr>


<tr><td rowspan=2 valign=top><b>Hypothetical proteins</b></td>
<td>Hypothetical.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g40190 target="new">At5g40190</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421955&dopt=GenBank>NM_123383</A><br>(GI:18421955)</td>



        </tr>

<tr>
<td>Hypothetical.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g28140 target="new">At3g28140</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18405659&dopt=GenBank>NM_113732</A><br>(GI:18405659)</td>



        </tr>


<tr class="alt"><td rowspan=3 valign=top><b>PCBPs</b></td>
<td>APCBP.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g43040 target="new">At2g43040</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18406133&dopt=GenBank>NM_129865</A><br>(GI:18406133)</td>



        </tr>

<tr class="alt">
<td>APCBP.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g27460 target="new">At1g27460</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396346&dopt=GenBank>NM_102510</A><br>(GI:18396346)</td>



        </tr>


<tr class="alt">
<td>APCBP.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g28600 target="new">At4g28600</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417228&dopt=GenBank>NM_119002</A><br>(GI:18417228)</td>



        </tr>

<tr><td rowspan=3 valign=top><b>CB-HSPs</b></td>
<td>CB-HSP.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g49050 target="new">At3g49050</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408765&dopt=GenBank>NM_114764</A><br>(GI:18408765)</td>



        </tr>


<tr>
<td>CB-HSP.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g00500 target="new">At4g00500</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411353&dopt=GenBank>NM_116274</A><br>(GI:18411353)</td>



        </tr>


<tr>
<td>CB-HSP.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g37710 target="new">At5g37710</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421679&dopt=GenBank>NM_123130</A><br>(GI:18421679)</td>



        </tr>

<tr class="alt"><td rowspan=5 valign=top><b>GAD</b></td>
<td>GAD1.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At5g17330 target="new">At5g17330</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18418267&dopt=GenBank>NM_121739</A><br>(GI:18418267)</td>



        </tr>


<tr class="alt">
<td>GAD2.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g65960 target="new">At1g65960</A></td>

       <td>&nbsp;</td>



        </tr>

<tr class="alt">
<td>GAD.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g02010 target="new">At2g02010</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395281&dopt=GenBank>NM_126262</A><br>(GI:18395281)</td>



        </tr>


<tr class="alt">
<td>GAD.d</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g17760 target="new">At3g17760</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401634&dopt=GenBank>NM_112657</A><br>(GI:18401634)</td>



        </tr>

<tr class="alt">
<td>GAD.e</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g02000 target="new">At2g02000</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395279&dopt=GenBank>NM_126261</A><br>(GI:18395279)</td>



        </tr>


<tr><td rowspan=13 valign=top><b>ACA</b></td>
<td>ACA1.a</td>
<td><a href=/servlets/TairObject?type=locus&name=At1g27770 target="new">At1g27770</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396483&dopt=GenBank>NM_102542</A><br>(GI:18396483)</td>



        </tr>

<tr>
<td>ACA2.b</td>
<td><a href=/servlets/TairObject?type=locus&name=At4g37640 target="new">At4g37640</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420089&dopt=GenBank>NM_119927</A><br>(GI:18420089)</td>



        </tr>


<tr>
<td>ACA.c</td>
<td><a href=/servlets/TairObject?type=locus&name=At3g57330 target="new">At3g57330</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18410695&dopt=GenBank>NM_115593</A><br>(GI:18410695)</td>



        </tr>

<tr>
<td>ACA4.d</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g41560 target="new">At2g41560</A></td>

       <td>&nbsp;</td>



        </tr>


<tr>
<td>ACA7.e</td>
<td><a href=/servlets/TairObject?type=locus&name=At2g22960 target="new">At2g22960</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18400129&dopt=GenBank>NM_127861</A><br>(GI:18400129)</td>



        </tr>

<tr>
<td>ACA8.f</td><td><a href=/servlets/TairObject?type=locus&name=At5g57110 target="new">At5g57110</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423938&dopt=GenBank>NM_125093</A><br>(GI:18423938)</td>



        </tr>

<tr>
<td>ACA9.g</td><td><a href=/servlets/TairObject?type=locus&name=At3g21180 target="new">At3g21180</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18402917&dopt=GenBank>NM_113013</A><br>(GI:18402917)</td>



        </tr>

<tr>
<td>ACA10.h</td><td><a href=/servlets/TairObject?type=locus&name=At4g29900 target="new">At4g29900</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417488&dopt=GenBank>NM_119136</A><br>(GI:18417488)</td>



        </tr>
<tr>
<td>ACA.i</td><td><a href=/servlets/TairObject?type=locus&name=At5g53010 target="new">At5g53010</A></td>

       <td>&nbsp;</td>

        </tr>

<tr>
<td>ACA.j</td><td><a href=/servlets/TairObject?type=locus&name=At3g63380 target="new">At3g63380</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412752&dopt=GenBank>NM_116203</A><br>(GI:18412752)</td>



        </tr>

<tr>
<td>ACA.k</td><td><a href=/servlets/TairObject?type=locus&name=At3g22910 target="new">At3g22910</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403575&dopt=GenBank>NM_113191</A><br>(GI:18403575)</td>



        </tr>

<tr>
<td>ACA.l</td><td><a href=/servlets/TairObject?type=locus&name=At1g13210 target="new">At1g13210</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18391486&dopt=GenBank>NM_101192</A><br>(GI:18391486)</td>



        </tr>

<tr>
<td>ECA3.m</td><td><a href=/servlets/TairObject?type=locus&name=At1g10130 target="new">At1g10130</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18391112&dopt=GenBank>NM_100887</A><br>(GI:18391112)</td>



        </tr>

<tr class="alt"><td rowspan=2 valign=top><b>PPI</b></td>
<td>PPI.a</td><td><a href=/servlets/TairObject?type=locus&name=At3g25230 target="new">At3g25230</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404476&dopt=GenBank>NM_113429</A><br>(GI:18404476)</td>



        </tr>

<tr class="alt">
<td>PPI.b</td><td><a href=/servlets/TairObject?type=locus&name=At5g48570 target="new">At5g48570</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422930&dopt=GenBank>NM_124233</A><br>(GI:18422930)</td>



        </tr>

<tr><td rowspan=4 valign=top><b>EF-1alpha </b></td>
<td>EF-1alpha.a</td><td><a href=/servlets/TairObject?type=locus&name=At5g60390 target="new">At5g60390</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424350&dopt=GenBank>NM_125432</A><br>(GI:18424350)</td>



        </tr>

<tr>
<td>EF-1alpha.b</td><td><a href=/servlets/TairObject?type=locus&name=At1g07920 target="new">At1g07920</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18390826&dopt=GenBank>NM_100666</A><br>(GI:18390826)</td>



        </tr>

<tr>
<td>EF-1alpha.c</td><td><a href=/servlets/TairObject?type=locus&name=At1g07930 target="new">At1g07930</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18390828&dopt=GenBank>NM_100667</A><br>(GI:18390828)</td>



        </tr>

<tr>
<td>EF-1alpha.d</td><td><a href=/servlets/TairObject?type=locus&name=At1g07940 target="new">At1g07940</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18390830&dopt=GenBank>NM_100668</A><br>(GI:18390830)</td>



        </tr>

<tr class="alt"><td rowspan=4 valign=top><b>TGA3-like</b></td>
<td>TGA3.a</td><td><a href=/servlets/TairObject?type=locus&name=At1g22070 target="new">At1g22070</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395067&dopt=GenBank>NM_102057</A><br>(GI:18395067)</td>



        </tr>

<tr class="alt">
<td>TGA3-like.b</td><td><a href=/servlets/TairObject?type=locus&name=At1g77920 target="new">At1g77920</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411747&dopt=GenBank>NM_106441</A><br>(GI:18411747)</td>



        </tr>

<tr class="alt">
<td>TGA1.c</td><td><a href=/servlets/TairObject?type=locus&name=At5g10030 target="new">At5g10030</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416161&dopt=GenBank>NM_121041</A><br>(GI:18416161)</td>



        </tr>

<tr class="alt">
<td>TGA1b.d</td><td><a href=/servlets/TairObject?type=locus&name=At5g65210 target="new">At5g65210</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424924&dopt=GenBank>NM_125919</A><br>(GI:18424924)</td>



        </tr>

<tr><td rowspan=3 valign=top><b>60 S ribosomal L19 proteins</b></td>
<td>RibosomalL19.a</td><td><a href=/servlets/TairObject?type=locus&name=At3g16780 target="new">At3g16780</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401244&dopt=GenBank>NM_112551</A><br>(GI:18401244)</td>



        </tr>

<tr>
<td>RibosomalL19.b</td><td><a href=/servlets/TairObject?type=locus&name=At4g02230 target="new">At4g02230</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411886&dopt=GenBank>NM_116456</A><br>(GI:18411886)</td>



        </tr>

<tr>
<td>RibosomalL19.c</td><td><a href=/servlets/TairObject?type=locus&name=At1g02780 target="new">At1g02780</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18379006&dopt=GenBank>NM_100157</A><br>(GI:18379006)</td>



        </tr>

<tr class="alt"><td rowspan=6 valign=top><b>Heat shock protein 70s (HSP70s)</b></td>
<td>HSP70.a</td><td><a href=/servlets/TairObject?type=locus&name=At3g12580 target="new">At3g12580</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18399673&dopt=GenBank>NM_112093</A><br>(GI:18399673)</td>



        </tr>

<tr class="alt">
<td>HSP70.b</td><td><a href=/servlets/TairObject?type=locus&name=At5g02500 target="new">At5g02500</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413939&dopt=GenBank>NM_120328</A><br>(GI:18413939)</td>



        </tr>

<tr class="alt">
<td>HSP70.c</td><td><a href=/servlets/TairObject?type=locus&name=At3g09440 target="new">At3g09440</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398513&dopt=GenBank>NM_111778</A><br>(GI:18398513)</td>



        </tr>

<tr class="alt">
<td>HSP70.d</td><td><a href=/servlets/TairObject?type=locus&name=At5g02490 target="new">At5g02490</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413937&dopt=GenBank>NM_120327</A><br>(GI:18413937)</td>



        </tr>

<tr class="alt">
<td>HSP70.e</td><td><a href=/servlets/TairObject?type=locus&name=At1g16030 target="new">At1g16030</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394315&dopt=GenBank>NM_101471</A><br>(GI:18394315)</td>



        </tr>

<tr class="alt">
<td>HSP70.f</td><td><a href=/servlets/TairObject?type=locus&name=At1g56410 target="new">At1g56410</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18405818&dopt=GenBank>NM_104519</A><br>(GI:18405818)</td>



        </tr>

</table><P>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
 <BR>
 <BR>
 <BR>

<P>





<center>Last modified on October 2nd, 2002</center>       

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
