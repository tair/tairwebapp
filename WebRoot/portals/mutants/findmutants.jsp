<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "Mutant/Mapping Resources: Find Mutants";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1162" />
</jsp:include>

<jsp:include page="/jsp/includes/forwardSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Find Mutants" />  
</jsp:include>


<div id="rightcolumn">

                <span class= "mainheader">Find Mutants</span>
                     <dl>
 <dd>This section provides a series of links in the left hand sidebar to                        <UL>
                        <LI>germplasm and seed stock searches and browsers</LI>
                        <LI>various genome browsers that display T-DNA insertions, transposon insertions and other mutations in the context of the Arabidopsis genome</LI>
                        <LI>BLAST searches that can be coupled with your sequence input and appropriate BLAST datasets to locate insertions in your region of interest</LI>
                        <LI>TILLING services to locate EMS induced mutations in your gene of interest in either Columbia or Landsberg erecta backgrounds.</LI>
                        </UL>
                    </dd>


		<dd> Several reverse genetics projects have mapped the locations of mutations with respect to the chromosomal coordinates of the Arabidopsis genome.  A breakdown of which mutant lines can be viewed on which genome browser is provided below.  If a set of lines is not visible in any of the genome browsers, the flanking sequence, RNAi construct used and/or locus assignments are available at the project website.</dd>

<dd>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">

    <TR><TH></TH>
        <TH><A HREF="http://atensembl.arabidopsis.info/">AtEnsembl</A></TH>
        <TH><A HREF="http://atidb.org/cgi-perl/gbrowse/atibrowse">AtIDB</A></TH>
        <TH><A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A></TH>
        <TH><A HREF="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</A></TH>
	<TH><A HREF="http://rarge.gsc.riken.jp/genomemap/genomemap.pl">RARGE</A></TH>
        </TR>


        <TR>
        <TD><A HREF="http://www.agrikola.org/index.php?o=/agrikola/html/database">AGRIKOLA</A></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><A HREF="http://www.szbk.u-szeged.hu/~arabidop/mappingoftdnalines.htm#mappedtdna">Biological Research Center(Hungary)</A></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><A href = 'http://genetrap.cshl.org/'>CSHL</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>

	<TR>
        <TD><A href = 'http://www.jic.bbsrc.ac.uk/science/cdb/exotic/index.htm'>EXOTIC/JIC Gene Trap</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href = "http://www.gabi-kat.de/">GABI-Kat</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href= "http://garnet.arabidopsis.org.uk/transposons_for_functional_genomics.htm">GARNet- JIC SM</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href= "/abrc/ima.jsp">IMA</A></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href = "http://urgv.evry.inra.fr/projects/FLAGdb++/HTML/index.shtml">INRA-Versailles FST</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href= "http://arabidopsis.info/CollectionInfo?id=29">JIC Activate</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        </TR>


        <TR>
        <TD><A HREF="http://enhancertraps.bio.upenn.edu/FMPro?-db=w_enhancer_traps.fp5&-layout=all&-Format=enhancer_search.html&-SortField=line&-SortOrder=ascend&-Max=25&-Findall">Poethig/U. Penn</A></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href= "http://rarge.gsc.riken.jp/dsmutant/index.pl">RIKEN Transposon Insertion</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        </TR>

        <TR>
        <TD><a href= "http://amber.gsc.riken.jp/act/top.php">RIKEN Activation Trap</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
	 </TR>
  
        <TR>
        <TD><a href="/abrc/sail.jsp">SAIL (formerly GARLIC/TMRI)</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href= "http://signal.salk.edu/tabout.html">SALK</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href= "http://tilling.fhcrc.org/">TILLING (Col)</A></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href= "http://www.cnb.csic.es/~tiller/ ">TILL<i>er</i> (Ler)</A></TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD>
        </TR>

        <TR>
        <TD><a href= "http://www.hort.wisc.edu/krysan/Ds-Lox/">Wisconsin Ds-Lox</A></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD><CENTER>x</CENTER></TD>
        <TD>&nbsp;</TD>
        </TR>


</TABLE>
      		    </dl>


</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


