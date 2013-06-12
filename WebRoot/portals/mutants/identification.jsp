<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "Mutant/Mapping Resources: Mutant Identification/Confirmation";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11631" />
</jsp:include>

<jsp:include page="/jsp/includes/forwardSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Mutation Identification/Confirmation" />  
</jsp:include>


<div id="rightcolumn">


                <span class= "mainheader">Mutant Identification and Confirmation</span>
                     <dl>
		<dd> 
		You've narrowed down your quest to a particular gene and are ready to identify the mutation that is affecting the gene.  Or, you have already identified the 
molecular lesion and would like to track it using a (d)CAPS assay.  Alternatively, you've found an interesting T-DNA insertion mutant and want to identify the exact site of insertion.  
		</dd>

		<dd>Here are some links to online software that can help you design primers for sequencing or PCR and to protocols that can be used to recover the sequence flanking the insertion and help you identify the mutated gene.</dd>

               <dt><b>Flanking Sequence Recovery</b></dt>

                <dd>
                <dl>
                     <dt><a href="http://www.protocol-online.org/prot/Molecular_Biology/PCR/Inverse_PCR/">Protocols-Online: Inverse PCR</a></dt>
                     <dd>Assorted IPCR protocols.</dd>

                     <dt><a href="http://www.pcrlinks.com/variants/tail-pcr.htm">PCRLinks.com: Thermal Asymmetric Interlaced PCR</a></dt>
                     <dd>Assorted TAIL-PCR protocols.</dd>

                     <dt><a href="http://signal.salk.edu/tdna_FAQs.html">Recovery of SALK line flanks</a></dt>
                     <dd>SIGnAL's FAQ on their T-DNA lines, with info on vectors and border primers.</dd>

                     <dt><a href="http://arabidopsis.org/abrc/sail.jsp">Recovery of SAIL line flanks</a></dt>
                     <dd>Information on vectors used in generating the SAIL lines.</dd>

                     <dt><a href="http://www.gabi-kat.de/faq/vector-primer-info.html">Recovery of GABI-KAT line flanks</a></dt>
                     <dd>Information about vectors and primers used generating the GABI-Kat lines.</dd>
                 </dl>
                 </dd>

                 <dt><b>PCR/Sequencing Primer Design</b></dt>
                 <dd>
                 <dl>
                     <dt><a href="http://frodo.wi.mit.edu/cgi-bin/primer3/primer3_www.cgi">Primer 3</a></dt>
                     <dd>Pick PCR primers from nucleotide sequence.</dd>
                     <dt><a href="http://seq.yeastgenome.org/cgi-bin/web-primer">WebPrimer</a></dt>
                     <dd>Allow alternative design of primers for either PCR or sequencing purposes.</dd>
                     <dt><a href="http://blocks.fhcrc.org/codehop.html">CODEHOP</a></dt>
                     <dd>Design PCR primers from protein multiple sequence alignments.</dd>
                     <dt><a href="http://signal.salk.edu/tdnaprimers.2.html">SIGNAL T-DNA Verification Primer Design</a></dt>
                     <dd>SIGnAL's PCR primer design program, just input your insertion line name and go!</dd>

                 </dl>
                 </dd>

                <dt><b>Marker Design</b></dt>
                <dd>
                <dl>
                     <dt><a href="http://helix.wustl.edu/dcaps/dcaps.html">dCAPS finder</a></dt>
                     <dd>A web-based tool to design PCR primers for dCAPs markers.</dd>
                     <dt><a href="http://bbc.botany.utoronto.ca/ntools/cgi-bin/ntools_blast_digester.cgi">BlastDigester</a></dt>
                     <dd>A web-based tool for CAPS marker generation for positional cloning. Identifies snip-SNPs (SNPs that alter a restriction endonuclease cut site) in BLAST sequence alignments and generates PCR primers surrounding them for easy CAPS marker generation.</dd>
                </dl>
                </dd>

      		    </dl>


</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

