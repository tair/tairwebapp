<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR";
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
 
<h2><A NAME="TypeIMADS-box"><b><i>Arabidopsis</i> Type I MADS-box Gene Families</B></A></h2>
<TABLE><TR>

<TD valign=top><B>Source:</B></TD> 
<TD><B><a href="/servlets/Community?action=view&type=person&communityID=1013001">De Bodt, S.</a>, Raes, J., Florquin, K., <a href="/servlets/Community?action=view&type=person&communityID=7758">Rombauts, S.</A>, <a href="/servlets/Community?action=view&type=person&communityID=7763">Rouz&eacute;, P.</A>, <a href="/servlets/Community?action=view&type=person&communityID=2636">Theissen, G.</A>, Van de Peer, Y.</B> (2002) <a href="/servlets/TairObject?type=publication&id=501705825">Genome-wide structural and evolutionary analysis of the type I MADS-box genes in plants</a> <i>Journal of Molecular Evolution</i>. 56(5): 573-86 <br><a href="http://www.mpiz-koeln.mpg.de/mads">http://www.mpiz-koeln.mpg.de/mads</A><br><a href="http://www.psb.rug.ac.be/bioinformatics/MADS">http://www.psb.rug.ac.be/bioinformatics/MADS</A></TD></TR>

<TR><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> Eugene (Schiex et al., 2001) and GeneMark.hmm (Lukashin and Borodovsky, 1998) was used for gene prediction on genomic sequences. Similarities to family-specific signatures of experimentally characterised genes and similarities to ESTs were used to adjust incorrect gene predictions. Remote-homolog detection was performed using HMMer. Family-wise annotation. MADS-box genes are regarded as type I when they don't possess the K-box (using InterPro and MultiCoil), characteristic for plant type II MADS-box genes.</TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><A href="/servlets/Community?action=view&type=person&communityID=1013001">Stefanie De Bodt</A></TD></TR>

</TABLE> 

  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=46 valign=top><B>Type I MADS-box gene family</B></TD>
	<TD>&nbsp;</TD>
	<TD>AC011809<BR>At1g18750</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF27105&doptcmdl=GenPept">AAF27105</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18750">homeodomain transcription factor, putative</A></TD></TR>
	
<tr class="alt">	<TD>AGL30</TD>
	<TD>AC004138<BR>At2g03060</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAC32924&doptcmdl=GenPept">AAC32924</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03060">homeotic protein AGL30 </A></TD></TR>

<tr class="alt">	<TD>AGL23</TD>
	<TD>T8F5.14<BR>At1g65360</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAC27145&doptcmdl=GenPept">AAC27145</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65360">MADS-box protein, putative</A></TD></TR>

<!--TR bgcolor=
D5D9DD>	<TD>AGL26</TD>
	<TD>F2P16.17<BR>At5g26950</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26950">putative protein</A></TD></TR-->

<tr class="alt">	<TD>AGL28</TD>
	<TD>F22L4.7<BR>At1g01530</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=CAA73304&doptcmdl=GenPept">CAA73304</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01530">MADS-box transcription factor, putative</A></TD></TR>

<tr class="alt">	<TD>AGL29</TD>
	<TD>F13P17.1<BR>At2g34440</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAC26702&doptcmdl=GenPept">AAC26702</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34440">MADS-box protein (AGL29)</A></TD></TR>

<tr class="alt">	<TD>AGL33</TD>
	<TD>T1D16.4<BR>At2g26320</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26320">TIGR</A>: MADS-box protein<BR>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</a></TD></TR>

<tr class="alt">	<TD>AGL39</TD>
	<TD>T21B4.40<BR>At5g27130</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27130">TIGR</a>: putative protein<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></TD></TR>

<tr class="alt">	<TD>AGL40</TD>
	<TD>AP22.88<BR>At4g36590</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=CAB80325&doptcmdl=GenPept">CAB80325</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36590">putative MADS-box protein</A></TD></TR>

<tr class="alt">	<TD>AGL41</TD>
	<TD>F12C20.8<BR>At2g26880</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAC32246&doptcmdl=GenPept">AAC32246</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26880">putative MADS-box protein</A></TD></TR>

<tr class="alt">	<TD>AGL43</TD>
	<TD>K19M22.9<BR>At5g58890</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=BAB09634&doptcmdl=GenPept">BAB09634</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58890">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MDF20.13<BR>AT5g55690</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=BAB09236&doptcmdl=GenPept">BAB09236</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55690">unknown protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MUF9.24<BR>At5g60440</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=BAB08227&doptcmdl=GenPept">BAB08227</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60440">putative MADS box protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>K15N18.16<BR>At5g48670</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=BAB10700&doptcmdl=GenPept">BAB10700</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48670">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>K6M13.3<BR>At5g49490</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=BAB10762&doptcmdl=GenPept">BAB10762</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49490">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T8F5.11<BR>At1g65330</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAC27144&doptcmdl=GenPept">AAC27144</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65330">MADS-box transcription factor, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T8F5.8<BR>At1g65300</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAC27141&doptcmdl=GenPept">AAC27141</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65300">TIGR</a>: MADS-box transcription factor, putative<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F12K8.7<BR>At1g22590</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22590">TIGR</a>: expressed protein<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F27C12.24<BR>At2g24840</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAD23028&doptcmdl=GenPept">AAD23028</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24840">putative MADS-box protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T8O18.14<BR>At2g28700</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAD24361&doptcmdl=GenPept">AAD24361</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28700">putative MADS-box protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F15F15.30<BR>At5g27960</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27960">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F28K19.16<BR>At1g77950</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF17684&doptcmdl=GenPept">AAF17684</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77950">TIGR</a>: MADS box transcription factor, putative<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F28K19.20<BR>At1g77980</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77980">TIGR</a>: hypothetical protein<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F3M18.10<BR>At1g28460</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF16766&doptcmdl=GenPept">AAF16766</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28460">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F3M18.11<BR>At1g28450</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF16765&doptcmdl=GenPept">AAF16765</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28450">MADS-box protein, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F10A16.16<BR>At3g05860</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF26088&doptcmdl=GenPept">AAF26088</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05860">putative DNA-binding protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T2E6.17<BR>At1g47760</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF99799&doptcmdl=GenPept">AAF99799</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47760">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T6K12.28<BR>At3g04100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF26803&doptcmdl=GenPept">AAF26803</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04100">putative SRF-type transcription factor</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T7M7.9<BR>At2g40210</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF18735&doptcmdl=GenPept">AAF18735</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40210">TIGR</a>: putative MADS-box protein<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T7P1.3<BR>At1g60880</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAG51637&doptcmdl=GenPept">AAG51637</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60880">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T7P1.6<BR>At1g60920</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAG51643&doptcmdl=GenPept">AAG51643</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60920">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T13M22.2<BR>At1g17310</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAF79890&doptcmdl=GenPept">AAF79890</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17310">transcription factor, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T8E24.5<BR>At3g66656</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAG50993&doptcmdl=GenPept">AAG50993</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g66656">SRF-type transcription factor</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F21E10.14<BR>At5g26575</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAC13600&doptcmdl=GenPept">AAC13600</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26575">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F21E10.9<BR>At5g26625</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAC13589&doptcmdl=GenPept">AAC13589</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26625">TIGR</a>: putative protein<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F21E10.10<BR>At5g26645</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26645">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>FCAALL.249<BR>At4g14530</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14530">TIGR</a>: hypothetical protein<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T32M21.240<BR>At5g04640</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=CAB85570&doptcmdl=GenPept">CAB85570</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04640">MADS-box protein - like</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F2E2.20<BR>At1g22130</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22130">MADS-box protein (ZAP1), putative </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F21D18.1<BR>At1g48150</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAG60141&doptcmdl=GenPept">AAG60141</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48150">MADS-box protein, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MBB18.17<BR>At5g38620</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=BAB10152&doptcmdl=GenPept">BAB10152</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38620">MADS-box protein-like</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>K7J8.9<BR>At5g49420</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49420">MADS-box protein-like</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T10D10.18<BR>At1g72350</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAG52570&doptcmdl=GenPept">AAG52570</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72350">putative SRF-type transcription factor</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F27M3.16<BR>At1g31640</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAG60139&doptcmdl=GenPept">AAG60139</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31640">MADS box transcription factor, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F27M3.17<BR>At1g31630</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAG60141&doptcmdl=GenPept">AAG60141</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31630">MADS-box protein, putative</A></TD></TR>



<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F27M3.17<BR>At1g31630</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31630">MADS-box protein, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F28K20.7<BR>At1g31140</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=Protein&term=AAD21695&doptcmdl=GenPept">AAD21695</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31140">unknown protein</A></TD></TR>
</table>
<P><P>

<h2><A NAME="MADSlike"><b><i>Arabidopsis</i> MADS like Gene Families</B></A></h2>
<P>
<TABLE>
<TR><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> MADS-like genes are genes that possess either half of the MADS-box or a very diverged form of the MADS-box.</TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><A href="/servlets/Community?action=view&type=person&communityID=1013001">Stefanie De Bodt</A></TD></TR>

</TABLE> 

  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        
<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>
	    </TR>

<tr><td rowspan="16" valign=top><b>MADS like gene family</b></td>

       <td>&nbsp;</td>

       <td>AF170760<br><a href=/servlets/TairObject?type=locus&name=At5g27090 target="new">At5g27090</A></td>

       <td>NP_198061<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27090 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AF170670<br><a href=/servlets/TairObject?type=locus&name=At5g27070 target="new">At5g27070</A></td>

       <td>NP_198059<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27070 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AC007478<br><a href=/servlets/TairObject?type=locus&name=At5g27580 target="new">At5g27580</A></td>

       <td>NP_198110<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27580 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>AGL26</td>

       <td>AF007270<br><a href=/servlets/TairObject?type=locus&name=At5g26950 target="new">At5g26950</A></td>

       <td>NP_198047<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26950 target="new">TIGR</a>: MADS-box protein<br>Expert: <a href="http://www.psb.rug.ac.be/bioinformatics/MADS">De Bodt</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AL096882<br><a href=/servlets/TairObject?type=locus&name=At4g11250 target="new">At4g11250</A></td>

       <td>NP_192864<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11250 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AB011479<br><a href=/servlets/TairObject?type=locus&name=At5g65330 target="new">At5g65330</A></td>

       <td>NP_201336<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65330 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AB010699<br><a href=/servlets/TairObject?type=locus&name=At5g40220 target="new">At5g40220</A></td>

       <td>NP_198838<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40220 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AB016876<br><a href=/servlets/TairObject?type=locus&name=At5g39750 target="new">At5g39750</A></td>

       <td>NP_198791<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39750 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AB011478<br><a href=/servlets/TairObject?type=locus&name=At5g38740 target="new">At5g38740</A></td>

       <td>NP_198690<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38740 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AB010699<br><a href=/servlets/TairObject?type=locus&name=At5g40120 target="new">At5g40120</A></td>

       <td>NP_198828<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40120 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AB016876<br><a href=/servlets/TairObject?type=locus&name=At5g39810 target="new">At5g39810</A></td>

       <td>NP_198797<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39810 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AB010072<br><a href=/servlets/TairObject?type=locus&name=At5g41200 target="new">At5g41200</A></td>

       <td>NP_198936<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g41200 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AB026654<br><a href=/servlets/TairObject?type=locus&name=At3g18650 target="new">At3g18650</A></td>

       <td>NP_188495<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18650 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AF170670<br><a href=/servlets/TairObject?type=locus&name=At5g27050 target="new">At5g27050</A></td>

       <td>NP_198057<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27050 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AC005966<br><a href=/servlets/TairObject?type=locus&name=At1g60040 target="new">At1g60040</A></td>

       <td>NP_176212<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60040 target="new">MADS-box protein</A></td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td>AC007258<br><a href=/servlets/TairObject?type=locus&name=At1g59810 target="new">At1g59810</A></td>

       <td>NP_176190<br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59810 target="new">MADS-box protein</A></td>

        </tr>

	</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
