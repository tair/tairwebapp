<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Browse - Gene Families";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
String id="63";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


  <script type="text/javascript">
   function tableRows() {
    if (document.getElementsByTagName) {
     var tables = document.getElementsByTagName('table');
     for (var i = 0; i < tables.length; i++) {
      var trs = tables[i].getElementsByTagName('tr');
      for (var j = 1; j < trs.length; j+=2) {
       trs[j].className = 'alt';
      }
     }
    }
   }
  </script>
		
		<!-- Content goes here //--> 

		<span class="mainheader"><i>Arabidopsis</i> Gene Family Information</span> <span class="num_results"> [996</span> gene families ] and [<span class="num_results">8,331</span> genes].


<p>
We encourage users of TAIR to share their gene family data with the research community. To submit data for a gene family, please format your data as described in the <a href="/submit/genefamily_submission.jsp">Gene Family Data Submission</a> page. 
</p>


<p>
Please click on the links below to view the gene family of your choice.
Alternatively, the gene families and genes are displayed in one tab delimited file in the <a href="ftp://ftp.arabidopsis.org/home/tair/Genes/Gene_families/">FTP Downloads</a> section.

</p>
	<table>

		<tr>
			<th>Gene Family Name</th>
			<th>Family Count/ <br />
			    Gene Count</th>
			<th>Submitter</th>
		</tr>


		<tr>
			<td><A HREF="14-3-3.jsp">14-3-3 family</A></td>
			<td>1 family<br> 13 members</td>
			<td><a href="/servlets/Community?action=view&type=organization&communityID=8075">R Ferl Laboratory</A>
			</td>
		</tr>

		<tr>
			<td><A HREF="ABC_merged.jsp">ABC Superfamily</A></td>
			<td>Subfamilies 8<br />Members 136 </td>
			<td><A HREF="mailto:paul.verrier@bbsrc.ac.uk" target="display">Paul Verrier</A><br />
            <A HREF="/servlets/TairObject?type=person&id=2028" target="display">Freddie Theodoulou</A><br />
            <A HREF="/servlets/TairObject?type=person&id=5076" target="display">Angus Murphy</A>
			</td>
		</tr>
    

<tr>
	<td><a href="ABI3VP1.jsp">ABI3VP1 Transcription Factor Family</a></td>
	<td>1 family<br/>11 members</td>
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>
		<tr>
			<td><A HREF="AGC.jsp">AGC Kinase Gene Family</A></td>
			<td>1 family<br>39 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=1213417">Laszlo Bogre</A>, <a href="/servlets/Community?action=view&type=person&communityID=7034">Laszlo Okresz</a></td>
		</tr>

		<tr>
			<td><A HREF="aldh.jsp">Aldehyde Dehydrogenase Gene Family</A></td>
			<td>9 families<br>14 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=5166">Dorothea Bartels</A><br>
			    <a href="/servlets/Community?action=view&type=person&communityID=210609">Hans-Hubert Kirch</A>
			</td>
		</tr>

		<tr>
			<td><A HREF="AAAP.jsp">Amino Acid/Auxin Permease AAAP Family</A></td>
			<td>1 family<br>43 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</A></td>
		</tr>

		<tr>
			<td><A HREF="acyl_lipid.jsp">Acyl Lipid Metabolism Gene Families</A></td>
			<td>174 families<br>610 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=612141">Fred Beisson</A></td>
		</tr>
<tr>
	<td><a href="Alfinlike.jsp">Alfin-like Transcription Factor Family</a></td>
	<td>1 family<br/>7 members</td>
		<td><a target="display" href="/servlets/Community?action=view&type=organizationanization&communityID=1501423724">AGRIS</a></td>
</tr>

		<tr>
			<td><A HREF="Antiporters.jsp">Antiporters</A></td>
			<td>13 families<br>70 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</A></td>
		</tr>
        
        <tr>
			<td><A HREF="antiporter.jsp">Antiporter Super Family</A></td>
			<td>1 subfamily<br>28 members</td>
			<td><a href="/servlets/TairObject?type=person&id=6270">Heven Sze</A><br />
                <a href="/servlets/TairObject?type=person&id=5515">Kendal Hirschi</A><br />
                <a href="/servlets/Community?type=organization&action=view&communityID=8372">H Sze Laboratory</a><br />
                <a href="/servlets/Community?type=organization&action=view&communityID=9616">K Hirschi Laboratory</a></td>
		</tr>

		<tr>
			<td><A HREF="Aquaporins.jsp">Aquaporins</A></td>
			<td>2 families<br>35 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</A></td>
		</tr>

		<tr>
			<td><A HREF="ARIADNE.jsp">ARIADNE family</A></td>
			<td>3 subfamilies<br>16 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=4770">Marie-Theres Hauser</a></td>
		</tr>
<tr>
	<td><a href="ARRB.jsp">ARR-B</a></td>
	<td>1 family<br/>15 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organizationanization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="ARF.jsp">ARF Transcription Factor Family</a></td>
	<td>1 family<br/>24 members</td>
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="ARID.jsp">ARID Transcription Factor Family</a></td>
	<td>1 family<br/>7 members</td>
		<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="AP2EREBP.jsp">AP2-EREBP Transcription Factor Family</a></td>
	<td>1 family<br/>138 members</td>
		<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

		<tr>
			<td><A HREF="AS2.jsp">AS2 family</A></td>
			<td>1 family<br>42 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=5685">Yasunori Machida</a></td>
		</tr>
<tr>
	<td><a href="AtRKD.jsp">AtRKD Transcription Factor Family</a></td>
	<td>1 family<br/>5 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="B3binding.jsp">B3 DNA Binding Superfamily</a></td>
	<td>1 family<br/>87 members</td>
	
	<td> <a href="mailto:alvesfer@biologia.ufrj.br">Marcio Alves-Ferreira</a> <br /> <a href="mailto:elissonromanel@yahoo.com.br">Elisson Romanel </a></td>
</tr>
		<tr>
			<td><a href="bpc.jsp">BBR/BPC Transcription factor family</a></td>
			<td>1 family<br>7 members</td>
			<td><a href="/servlets/Community?action=view&amp;type=person&amp;communityID=10631">Dierk Wanke</a></td>
		</tr>


<tr>
	<td><a href="bHLH.jsp">bHLH Transcription Factor Family</a></td>
	<td>1 family<br/>161 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>
		<tr>
			<td><A HREF="blhm.jsp">Basic Helix-Loop-Helix Transcription Factor Gene Family</A></td>
			<td>1 family<br>162 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=6272">Bernd Weisshaar</a></td>
		</tr>

		<tr>
			<td><A HREF="bZIP-Jak.jsp">Basic region leucine zipper (bZIP) Transcription Factor Gene Family</A></td>
			<td>1 family<br>75 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=10799">Marc Jakoby</a></td>
		</tr>
<tr>
	<td><a href="bZIP.jsp">bZIP Transcription Factor Family</a></td>
	<td>1 family<br/>73 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="BZR.jsp">BZR Transcription Factor Family</a></td>
	<td>1 family<br/>6 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>



		<tr>
			<td><A HREF="CDPK.jsp">Calcium Dependent Protein Kinase</A></td>
			<td>1 family<br>34 members</td>
			<td><a href="/servlets/Community?type=organization&action=view&communityID=8365">J Sheen Laboratory</A></td>
		</tr>

		<tr>
			<td><A HREF="CBP.jsp">Calmodulin-binding Proteins</A></td>
			<td>17 families<br>100 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=711946">Vaka S Reddy</A>, <br>
			    <a href="/servlets/Community?action=view&type=person&communityID=1313553">Gul Shad Ali</A>, <br>
<a href="/servlets/Community?action=view&type=person&communityID=5935">ASN Reddy</A></td>
		</tr>



<tr>
	<td><a href="C2C2COlike.jsp">C2C2-CO-like Transcription Factor Family</a></td>
	<td>1 family<br/>30 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>			    

<tr>
	<td><a href="C2C2Dof.jsp">C2C2-Dof Transcription Factor Family</a></td>
	<td>1 family<br/>36 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="C2C2Gata.jsp">C2C2-Gata Transcription Factor Family</a></td>
	<td>1 family<br/>30 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="C2C2YABBY.jsp">C2C2-YABBY Transcription Factor Family</a></td>
	<td>1 family<br/>6 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="C2H2.jsp">C2H2 Transcription Factor Family</a></td>
	<td>1 family<br/>211 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="C3H.jsp">C3H Transcription Factor Family</a></td>
	<td>1 family<br/>165 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>
		<tr>
			<td><A HREF="CarbohydrateEsterase.jsp">Carbohydrate Esterase</a></td>
			<td>5 families<br>98 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=912146">B. Henrissat</a>, <br />
			    <a href="/servlets/Community?action=view&type=person&communityID=912144">P. Coutinho</a>, E. Deleury</td>
		</tr>

<tr>
	<td><a href="CAMTA.jsp">CAMTA Transcription Factor Family</a></td>
	<td>1 family<br/>6 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>
		<tr>
			<td><A HREF="CBL.jsp#CIPK">CBL-interacting serine-threonine protein kinases</A></td>
			<td>1 family<br>25 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=6945">Joerg Kudla</a></td>
		</tr>

<tr>
	<td><a href="CCAATDR1.jsp">CCAAT-DR1 Transcription Factor Family</a></td>
	<td>1 family<br/>2 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="CCAATHAP2.jsp">CCAAT-HAP2 Transcription Factor Family</a></td>
	<td>1 family<br/>10 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>
<tr>
	<td><a href="CCAATHAP3.jsp">CCAAT-HAP3 Transcription Factor Family</a></td>
	<td>1 family<br/>10 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="CCAATHAP5.jsp">CCAAT-HAP5 Transcription Factor Family</a></td>
	<td>1 family<br/>13 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

		<tr>
			<td><A HREF="cellwall.jsp">Cell Wall Biosynthesis</A></td>
			<td>8 families<br>52 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=4778">Todd Richmond</a></td>
		</tr>

		<tr>
			<td><A HREF="Chloroplast.jsp">Chloroplast and Mitochondria Gene Families</A></td>
			<td>16 families<br>50 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</A></td></tr>

		<tr>
			<td><A HREF="COB.jsp">COBRA Gene Family</a></td>
			<td>2 families<br>12 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=4729">Philip Benfey</A></td>
		</tr>

		<tr>
			<td><A HREF="cellcycle.jsp">Core Cell Cycle Gene Families</a></td>
			<td>7 families<br>61 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=912276">Klaas Vandepoele</a></td>
		</tr>
        
        <tr>
			<td><A HREF="core.jsp">Core DNA Replication Machinery Family</a></td>
			<td>1 family<br>61 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=312020">Randall Shultz</a><br />
            <a href="/servlets/Community?type=organization&action=view&communityID=1501415562">Linda Hanley-Bowdoin Laboratory</a></td>
		</tr>
        
<tr>
	<td><a href="CPP.jsp">CPP Transcription Factor Family</a></td>
	<td>1 family<br/>8 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

		<tr>
			<td><A HREF="p450.jsp">Cytochrome P450</A></td>
			<td>69 families<br>256 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=958">S. Bak</a>, <br />
			    <a href="/servlets/Community?action=view&type=person&communityID=912138">D. Nelson</a>, <br />
			    <a href="/servlets/Community?action=view&type=person&communityID=4512">Mary Schuler</a></td>
		</tr>

		<tr>
			<td><A HREF="cytochromeb5.jsp">Cytochrome b5</A></td>
			<td>1 family<br>7 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=5152">Soren Bak</a></td>
		</tr>

		<tr>
			<td><A HREF="athr.jsp">Cytoplasmic Ribosomal Protein Gene Family</A></td>
			<td>79 families<br>255 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=958">Julia Bailey-Serres</a></td>
		</tr>

		<tr>
			<td><A HREF="cytoskeleton.jsp">Cytoskeleton Gene Families</A></td>
			<td>2 families<br>15 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=4626">Richard Meagher</a></td>	
		</tr>

		<tr>
			<td><A HREF="DOF.jsp">DOF Gene Family</A></td>
			<td>1 family<br>37 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=1501417250">Shuichi Yanagisawa</a></td>
		</tr>
<tr>
	<td><a href="E2FDP.jsp">E2F-DP Transcription Factor Family</a></td>
	<td>1 family<br/>8 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="EIL.jsp">EIL Transcription Factor Family</a></td>
	<td>1 family<br/>6 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

		<tr>
			<td><A HREF="ef-hand.jsp">EF-hand Containing Proteins</A></td>
			<td>8 families<br>234 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=912159">Irene S Day</A>,<br /> 
			<a href="/servlets/Community?action=view&type=person&communityID=711946">Vaka Reddy</A>,<br />
 			<A href="/servlets/Community?action=view&type=person&communityID=1313553">Gul Shad Ali</A>, <br />
			<A href="/servlets/Community?action=view&type=person&communityID=5935">ASN Reddy</A></td>
		</tr> 

		<tr>
			<td><A HREF="ent.jsp">Equilibrative Nucleoside Transporter Gene Family (ENT)</a></td>
			<td>1 family<br>8 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=2062">Torsten Moehlmann</a></td>
		</tr>

		<tr>
			<td><A HREF="eIF.jsp">Eukaryotic Initiation Factors Gene Family</a></td>
			<td>44 families<br>100 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=5220">Karen Browning</a></td>
		</tr>

		<tr>
			<td><A HREF="expansin.jsp">Expansin Gene Family</a></td>
			<td>4 families<br>36 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=5092">Daniel Cosgrove</a></td>
		</tr>

		<tr>
			<td><a href="exo.jsp">EXO70 exocyst subunit family</a></td>
			<td>1 family<br />23 members</td>
			<td><a href="/servlets/Community?action=view&amp;type=person&amp;communityID=639">Viktor Zarsky</a></td>
		</tr>

		<tr>
			<td><A HREF="F_box.jsp">F-Box Gene Family</a></td>
			<td>1 family<br>4 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=507">Claus Schwechheimer</a></td>
		</tr>

		<tr>
			<td><A HREF="fh2.jsp">FH2 protein (formin) Gene Family</a></td>
			<td>1 family<br>21 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=3301">Fatima Cvrckova</a></td>
		</tr>

		<tr>
			<td><A HREF="ftsh.jsp">FtsH Gene Family</a></td>
			<td>1 family<br>12 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=1012567">Adi Zaltsman</a></td>
		</tr>
<tr>
	<td><a href="G2like.jsp">G2-like Transcription Factor Family</a></td>
	<td>1 family<br/>40 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>


<tr>
	<td><a href="GeBP.jsp">GeBP Transcription Factor Family</a></td>
	<td>1 family<br/>16 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
			<td><A HREF="gdu.jsp">Glutamine Dumper (GDU) Family</a></td>
			<td>1 <br />7 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=4110">Guillaume Pilot</a>,<br /> 
			    <a href="/servlets/Community?action=view&type=organization&communityID=1501415330">Wolf Frommer Laboratory at Stanford</a></td>
		</tr>


		<tr>
			<td><A HREF="GlycosideHydrolase.jsp">Glycoside Hydrolase</a></td>
			<td>31 family<br>379 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=912146">B. Henrissat</a>,<br /> 
			    <a href="/servlets/Community?action=view&type=person&communityID=912144">P. Coutinho</a>, E. Deleury</td>
		</tr>

		<tr>
			<td><A HREF="Glycosyltransferase.jsp">Glycosyltransferase</a></td>
			<td>28 families<br>361 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=912146">B. Henrissat</a>,<br /> 
			    <a href="/servlets/Community?action=view&type=person&communityID=912144">P. Coutinho</a>, E. Deleury</td>
		</tr>

		<tr><td><A href="gras_genefamily.jsp">GRAS Gene Family</A></td><td>1 family<br>33 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1329">Cordelia Bolle</a></td></tr>

<tr>
	<td><a href="GRAS.jsp">GRAS Transcription Factor Family</a></td>
	<td>1 family<br/>33 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="GRF.jsp">GRF Transcription Factor Family</a></td>
	<td>1 family<br/>9 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr><td><A href="gst.jsp">Glutathione S-transferase Gene Family</A></td><td>7 families<br>53 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1501414806">Pia G. Sappl</a>, <a href="/servlets/Community?action=view&type=person&communityID=1501414127">Harvey Millar</a>, <a href="/servlets/Community?action=view&type=person&communityID=6670">Karam B. Singh</a></td></tr>

<tr><td><A href="Hsfs.jsp">Heat shock transcription factors Hsfs</A></td><td>1 family<br>21 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=912135">Lutz Nover</a></td></tr>

<tr><td><A href="HisK.jsp">Histidine Kinase Gene Family</A></td><td>1 family<br>16 members</td><td><a href="/servlets/Community?type=organization&action=view&communityID=8365">J Sheen Lab</a></td></tr>

<tr><td><A href="AHP.jsp">Histidine Phosphotransfer Proteins</A></td><td>1 family<br>6 members</td><td><a href="/servlets/Community?type=organization&action=view&communityID=8365">J Sheen Lab</a></td></tr>

<tr>
	<td><a href="Homeobox.jsp">Homeobox Transcription Factor Family</a></td>
	<td>1 family<br/>91 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="HRT.jsp">HRT Transcription Factor Family</a></td>
	<td>1 family<br/>3 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="HSF.jsp">HSF</a></td>
	<td>1 family<br/>21 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr><td><A HREF="idz.jsp">IDZ Gene Family</A></td><td>1 family<br>11 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1827">Thomas Merkle</A></td></tr>

<tr><td><A HREF="Cotransporter.jsp">Inorganic Solute Cotransporters</A></td><td>16 families<br>84 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</A></td></tr>

<tr><td><A HREF="Ionchannels.jsp">Ion Channels</A></td><td>7 families<br>61 members</td>  <td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</A>, <A href="/servlets/Community?action=view&type=person&communityID=211861">Benoiit Lacombe</A></td></tr>

<tr><td><A HREF="IQD.jsp">IQD Protein Family</A></td><td>1 family<br>33 members</td>  <td><a href="/servlets/TairObject?type=person&id=5114">Steffen Abel</A></td></tr>
<tr>
	<td><a href="JUMONJI.jsp">JUMONJI Transcription Factor Family</a></td>
	<td>1 family<br/>5 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr><td><A HREF="lob.jsp">Lateral Organ Boundaries Gene Family</A></td><td>1 family<br>43 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1213505">B. Shuai</A>, <A href="/servlets/Community?action=view&type=person&communityID=1213506">C. Reynaga-Pena</A>, <a href="/servlets/Community?action=view&type=person&communityID=4469">P. Springer</A> </td></tr>

<tr><td><a href="leuc.jsp">Leucine-rich Repeat extensin Gene Families</a></td><td>2 families<br>11 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=912379">Christoph Ringli</a></td></tr>

<tr><td><A HREF="Lipid.jsp">Lipid Metabolism Gene Families</A></td><td>28 families<br>98 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</A></td></tr>

<tr><td><A HREF="Myosin_kinesins.jsp#kinesins">Kinesins gene family</A></td><td>1 family<br>61 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=5935">A. S. N. Reddy</a>, <a href="http://arabidopsisorg/servlets/Community?action=view&type=person&communityID=912159">Irene Day</A></td></tr>

<tr>
	<td><a href="mads_tffamily.jsp">MADS Transcription Factor Family</a></td>
	<td>1 family<br/>109 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>


<tr><td><A HREF="MADSlike.jsp">MADS-box Gene Family</A></td><td>1 family<br>108 members</td><td><A href="/servlets/Community?action=view&type=person&communityID=1501418015">Stefan de Folter</A></td></tr>


<tr><td><A HREF="MADS.jsp#MADSlike">MADS like Gene Family</A></td><td>1 family<br>16 members</td><td><A href="/servlets/Community?action=view&type=person&communityID=1013001">Stefanie De Bodt</A></td></tr>

<tr><td><A HREF="MADS.jsp">Type I MADS-box Gene Family</A></td><td>1 family<br>46 members</td><td><A href="/servlets/Community?action=view&type=person&communityID=1013001">Stefanie De Bodt</A></td></tr>


<tr><td><A HREF="MIP.jsp">Major Intrinsic Protein MIP</A></td><td>1 family<br>38 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</a></td></tr>

<tr><td><A HREF="MAPK.jsp">MAP Kinase Gene Family</A></td><td>1 family<br>20 members</td><td><a href="/servlets/Community?type=organization&action=view&communityID=8365">J Sheen Lab</a></td></tr>

<tr><td><A HREF="MAPKK.jsp">MAP Kinase Kinase Gene Family</A></td><td>1 family<br>10 members</td><td><a href="/servlets/Community?type=organization&action=view&communityID=8365">J Sheen Lab</a></td></tr>

<tr><td><A HREF="MAPKKK.jsp">MAP Kinase Kinase Kinase</A></td><td>3 sub families<br>80 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1213417">Laszlo Bogre</A>, <a href="/servlets/Community?action=view&type=person&communityID=7034">Laszlo Okresz</a></td></tr>

<tr><td><A HREF="MAP4K.jsp">MAP Kinase Kinase Kinase Kinase</A></td><td>1 family<br>10 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1213417">Laszlo Bogre</A>, <a href="/servlets/Community?action=view&type=person&communityID=7034">Laszlo Okresz</a></td></tr>

<tr><td><A HREF="mechanoIon.jsp">Mechanosensitive Ion Channel Family</A></td><td>1 family<br>10 members</td><td>Elizabeth Haswell</td></tr>

<tr><td><A HREF="Miscellaneous.jsp">Miscellaneous Gene Families</A></td><td>108 families<br>443 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</a></td></tr>

<tr><td><A HREF="mlo.jsp">MLO family</A></td><td>1 family<br>15 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1702">Ralph Panstruga</a></td></tr>


<tr><td><A HREF="Raes.jsp">Monolignol Biosynthesis Gene Families</A></td><td>1 family<br>61 members</td><td><a href=/servlets/TairObject?type=person&id=1501414522 target=new>Jereon Raes</a></td></tr>


<tr><td><A HREF="Monos.jsp">Monosaccharide Transporter(-like) Gene Family</A></td><td>7 families<br>53 members</td><td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=4935 target=new>Norbert Sauer</a></td></tr>

<tr><td><A HREF="MRS2.jsp">MRS2 Gene Family</A></td><td>1 family<br>11 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=2099">Volker Knoop</A>, <a href="/servlets/Community?action=view&type=person&communityID=5428">Richard Gardner</a></td></tr>

<tr><td><a href="MYB.jsp">MYB family</A></td><td>1 family<br>133 members</td><td><a href="/servlets/Community?type=organization&action=view&communityID=9527">B Weisshaar Laboratory</A></td></tr>

<tr>
	<td><a href="myb-agris.jsp">MYB Transcription Factor Family</a></td>
	<td>1 family<br/>131 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>
<tr>
	<td><a href="MYBRelated.jsp">MYB-Related Transcription Factor Family</a></td>
	<td>1 family<br/>2 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>


<tr><td><A HREF="Myosin_kinesins.jsp">Myosins gene family</A></td><td>1 family<br>17 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=5935">A. S. N. Reddy</a>, <a href="http://arabidopsisorg/servlets/Community?action=view&type=person&communityID=912159">Irene Day</A></td></tr>

<tr>
	<td><a href="NAC.jsp">NAC Transcription Factor Family</a></td>
	<td>1 family<br/>96 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr><td><A HREF="cytochromeb5.jsp#NADPH_P450_reductases">NADPH P450 reductases</A></td><td>1 family<br>3 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=958">Soren Bak</a></td></tr>

<tr><td><A HREF="NS_genefamily.jsp">Nicotianamine Synthase Gene Family</A></td><td>1 family<br>4 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=11323">Petra Bauer</a>, <a href="/servlets/Community?action=view&type=person&communityID=5501">Rudiger Hell</a></td></tr>

<tr>
	<td><a href="NLP.jsp">NLP Transcription Factor Family</a></td>
	<td>1 family<br/>9 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr><td><A HREF="Nodulin.jsp">Nodulin-like Gene Family</A></td><td>3 families<br>64 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</a></td></tr>

<tr><td><a href="nse.jsp">Non-SMC Element family</a></td><td>1 family<br>2 members</td><td><a href="/entity/person_detail/1501430322">	Koichi Watanabe</a></td></tr>

<tr><td><A HREF="nat.jsp">Nucleobase Ascorbate Transporter Gene Family</A></td><td>1 family<br>12 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1277">Ulf-Ingo Flugge</a></td></tr>
<tr>
	<td><a href="Orphan.jsp">Orphan Transcription Factor Family</a></td>
	<td>1 family<br/>2 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>
<tr><td><A HREF="Organicsolute.jsp">Organic Solute Cotransporters</A></td><td>35 families<br>279 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</a></td></tr>

<tr><td><A HREF="peroxidase.jsp">Peroxidase, class III</A></td><td>1 family<br>73 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1012653">Michael Tognolli</a></td></tr>

<tr>
	<td><a href="PHD.jsp">PHD Transcription Factor Family</a></td>
	<td>1 family<br/>11 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="phd2.jsp">PHD Gene Family</a></td>
	<td>1 subfamily<br/>5 members</td>

	<td><a href="/servlets/Community?type=organization&action=view&communityID=8639" target=new>C Dean Laboratory</a></td>
</tr>


<tr><td><a href="PhospholipaseD.jsp">Phospholipase D Gene Family (Zarsky group)</A></td><td>2 sub families<br>12 members</td><td><a href="/servlets/Community?type=organization&action=view&communityID=9532">V Zarsky Laboratory</a></td></tr>

<tr><td><A HREF="PLD.jsp">Phospholipase D Gene Family (Wang group)</a></td><td>1 family<br>12 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=4761">X. Wang</a></td></tr>

<tr><td><A HREF="PhytocyaninS.jsp">Phytocyanin Superfamily</a></td><td>1 super family<br>22 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1501426590">Kiyoshi Mashiguchi</a></td></tr>

<tr><td><A HREF="plant_defensins.jsp">Plant Defensins Gene Families</a></td><td>3 families<br>15 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=10830">Bart Thomma</a></td></tr>

<tr><td><A HREF="PolysaccharideLyase.jsp">Polysaccharide Lyase</a></td><td>2 families<br>35 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=912146">B. Henrissat</a>, <a href="/servlets/Community?action=view&type=person&communityID=912144">P. Coutinho</a>, E. Deleury</td></tr>

<tr><td><a href="PollenCoatProteome.jsp">Pollen Coat Proteome</a></td><td>4 families<br>11 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=7632">J. A. Mayfield</a>, <a href="/servlets/Community?action=view&type=person&communityID=7372">A. Fiebig</A>, S.E. Johnstone, <A href="/servlets/Community?action=view&type=person&communityID=4587">D. Preuss</A></td></tr>

<tr><td><A HREF="PP2C.jsp">PP2C-type Phosphatase Gene Family</A></td><td>1 family<br>76 members</td> <td><a href="/servlets/Community?action=view&type=person&communityID=3269">Irute Meskiene</a></td></tr>

<tr><td><A HREF="ATPases.jsp">Primary Pumps ATPases</A></td><td>12 families<br>83 members</td> <td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</a></td></tr>

<tr><td><A HREF="primary_pumps.jsp">Primary Pumps ATPases(2)</A></td><td>2 subfamilies<br>32 members</td> <td><a href="/servlets/TairObject?type=person&id=6270">Heven Sze</A><br />
<a href="/servlets/TairObject?type=person&id=210828">Xiyan Li</A><br />
<a href="/servlets/Community?type=organization&action=view&communityID=8372">H Sze Laboratory</a></td></tr>

<tr><td><A HREF="PTP.jsp">Protein tyrosine phosphatase (PTP) family</A></td><td>1 family<br>28 members</td> <td><a href="/servlets/Community?action=view&type=person&communityID=5679">Sheng Luan</a>, <a href="/servlets/Community?type=organization&action=view&communityID=8310">S Luan Laboratory</a></td></tr>

<tr><td><A HREF="PRT.jsp">PRT Gene Family</A></td><td>4 families<br>15 members</td> <td><a href="/servlets/Community?action=view&type=person&communityID=1501417380">Ralf Boldt</a></td></tr>
<tr><td><A HREF="lobo.jsp">Rapid Response to Elicitors</A></td><td>1 family<br>4 members</td> <td><a href=servlets/Community?action=view&type=person&communityID=1501415808 target=new>Marta Berrocal-Lobo</A><br>
    <a href=/servlets/Community?action=view&type=person&communityID=5473 target=new>Plinio Guzman</a></td></tr>


<tr>
	<td><a href="RAV.jsp">RAV Transcription Factor Family</a></td>
	<td>1 family<br/>11 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>


<tr><td><A HREF="Rad5_Rad15.jsp">RAD5/RAD16-like Gene Family</A></td><td>1 family<br>10 members</td> <td><a href="/servlets/Community?action=view&type=person&communityID=1665">Holger Puchta</a></td></tr>

<tr><td><A HREF="RCI2.jsp">RCI2 Gene Family</A></td><td>1 family<br>8 members</td> <td><a href="/servlets/Community?action=view&type=person&communityID=5454">Julio Salinas</a></td></tr>


<tr><td><A HREF="Receptor_kinase.jsp">Receptor kinase-like Gene Family</a></td><td>1 family<br>307 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=6083">John Ward</a></td></tr>

<tr>
	<td><a href="REM.jsp">REM Transcription Factor Family</a></td>
	<td>1 family<br/>21 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>
		<tr>
			<td><A HREF="ARR.jsp">Response Regulator Gene Family</A></td>
			<td>3 families<br>32 members</td>
			<td><a href="/servlets/Community?type=organization&action=view&communityID=8365">J Sheen Lab</a></td>
		</tr>


<tr>
	<td><a href="SBP.jsp">SBP Transcription Factor Family</a></td>
	<td>1 family<br/>16 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>


		<tr>
			<td><A HREF="sbp_box_genefamily.jsp">SBP-box Gene Family</A></td>
			<td>1 family<br>17 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=1435">Peter Huijser</a></td>
		</tr>


		<tr>
			<td><A HREF="SMH_genefamily.jsp">Single Myb Histone (SMH) Gene Family</A></td>
			<td>1 family<br>5 members</td>
			<td><a href=/servlets/Community?action=view&type=person&communityID=3460>Hank Bass</a></td>
		</tr>
        
        		<tr>
			<td><A HREF="syntaxin.jsp">SNARE and Associated Proteins</A></td>
			<td>27 families<br>68 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=2595">Anton Sanderfoot</a></td>
		</tr>
        
                	<tr>
			<td><A HREF="lrrv.jsp">Strubbelig Receptor Gene Family</A></td>
			<td>1 family<br>9 members</td>
			<td><a href=/servlets/Community?action=view&type=person&communityID=5928>Kay Schneitz</a></td>
		</tr>
        
        <tr>
			<td><A HREF="smc.jsp">Structural Maintenance of Chromosomes family</A></td>
			<td>1 family<br>3 members</td>
			<td><a href="/entity/person_detail/1501430322">	Koichi Watanabe</a></td>
		</tr>
        

		<tr>
			<td><A HREF="subtilase.jsp">Subtilisin-like Serine Gene Family</A></td>
			<td>1 family<br>55 members</td>
			<td><a href="/servlets/Community?action=view&type=person&communityID=5124">Thomas Altman</a><br>
			    <a href="/servlets/Community?action=view&type=person&communityID=611942">Carsten Rauntengarten"</a></td>
		</tr>
 
		<tr>
			<td><A HREF="sucrose.jsp">Sucrose Transporter Gene Family</A></td>
			<td>1 family<br>9 members</td>
			<td><a href=/servlets/Community?action=view&type=person&communityID=4935>Norbert Sauer</a></td>
		</tr>

		<tr>
			<td><A HREF="STR_genefamily.jsp">Sulfurtransferasese/Rhodanese</A></td>
			<td>1 family<br>18 members</td>
			<td><a href=/servlets/Community?action=view&type=person&communityID=2402>Jutta Papenbrock</a></td>
		</tr>

	
<tr>
	<td><a href="TCP.jsp">TCP Transcription Factor Family</a></td>
	<td>1 family<br/>24 members</td>

	<td><a target="display" href="/entity/person_detail/6339">Pilar Cubas</a></td>
</tr>

<tr>
	<td><a href="tify.jsp">Tify Gene Family</a></td>
	<td>1 family<br/>18 members</td>

	<td><a target="/servlets/TairObject?type=person&id=1516">Lieve Gheysen</a></td>
</tr>

<tr><td><A href="AtTPS.jsp">Trehalose Biosynthesis Gene Families</A></td><td>2 families<br>12 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1325">Barbara Leyman</a> </td></tr>

<tr>
	<td><a href="Trihelix.jsp">Trihelix Transcription Factor Family</a></td>
	<td>1 family<br/>29 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="TRM.jsp">TRM (TON1 Recruiting Motif) Superfamily</a></td>
	<td>1 family<br/>34 members</td>

	<td><a target="display" href="http://www.arabidopsis.org/servlets/Community?action=view&type=person&communityID=5056">David Bouchez</a></td>
</tr>

<tr>
	<td><a href="TUB.jsp">TUB Transcription Factor Family</a></td>
	<td>1 family<br/>10 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr><td><A href="pub.jsp">U-box Gene Family</A></td><td>1 family<br>61 members</td><td><a href="http://www.sainsbury-laboratory.ac.uk/ken-shirasu/INDEX.htm">Ken Shirasu</a>   </td></tr>
<tr>
	<td><a href="VOZ9.jsp">VOZ-9 Transcription Factor Family</a></td>
	<td>1 family<br/>2 members</td>
	
	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr>
	<td><a href="Whirly.jsp">Whirly Transcription Factor Family</a></td>
	<td>1 family<br/>3 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

<tr><td><A href="wox.jsp">Wox Gene Family</A></td><td>1 family<br>14 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=5630">Thomas Laux</a></td></tr>

<tr><td><A href="WRKY-Som.jsp">WRKY Transcription Factor Superfamily</A></td><td>8 families<br>74 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=4955">Imre Somssich</a>   </td></tr>

<tr>
	<td><a href="WRKY.jsp">WRKY Transcription Factor Family</a></td>
	<td>1 family<br/>72 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>


<tr><td><A href="AtFUT.jsp">Xyloglucan Fucosyltransferase1</A></td><td>1 family<br>13 members</td><td><a href="/servlets/Community?type=organization&action=view&communityID=8333">N Raikhel Laboratory</a>, <a href="/servlets/Community?action=view&type=person&communityID=4257">M. O'Neill</A>, <a href="/servlets/Community?action=view&type=person&communityID=10689">A. Faik</A>, <A href="/servlets/Community?type=person&action=view&communityID=807">K. Keegstra</A>, <A href="/servlets/Community?action=view&type=person&communityID=211716">I Wilson</A></td></tr>

<tr><td><A href="ZF-HD.jsp">Zinc finger-homeobox gene family</A></td><td>2 families<br>17 members</td><td><a href="/servlets/Community?action=view&type=person&communityID=1501421667">Wei Hu</a>   </td></tr>
<tr>
	<td><a href="ZFHD.jsp">ZF-HD Transcription Factor Family</a></td>
	<td>1 family<br/>15 members</td>

	<td><a target="display" href="/servlets/Community?action=view&type=organization&communityID=1501423724">AGRIS</a></td>
</tr>

</table>
  <script type="text/javascript">
   tableRows();
  </script>
<p>
<center>Last modified on June 20, 2008</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
