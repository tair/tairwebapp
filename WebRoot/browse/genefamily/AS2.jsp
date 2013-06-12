<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - AS2 Gene Family";
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
<h2><i>Arabidopsis</i> AS2 Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><b><li>Iwakawa H, Ueno Y, Semiarti E, Onouchi H, Kojima S, Tsukaya H, Hasebe M, Soma T, Ikezaki M, Machida C, Machida Y.</b> (2002) <A HREF="/servlets/TairObject?type=publication&id=501682070">The ASYMMETRIC LEAVES2 gene of Arabidopsis thaliana, required for formation of a symmetric flat leaf lamina, encodes a member of a novel family of proteins characterized by cysteine repeats and a leucine zipper.</a> <i>Plant Cell Physiol.</i> <b>43 :</b>467-478 <br><li><a href="http://www.bio.nagoya-u.ac.jp:8001/~yas/b2.html" target=new>MACHIDA lab page</A> - Group of Plant Developmental Biology </td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Structural characterization of the AS2 protein family that is defined by
the presence of the AS2 domain containing the C-motif, the conserved
glycine residue, and the leucine-zipper-like motif</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=5685 target=new>Yasunori Machida</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=42 valign=top><b>AS2 family</b></td>

       <td>AS2:ASYMMETRIC LEAVES2</td>

       <td>F5I14.15<br><a href=/servlets/TairObject?type=locus&name=At1g65620 target="new">At1g65620</A></td>

       <td>AB080802</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65620 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL1:AS2-like gene1</td>

       <td>MUD21.13<br><a href=/servlets/TairObject?type=locus&name=At5g66870 target="new">At5g66870</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66870 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL2:AS2-like gene2</td>

       <td>F26B6.31<br><a href=/servlets/TairObject?type=locus&name=At2g23660 target="new">At2g23660</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23660 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL3:AS2-like gene3</td>

       <td>MGF10.6<br><a href=/servlets/TairObject?type=locus&name=At3g27650 target="new">At3g27650</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27650 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL4:AS2-like gene4</td>

       <td>MDC12.5<br><a href=/servlets/TairObject?type=locus&name=At5g63090 target="new">At5g63090</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63090 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL5:AS2-like gene5</td>

       <td>T27E13.13<br><a href=/servlets/TairObject?type=locus&name=At2g30130 target="new">At2g30130</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30130 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL6:AS2-like gene6</td>

       <td>T19E23.11<br><a href=/servlets/TairObject?type=locus&name=At1g31320 target="new">At1g31320</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31320 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL7:AS2-like gene7</td>

       <td>T17D12.6<br><a href=/servlets/TairObject?type=locus&name=At2g28500 target="new">At2g28500</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28500 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL8:AS2-like gene8</td>

       <td>F24B9.1<br><a href=/servlets/TairObject?type=locus&name=At1g07900 target="new">At1g07900</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07900 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL9:AS2-like gene9</td>

       <td>F3O9.33<br><a href=/servlets/TairObject?type=locus&name=At1g16530 target="new">At1g16530</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16530 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL10:AS2-like gene10</td>

       <td>T9D9.15<br><a href=/servlets/TairObject?type=locus&name=At2g30340 target="new">At2g30340</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30340 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL11:AS2-like gene11</td>

       <td>T2P4.18<br><a href=/servlets/TairObject?type=locus&name=At2g40470 target="new">At2g40470</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40470 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL12:AS2-like gene12</td>

       <td>F9F8.10<br><a href=/servlets/TairObject?type=locus&name=At3g11090 target="new">At3g11090</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11090 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL13:AS2-like gene13</td>

       <td>MLJ15.5<br><a href=/servlets/TairObject?type=locus&name=At3g26660 target="new">At3g26660</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g26660 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL14:AS2-like gene14</td>

       <td>MLJ15.1<br><a href=/servlets/TairObject?type=locus&name=At3g26620 target="new">At3g26620</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g26620 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL15:AS2-like gene15</td>

       <td>MHK10.16<br><a href=/servlets/TairObject?type=locus&name=At2g42440 target="new">At2g42440</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42440 target="new">hypothetical protein </A></td>

        </tr>
<tr class="alt">

       <td>ASL16:AS2-like gene16</td>

       <td>F9D24.100<br><a href=/servlets/TairObject?type=locus&name=At3g58190 target="new">At3g58190</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g58190 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL17:AS2-like gene17</td>

       <td>F16D14.15<br><a href=/servlets/TairObject?type=locus&name=At2g31310 target="new">At2g31310</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31310 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL18:AS2-like gene18</td>

       <td>MHK10.15<br><a href=/servlets/TairObject?type=locus&name=At2g42430 target="new">At2g42430</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42430 target="new">expressed protein </A></td>

        </tr>
<tr class="alt">

       <td>ASL19:AS2-like gene19</td>

       <td>F6N15.4<br><a href=/servlets/TairObject?type=locus&name=At4g00220 target="new">At4g00220</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00220 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL20:AS2-like gene20</td>

       <td>F4L23.41<br><a href=/servlets/TairObject?type=locus&name=At2g45420 target="new">At2g45420</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45420 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL21:AS2-like gene21</td>

       <td>F20H23.21<br><a href=/servlets/TairObject?type=locus&name=At3g03760 target="new">At3g03760</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03760 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL22:AS2-like gene22</td>

       <td>F6N15.25<br><a href=/servlets/TairObject?type=locus&name=At4g00210 target="new">At4g00210</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00210 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL23:AS2-like gene23</td>

       <td>F4L23.45<br><a href=/servlets/TairObject?type=locus&name=At2g45410 target="new">At2g45410</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45410 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL24:AS2-like gene24</td>

       <td>K16F4.4<br><a href=/servlets/TairObject?type=locus&name=At5g06080 target="new">At5g06080</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06080 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL25:AS2-like gene25</td>

       <td>T20E23.110<br><a href=/servlets/TairObject?type=locus&name=At3g50510 target="new">At3g50510</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50510 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL26:AS2-like gene26</td>

       <td>T12H17.90<br><a href=/servlets/TairObject?type=locus&name=At4g22700 target="new">At4g22700</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22700 target="new">predicted protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL27:AS2-like gene27</td>

       <td>MIK22.21<br><a href=/servlets/TairObject?type=locus&name=At5g35900 target="new">At5g35900</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35900 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL28:AS2-like gene28</td>

       <td>K24A2.3<br><a href=/servlets/TairObject?type=locus&name=At3g27940 target="new">At3g27940</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27940 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL29:AS2-like gene29</td>

       <td>T23J7.200<br><a href=/servlets/TairObject?type=locus&name=At3g47870 target="new">At3g47870</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47870 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL30:AS2-like gene30</td>

       <td>MCP4.8<br><a href=/servlets/TairObject?type=locus&name=At3g13850 target="new">At3g13850</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13850 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL31:AS2-like gene31</td>

       <td>F3N23.18<br><a href=/servlets/TairObject?type=locus&name=At1g72980 target="new">At1g72980</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72980 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL32:AS2-like gene32</td>

       <td>F9P14.14<br><a href=/servlets/TairObject?type=locus&name=At1g06280 target="new">At1g06280</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06280 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL33:AS2-like gene33</td>

       <td>T22A15.8<br><a href=/servlets/TairObject?type=locus&name=At1g36000 target="new">At1g36000</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g36000 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL34:AS2-like gene34</td>

       <td>F3P11.11<br><a href=/servlets/TairObject?type=locus&name=At2g19510 target="new">At2g19510</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19510 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL35:AS2-like gene35</td>

       <td>F6F22.15<br><a href=/servlets/TairObject?type=locus&name=At2g19820 target="new">At2g19820</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19820 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL36:AS2-like gene36</td>

       <td>T26J14.8<br><a href=/servlets/TairObject?type=locus&name=At1g68510 target="new">At1g68510</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68510 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL37:AS2-like gene37</td>

       <td>F5A8.2<br><a href=/servlets/TairObject?type=locus&name=At1g67100 target="new">At1g67100</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67100 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL38:AS2-like gene38</td>

       <td>F16B3.18<br><a href=/servlets/TairObject?type=locus&name=At3g02550 target="new">At3g02550</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02550 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL39:AS2-like gene39</td>

       <td>K8K14.16<br><a href=/servlets/TairObject?type=locus&name=At5g67420 target="new">At5g67420</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67420 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL40:AS2-like gene40</td>

       <td>F3A4.20<br><a href=/servlets/TairObject?type=locus&name=At3g49940 target="new">At3g49940</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49940 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ASL41:AS2-like gene41</td>

       <td>F19F18.30<br><a href=/servlets/TairObject?type=locus&name=At4g37540 target="new">At4g37540</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37540 target="new">putative protein</A></td>

        </tr>

</table><P>
<center>Last modified on January 13, 2004</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
