<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Genome Assembly";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName%>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11410" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Genome Assembly" />  
</jsp:include>
<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Genome Assembly</span>


<DL>
The Arabidopsis thaliana genome was sequenced in 2000 by the Arabidopsis Genome Initiative (AGI) (<a href="http://www.nature.com/nature/journal/v408/n6814/full/408796a0.html">Nature 14 Dec. 2000</a>). The genome has five chromosomes and a total size of approximately 135-megabases. The current TIGR golden path length is 119,146,348 bp. The table below shows the approximate total length and the length of the golden path for each chromosome.

<P>
<table border=1 cellspacing="0" cellpadding="1">
<TR>
<TH></TH>
<TH>Golden path length</TH>
<TH>Approximate chromosome length</TH>
</TR>

<TR>
<TD>Chromosome 1</TD>
<TD>30,427,671 bp</TD>
<TD>34,964,571 bp</TD>
</TR>

<TR>
<TD>Chromosome 2</TD>
<TD>19,698,289 bp</TD>
<TD>22,037,565 bp</TD>
</TR>

<TR>
<TD>Chromosome 3</TD>
<TD>23,459,830 bp</TD>
<TD>25,499,034 bp</TD>
</TR>

<TR>
<TD>Chromosome 4</TD>
<TD>18,585,056 bp</TD>
<TD>20,862,711 bp</TD>
</TR>

<TR>
<TD>Chromosome 5</TD>
<TD>26,975,502 bp</TD>
<TD>31,270,811 bp</TD>
</TR>
<TR>
<TD>Total</TD>
<TD>119,146,348 bp</TD>
<TD>134,634,692 bp</TD>
</TR>


</TABLE>
<P>
<a href="ftp://ftp.arabidopsis.org/home/tair/home/tair/Sequences/whole_chromosomes/">Chromosome sequence data</a> and <a href="ftp://ftp.arabidopsis.org/home/tair/Maps/seqviewer_data/sv_assembly_unit.data">AGI tiling paths</a> are available from the <a href="ftp://ftp.arabidopsis.org/home/tair/home/tair/">TAIR FTP site</a>.

<p><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR8_Assembly_updates.xls">TAIR8_Assembly_updates.xls</a> and <a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR9_Assembly_updates.xls">TAIR9_Assembly_updates.xls</a> contains a list of all assembly updates made for the TAIR8 and TAIR9 genome releases.</p>

<P>
<P>For a summary of remaining gaps and and unsequenced clones go to <a href="#status">Current Genome Status</a>. For a description  of the groups that participated in the sequencing effort go to <a href="#groups">AGI groups</a>.
</DL>
<a name="top"></a>
<a name="status"></a>
<DL>
<DT>Current Genome Status
<DL>

<DT><B> Known Gaps</B>
<DD>Centromeres and other gaps between clones in <font color="#ff0000">red</font>.<BR> 
Clones containing gaps in <font color="#cc00ff">purple</font>.<BR>
 * Indicates sequence is not yet deposited in GenBank.
    
<DD><B>Chromosome 1:</B> <BR>
 T18N24<font color="#cc00ff">-F8L2-</font>F2C1<font color="#cc00ff"></font><font color="#cc00ff">-F12G6-</font>T23P23<font color="#cc00ff">-T28N5-</font>F11K13<BR>

 T24F19<font color="#ff0000">-<B>CEN1</B>-</font>F13P3<BR>
 F9A12<font color="#cc00ff">-F25O15-</font><font color="#cc00ff">F9D18-</font>T5F23<BR>
 F27F5<font color="#cc00ff">-T2P3-</font>F2G19
 F12A4<font color="#cc00ff">-F1504-</font>F14D7
 T32E22<font color="#cc00ff">-F103-</font>T32E20
 F16N3<font color="#cc00ff">-T2E6-</font>T6B12
 F10A5<font color="#cc00ff">-T4012-</font>T23E18

<DD><B>Chromosome 2:</B> <BR>
    NOR2<font color="#cc00ff">-F23H14-</font>F10A8
    T12J2<font color="#ff0000">-<B>CEN2</B>-<font color="#cc00ff">T6C20-</font></font>T14C8<BR>
    T4E5<font color="#cc00ff">-F10C8-</font>T18E17

<DD><B>Chromosome 3:</B> <BR>
    <font color="#cc00ff">TEL3N-</font>T4P13
    K3G3<font color="#cc00ff">-MJL12-</font>MTE24
    MUO10<font color="#cc00ff">-T13B17-</font>MWE13
    F8N14<font color="#cc00ff">-T803-</font>F1M23
    T15D2<FONT color="#ff0000">-<B>CEN3</B>-<font color="#cc00ff">T25F15-</font></FONT>F23H6<FONT color="#cc00ff">-T28G19</font><font color="#ff0000">-5SrDNA-</font>F1C23<font color="#cc00ff">-T18B3-</FONT>T26P13-T14A11-<br>
    T4P3<FONT color="#cc00ff">-F21A14</font><font color="#ff0000">-5SrDNA-</font></FONT>F4M19
    F7M19<font color="#cc00ff">-T6L19-</font>
    <font color="#cc00ff"></font>-F7K15
<DD><B>Chromosome 4:</B> <BR>
    <font color="#ff0000">NOR4</font>-T15P10
    F21I2<font color="#ff0000">-5SrDNA-</font>F14G16<BR>
    T2N12<font color="#ff0000">-<B>CEN4</B>-</font>F13J5<BR>
    T13J8<font color="#cc00ff">-F26K10-</font>F20O9<font color="#cc00ff">-T5F17-</font>F16A16 <BR>

    F19B15<font color="#cc00ff">-F17A13-</font>T16L4 <BR>
    F6I18<font color="#cc00ff">-F6E21-</font>F8F16 <BR>
    F4D11<font color="#cc00ff">-T16I18-</font>F26P21

<DD><B>Chromosome 5:</B> <BR>
    <font color="#cc00ff"></font>
    F21E1<font color="#cc00ff">-T19N18*-</font>T32M21<BR>
    F23C8<font color="#cc00ff">-T26N4</font><font color="#ff0000">-5SrDNA-</font>F23B23<BR>
    F28N5<font color="#ff0000">-<B>CEN5</B>-</font>T8H11<BR>

    T32B3<font color="#ff0000">-5SrDNA-</font><font color="#cc00ff">T25B21-</font>T3J11
    
 <dt><b><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/Assembly_gaps.gff">GFF file of all known gaps in the Arabidopsis genome assembly</a> April 2008</b>   
<DT>
<B><A HREF="currentStatus.txt">Clones Missing or Incomplete in GenBank</A> September 2003</B
<DD>Clones in GenBank HTG section (sequencing in progress) or missing from GenBank.  Includes chromosome, status, accession number, group and comments.

<DT><B> <A HREF="TAIRgapTable.jsp">Table of Gaps and Incomplete Clones</A> September 2003</B>
<DD>Includes comments from TAIR, TIGR and AGI groups on status and priority for sequencing.
<P>
</DL>
</DL>
<p>Back to <a href="#top">top</a></p>
<a name="groups"></a>
<DL>
<DT>AGI Groups

<DT><a href="http://nucleus.cshl.org/protarab/"><B>Cold Spring Harbor Sequencing Consortium (CSHSC)</B></a>
<DD> <TABLE cellspacing="5">
<TR> <TD>  <B>Members:</B></TD>
     <TD><a href="http://www.cshl.org/">CSHL</a>, ABI, <a href="http://genome.wustl.edu/">WashU</a></TD></TR>
<TR> <TD>  <B>Contacts:</B></TD>
     <TD><A HREF="mailto:mccombie@cshl.org">Dick McCombie</A>, <A HREF="mailto:martiens@cshl.org">Rob Martienssen</A> (CSHL); <A HREF="mailto:rwilson@watson.wustl.edu">Rick Wilson</A> (WashU)</TD></TR>
<TR> <TD>  <B>Regions<br> sequenced:</B></TD>
     <TD> 13.1 Mb including the top of chromosome 4 and 3 Mb around the centromere of chromosome 5.</TD></TR>
</TABLE>

<DT><a href="http://mips.gsf.de/projects/plants/proj/essa_overview.html"><B>European Scientists Sequencing Arabidopsis (ESSA)</B></a>
<DD> <TABLE cellspacing="5">
<TR> <TD>  <B>Members:</B></TD>
     <TD><a href="http://www.jic.bbsrc.ac.uk">John Innes Centre</a>, <a href="http://mips.gsf.de/">MIPS</a>, network of 18 labs</TD></TR>
<TR> <TD>  <B>Contacts:</B></TD>
    <TD><A HREF="mailto:michael.bevan@bbsrc.ac.uk">Mike Bevan</A> (JIC); <A HREF="mailto:kmayer@gsf.de">Klaus Mayer</A> (MIPS)</TD>
<TR> <TD>  <B>Regions<br> sequenced:</B></TD>
     <TD>Chromosomes 4 (14.5 Mb) and 5 (6Mb)</TD>
</TABLE>
   
    
<DT>
<a href="http://www.genoscope.cns.fr/externe/English/Projets/Projet_S/S.html"><B>Genoscope-EU Consortium </B></a>
<DD> <TABLE cellspacing="5">
<TR> <TD>  <B>Members:</B></TD>
     <TD>EMBL, <a href="http://www.genoscope.cns.fr/">Genoscope</a>, Lion, U. van Amsterdam, Valle</TD>
<TR> <TD>  <B>Contacts:</B></TD>
    <TD><A HREF="mailto:salanou@genoscope.cns.fr">Marcel Salanoubat</A>, <A HREF="mailto:quetier@genoscope.cns.fr">Francis Quetier</A> </TD>
<TR> <TD>  <B>Regions<br> sequenced:</B></TD>
     <TD>Chromosome 3 bottom arm (9.2 Mb)</TD>
</TABLE>
    
    
<DT>
<B><a href="http://www.kazusa.or.jp/kaos/">Kazusa DNA Research Institute</B></a>
<DD> <TABLE cellspacing="5">
<TR> <TD>  <B>Members:</B></TD>
     <TD><a href="http://www.kazusa.or.jp/kaos/">Kazusa</a></TD>
<TR> <TD>  <B>Contacts:</B></TD>
    <TD><A HREF="mailto:tabata@kazusa.or.jp">Satoshi Tabata</A>, <A HREF="mailto:kiyo@ok-lab.bot.kyoto-u.ac.jp">Kiyotaka Okada</A></TD>
<TR> <TD>  <B>Regions<br> sequenced:</B></TD>
     <TD>Chromosomes 3 (9.8 Mb) and 5 (17.8 Mb)</TD>
</TABLE>
    

<DT>
<B><a href="http://med.stanford.edu/sgtc/research/arab.html">SPP Consortium</a></B>
<DD> <TABLE cellspacing="5">
<TR> <TD>  <B>Members:</B></TD>
     <TD><a href="http://www.pgec.usda.gov/">PGEC</a>, <a href="http://sequence-www.stanford.edu/">Stanford</a>, <a href="http://genome.salk.edu/SPP.html">UPenn (ATGC)</a></TD>
<TR> <TD>  <B>Contacts:</B></TD>
    <TD><A HREF="mailto:theo@nature.berkeley.edu">Sakis Theologis</A> (PGEC); Ron Davis (Stanford); <A HREF="mailto:ecker@smtp.salk.edu">Joe Ecker</A> (ATGC)</TD>
<TR> <TD>  <B>Regions<br> sequenced:</B></TD>
     <TD>Chromosome 1 (20.2 Mb)</TD>
</TABLE>

    
<DT>
<B><a href="http://www.jcvi.org/">The J. Craig Venter Center (JCVI) formerly TIGR </a></B>
<DD> <TABLE cellspacing="5">
<TR> <TD>  <B>Members:</B></TD>
     <TD><a href="http://www.jcvi.org/">JCVI</a></TD>
<TR> <TD>  <B>Contacts:</B></TD>
    <TD><A HREF="mailto:cdtown@jcvi.org">Christopher Town</A></TD>
<TR> <TD>  <B>Regions<br> sequenced:</B></TD>
     <TD>Chromosome 2 (19.6 Mb), parts of 1 and 3</TD>
</TABLE>
    <P>

</DL>
</DL>
<center>Last modified on April 5, 2010</center>

</div><!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

