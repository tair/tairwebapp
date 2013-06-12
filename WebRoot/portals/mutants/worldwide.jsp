<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "Mutant/Mapping Resources: Worldwide Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1161" />
</jsp:include>

<jsp:include page="/jsp/includes/forwardSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Worldwide Resources" />  
</jsp:include>


<div id="rightcolumn">

                <span class= "mainheader">Worldwide Forward and Reverse Genetics Resources</span>
              
                     <dl>

                <dd>An overview of various forward and reverse genetics projects and seed resources is presented below.  </dd>


<dd>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">

    <TR><TH><B>Resource name</B></TH>
        <TH><B>Type</B></TH>
        <TH><B>Back- ground Line</B></TH>
	<TH><B>Vector Info</B></TH>
        <TH><B>View Mutation on Genome</B></TH>
        <TH><B>Available From</B></TH>
        </TR>


        <TR>
        <TD><A href = 'http://www.agrikola.org'>AGRIKOLA</A></TD>
        <TD>RNAi knockout (individual lines)</TD>
        <TD>Col</TD>
	<TD><a href= "http://www.agrikola.org/index.php?o=/agrikola/html/pAGRIKOLA">pAGRIKOLA </a><a href="http://www.invitrogen.com/search.cfm?category=Vectors&searchTerm=pDONR207&id=679">pDONR207</a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>

        </TR>

        <TR>
        <TD><A href = 'http://arabidopsis.org/abrc/alonso.jsp'>Alonso, Crosby and Ecker</A></TD>
        <TD>Simple insert (sets of pools and individual lines)</TD>
        <TD>Col-0</TD>
	<TD><a href= "http://signal.salk.edu/tdna_protocols.html">pROK2</a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><A href = 'http://www.szbk.u-szeged.hu/~arabidop/mappingoftdnalines.htm'>Biological Research Center(Hungary) </A><B>*</B></TD>
        <TD>Promoter trap and activation tag (individual lines)</TD>
        <TD>Col</TD>
        <TD><a href= "http://www.szbk.u-szeged.hu/~arabidop/mappingoftdnalines.htm#vectormaps">multiple T-DNA vectors</a></TD>
        <TD>locus mapping available on project website</TD>
        <TD>contact authors</TD>
        </TR>


        <TR>
        <TD><A href = 'http://arabidopsis.org/abrc/bressan.jsp'>Bressan, Yokoi and Koiwa</A></TD>
        <TD>Activation tag (sets of pools)</TD>
        <TD>C24</TD>
        <TD><a href= "http://www.weigelworld.org/resources/plasmids/activationtagging/pski015">pSKI15</a></TD>
        <TD>n/a</TD>
	<TD>ABRC NASC</TD>        
        </TR>

        <TR>
        <TD>Characterized mutants</TD>
        <TD>Misc. individual lines</TD>
        <TD>Misc.</TD>
        <TD>Misc.</TD>
        <TD>see records</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><A href = 'http://genetrap.cshl.org/'>CSHL</A></TD>
        <TD>Gene trap and enhancer trap (individual lines)</TD>
        <TD>Ler</TD>
        <TD><a href= "http://genetrap.cshl.org/traps.html">Ac, DsG and DsE T-DNAs </a></TD> 
        <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A>  <A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><A href = 'http://www.jic.bbsrc.ac.uk/science/cdb/exotic/index.htm'>EXOTIC/ JIC Gene Trap</A></TD>
        <TD>Gene trap transposon (individual lines)</TD>
        <TD>Ler</TD>
        <TD><a href= "http://www.jic.bbsrc.ac.uk/science/cdb/exotic/index.htm">Ds-GT and Tpase</a></TD>
        <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>


        <TR>
        <TD><A href = 'http://arabidopsis.org/abrc/feldmann.jsp'>Feldmann</A></TD>
        <TD>Simple insert (sets of pools and individual lines)</TD>
        <TD>Ws-2</TD>
        <TD><a href= "/servlets/TairObject?type=vector&id=500300068">3850:1003 Ti </a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href = "http://www.gabi-kat.de/">GABI-Kat </a><B>*</B></TD>
        <TD>T-DNA insertion (individual lines)</TD>
        <TD>Col</TD>
        <TD><a href= "http://www.gabi-kat.de/General_Information/GABI-Kat-pAC161T-DNAmapPr.html">pAC161</a></TD>
        <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A> <A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://garnet.arabidopsis.org.uk/transposons_for_functional_genomics.htm">GARNet - JIC SM </a></TD>
        <TD>Single insert Ds-Spm (insertion lines)</TD>
        <TD>Col-0</TD>
        <TD><a href= "http://jicgenomelab.co.uk/fileadmin/Download/Documents/pdf/Tissier_PC_1999.pdf">SLJ8313 SLJ8337 SLJ8353</a></TD>
       <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href = "http://www.plantsci.cam.ac.uk/Haseloff/geneControl/catalogFrame.html">Haseloff/U. Cambridge</a></TD>
        <TD>Enhancer trap (individual lines)</TD>
        <TD>C24</TD>
       <TD><a href= "/servlets/TairObject?type=vector&id=500400069">pBIN m-gfp5-ER</a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "/abrc/ima.jsp">IMA </a><B>*</B></TD>
        <TD>Ds insertion (individual lines)</TD>
        <TD>Ler</TD>
       <TD><a href= "http://www.plantcell.org/cgi/content/full/11/12/2263">Ds element (kanamycin resistance, GUS reporter)</a></TD>
        <TD><A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href = "http://urgv.evry.inra.fr/projects/FLAGdb++/HTML/index.shtml">INRA-Versailles FLAG_FST </a><B>*</B></TD>
        <TD>Promoter trap (individual lines)</TD>
        <TD>Ws</TD>
       <TD><a href= "http://www-ijpb.versailles.inra.fr/fr/sgap/equipes/cyto/ressources/pGKB5.html">pGKB5</a></TD>
        <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A> <A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>INRA</TD>
        </TR>

        <TR>
        <TD><A href = 'http://arabidopsis.org/abrc/inra.jsp'>INRA</A></TD>
        <TD>Promoter trap (set of pools)</TD>
        <TD>Ws-4</TD>
       <TD><a href= "http://www-ijpb.versailles.inra.fr/fr/sgap/equipes/cyto/ressources/pGKB5.html">pGKB5</a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://arabidopsis.info/CollectionInfo?id=29">JIC Activate</a></TD>
        <TD>Activation trap (individual lines)</TD>
        <TD>Ler</TD>
       <TD>Tn113 (Ds starter line) X Tn25 (Ac transposase lines)</TD>
        <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><A href = 'http://arabidopsis.org/abrc/jack.jsp'>Jack</A></TD>
        <TD>Enhancer trap (set of pools)</TD>
        <TD>Col-6 (gl1)</TD>
       <TD><a href= "http://www.dartmouth.edu/~tjack/#pD991">pD991</a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

       <TR>
        <TD>Misc. Insertion Collections</TD>
        <TD>Misc.</TD>
        <TD>Misc.</TD>
        <TD>n/a</TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD>Misc. T-DNA pools for forward screening</TD>
        <TD>Misc.</TD>
        <TD>Misc.</TD>
        <TD>n/a</TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://enhancertraps.bio.upenn.edu/">Poethig/U. Penn</a></TD>
        <TD>Enhancer trap (individual lines)</TD>
        <TD>Col</TD>
        <TD><a href= "/servlets/TairObject?type=vector&id=500400069">pBIN m-gfp5-ER</a></TD>
        <TD>locus mapping available on project website</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://rarge.gsc.riken.jp/dsmutant/index.pl">RIKEN </a><B>*</B></TD>
        <TD>Ds transposon insertion (individual lines))</TD>
        <TD>No-O</TD>
        <TD><a href= "http://rarge.gsc.riken.jp/dsmutant/index.pl">series of Ds constructs</a></TD>
	<TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://rarge.gsc.riken.jp/genomemap/genomemap.pl">RARGE</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>RIKEN BRC</TD>
        </TR>

        <TR>
        <TD><a href= "http://amber.gsc.riken.jp/act/top.php">RIKEN </a><B>*</B></TD>
        <TD>Activation trap (individual lines)</TD>
        <TD>Col</TD>
        <TD>pPCVICEn4HPT (hygromycin resistance, 4x 35CaMV enhancer)</TD>
       <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://rarge.gsc.riken.jp/genomemap/genomemap.pl">RARGE</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>RIKEN BRC</TD>
        </TR>

        <TR>
        <TD><a href="/abrc/sail.jsp">SAIL (formerly GARLIC/TMRI)</a></TD>
        <TD>T-DNA insertion (individual lines)</TD>
        <TD>Col</TD>
        <TD><a href= "/abrc/pCSA110.pdf">pCSA110 </a><a href= "/abrc/pDAP101.pdf">pDAP101</a></TD>
        <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A> <A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://signal.salk.edu/tabout.html">SALK</a></TD>
        <TD>T-DNA insertion (individual lines)</TD>
        <TD>Col</TD>
        <TD><a href= "http://signal.salk.edu/tdna_protocols.html">pROK2</a></TD>
       <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A> <A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://signal.salk.edu/gabout.html">Confirmed SALK insertion lines</a></TD>
        <TD>T-DNA insertion (PCR-validated <a href = 'http://signal.salk.edu/geno/sum.txt'>homozygous</a> or heterozygous individual lines)</TD>
        <TD>Col</TD>
        <TD><a href= "http://signal.salk.edu/tdna_protocols.html">pROK2</a></TD>
        <TD><A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><A href = 'http://arabidopsis.org/abrc/Scheible.jsp'>Scheible and Somerville</A></TD>
        <TD>Activation tag (set of pools)</TD>
        <TD>Col-2</TD>
        <TD><a href= "http://www.weigelworld.org/resources/plasmids/activationtagging/pski015">pSKI15</a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><A href = 'http://arabidopsis.org/abrc/sussman_fwd.jsp'>Sussman and Amasino</A></TD>
        <TD>Simple insert (set of pools)</TD>
        <TD>Ws-2</TD>
        <TD><a href= "http://www.biotech.wisc.edu/NewServicesAndResearch/Arabidopsis/pD991-AP3_finalseq.html">pD991-AP3</a></TD>
        <TD>n/a</TD>
         <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=16087178">TAMARA</a></TD>
        <TD>Tn mediated activation tag (individual lines)</TD>
        <TD>Col-0</TD>
        <TD><a href= "http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=16087178">TAMARA</a></TD>
        <TD>contact authors</TD>
        <TD>NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://tilling.fhcrc.org/">TILLING</a></TD>
        <TD>EMS mutagenized (individual lines)</TD>
        <TD>Col er-105</TD>
        <TD>n/a</TD>
       <TD><A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A></TD>
         <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><A href = 'http://arabidopsis.org/abrc/weigel.jsp'>Weigel</A></TD>
        <TD>Activation tag (set of pools)</TD>
        <TD>Col-7</TD>
        <TD><a href= "http://www.weigelworld.org/resources/plasmids/activationtagging/pski015">pSKI15</a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "http://www.hort.wisc.edu/krysan/Ds-Lox/">Wisconsin Ds-Lox</a></TD>
        <TD>Ds-Lox insertion (individual lines)</TD>
        <TD>Col</TD>
       <TD><a href= "http://www.hort.wisc.edu/krysan/Ds-Lox/">pDS-Lox</a></TD>
        <TD><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A> <A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A> <A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A> <A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TD>
        <TD>ABRC NASC</TD>
        </TR>

        <TR>
        <TD><a href= "/abrc/akf.jsp">Wisconsin KO</a></TD>
        <TD>T-DNA insertion (set of pools)</TD>	
        <TD>Ws</TD>
        <TD><a href= "http://www.biotech.wisc.edu/NewServicesAndResearch/Arabidopsis/pD991-AP3_finalseq.html">pD991-AP3</a></TD>
        <TD>n/a</TD>
        <TD>ABRC NASC</TD>
        </TR>


</TABLE>

<dd>* MTA needs to be signed and/or IP restrictions</dd>



      		    </dl>


</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


