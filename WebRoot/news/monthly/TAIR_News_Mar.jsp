<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR March News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
*********************************************************************************************<P>
For the month of March 2003:<br>
1. New data:<br>
1.1 Additional SALK T-DNA insertion data:<br>
<p>
An additional 24,945 T-DNA insertion sequences were received from the Salk
Institute. The SALK T-DNA data are searchable from the TAIR <a href="/servlets/Search?action=new_search&type=polyallele">Polymorphism Search</a>.<br>
They were also added to the "Insertion Flank Sequences" dataset so that
you can find out whether your sequence has a SALK T-DNA insertion by using
the TAIR Blast, WU-Blast, Fasta, and PatternMatch tools. This new data set
will soon be viewable in the SeqViewer T-DNA band.
<p>
1.2 Two new gene sets are listed under the Arabidopsis <a href="/info/2010_projects/index.jsp">Functional Genomics Projects</a><br>

*  Subcellular localization of 798 unknown proteins by GFP tagging is
being carried out by Citovsky and colleagues.<p>
*  Three-dimentional protein structure of 714 genes is being solved by
X-ray
crystallography by Markley, Phillips, and colleagues.<p>

Currently, 19,562 unique genes are included in the functional genomics
projects. You can query or browse to find out what types of functional
genomics efforts are being carried out on your favorite genes.
<p>
2. Updated data:<br>
2.1 SNPs from the Stanford Genome Center (SGCSNP) re-mapped
All of the 8612 SGCSNPs were re-mapped to the chromosomes using longer
flanking sequences for more precise location.
<p>
In addition, 2186 new SGCSNPs were added.
<P>
The SGCSNPs are searchable under <a href="/servlets/Search?action=new_search&type=polyallele">polymorphism/allele search</a> and are displayed in the SeqViewer.
<p>
3. New tools/features:<br>
3.1 <a href="/servlets/Search?type=protein&action=new_search">Protein search</a><br>
This new protein search page allows you to search proteins by gene name,
protein domain name, molecular weight, and chromosome location, among
others. If you want to search for protein information in a batch mode
using a list of locus names, please use our <a href="/tools/bulk/protein/index.jsp">Bulk protein search</a> tool
<p>
4. Updated tools/features:<br>
4.1 Advanced search<br>
AGI clone (any BAC clone that was sequences and used in the assembly of
the AGI map) was added as an option for the 'Range' field of the Restrict
by map location bands found on the Advanced search pages. This allows you
to search, for an example, all genes between two BAC clones on the AGI
map. To do so, in the "Restrict by map location" band of the <a href="/servlets/Search?action=new_search&type=gene">advanced gene search</a> page choose AGI as map type, put the two BAC names in the range fields and
specify them as AGI clone.
<p>
4.2 <a href="">AraCyc</a><br>
AraCyc is now powered by the Pathway Tools <a href="http://biocyc.org/release-notes.shtml">7.0 release</a>. The 7.0 release supports more
powerful querying and more sophisticated viewing of microarray expression
data.
<p>
Query:    In addition to querying a single object type such as pathway,
protein, reaction, compound, or gene by name, you can now query all of
these object types at once. For example, query 'all' with name 'acetate'
will return pathways, proteins, reactions, compounds and genes that have a
name match to the string 'acetate'. You can also query proteins that
catalyze a specific reaction by the EC number of that reaction. For
example, query 'protein' with EC 1.2.3.4 will return all the protein
entries catalyze this reaction. In addition, you can enter multiple
queries separated by a coma. For example, query 'reaction' with EC
'1.2.3.4, 1.2.3.1'.
<p>
Expression viewer:    In addition to overlaying expression values from a
single microarray experiment on the metabolic pathway overview map, you
can now display results from time course experiments using the new
animation feature. You can also define the color scales used by the
viewer.
<p>
************************************************************************<br>
Note: if you prefer not to receive future email updates from us, please
log in to your TAIR account and update your profile by unchecking the
'Email me monthly TAIR release notes' check box.
<p>
To view previous monthly news releases, go to<a href="/doc/news/breaking_news/140">
http://arabidopsis.org/news/news.html</a>
<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team <br>
<a href="/index.jsp"></a>	
	<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
