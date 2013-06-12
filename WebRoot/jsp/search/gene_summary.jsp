<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.search.*, org.tair.utilities.*, java.util.*, org.tair.search.GeneSummary, org.tair.search.GeneSearcher"%>

<%!
String pageName = "Gene Search Results";
String highlight = "1";
%>


<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
Map searchParams = (Map) request.getAttribute( "searchParams" );
Vector gene_vector = (Vector) searchCollection.getResults();
// returns distinct number of genes in the results set; used for download all
int resultSize = searchCollection.getSecondaryResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
String query_id = (String) request.getAttribute( "query_id" );

// each element of search results is a Vector representing all genes associated with a locus
Vector locus_gene_vector = null; 

// each element of locus_gene_vector is a GeneSummary
GeneSummary gene = null;      

String searchedKeyword = null;

if ( searchParams != null ) {
   searchedKeyword = (String) searchParams.get("keyword_term");
}

%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<SCRIPT LANGUAGE="JavaScript">
<!-- 
function mySubmit( page_number, action, size, query_id ) {
    document.gene_search_result.pageNum.value = page_number;
    document.gene_search_result.search_action.value = action;
    document.gene_search_result.size.value = size;
    document.gene_search_result.query_id.value = query_id;
    document.gene_search_result.submit();
}

function checkAll() {
      if ( document.gene_search_result.id.length >= 1 ) {
          for ( i = 0; i< document.gene_search_result.id.length; i++ ) {
              document.gene_search_result.id[ i ].checked = true;
          }
      } else {
          document.gene_search_result.id.checked = true;
      }
}

function unCheckAll(){
      if ( document.gene_search_result.id.length >= 1 ) {
          for ( i = 0; i < document.gene_search_result.id.length; i++ ) {
              document.gene_search_result.id[ i ].checked = false;
          }
      } else {
          document.gene_search_result.id.checked = false;
      }
 }


// -->
</SCRIPT>

<form action="<%=response.encodeURL("/servlets/Search")%>" name="gene_search_result" method="get">
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2"  bgcolor="#ffffff">
      <tr>
	<td>
	<input type="hidden" name="search_action" value="" />
	<input type="hidden" name="type" value="gene" />
	<input type="hidden" name="pageNum" value="" />
	<input type="hidden" name="size" value="25" />
    <input type="hidden" name="query_id" value="" />  
          <H1>TAIR Gene Search Results</H1>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
               <tr>
                <td align="center" width="33%" class="sm">
		 <input type="button" value="new search" onClick="mySubmit('1','new_search', 25)" ><BR>
                  new gene search
                </td>

             	<td align="center" width="33%" class="sm">
		   <input type="button" value="download all" onClick="mySubmit( 0, 'downloadAll', <%= resultSize %>, '<%= query_id %>' )" ><BR>
                       download all results
                </td>
                
                <td align="center" width="34%" class="sm">
		   <input type="button" value="download checked" onClick="mySubmit( 0, 'download', 25, '<%= query_id %>')" ><BR>
                       check the boxes below and download results
                </td>
            </tr></tr>
                <td>&nbsp;</td>
                <td align="center" width="33%" class="sm">
                <input type="button" value="get all sequences" onClick="mySubmit( 0, 'sendToSequenceDLAll', <%= resultSize %>, '<%= query_id %>')" >
                </td>
            
                <td align="center" width="34%" class="sm">
                <input type="button" value="get checked sequences" onClick="mySubmit( 0, 'sendToSequenceDL', 25, '<%= query_id %>' )" >
                </td>
            </tr>
            </table>
       </tr>

       <tr>
           <td>&nbsp;</td>
       </tr>

      <% if ( resultSize >  0 ){ %>
       <tr>
         <td>
            <%= EmptyTextConverter.convert( searchCriteria ) %>
            <p>
              Displaying <%= floor %> - <%= ceiling %>.
            <p>
              To see ESTs associated with your gene of interest, click on the Locus link.<br><br>
         </td>
       </tr>

      <% } else { %>
       <tr>
         <td>
            <%= EmptyTextConverter.convert( searchCriteria ) %>
            <p>
            Please consider the following as you modify your query and try again:<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- When searching for genes, you can check the 'include obsolete genes' box to see if the gene you are searching for has been obsoleted.<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- For a broader or narrower search make the appropriate selection from the name drop-down menu<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- If you are searching based upon location, check that the appropriate map type or valid range is entered.</font></P><br>
	 </td>
       </tr>
     <% } %>


     <% if ( resultSize > 0 ) { %>
         <tr valign="top" bgcolor="#F5F9FF">
           <td colspan="8"><input type="button" name="check7" value="Check All" onClick="checkAll()"><input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"></td>
        </tr>

	<tr>
	   <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ffffff">
              <tr  <%=myBgColor.toggleBgColor()%> > 
                    <td class="sm">&nbsp; </td>
                    <td class="sm" valign=top>Locus<br><%=DefinitionsLookup.createPopupLink("Locus","class")%></td>
                    <td class="sm" valign=top>Description<br><%=DefinitionsLookup.createPopupLink("Gene","summary")%></td>
                    <td class="sm" valign=top>Gene<br>Model(s)<br><%=DefinitionsLookup.createPopupLink("Gene","name")%></td>
                    <td class="sm" valign=top>Other Names<br><%=DefinitionsLookup.createPopupLink("GeneAlias", "alias_type")%></td>
                    <td class="sm" valign=top align="center">Keywords<%=DefinitionsLookup.createPopupLink("Keyword","class")%></td>
              </tr>

           <%  
              Iterator locusIter = gene_vector.iterator();
              String bgColor = null;
              boolean first = true;
              
              String descriptionText = "";
              int descriptionMaxLength = 125;
              
              int numGeneModels;

	      Map locusKeywordMap = GeneSearcher.makeLocusKeywordMap(gene_vector, "GO");
              
              while ( locusIter.hasNext() ) {
                  locus_gene_vector = (Vector) locusIter.next();
                  numGeneModels = locus_gene_vector.size();
                  bgColor = myBgColor.toggleBgColor();
                  Iterator geneIter = locus_gene_vector.iterator();
                  first = true;
                  
                  while ( geneIter.hasNext() ) {
                      // Get next gene
                      gene = (GeneSummary) geneIter.next();



	              if ( searchedKeyword == null ) {
	                  searchedKeyword = gene.getSearchString();
	              }
                      
                      // Get desription text (only if first gene)
                      if ( first ) {
                          
                          descriptionText = EmptyTextConverter.convert( gene.get_description() );
                          
                          // Limit length of description
                          if (descriptionText.length() > descriptionMaxLength){
                              descriptionText = descriptionText.substring(0,descriptionMaxLength);
                              descriptionText = descriptionText + "....";
                          }
                      }
                      // Don't display description if not first
                      else{
                          descriptionText = "";
                      }
           %>

            <% if ( first ) { %>
               <tr <%= bgColor %> valign="top">
                <td class="sm" align="left"><%= floor++ %><input type="checkbox" name="id" value="<%= gene.get_locus_id() %>"></td>
                <td class="sm"><A href="/servlets/TairObject?id=<%= gene.get_locus_id() %>&type=locus"><%= gene.get_locus() %></A> <%= gene.getLocusObsoleteLabel() %>&nbsp;</td>
                <% if ( numGeneModels == 1) { %>
                    <td class="sm"><%= descriptionText %>&nbsp;</td>
                <% } else { %>
                    <td class="sm" rowspan=<%= numGeneModels %>><%= descriptionText %>&nbsp;</td>
                <% } %>
                   
           <% } else { %>
               <tr <%= bgColor %> valign="top">
                <td class="sm" align="left">&nbsp;</td>
                <td class="sm">&nbsp;</td>
            <% } %>

                <td class="sm"><A href="/servlets/TairObject?id=<%= gene.get_gene_id() %>&type=gene"><%= gene.get_name() %></A> <%= gene.getObsoleteLabel() %>&nbsp;</td>
                <td class="sm"><%= EmptyTextConverter.convert( gene.get_other_name_table() ) %>&nbsp;</td>
            
	    <% if ( first ) { %>
                <td class="sm" wrap align="left"><%=GeneSummary.makeHighlightedKeywordList((Collection)locusKeywordMap.get(gene.get_locus_id().toString()) ,  searchedKeyword, ", ", true, "nots_in_back")%>&nbsp;</td>
	    <% } else { %>
                <td class="sm">&nbsp;</td>
	    <% } %>

            </tr>
                <% first = false; %>
         <% } %>
    <% } %>
	</table>
    </td>
   </tr>

   <% if ( scrollLinks != null ) { %>
    <tr>
      <td class="sm" align="center"><%= scrollLinks %></td>
    </tr>
   <% } %>
<% } %>

</table>
</form>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
