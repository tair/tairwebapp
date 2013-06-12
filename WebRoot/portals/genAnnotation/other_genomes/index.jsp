<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "Other Plant Genomes";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1144" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Other Genomes" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE-->
<a name="top"></a><br/>
<span class="mainheader">Other Genome Databases and Sequencing Efforts</span>
<p>This page provides a list of <a href="#plants"><b>plant-specific</b></a> and <a href="#non_plant"><b>non-plant</b></a> model organism databases, as well as links to other sites that maintain <a href="#multi_organism"><b>links to numerous organism-specific resources</b></a>.<br/><br> This page also has links to information about <a href="#sequence"><b>other plant genome sequencing projects</b></a></p>

		<a name="plants"></a><br/>
		<b>Plant Model Organism Databases</b><br/><br/>
		    
		    <b><a href="http://beangenes.cws.ndsu.nodak.edu/" target="_blank"> BeanGenes</a></b> - beans<br/>
		    <i>Phaseolus and Vigna</i> species<br/><br/>
		    
		    <b><a href="http://www.brachypodium.org/" target="_blank">The Brachypodium distachyon Information Resource</a></b> - model grass<br/>
		    <i>Brachypodium distachyon</i><br/><br/>
		    
		    <b><a href="http://www.chlamy.org/" target="_blank"> Chlamydomonas Center</a></b> - green alga<br/>
		    <i>Chlamydomonas</i><br/><br/>

		     <b><a href="http://foresttree.org:8680/DB/nimbus/project.do" target="_blank"> ForesttreeDB</a></b> - white spruce, loblolly pine, and poplar<br/>
		     <i>Picea glauca, Pinus taeda, and Populus</i> species<br/><br/>

		     <b><a href="http://wheat.pw.usda.gov/GG2/index.shtml"
		      target="_blank"> GrainGenes</a></b> - grasses<br/>
		     <i>Triticum and Avena</i> species<br/><br/>
		     
		     <b><a href="http://www.gramene.org/" target="_blank"> Gramene</a></b> - cultivated rice, wild rice, maize, wheat, barley, sorghum, pearl millet, foxtail, and oats<br/>
		     <i>Oryza sativa and Zizania species, Zea mays, Triticum aestivum, Hordeum vulgare, Sorghum bicolor, Pennisetum glaucum, Alopecurus pratensis, Avena </i>species, and other grasses</i><br/><br/>
		     
		     <b><a href="http://www.legumebase.agr.miyazaki-u.ac.jp" target="_blank"> Legume Base</a></b> - Lotus japonicus and soybean<br/>
		     <i>Lotus japonicus and Glycine max</i><br/><br/>
		     
		     <b><a href="http://www.comparative-legumes.org/" target="_blank"> The Legume Information Service</a></b> - multiple legumes<br/>
		     <i>Cicer arietinum, Glycine max, Lotus japonicus, Medicago truncatula, Phaseolus vulgaris, Vigna radiata</i> and other legumes<br/><br/>
		     
                    <b><a href="http://www.maizegdb.org/" target="_blank"> Maize GDB</a></b> - corn / maize<br/>
		     <i>Zea mays</i><br/><br/>
		     
		     <b><a href="http://www.maizemap.org/" target="_blank"> Maize Mapping Project</a></b> - corn / maize<br/>
		     <i>Zea mays</i><br/><br/>
		     
		      <b><a href="http://www.medicago.org/" target="_blank"> Medicago.org</a></b> - barrel medic<br/>
		     <i>Medicago truncatula</i><br/><br/>
		     
		     <b><a href="http://mips.gsf.de/proj/plant/jsf/index.jsp" target="_blank"> MIPS (Munich Information Center for Protein Sequence)</a></b> - mouse ear cress, corn / maize, rice, barrel medic, Lotus japonicus, tomato<br/>
		     <i>Arabidopsis thaliana, Zea mays, Oryza sativa, Medicago truncatula, Lotus japonicus, Solanum lycopersicum</i><br/><br/>
		     
		     <b><a href="http://www.shigen.nig.ac.jp/rice/oryzabase/top/top.jsp" target="_blank"> Oryzabase</a></b> - rice species<br/>
		     <i>Oryza species</i><br/><br/>
		     
		     <b><a href="http://www.phytozome.net/" target="_blank"> Phytozome</a></b> - more than 20 green plants<br/>
		     <i>includes A. thaliana, A. lyrata, P. trichocarpa, Z. mays, O. sativa, V. vinifera, S. bicolor and an increasing number of other green plants</i><br/><br/> 		     

		     <b><a href="http://www.phytozome.net/poplar" target="_blank"> Poplar Genome </a></b> - poplar<br/>
		     <i>Populus trichocarpa</i><br/><br/>
                    
		     <b><a href="http://rgp.dna.affrc.go.jp/" target="_blank"> Rice Genome Research Project </a></b> - cultivated rice<br/>
		     <i>Oryza sativa</i><br/><br/>
		     
		     <b><a href="http://www.sgn.cornell.edu/" target="_blank"> SGN (Sol Genomics Network) </a></b> - tomato, potato, eggplant, pepper, petunia, coffee, petunia<br/>
		     <i>Solanaceae and Rubiaceae</i> species<br/><br/>
		     
             <b><a href="http://www.mobot.org/mobot/research/brassicaceae">Systematics and phylogeny of the mustard family Brassicaceae (Cruciferae)</a></b><br/><br/>
             
		     <b><a href="http://soybase.agron.iastate.edu/" target="_blank"> SoyBase </a></b> - soybean<br/>
		     <i>Glycine max</i><br/><br/>
                    
		     <b><a href="http://www.tigr.org/plantProjects.shtml" target="_blank"> TIGR Plant Genomics Database</a></b> - multiple species <br/><br/>
		     
		     <b><a href="http://mips.gsf.de/proj/plant/jsf/medi/index.jsp" target="_blank"> UrMeLDB </a></b> - barrel medic <br/>
		     <i>Medicago truncatula </i><br/><br/>
		     
		     <b><a href="http://www.k-state.edu/wgrc/" target="_blank"> Wheat Genetic and Genomic Resources Center </a></b> - wheat and related grasses <br/>
		     <i>Triticum, Aegilops, and Haynaldia villosa</i> species <br/>
		    
		    <a name="non_plant"></a><br/>
                    <b>Non-Plant Model Organism Databases</b><br/><br/>
		    
		    <b><a href="http://www.kazusa.or.jp/cyano/" target="_blank"> CyanoBase</a></b> - Cyanobacteria<br/>
		    <i>Cyanobacteria</i> species<br/><br/>
		    
		    <b><a href="http://dictybase.org/" target="_blank"> Dictybase</a></b> - Dictyostelium<br/>
		    <i>Dictyostelium discoideum</i><br/><br/>
		     
		    <b><a href="http://www.flybase.org/" target="_blank"> FlyBase</a></b> - fruit fly<br/>
		    <i>Drosophila</i> species<br/><br/>
		    
		    <b><a href="http://www.informatics.jax.org/" target="_blank"> MGI (Mouse Genome Informatics)</a></b> - mouse<br/>
		    <i>Mus musculus</i><br/><br/>
		    
		    <b><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=OMIM" target="_blank"> OMIM (Online Mendelian Inheritance in Man)</a></b> - human<br/>
		    <i>Homo sapiens</i><br/><br/>
		    
		    <b><a href="http://rgd.mcw.edu" target="_blank"> RGD (Rat Genome Database)</a></b> - rat<br/>
		    <i>Rattus norvegicus</i><br/><br/>
		    
		    <b><a href="http://www.sanger.ac.uk/Projects/S_pombe/" target="_blank"> S. pombe Genome Project</a></b> - fission yeast<br/>
		    <i>Schizosaccharomyces pombe</i><br/><br/>
		    
		     <b><a href="http://www.yeastgenome.org/" target="_blank"> SGD (Saccharomyces Genome Database)</a></b> - budding yeast / baker's yeast<br/>
		    <i>Saccharomyces cerevisiae</i><br/><br/>
          
		    
		    <b><a href="http://www.wormbase.org/" target="_blank"> WormBase</a></b> - round worms<br/>
		    <i>Caenorhabditis</i> species<br/><br/>
		    
		    <b><a href="http://zfin.org/" target="_blank"> ZFIN</a></b> - zebrafish<br/>
		    <i>Danio rerio</i><br/>
		    
		    
		    <a name="multi_organism"></a><br/>
		    <b>Additional Organism-Specific Database Collections and Resources</b><br/><br/>
		     
		     <b><a href="http://genome.jgi-psf.org/euk_home.html" target="_blank"> JGI Eukaryotic Genomics Projects</a></b> - over 40 species<br/><br/>
		     
		     <b><a href="http://genome.jgi-psf.org/mic_home.html" target="_blank"> JGI Microbial Genomics Projects</a></b> - over 200 species<br/><br/>
		     
		     <b><a href="http://www.genome.ucsc.edu/" target="_blank"> Multiple Species Genome Browser</a></b> - numerous non-plant species<br/><br/>
		    
		    <b><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?cmd=search&db=genomeprj" target="_blank"> NCBI Entrez Genome Project Database</a></b> - hundreds of species<br/><br/>
		    
		    <b><a href="http://www.tigr.org/db.shtml" target="_blank"> TIGR Genome Projects</a></b> - multiple species <br/><br/>
		    		     
		     <b><a href="http://www.shigen.nig.ac.jp/wgr/top/top.jsp" target="_blank"> Worldwide Genetic Resources</a></b> - over 750 species <br/><br/>
		     



<p> Back to <a href="#top">top</a></p>
<dl>
<p><a name="sequence"></a></p>
<dt>Other plant genome sequencing projects</dt>

<p>For the most current information and a complete set of links, please visit the:</p>
<p><b><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?cmd=search&db=genomeprj" target="_blank"> NCBI Entrez Genome Project Database</a></b>.</p><br />

<p><b>Quick Status Summary</b></p><br />
<dd>

<table border="1" cellspacing="0">
    <thead>
        <tr>
            <td><b>Common name</b></td>
            <td><b>Latin name</b></td>
            <td><b>Status</b></td>
            <td><b>Sequencing group</b></td>
            <td><b>Sequencing method</b></td>
        </tr>
        <tr> 
            <td colspan="7"><b>DICOTS</b></td>
        </tr>
    </thead>
    
    <tbody>
        <tr>
            <td>mouse ear cress</td>
            <td><i>Arabidopsis thaliana</i></td>
            <td><a href="/">completed</a></td>
            <td>consortium (AGI)</td>
            <td>clone</td>
        </tr>
        <tr>
            <td>poplar</td>
            <td><i>Populus trichocarpa</i></td>
            <td><a href="http://genome.jgi-psf.org/Poptr1_1/Poptr1_1.home.html">completed</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>lyreleaf rockcress</td>
            <td><i>Arabidopsis lyrata</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2006/AlyrataCrubella.html">in progress</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>pink shepherd's purse</td>
            <td><i>Capsella rubella</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2006/AlyrataCrubella.html">in progress</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>rapeseed</td>
            <td><i>Brassica rapa</i></td>
            <td><a href="http://www.brassica.info/">in progress</a></td>
            <td>consortium (MGBP)</td>
            <td>clone</td>
        </tr>
        <tr>
            <td>tomato</td>
            <td><i>Lycopersicum esculentum</i></td>
            <td><a href="http://www.sgn.cornell.edu/about/tomato_sequencing.pl">in progress</a></td>
            <td>consortium (ITGSP)</td>
            <td>clone</td>
        </tr>
        <tr>
            <td>potato</td>
            <td><i>Solanum tuberosum</i></td>
            <td><a href="http://www.potatogenome.net/">in progress</a></td>
            <td>consortium (PGSC)</td>
            <td>clone</td>
        </tr>
        <tr>
            <td>barrel medic</td>
            <td><i>Medicago truncatula</i></td>
            <td><a href="http://medicago.org/genome/IMGAG/">completed?</a></td>
            <td>consortium (IMGAG)</td>
            <td>clone</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><i>Lotus japonicus</i></td>
            <td><a href="http://mips.gsf.de/proj/plant/jsf/lotus/index.jsp">in progress</a></td>
            <td>consortium</td>
            <td>clone</td>
        </tr>
        <tr>
            <td>monkey flower</td>
            <td><i>Mimulus guttatus</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2006/mimulus.html">in progress</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>soybean</td>
            <td><i>Glycine max</i></td>
            <td><a href="http://soybeangenome.siu.edu/">in progress</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>cotton</td>
            <td><i>Gossypium hirsutum</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2007/cotton.html">in progress</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>cassava</td>
            <td><i>Manihot esculenta</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2007/cassava.html">in progress</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>grape</td>
            <td><i>Vitis vinifera</i></td>
            <td><a href="http://www.genoscope.cns.fr/externe/English/Projets/Projet_ML/projet.html">completed?</a></td>
            <td>consortium</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>columbine</td>
            <td><i>Aquilegia formosa</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2007/aquilegia.html">pending</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>eucalyptus</td>
            <td><i>Eucalyptus grandis</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2008/eucalyptus.html">pending</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>papaya</td>
            <td><i>Carica papaya</i></td>
            <td><a href="http://asgpb.mhpcc.hawaii.edu/papaya/">in progress?</a></td>
            <td>consortium</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>castor bean</td>
            <td><i>Ricinus communis</i></td>
            <td><a href="http://castorbean.tigr.org/">completed?</a></td>
            <td>TIGR</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>yellow owl's clover</td>
            <td><i>Triphysaria versicolor</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2006/Triphysaria.html">pending</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td colspan="7"><b>MONOCOTS</b></td>
        </tr>
        <tr>
            <td>rice</td>
            <td><i>Oryza sativa japonica Nipponbare</i></td>
            <td><a href="http://rgp.dna.affrc.go.jp/IRGSP/">completed</a></td>
            <td>consortium (IRGSP)</td>
            <td>clone shotgun</td>
        </tr>
        <tr>
            <td>rice</td>
            <td><i>Oryza sativa indica</i></td>
            <td><a href="http://english.cas.ac.cn/Eng2003/page/SRA/B_5.htm">completed</a></td>
            <td>Beijing Genomics Institute</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>maize</td>
            <td><i>Zea mays</i></td>
            <td><a href="http://www.maizegdb.org/">in progress</a></td>
            <td>consortium</td>
            <td>clone</td>
        </tr>
        <tr>
            <td>sorghum</td>
            <td><i>Sorghum bicolor</i></td>
            <td><a href="http://www.phytozome.net/sorghum">completed</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>grass</td>
            <td><i>Brachypodium distachyon</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2007/brachypodium.html">in progress</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>foxtail millet</td>
            <td><i>Setaria italica</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2008/foxtailmillet.html">pending</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>banana</td>
            <td><i>Musa acuminata</i></td>
            <td><a href="http://www.musagenomics.org/">in progress</a></td>
            <td>consortium</td>
            <td>clone</td>
        </tr>
        <tr>
            <td>wheat</td>
            <td><i>Triticum aestivum</i></td>
            <td><a href="http://www.wheatgenome.org/">pilot</a></td>
            <td>consortium (IWGSC)</td>
            <td>clone or single chromosome shotgun</td>
        </tr>
        <tr>
            <td colspan="7"><b>OTHER</b></td>
        </tr>
        <tr>
            <td>moss</td>
            <td><i>Physcomitrella patens</i></td>
            <td><a href="http://genome.jgi-psf.org/Phypa1_1/Phypa1_1.home.html">completed</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
        <tr>
            <td>gemmiferous spike moss</td>
            <td><i>Selaginella moellendorffii</i></td>
            <td><a href="http://www.jgi.doe.gov/sequencing/why/CSP2005/selaginella.html">completed</a></td>
            <td>JGI</td>
            <td>whole genome shotgun</td>
        </tr>
    </tbody>

</table>
</dd>
</dl>




<p>Back to <a href="#top">top</a></p>

<dd>












<dl>
<dt><a href=""></a></dt>
<dd></dd>
</dl>

</dd>
</dl>
            </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

