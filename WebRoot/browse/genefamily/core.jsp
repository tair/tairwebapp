<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<%
	String pageName = "Core DNA Replication Machinery Family";
	String highlight = "3";
	String helpfile="";
	String cssfile="/css/page/pagelevels.css";
%>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
	<jsp:param name="helpfile" value="<%= helpfile %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<!-- Content goes here //-->

<h2><b><i>Arabidopsis thaliana</i> Core DNA Replication Machinery Family</B></h2>

<table>
<tr>

<td valign=top><b>Source:</b></td>

<td valign=top>
<b>Website:</b><a href="http://www.plantreplication.org/"> Global analysis of functional units in plant chromosomes</a>
<p><b>Shultz, R. W., Tatineni, V. M., Hanley-Bowdoin, L., and Thompson, W. F.</b> (2007) <a href="/servlets/TairObject?type=publication&id=501722569
">Genome-wide analysis of the core DNA replication machinery in the higher plants Arabidopsis and rice.</a> <i>PLANT PHYSIOLOGY</i> 144: 1697-1714 <b></b></p>

</td></tr>

<tr>
<td valign=top><B>Gene Family<BR>Criteria:</B></td>
<td>Genome-wide analysis of the core DNA replication machinery in plants. Homology-based computational alignments, manual inspections of domain conservation and extensive review of the literature were used to annotate these proteins as members of the core DNA replication machine. </td></tr>

<tr><td><B>Contact:</B></td>
<td><a href="/servlets/Community?action=view&type=person&communityID=312020">Randall Shultz</a>
<br /><a href="/servlets/Community?type=organization&action=view&communityID=1501415562">Linda Hanley-Bowdoin Laboratory</a></td></tr>
</table> 

<table  align="center" border="1" cellspacing="0" cellpadding="2">
    <tr>    
        <th><b>Subfamily:</b></th>
        <th><b>Gene Name:</b></th>
        <th><b>Chromosomal Locus:</b></th>
        <th><b>Protein Function/Description:</b></th>
    </tr>
    
    <tr class="alt">    
        <td>Origin recognition</td>
        <td>ORC1A</td>
        <td>At4g14700</td>
        <td>Putative component of the origin recognition complex (ORC)</td>
    </tr>
    <tr class="alt">    
        <td>Origin recognition</td>
        <td>ORC1B</td>
        <td>At4g12620</td>
        <td>Putative component of the origin recognition complex (ORC)</td>
    </tr><tr class="alt">    
        <td>Origin recognition</td>
        <td>ORC2</td>
        <td>At2g37560</td>
        <td>Putative component of the origin recognition complex (ORC)</td>
    </tr><tr class="alt">    
        <td>Origin recognition</td>
        <td></td>
        <td></td>
        <td>Putative component of the origin recognition complex (ORC)</td>
    </tr>
    <tr class="alt">    
        <td>Origin recognition</td>
        <td>ORC3</td>
        <td>At5g16690</td>
        <td>Putative component of the origin recognition complex (ORC)</td>
    </tr>
    <tr class="alt">    
        <td>Origin recognition</td>
        <td>ORC4</td>
        <td>At2g01120</td>
        <td>Putative component of the origin recognition complex (ORC)</td>
    </tr>
    <tr class="alt">    
        <td>Origin recognition</td>
        <td>ORC5</td>
        <td>At4g29910</td>
        <td>Putative component of the origin recognition complex (ORC)</td>
    </tr>
    <tr class="alt">    
        <td>Origin recognition</td>
        <td>ORC6</td>
        <td>At1g26840</td>
        <td>Putative component of the origin recognition complex (ORC)</td>
    </tr>
    
    <tr class="alt">    
        <td>Origin recognition</td>
        <td>NOC3</td>
        <td>At1g79150</td>
        <td>Nucleolar complex (NOC) associated protein involved in ribosome biogenesis; Putative origin binding protein in S. cerevisiae.</td>
    </tr>
    <tr class="alt">    
        <td>Replicative helicase</td>
        <td>MCM2</td>
        <td>At1g44900</td>
        <td>Putative component of the heterohexameric replicatitive helicase complex (MCM)</td>
    </tr>
    <tr class="alt">    
        <td>Replicative helicase</td>
        <td>MCM3</td>
        <td>At5g46280</td>
        <td>Putative component of the heterohexameric replicatitive helicase complex (MCM)</td>
    </tr>
    <tr class="alt">    
        <td>Replicative helicase</td>
        <td>MCM4</td>
        <td>At2g16440</td>
        <td>Putative component of the heterohexameric replicatitive helicase complex (MCM)</td>
    </tr>
    <tr class="alt">    
        <td>Replicative helicase</td>
        <td>MCM5</td>
        <td>At2g07690</td>
        <td>Putative component of the heterohexameric replicatitive helicase complex (MCM)</td>
    </tr>
    <tr class="alt">    
        <td>Replicative helicase</td>
        <td>MCM6</td>
        <td>At5g44635</td>
        <td>Putative component of the heterohexameric replicatitive helicase complex (MCM)</td>
    </tr>
    <tr class="alt">    
        <td>Replicative helicase</td>
        <td>MCM7</td>
        <td>At4g02060</td>
        <td>Putative component of the heterohexameric replicatitive helicase complex (MCM)</td>
    </tr>
    <tr class="alt">    
        <td>MCM helicase loading (licensing) factor</td>
        <td>CDC6A</td>
        <td>At2g29680</td>
        <td>Putative DNA replication licensing factor</td>
    </tr>
      <tr class="alt">    
        <td>MCM helicase loading (licensing) factor</td>
        <td>CDC6B</td>
        <td>At1g07270</td>
        <td>Putative DNA replication licensing factor</td>
    </tr>
      <tr class="alt">    
        <td>MCM helicase loading (licensing) factor</td>
        <td>CDT1A</td>
        <td>At2g31270</td>
        <td>Putative DNA replication licensing factor</td>
    </tr>
      <tr class="alt">    
        <td>MCM helicase loading (licensing) factor</td>
        <td>CDT1B</td>
        <td>At3g54710</td>
        <td>Putative DNA replication licensing factor</td>
    </tr>
    <tr class="alt">    
        <td>Initiation factor</td>
        <td>CDC45</td>
        <td>At3g25100</td>
        <td>Putative DNA replication initiation factor</td>
    </tr>
    <tr class="alt">    
        <td>Initiation factor</td>
        <td>MCM8</td>
        <td>At3g09660</td>
        <td>Putative DNA replication initiation factor</td>
    </tr>
    <tr class="alt">    
        <td>Initiation factor</td>
        <td>MCM9</td>
        <td>At2g14050</td>
        <td>Putative DNA replication initiation factor</td>
    </tr>
    <tr class="alt">    
        <td>Initiation factor</td>
        <td>MCM10</td>
        <td>At2g20980</td>
        <td>Putative DNA replication initiation factor</td>
    </tr>
    <tr class="alt">    
        <td>Initiation factor</td>
        <td>TOPBP1A</td>
        <td>At1g77320</td>
        <td>Putative DNA replication initiation factor</td>
    </tr>
    <tr class="alt">    
        <td>Initiation factor</td>
        <td>TOPBP1B</td>
        <td>At4g02110</td>
        <td>Putative DNA replication initiation factor</td>
    </tr>
    <tr class="alt">    
        <td>Fork component: GINS complex</td>
        <td>PSF1</td>
        <td>At1g80190</td>
        <td>Putative component of the heterotetrameric GINS complex at the DNA replication fork</td>
    </tr>
    <tr class="alt">    
        <td>Fork component: GINS complex</td>
        <td>PSF2</td>
        <td>At3g12530</td>
        <td>Putative component of the heterotetrameric GINS complex at the DNA replication fork</td>
    </tr>
    <tr class="alt">    
        <td>Fork component: GINS complex</td>
        <td>PSF3A</td>
        <td>At1g19080</td>
        <td>Putative component of the heterotetrameric GINS complex at the DNA replication fork</td>
    </tr>
    <tr class="alt">    
        <td>Fork component: GINS complex</td>
        <td>PSF3B</td>
        <td>At3g55490</td>
        <td>Putative component of the heterotetrameric GINS complex at the DNA replication fork</td>
    </tr>
    <tr class="alt">    
        <td>Fork component: GINS complex</td>
        <td>SLD5</td>
        <td>At5g49010</td>
        <td>Putative component of the heterotetrameric GINS complex at the DNA replication fork</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLA1</td>
        <td>At5g67100</td>
        <td>Putative catalytic subunit of the DNA polymerase alpha (POLA) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLA2</td>
        <td>At1g67630</td>
        <td>Putative regulatory component of the DNA polymerase alpha (POLA) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLA3</td>
        <td>At1g67320</td>
        <td>Putative primase component of the DNA polymerase alpha (POLA) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLA4</td>
        <td>At5g41880</td>
        <td>Putative primase component of the DNA polymerase alpha (POLA) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLD1</td>
        <td>At5g63960</td>
        <td>Putative catalytic subunit of the DNA polymerase delta (POLD) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLD2</td>
        <td>At2g42120</td>
        <td>Putative regulatory component of the DNA polymerase delta (POLD) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLA3</td>
        <td>At1g67320</td>
        <td>Putative regulatory component of the DNA polymerase delta (POLD) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLD4</td>
        <td>At1g09815</td>
        <td>Putative regulatory component of the DNA polymerase delta (POLD) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLE1A</td>
        <td>At1g08260</td>
        <td>Putative catalytic subunit of the DNA polymerase epsilon (POLE) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLE1B</td>
        <td>At2g27120</td>
        <td>Putative catalytic subunit of the DNA polymerase epsilon (POLE) complex</td>
    </tr>
    <tr class="alt">    
        <td>DNA synthesis: DNA polymerase alpha complex</td>
        <td>POLE2</td>
        <td>At5g22110</td>
        <td>Putative regulatory component of the DNA polymerase epsilon (POLE) complex</td>
    </tr>
    <tr class="alt">    
        <td>POLD clamp</td>
        <td>PCNA1</td>
        <td></td>
        <td>Processivity factor for DNA polymerase delta (POLD). Proliferating cell nuclear antigen (PCNA) proteins form a homotrimeric ring that encircles DNA and tethers the polymerase to the replication fork.</td>
    </tr>
    <tr class="alt">    
        <td>POLD clamp</td>
        <td>PCNA2</td>
        <td></td>
        <td>Processivity factor for DNA polymerase delta (POLD). Proliferating cell nuclear antigen (PCNA) proteins form a homotrimeric ring that encircles DNA and tethers the polymerase to the replication fork.</td>
    </tr>
    <tr class="alt">    
        <td>PCNA loading complex</td>
        <td>RFC1</td>
        <td>At5g22010</td>
        <td>Replication factor C is a five subunit clamp loader complex that uses ATP to load PCNA onto DNA</td>
    </tr>
    <tr class="alt">    
        <td>PCNA loading complex</td>
        <td>RFC2</td>
        <td>At1g63160</td>
        <td>Replication factor C is a five subunit clamp loader complex that uses ATP to load PCNA onto DNA</td>
    </tr>
    <tr class="alt">    
        <td>PCNA loading complex</td>
        <td>RFC3</td>
        <td>At5g27740</td>
        <td>Replication factor C is a five subunit clamp loader complex that uses ATP to load PCNA onto DNA</td>
    </tr>
    <tr class="alt">    
        <td>PCNA loading complex</td>
        <td>RFC4</td>
        <td>At1g21690</td>
        <td>Replication factor C is a five subunit clamp loader complex that uses ATP to load PCNA onto DNA</td>
    </tr>
    <tr class="alt">    
        <td>PCNA loading complex</td>
        <td>RFC5</td>
        <td>At1g77470</td>
        <td>Replication factor C is a five subunit clamp loader complex that uses ATP to load PCNA onto DNA</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA1A</td>
        <td>At2g06510</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA1B</td>
        <td>At5g08020</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA1C</td>
        <td>At5g45400</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA1D</td>
        <td>At5g61000</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA1E</td>
        <td>At4g19130</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA2A</td>
        <td>At2g24490</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA2B</td>
        <td>At3g02920</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA3A</td>
        <td>At3g52630</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Single-stranded DNA binding</td>
        <td>RPA3B</td>
        <td>At4g18590</td>
        <td>RPA functions as a heterotrimeric complex to stabilize ssDNA during replication, repair and transcription.</td>
    </tr>
    <tr class="alt">    
        <td>Okazaki fragment maturation</td>
        <td>FEN1</td>
        <td>At5g26680</td>
        <td>Putative flap endonuclease 1 protein. FEN1 cleaves the 5' flap structure generated during DNA synthesis on the lagging strand</td>
    </tr>
    <tr class="alt">    
        <td>Okazaki fragment maturation</td>
        <td>DNA2</td>
        <td>At1g08840</td>
        <td>Putative DNA2 protein. DNA2 has been shown to contribute to Okazaki fragment processing in yeast.</td>
    </tr>
    <tr class="alt">    
        <td>Okazaki fragment maturation</td>
        <td>RNASEH2A</td>
        <td>At2g25100</td>
        <td>Putative RNASEH2A protein. RNASEH may be involved in the cleavage of RNA primer sequence from the Okazaki fragment.</td>
    </tr>
    <tr class="alt">    
        <td>Okazaki fragment maturation</td>
        <td>LIG1A</td>
        <td>At1g08130</td>
        <td>Putative DNA ligase I (LIG1). LIG1 seals the nick structure between adjacent Okazaki fragments to generate the intact nascent strand. </td>
    </tr>
    <tr class="alt">    
        <td>Okazaki fragment maturation</td>
        <td>LIG1B</td>
        <td>At1g49250</td>
        <td>Putative DNA ligase I (LIG1). LIG1 seals the nick structure between adjacent Okazaki fragments to generate the intact nascent strand.</td>
    </tr>
    
    </table>


<p>
<a href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</a>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

