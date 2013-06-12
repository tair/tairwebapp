<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<%@page import="org.tair.utilities.*"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="TAIR: Bulk Protein Search" />
<jsp:param name="id" value="84" />
</jsp:include>

<script language="javascript">
 function check_proteinbyloci() {
   document.proteinsearch.proteinbyloci[1].checked=true;
 }
</script>

  <span class="header">Bulk Protein Search</span>
  [<a href="/help/helppages/proteinhelp.jsp">help</a>]
		    <BR>
<br>

Search proteins according to predicted protein properties. Note: All datasets have been updated to TAIR10 Genome Release (November 2010).			  <br>
		    	    
		    <form action="/cgi-bin/bulk/protein/getprotein" name="proteinsearch" method="post" enctype="multipart/form-data">


		    
<TABLE width=600>
		      <TR><TD>
		    <input type=reset></TD>
			  <TD align=right><input type=submit Value="Get Protein Data">
		      </TD></TR></TABLE>

		    <TABLE width=600 cellpadding=20><TR><TD bgcolor=e0e0e0><!-- grey table -->
<center>
		      <font size=3><b><a href="/help/helppages/proteinhelp.jsp#outputoptions">Output Options</a></b></font><BR><BR>
		      Format:
		      <input type=radio name=outputtype checked value=html> html &nbsp;&nbsp;&nbsp;
		      <input type=radio name=outputtype value=text> text<br>
		      Output reverts to text if output &gt; 1000 proteins.
		      <BR><BR>
		
		      <table><tr><td>Output:</td>
		       <td><input type=checkbox name=output_MW checked> Molecular Weights &nbsp;&nbsp;&nbsp;</td>
		      <td><input type=checkbox name=output_pI> Isoelectric points &nbsp;&nbsp;&nbsp;
		      </td></tr>
		      <tr><td>&nbsp;</td><td><input type=checkbox name=output_locations> Intracellular locations &nbsp;&nbsp;&nbsp;</td>
		      <TD><input type=checkbox name=output_domains> Domains &nbsp;&nbsp;&nbsp;</td></tr>
		      <tr><td>&nbsp;</TD><TD><input type=checkbox name=output_transmembrane> Number of transmembrane domains</TD>
		      <TD><input type=checkbox name="output_swissprotids"> UniProt ID</TD></TR>
		      <tr><td>&nbsp;</TD><TD><input type=checkbox name=output_scop_class> SCOP's structural class<img src="/images/new.gif"></TD></TR>
		      </table>
		     
		      <BR>
		    <table width=560><TR><TD>
			<center>
			<font size=3><b><a href="/help/helppages/proteinhelp.jsp#limitsearch">Limit search to specific loci</a></b></font><BR>
		    </center>
		    <input type=radio name=proteinbyloci value=allproteins checked> Search all proteins<br>
     <input type=radio name=proteinbyloci value=limitproteins> Perform search in following subset:<br>
		     <TABLE><TR><TD width=20>&nbsp;
			     <TEXTAREA name=loci rows=5 cols=40 onFocus="check_proteinbyloci()"></TEXTAREA>
		    <br>

		Upload file: <input type="file" name="file" onFocus="check_proteinbyloci()">
                    </td></tr></TABLE>
		    </td></tr></table>
		      <BR>
		      <font size=3><b><a href="/help/helppages/proteinhelp.jsp#proteincharacteristics">Restrict by Predicted Protein Characteristics</a></b></font><BR> 
		      </center>
		      <BR><BR>
		    <input type=checkbox name=restrictbypI checked>
		      <a href="/help/helppages/proteinhelp.jsp#isoelectricpoints">Predicted pI<%=DefinitionsLookup.createPopupLink("AASequence","calc_pI")%></a> range low: <input type=text size=4 name=pIlow value=0.00 onFocus="check_pI()">
		      pI high: <input type=text size=4 name=pIhigh value=14.00 onFocus="check_pI()"><BR><BR>

		    <input type=checkbox name=restrictbyMW checked>
		      <a href="/help/helppages/proteinhelp.jsp#molecularweights">Predicted MW<%=DefinitionsLookup.createPopupLink("AASequence","calc_MW")%></a> range low: <input type=text size=10 name=MWlow value=0.00 onFocus="check_MW()"> MW high:
		      <input type=text size=10 name=MWhigh value=1000000 onFocus="check_MW()"> [Da]
		      <BR><BR>
		      <TABLE border=0 width=560 cellspacing=0 cellpadding=0><TR><TD width=280 valign=top>
		    <input type=checkbox name=restrictbylocation value=dontrestrict checked> Predicted
			<a href="/help/helppages/proteinhelp.jsp#subcellularlocation">subcellular location<%=DefinitionsLookup.createPopupLink("Glossary","targetp")%></a>:<br>			
			<TABLE border=0><TR><TD width=20>&nbsp;</TD><TD>
		    <input type=checkbox name=cytoplasm onClick="check_location()"> Other (cytoplasm etc.)<br>
		    <input type=checkbox name=chloroplast onClick="check_location()"> Chloroplast<br>
		    <input type=checkbox name=mitochondrion onClick="check_location()"> Mitochondrion<br>
		    <input type=checkbox name=secreted onClick="check_location()"> Secreted Proteins<br>
		    <input type=checkbox name=undefined_location onClick="check_location()"> Undefined<br>
		    <input type=checkbox name=undetermined_location onClick="check_location()"> Undetermined<br>
			    </TD></TR></TABLE>
			</TD><TD valign=top width=280>
			    <TABLE border=0 cellspacing=0 cellpadding=0><TR><TD valign="middle">
<input type=checkbox name=hasdomain></TD><TD>&nbsp;</TD><TD> contains any
    <a href="help/helppages/proteinhelp.jsp#proteindomains">domain<%=DefinitionsLookup.createPopupLink("ProteinDomain","type")%></a></TD></TR><br>
		   <TR valign="middle"><TD><input type=checkbox name=hasthisdomain></TD><TD>&nbsp;</TD><TD valign="middle">has this domain id: <input type=text size=15 name=domainname onFocus="check_hasthisdomain()"><br>
		       (Enter a
		       <a href="http://www.sanger.ac.uk/Software/Pfam">Pfam</a>,
		       <a href="http://www.expasy.ch/prosite">Prosite</a>,
		       <a href="http://prodes.toulouse.inra.fr/prodom/doc/prodom.html">ProDom</a>,
		       <a href="http://www.bioinf.man.ac.uk/dbbrowser/PRINTS">PRINTS</a>,
		       <a href="http://smart.embl-heidelberg.de/">SMART</a> or 
		       <a href="http://www.ebi.ac.uk/interpro/">InterPro</a> identifier)
				</TD></TR></TABLE>
				<BR><BR>
		<TABLE border=0 cellspacing=0 cellpadding=0><TR><TD valign=top>
		    <input type=checkbox name=ismembraneprotein></TD>
                                     <TD>&nbsp;</TD>
                                     <TD> is a<a href="/help/helppages/proteinhelp.jsp#transmembranedomains">membrane protein<%=DefinitionsLookup.createPopupLink("Glossary","hmmtop")%></a><BR></TD></TR>
				
		    <TR valign=top><TD><input type=checkbox name=restrictbytransmembrane></TD>
                                    <TD>&nbsp;</TD>
                                     <TD> has <input type=text size=5 name=transmembrane_count onFocus="check_transmembrane()"> predicted membrane spanning domains<BR> </TD></TR></TABLE>
		    </TD></TR></table>
		    <BR>
<!added new Sue Rhee 20031017>
		      <TABLE border=0 width=560 cellspacing=0 cellpadding=0><TR><TD width=280 valign=top>
		    <input type=checkbox name=restrictbyscop_class value=dontrestrict checked> Predicted
			<a href="/help/helppages/proteinhelp.jsp#structural_class">structural class<%=DefinitionsLookup.createPopupLink("StructuralClassType","structural_class_type_id")%></a>:<img src="/images/new.gif"><br>			
			<TABLE border=0><TR><TD width=20>&nbsp;</TD><TD>
		    <input type=checkbox name=alpha onClick="check_structure()"> All alpha proteins<br>
		    <input type=checkbox name=beta onClick="check_structure()"> All beta proteins<br>
		    <input type=checkbox name=alphabeta onClick="check_structure()"> Alpha and beta proteins (a/b)<br>
		    <input type=checkbox name=alphaandbeta onClick="check_structure()"> Alpha and beta proteins (a+b)<br>
		    <input type=checkbox name=multi_domain onClick="check_structure()"> Multi-domain proteins (alpha and beta)<br>
		    <input type=checkbox name=membrane_surface_peptide onClick="check_structure()"> Membranes, cell surface proteins, and peptides<br>
		    <input type=checkbox name=small_protein onClick="check_structure()"> Small proteins<br>	    
		</TD></TR></TABLE>
		    <BR><BR>
		    
</td></tr>
</table>
			 
<BR></td></tr>
	      </table> <!-- the grey table -->
		    <br>
		    <TABLE width=600>
		      <TR><TD>
		    <input type=reset></TD>
			  <TD align=right><input type=submit Value="Get Protein Data">
		      </TD></TR></TABLE>

		    </form>
 <p>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

