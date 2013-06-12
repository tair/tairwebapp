<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("0") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
		
		<!-- Content goes here //--> 

<span class="header">IMPORTANT MESSAGE FROM DAVID MEINKE, CURATOR OF MUTANT GENE SYMBOLS AND THE CLASSICAL GENETIC MAP:</span>
<P>
Dear Colleagues:<br>
<p>
I need your help to update the list of mutant gene symbols and replace the classical genetic map of Arabidopsis with a sequence-based map of genes with mutant phenotypes.<br>    
<p>
Please read and respond to this message before July 31, 2002.  Your help is needed to provide accurate and current information to the Arabidopsis community.<br>
<P>
I have posted here three different spreadsheets that need your immediate attention:<br>
<BLOCKQUOTE>
<b>1. The current list of mutant gene symbols from http://mutant.lse.okstate.edu.</b><br>
<p>  
Because of technical problems with our computer server, we have
temporarily placed a copy of this list at TAIR.  If you are using a
MUTANT gene symbol that is NOT included on this list, CONFLICTS with
an identical symbol on this list, or has been DISCONTINUED, please
send your additions, corrections, and/or deletions to: <a
href="mailto:Meinke@okstate.edu">Meinke@okstate.edu</a>.  Include gene
symbol, full name of gene symbol, and reference laboratory.<br>
 [<a href="/news/TAIR_List_of_Mutant_Gene_Symbols.xls">MS Excel</a>] [<a
href="/news/symbol.txt">text</a>]

<p>
<b>2. A list of loci on the classical genetic map published in Science [282: 663 (1998)] that appear to have NOT yet been cloned.</b><br> 
<p> 
Please check this list and let me know if you find any genes included that HAVE been cloned and should therefore be REMOVED from the list.  I have provided this list to help clarify the current status of genes listed on the classical genetic map.<br>     
[<a href="/news/TAIR_Classical_Genes_Not_Cloned.xls">MS Excel</a>] [<a href="/news/notcloned.txt">text</a>]
<p>
<b>3. A comprehensive list of CLONED genes with known AGI numbers that give a phenotype when disrupted by mutation.</b><br>
<p>  
Evidence of gene cloning was obtained by searching TAIR, GenBank, PubMed, research publications, web sites, and posters presented at Seville.  This list will be used to construct a sequence-based map of genes with mutant phenotypes.  AGI numbers and additional information for each gene will be available when the map is constructed.  Send examples of CLONED genes with MUTANT phenotypes that should be ADDED to this list to: <a href="mailto:Meinke@okstate.edu">Meinke@okstate.edu</a>.  You do not need to repeat genes that you found could be removed from the other spreadsheet.<br>   
[<a href="/news/TAIR_List_of_Cloned_Mutant_Genes.xls">MS Excel</a>] [<a href="/news/cloned.txt">text</a>]
<p>
Please provide the following information for genes that need to be added to the list:  AGI number (AtNgXXXXX), gene symbol, full name of gene symbol, method of gene identification (e.g. positional cloning; T-DNA tagging), reference lab, and a brief phrase describing the mutant phenotype and predicted protein function.  Or you can refer me to the appropriate publication.
<p>
Please remember that these genes should give a MUTANT PHENOTYPE when disrupted by mutation.  Genes that give a phenotype only when switched on through activation tagging or over-expression of transgenes should NOT be included.
<p>
You are also encouraged to send examples of additional alias names that refer to allelic mutants.
<p>
</BLOCKQUOTE>
<font color="red">I NEED YOUR RESPONSES BY THE END OF JULY IN ORDER TO INCLUDE THEM ON THE INITIAL VERSION OF THE MAP.</font>
<p>
Thanks in advance for any help you can provide.
<p>
Regards,
<p>
David Meinke (<a href="mailto:Meinke@okstate.edu">Meinke@okstate.edu</a>)




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
