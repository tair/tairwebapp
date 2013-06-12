<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*, org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*,org.tair.abrc.stock.*, org.tair.search.* "
%>

<%!
String pageName = "Germplasm / Stock Detail";
%>


<%
GermplasmDetailLite details = 
   (GermplasmDetailLite) request.getAttribute( "detail" );

String hiddenReq = request.getParameter( "hideNote" );
boolean hidden = ( hiddenReq != null && hiddenReq.equals( "true" ) );

String showAllReq = request.getParameter( "showAllNote" );
boolean showAll = ( showAllReq != null && showAllReq.equals( "true" ) );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<%@ include file="/jsp/includes/order_functions.jsp" %>


<table width="100%" border="0" colspan="2" cellspacing="0" >
    <TR <%=myBgColor.toggleBgColor() %> >
        <TD colspan="3"><b><font size="+1"><%= details.name %></font></b>
	</TD>
    </TR>

<!-- Stock information -->

<% Map stockInfo = details.stockInfo; %>
<% if ( (Boolean) stockInfo.get("has_stock") ) { %>

 <TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" align="left" valign="top">Stock Information<%= DefinitionsLookup.createPopupLink("Glossary","stock information") %></TH>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm">

<%

Boolean has_availability_type = (Boolean) stockInfo.get("has_availability_type");
Boolean has_availability_comment = (Boolean) stockInfo.get("has_availability_comment");
Boolean has_donors = (Boolean) stockInfo.get("has_donors");
Boolean has_donor_stock_number = (Boolean) stockInfo.get("has_donor_stock_number");
TfcStock stock = (TfcStock) stockInfo.get("stock");
%>

      <table width="100%" border="0" cellpadding="1">
            <TR align="left">
                <td class="sm" align="left" valign="top"> 
                    <br>
                    <form action="/servlets/Order/current" method="POST"  onSubmit="orderFormWindow( this )">
                    <input type="hidden" name="state" value="addStock">
                    <% if ( has_availability_type != null && (has_availability_type && DataConstants.getAvailableStock().equals(
                        ((TfcStockAvailabilityType)stockInfo.get("availability_type")).get_stock_availability_type() ) ) ) { %>
                        <input type="submit" name="submit" value="Order from ABRC" />
                        <br>
                        <br>
                    <% }  %>
                        <input type="button" value="View Order History" onClick="document.location.href='/servlets/Order?state=search&mode=stock&stock_numbers=<%=stock.get_name()%>'" />
                        <input type="hidden" name="stock_number" value="<%= stock.get_name() %>" />
                        </form>
                </td>
                <td class="sm" align="left"><table><th>
            <TR align="left" >
                <TH class="sm" align="left">&nbsp;</TH>
<% if (has_availability_type != null && has_availability_type) { %>
                <TH class="sm" align="left">&nbsp;</TH>
                <TH class="sm" align="left">Availability<%= DefinitionsLookup.createPopupLink("StockAvailabilityType","stock_availability_type") %></TH>
<% } %>
<% if ( has_availability_comment != null && has_availability_comment) { %>
                <TH class="sm" align="left">&nbsp;</TH>
                <TH class="sm" align="left">Availability Comment</TH>
<% } %>
<% if ( has_donors != null && has_donors) { %>
                <TH class="sm" align="left">&nbsp;</TH>
                <TH class="sm" align="left">Donor</TH>
<% } %>
<% if (has_donor_stock_number != null && has_donor_stock_number) { %>
                <TH class="sm" align="left">&nbsp;</TH>
                <TH class="sm" align="left">Donor Stock #</TH>
<% } %>
             </TR>
         <TR align="left" >
             <TD class="sm" align="left" valign="top" >
	       &nbsp;
             </TD>

<% if (has_availability_type != null && has_availability_type) { %>
             <TD class="sm" align="left">&nbsp;</TD>
             <TD class="sm" align="left" valign="top"><%= EmptyTextConverter.convert(
							  ((TfcStockAvailabilityType)stockInfo.get("availability_type")).get_stock_availability_type() ) %></TD>
<% } %>
<% if (has_availability_comment != null && has_availability_comment) { %>
             <TD class="sm" align="left">&nbsp;</TD>
             <TD class="sm" align="left" valign="top"><%= EmptyTextConverter.convert((String) stockInfo.get("availability_comment")) %></TD>
<% } %>
<% if (has_donors != null && has_donors) { %>
             <TD class="sm" align="left">&nbsp;</TD>

	     <%
		List<Map<String,Object>> donors = (List<Map<String,Object>>) stockInfo.get("donors");
		boolean firstDonor = true;
                for (Map<String,Object> donor : donors) {
             %>

             <!-- skip preceding columns if showing multiple donors -->
               <% if ( !firstDonor ) { %>
                   <tr>
                     <td class="sm" valign="top" colspan="<%= has_availability_comment ? 6 : 4 %>">&nbsp;</td>
               <% } %>
	       
                     <td class="sm" valign="top"><a href="/servlets/TairObject?type=<%= donor.get("community_type") %>&id=<%= donor.get("community_id") %>"><%= donor.get("name") %></a></td>
                     <td class="sm" align="left" valign="top">&nbsp;</TD>
		     <% if (firstDonor && !TextConverter.isEmpty((String) donor.get("donor_stock_number"))) { %>
                       <td class="sm" valign="top"><%= donor.get("donor_stock_number") %></td>
		     <% } %>
                   </tr>
                     <% firstDonor = false; %>
             <% } %>
<% } // end has_donor %>

     </TR>
    </table></td></tr>
     </table>
     </TD>
</TR>
<% } else { %>
<TR <%= myBgColor.toggleBgColor() %> > 
  <TH class="sm" align="left" valign="top">Stock Information<%= DefinitionsLookup.createPopupLink("Glossary","stock information") %></TH>    
  <TD class="sm">&nbsp;</TD>
  <TD class="sm"> Not donated to ABRC, please contact an author of publication(s) describing this line. </TD>
</TR>

<% } %>
 <!-- aliases -->
 <% Map otherNameInfo = details.otherNameInfo; %>
      <% if ( (Boolean) otherNameInfo.get("has_other_names") ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
	<th  align="left" class="sm">Other Names <!--<%= DefinitionsLookup.createPopupLink("Alias", "class") %> (NOTE: need to update or remove link) --></th>
	<TD class="sm">&nbsp;</TD>
	<TD class="sm">
	  <table width="100%" border="0" cellpadding="1">

        <% 
	   List<Map<String,Object>> other_names = (List<Map<String,Object>>) otherNameInfo.get("other_names");
	   for (Map<String,Object> other_name : other_names) {
        %>
            <tr>
              <td class="sm"><%= other_name.get("original_alias") %></td>
              <td class="sm" nowrap>&nbsp; &nbsp;</td>

              <td class="sm"><%= EmptyTextConverter.convert( (String) other_name.get("note") ) %></td>
            </tr>
        <% } %>
            
          </table>
        </td>
      </tr>
      <% } %>


 <!-- taxon -->
 <% Map taxonInfo = details.taxonInfo; %>
 <% if ( (Boolean) taxonInfo.get("has_taxon") ) { %>
    <TR <%=myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">Taxon<%= DefinitionsLookup.createPopupLink("Taxon","class") %></TH>
     <TD class="sm">&nbsp;&nbsp;</TD>
     <TD class="sm"><%= EmptyTextConverter.convert((String) ((Map<String,Object>)taxonInfo.get("taxon")).get("scientific_name") ) %></TD>
    </TR>
 <% } %>



<!--link to species variant-->
<% Map accessionInfo = details.accessionInfo; %>
<%  if ((Boolean) accessionInfo.get("has_accession")) { %>
<% Map<String,Boolean> headerInfo = (Map<String,Boolean>) accessionInfo.get("header_info"); 
   Map<String,String> accession = (Map<String,String>) accessionInfo.get("accession"); %>
  <TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">Accession</TH>
     <TD class="sm">&nbsp;&nbsp;</TD>
     <TD>
       <table width="100%" border="0" cellpadding="1">
         <TR align="left" valign="top">
<%
   if (headerInfo.get("has_original_name")) {
%>
           <TH class="sm" align="left" valign="top">Name</TH>
<% } %>
<%
   if (headerInfo.get("has_abbrev_name")) {
%>
           <TH class="sm" align="left" valign="top">Abbreviated Name</TH>
<% } %>
<%
   if (headerInfo.get("has_country")) {
%>
           <TH class="sm" align="left" valign="top">Country</TH>
<% } %>
<%
   if (headerInfo.get("has_location")) {
%>
           <TH class="sm" align="left" valign="top">Location</TH>	      
<% } %>
<%
   if (headerInfo.get("has_habitat")) {
%>
           <TH class="sm" align="left" valign="top">Habitat</TH>
<% } %>
         </TR>
	 <TR>

<%
   if (!TextConverter.isEmpty((String)accession.get("original_name"))) {
%>
	   <TD class="sm" align="left" valign="top">
	     <A href="/servlets/TairObject?type=species_variant&id=<%= accession.get("species_variant_id") %>"><%= accession.get("original_name") %></A>
	   </TD>
<% } %>
<%
   if (!TextConverter.isEmpty((String)accession.get("abbrev_name"))) {
%>
	   <TD class="sm" align="left" valign="top"><%= EmptyTextConverter.convert( (String) accession.get("abbrev_name") )%></TD>
<% } %>
<%
   if (!TextConverter.isEmpty((String)accession.get("country"))) {
%>
	   <TD class="sm" align="left" valign="top"><%= EmptyTextConverter.convert( (String) accession.get("country") )%></TD>
<% } %>
<%
   if (!TextConverter.isEmpty((String)accession.get("location"))) {
%>
	   <TD class="sm" align="left" valign="top"><%= EmptyTextConverter.convert( (String) accession.get("location") )%></TD>
<% } %>
<%
   if (!TextConverter.isEmpty((String)accession.get("habitat"))) {
%>
	   <TD class="sm" align="left" valign="top"><%= EmptyTextConverter.convert( (String) accession.get("habitat") )%></TD>
<% } %>
	 </TR>
       </table>
     </td>
  </TR>
<% } %>
<!-- Pedigree -->
<% Map parentInfo = details.parentInfo;
   Map progenyInfo = details.progenyInfo; %>
<% if ( (Boolean)parentInfo.get("has_parents") || (Boolean)progenyInfo.get("has_progeny") ) { %>
<TR <%= myBgColor.toggleBgColor() %> >
<%
   Map<String,Boolean> fheader = new HashMap<String,Boolean>();
   fheader.put("has_germplasm_id", Boolean.FALSE);
   fheader.put("has_tair_object_id", Boolean.FALSE);
   fheader.put("has_name", Boolean.FALSE);
   fheader.put("has_parent_gender", Boolean.FALSE);
   fheader.put("has_generation", Boolean.FALSE);
   fheader.put("has_generative_method", Boolean.FALSE);
   fheader.put("has_locus_associations", Boolean.FALSE);
   fheader.put("has_backgrounds", Boolean.FALSE);

   Map<String,Boolean> parentHeader = parentInfo.get("header_info")  != null ? (Map<String,Boolean>) parentInfo.get("header_info") : fheader;
   Map<String,Boolean> progenyHeader = progenyInfo.get("header_info")  != null ? (Map<String,Boolean>) progenyInfo.get("header_info") : fheader;

%>

     <TH class="sm" align="left" valign="top">Pedigree<%= DefinitionsLookup.createPopupLink("Pedigree","class") %></TH>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm">

      <table width="100%" border="0" cellpadding="1">


          <!-- only show generation, generative method and parent gender columns if
               there is at least one row of data display -->
          <%
             boolean parentGenderColumn = parentHeader.get("has_parent_gender") || progenyHeader.get("has_parent_gender");
             boolean generationColumn = parentHeader.get("has_generation") || progenyHeader.get("has_generation");
             boolean generativeMethodColumn = parentHeader.get("has_generative_method") || progenyHeader.get("has_generative_method");
	     boolean backgroundColumn = parentHeader.get("has_backgrounds") || progenyHeader.get("has_backgrounds");
	     boolean locusAssociationsColumn = parentHeader.get("has_locus_associations") || progenyHeader.get("has_locus_associations");
          %>

          <% if ( (Boolean)parentInfo.get("has_parents") ) { %>

            <TR align="left" valign="bottom">
                <TH class="sm" align="left" valign="top">Parent Line<%= DefinitionsLookup.createPopupLink("Pedigree","parent_germplasm_id") %></TH>

		<% if ( backgroundColumn ) { %>
		<th class="sm" align="left" valign="top">Background</th>
		<% } %>

               <% if ( parentGenderColumn ) { %>
                <TH class="sm" align="left" valign="top">Parent<br>Gender</TH>
               <% } %>

               <% if ( generationColumn ) { %>
                <TH class="sm" align="left" valign="top">Generation</TH>
               <% } %>

               <% if ( generativeMethodColumn ) { %>
                <TH class="sm" align="left" valign="top">Generative<br>Method</TH>
               <% } %>

               <% if ( locusAssociationsColumn ) { %>
                <TH class="sm" align="left" valign="top">Parent<br>Locus Associations</TH>
               <% } %>

            </TR>

            <% List<Map<String,Object>> parents = (List<Map<String,Object>>)parentInfo.get("parents");
	       for (int i = 0, size = parents.size(); i < GermplasmDetailLite.PARENT_LIMIT && i < size; i++) { 
	           Map<String,Object> parent = parents.get(i);
	    %>

                    <TR align="left" valign="top">
                        <TD class="sm" align="left"><A href="/servlets/TairObject?id=<%= parent.get("tair_object_id") %>&type=germplasm"><%= parent.get("name") %></A></TD>

			<% if ( backgroundColumn ) { %>
			<td class="sm" align="left">
			  <% if ( (Boolean) parent.get("has_backgrounds") ) { 
			     List<Map<String,Object>> backgrounds = (List<Map<String,Object>>) parent.get("backgrounds");
			     String baseName = null; 
			     String speciesVariantID = null;
			     for (Map<String,Object> background : backgrounds) {
                                 baseName = (String) background.get("abbrev_name");
                                 speciesVariantID = (String) background.get("species_variant_id");
			     %>
                          <a href="/servlets/TairObject?type=species_variant&id=<%= speciesVariantID %>"><%= baseName %></a>
			    <% } %>
			  <% } %>
			    &nbsp;
			</td>
		       <% } %>

                     <% if ( parentGenderColumn ) { %>
                        <TD class="sm" align="left"><%= EmptyTextConverter.convert( (String) parent.get("parent_gender") ) %></TD>
                     <% } %>

                     <% if ( generationColumn ) { %>
                        <TD class="sm" align="left"><%= EmptyTextConverter.convert( (String) parent.get("generation") ) %></TD>
                     <% } %>

                     <% if ( generativeMethodColumn ) { %>
                        <TD class="sm" align="left"><%= EmptyTextConverter.convert( (String) parent.get("generative_method") ) %></TD>
                     <% } %>

		     <% if ( locusAssociationsColumn ) { %>
                        <TD class="sm" align="left">
                            <% if ( (Boolean) parent.get("has_locus_associations") ) {
			           List<Map<String,Object>> loci = (List<Map<String,Object>>) parent.get("locus_associations");
                                   boolean firstLocus = true;
			           for (Map<String,Object> locus : loci) {
                                       if ( !firstLocus ) {
                                           out.write( "<br>" );
                                       }
                                       firstLocus = false;
                            %>
                                       <a href="/servlets/TairObject?type=locus&id=<%= locus.get("locus_id") %>"><%= locus.get("name") %></a>
                                 <% } %>
                            <% } %>
                        </TD>
		      <% } // locusAssociationsColumn %> 
                    </TR>
              <% } // for parents%>

          <% } // has parents %>

          <% if ( (Boolean)progenyInfo.get("has_progeny")  ) { %>
	  <% int progenyCount = ((Integer) progenyInfo.get("count")).intValue(); %>

            <!-- add spacer row if both parents and children present -->
            <% if ( (Boolean)parentInfo.get("has_parents") ) { %>
             <TR>
                <TD colspan="5">&nbsp;</TD>
             </TR>
            <% } %>

            <TR align="left" valign="bottom">
                <TH class="sm" align="left">Progeny Line(s) <!--<%= DefinitionsLookup.createPopupLink( "Pedigree","child_germplasm_id" ) %>(NOTE)--></TH>


		<% if ( backgroundColumn ) { %>
		<th class="sm" align="left" valign="top">Background</th>
		<% } %>

               <% if ( parentGenderColumn ) { %>
                <TH class="sm" align="left" valign="top">Parent<br>Gender</TH>
               <% } %>

               <% if ( generationColumn ) { %>
                <TH class="sm" align="left" valign="top">Generation</TH>
               <% } %>

               <% if ( generativeMethodColumn ) { %>
                <TH class="sm" align="left" valign="top">Generative<br>Method</TH>
               <% } %>

               <% if ( locusAssociationsColumn ) { %>
                <TH class="sm" align="left">Progeny<br>Locus Associations</TH>
		<% } %>

            </TR>


            <% List<Map<String,Object>> progeny = (List<Map<String,Object>>)progenyInfo.get("progeny");
	       for (int i = 0, size = progeny.size(); i < GermplasmDetailLite.PROGENY_LIMIT && i < size; i++) { 
	           Map<String,Object> p = progeny.get(i);
	    %>

                    <TR align="left" valign="top">
                        <TD class="sm" align="left"><A href="/servlets/TairObject?id=<%= p.get("tair_object_id") %>&type=germplasm"><%= p.get("name") %></A></TD>

			<% if ( backgroundColumn ) { %>
			<td class="sm" align="left">
			  <% if ( (Boolean) p.get("has_backgrounds") ) { 
			     List<Map<String,Object>> backgrounds = (List<Map<String,Object>>) p.get("backgrounds");
			     String baseName = null; 
			     String speciesVariantID = null;
			     for (Map<String,Object> background : backgrounds) {
                                 baseName = (String) background.get("abbrev_name");
                                 speciesVariantID = (String) background.get("species_variant_id");
			     %>
                          <a href="/servlets/TairObject?type=species_variant&id=<%= speciesVariantID %>"><%= baseName %></a>
			  <% } %>
			  <% } %>
			    &nbsp;
			</td>
			<% } %>


                     <% if ( parentGenderColumn ) { %>
                        <TD class="sm" align="left"><%= EmptyTextConverter.convert( (String) p.get("parent_gender") ) %></TD>
                     <% } %>

                     <% if ( generationColumn ) { %>
                        <TD class="sm" align="left"><%= EmptyTextConverter.convert( (String) p.get("generation") ) %></TD>
                     <% } %>

                     <% if ( generativeMethodColumn ) { %>
                        <TD class="sm" align="left"><%= EmptyTextConverter.convert( (String) p.get("generative_method") ) %></TD>
                     <% } %>



		     <% if ( locusAssociationsColumn ) { %>
                        <TD class="sm" align="left">
                            <% if ( (Boolean) p.get("has_locus_associations") ) {
			           List<Map<String,Object>> loci = (List<Map<String,Object>>) p.get("locus_associations");
                                   boolean firstLocus = true;
			           for (Map<String,Object> locus : loci) {
                                       if ( !firstLocus ) {
                                           out.write( "<br>" );
                                       }
                                       firstLocus = false;
                            %>
                                       <a href="/servlets/TairObject?type=locus&id=<%= locus.get("locus_id") %>"><%= locus.get("name") %></a>
                                 <% } %>
                            <% } %>
                        </TD>
		      <% } // locusAssociationsColumn %> 



              <% } // for progeny %>


              <!-- if collection contains abbreviated list of children, give link to view full list -->
              <% if ( progenyCount >= GermplasmDetailLite.PROGENY_LIMIT ) { %>
                <TR>
                   <TD colspan="5" class="sm">
                    <br>
                    <a href="/servlets/Search?type=germplasm&search_action=search&parent_germplasm_id=<%= details.germplasm.get_germplasm_id() %>&parent_germplasm_name=<%= URLEncoder.encode( details.germplasm.get_name() ) %>">View Complete List</a>
                    &nbsp;
                    (<%= GermplasmDetailLite.PROGENY_LIMIT %> of <%= progenyCount %> displayed)
                </TR>
              <% } %>

          <% } // has progeny %>

       </table>
    </TD>
</TR>
<% } %>
<!--Chromosomal constitution-->
<TR <%=myBgColor.toggleBgColor() %> >
  <TH class="sm" valign="top" align="left">Chromosomal Constitution</TH>
  <TD class="sm">&nbsp;</TD>
  <TD class="sm">
      <table width="100%" border="0" cellpadding="0">
             <TR align=left>
	       <% if (!EmptyTextConverter.convert(details.germplasm.get_ploidy()).equals("")) { %>
                <TH class="sm">Ploidy<%= DefinitionsLookup.createPopupLink("Germplasm","ploidy") %></TH>
                <TH class="sm" align="left">&nbsp;</TH>
	       <% } %>
	       <% if (!EmptyTextConverter.convert(details.germplasm.get_is_aneuploid()).equals("")) { %>
                <TH class="sm">Is Aneuploid<%= DefinitionsLookup.createPopupLink("Germplasm","is_aneuploid") %></TH>
                <% if( EmptyTextConverter.convert(details.germplasm.get_is_aneuploid()).equals("yes") ){  %>
                <TH class="sm" align="left">&nbsp;</TH>
                <TH class="sm">Variant Chromosome</TH>
                <% } %>
	       <% } %>
             </TR>
             <TR align=left>
	       <% if (!EmptyTextConverter.convert(details.germplasm.get_ploidy()).equals("")) { %>
                <TD class="sm"><%= EmptyTextConverter.convert(details.germplasm.get_ploidy()) %></TD>
                <TD class="sm" align="left">&nbsp;</TD>
	       <% } %>
	       <% if (!EmptyTextConverter.convert(details.germplasm.get_is_aneuploid()).equals("")) { %>
                <TD class="sm"> <%= EmptyTextConverter.convert(details.germplasm.get_is_aneuploid()) %> </TD>
                <% if( EmptyTextConverter.convert(details.germplasm.get_is_aneuploid()).equals("yes") ){  %>
                <TD class="sm" align="left">&nbsp;</TD>
                <TD class="sm"><%= EmptyTextConverter.convert(details.germplasm.get_aneuploid_chromosome()) %></TD>
                <% } %>
	       <% } %>
             </TR>
       </table>
  </TD>
</TR>


<!-- polymorphism NEW -->
<% Map polymorphismInfo = details.polymorphismInfo; %>
<% if ( (Boolean) polymorphismInfo.get("has_polymorphisms") ) { %>
  <TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">Associated Polymorphisms<%= DefinitionsLookup.createPopupLink("Glossary","associated polymorphisms") %></TH>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm">
<%
  Map<String,Boolean> headerInfo = (Map<String,Boolean>) polymorphismInfo.get("header_info");

   Boolean has_name = (Boolean) headerInfo.get("has_name");
   Boolean has_locus_names = (Boolean) headerInfo.get("has_loci");
   Boolean has_gene_names = (Boolean) headerInfo.get("has_genes");
   Boolean has_genotype = (Boolean) headerInfo.get("has_genotype");
   Boolean has_mutagen = (Boolean) headerInfo.get("has_mutagen");
   Boolean has_inheritance = (Boolean) headerInfo.get("has_inheritance");
%>

       <table border=0>
         <TR  align="left">
<% if ( has_name != null && has_name.booleanValue() ) { %>
             <TH class="sm">Name<%= DefinitionsLookup.createPopupLink("Polymorphism","name") %></TH>
             <TH class="sm">&nbsp; </TH>
<% } %>
<% if ( has_locus_names != null && has_locus_names.booleanValue() ) { %>
             <TH class="sm">Locus<%= DefinitionsLookup.createPopupLink("Locus","class") %></TH>
             <TH class="sm">&nbsp; </TH>
<% } %>
<% if ( has_gene_names != null && has_gene_names.booleanValue() ) { %>
             <th class="sm">Gene Name(s)<br>and/or Equivalents</th>
             <TH class="sm">&nbsp; </TH>
<% } %>
<% if ( has_genotype != null && has_genotype.booleanValue() ) { %>
             <TH class="sm">Genotype</TH>
             <TH class="sm">&nbsp; </TH>
<% } %>
<% if ( has_mutagen != null && has_mutagen.booleanValue() ) { %>
             <TH class="sm">Allele Mutagen<%= DefinitionsLookup.createPopupLink("Polymorphism","mutagen") %></TH>
             <TH class="sm">&nbsp; </TH>
<% } %>
<% if ( has_inheritance != null && has_inheritance.booleanValue() ) { %>
             <TH class="sm">Inheritance<%= DefinitionsLookup.createPopupLink("Polymorphism","inheritance") %></TH>
<% } %>

         </TR>

         <% 
	    List<Map<String,Object>> polymorphisms = 
	         (List<Map<String,Object>>) polymorphismInfo.get("polymorphisms");

             for (Map<String,Object> poly : polymorphisms) {
         %>

         <TR valign="top">
<% if ( has_name != null && has_name.booleanValue() ) { %>
           <TD class="sm"><A href="/servlets/TairObject?id=<%= poly.get("polymorphism_id") %>&type=polyallele">
	       <%=  EmptyTextConverter.convert( (String) poly.get("name")) %></A></TD>
           <TD class="sm">&nbsp;</TD>
<% } %>
<% if ( has_locus_names != null && has_locus_names.booleanValue() ) { %>
           <TD class="sm">
                <% List<Map<String,Object>> loci = (List<Map<String,Object>>) poly.get("loci");
                   boolean firstLocus = true;
                   for ( Map<String,Object> locus : loci ) {
                       if ( !firstLocus ) {
                           out.write( "<br>" );
                       }
                       firstLocus = false;
                %>
                      <a href="/servlets/TairObject?type=locus&id=<%= locus.get("locus_id") %>"><%= locus.get("name") %></a>
                <% } %>
               &nbsp;
           </td>
           <TD class="sm">&nbsp; </TD>

<% } %>
<% if ( has_gene_names != null && has_gene_names.booleanValue() ) { %>
           <!-- display gene's using "full_name" symbol for each gene -->
           <td class="sm">
             <% List<Map<String,Object>> genes = (List<Map<String,Object>>) poly.get("genes");
                boolean firstGene = true;
                for ( Map<String,Object> gene : genes ) {
                    Set names = (Set) gene.get("names");
                    if ( !firstGene ) { out.write( ";" ); }
                    firstGene = false;
               %>
             <a href="/servlets/TairObject?type=gene&id=<%= gene.get("gene_id") %>"><%= org.tair.utilities.Utils.join(names, "/") %></a>
             <% } // end gene while %>
               &nbsp;
            </td>
            <TD class="sm">&nbsp;</TD>
<% } %>
<% if ( has_genotype != null && has_genotype.booleanValue() ) { %>
            <TD class="sm"><%= EmptyTextConverter.convert( (String) poly.get("genotype") )%></TD>
            <TD class="sm">&nbsp;</TD>
<% } %>
<% if ( has_mutagen != null && has_mutagen.booleanValue() ) { %>
            <TD class="sm"><%= EmptyTextConverter.convert( (String) poly.get("mutagen") )%></TD>
            <TD class="sm">&nbsp;</TD>
<% } %>
<% if ( has_inheritance != null && has_inheritance.booleanValue() ) { %>
            <TD class="sm"><%= EmptyTextConverter.convert( (String) poly.get("inheritance") ) %></TD>
<% } %>
         </TR>
     <% } %>


     </TABLE>
    </TD>
 </TR>
<% } %>
<!-- mutagen -->
 <% if ( details.germplasm.get_mutagen() != null ) { %>
    <TR <%=myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">Mutagen Applied to Strain<%= DefinitionsLookup.createPopupLink("Germplasm","mutagen") %></TH>
     <TD class="sm">&nbsp;&nbsp;</TD>
     <TD class="sm"><%= EmptyTextConverter.convert(details.germplasm.get_mutagen()) %></TD>
    </TR>
 <% } %>


<!--associated Constructs-->
<% Map associatedConstructInfo = details.associatedConstructInfo; %>
<% if ( associatedConstructInfo.get("has_associated_constructs") != null && (Boolean) associatedConstructInfo.get("has_associated_constructs") ) { %>
  <TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">Associated Constructs</TH>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm">

          <%
	     Map<String,Boolean> headerInfo = (Map<String,Boolean>) associatedConstructInfo.get("header_info");
             boolean locusNameColumn = headerInfo.get("has_loci");
             boolean constructTypeColumn = headerInfo.get("has_construct_type");
             boolean vectorNameColumn = headerInfo.get("has_vector");
	  %>

       <table>
         <TR  align="left">
             <TH class="sm">Clone Name<%= DefinitionsLookup.createPopupLink("Clone","name") %></TH>
             <TH class="sm">&nbsp; </TH>
	     <% if (locusNameColumn ) { %>
             <TH class="sm">Locus Name<%= DefinitionsLookup.createPopupLink("Locus","name") %></TH>
             <TH class="sm">&nbsp; </TH>
	     <% } %>
	     <% if (constructTypeColumn ) { %>
             <TH class="sm">Construct Type<%= DefinitionsLookup.createPopupLink("Clone","construct_type") %></TH>
             <TH class="sm">&nbsp; </TH>
	     <% } %>
	     <% if (vectorNameColumn ) { %>
             <TH class="sm">Vector Name<%= DefinitionsLookup.createPopupLink("Vector","name") %></TH>
	     <% }%>

         </TR>
        <%  List<Map<String,Object>> clones = (List<Map<String,Object>>) associatedConstructInfo.get("associated_constructs");
            for ( Map<String,Object> clone : clones ) {
        %>
         <TR>
            <TD class="sm" valign=top><A href="/servlets/TairObject?id=<%= clone.get("clone_id") %>&type=clone"><%=  clone.get("original_name") %></A></TD>
           <TD class="sm">&nbsp; </TD>
	   <% if (locusNameColumn ) { %>
           <TD class="sm">
               <% List<Map<String,Object>> loci = (List<Map<String,Object>>) clone.get("loci");
		  if ( loci.size() > 0 ) {
                     boolean first = true;
                     for ( Map<String,Object> locus : loci ) {
                %>
                       <a href="/servlets/TairObject?type=locus&id=<%= locus.get("locus_id") %>"><%= locus.get("name") %></a>
                       <% if ( !first ) { %>
                          <br>
                       <% } %>
                       <% first = false; %>
                    <% } %>
                <% } %>
                &nbsp;
            </TD>
           <TD class="sm">&nbsp; </TD>
	   <% } %>
	   <% if (constructTypeColumn ) { %>
           <TD class="sm" valign=top> <%=  EmptyTextConverter.convert((String) clone.get("construct_type")) %></TD>
           <TD class="sm">&nbsp; </TD>
	   <% } %>
	   <% if (vectorNameColumn ) { %>
           <TD class="sm" valign=top>
	     <% if (clone.get("has_vector") != null && (Boolean) clone.get("has_vector")) { %>
	       <% Map<String,Object> vector = (Map<String,Object>) clone.get("vector"); %>
	     <A href="/servlets/TairObject?type=vector&id=<%= clone.get("vector_id") %>">
                <%=  EmptyTextConverter.convert((String) vector.get("original_name") ) %></A>
	     <% } %>
	     &nbsp;
           </TD>
	   <% } %>
     </TR>
 <% } %>
     </TABLE></TD>
  </TR>
<% } %>


<!-- Phenotype(s) -->
<% Map phenotypeInfo = details.phenotypeInfo; %>
    <TR <%=myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">Phenotype<%= DefinitionsLookup.createPopupLink("Phenotype","class") %></TH>
     <TD class="sm">&nbsp;</TD>
<% if( (Boolean)phenotypeInfo.get("has_phenotypes") == null || !((Boolean)phenotypeInfo.get("has_phenotypes")) ) 
{
    %>
     <TD class="sm">no phenotype information available at this time</TD>
    <%
}
else
{
%>
     <TD class="sm">
			<TABLE>
<%
   List<Map<String,Object>> phenotypes = (List<Map<String,Object>>) phenotypeInfo.get("phenotypes");
   List<String> referenceList = new ArrayList<String>();
		for ( Map<String,Object> phenotype : phenotypes) {
     if ( phenotype.get("has_reference") != null && (Boolean) phenotype.get("has_reference") ) {
       Map<String,Object> ref = (Map<String,Object>) phenotype.get("reference");
       referenceList.add((String) ref.get("label"));
     }
   }
   ReferenceDisplayHelper displayHelper = new ReferenceDisplayHelper( referenceList );

   for ( Map<String,Object> phenotype : phenotypes ) { 
%>
    <TR valign="top">
<%
			String reference = null;
     if ( phenotype.get("has_reference") != null && (Boolean) phenotype.get("has_reference") ) {
       Map<String,Object> ref = (Map<String,Object>) phenotype.get("reference");
       reference = (String) ref.get("label");
     }
   boolean shouldDisplayReference = displayHelper.getShouldDisplayReference( reference );
   boolean shouldDisplayBullet = displayHelper.getShouldDisplayBullet( reference );
   String refDisplay = "&nbsp;&nbsp;";
		if ( phenotype.get("has_reference") != null && (Boolean)phenotype.get("has_reference") && shouldDisplayReference)
		{
                 Map<String,Object> ref = (Map<String,Object>) phenotype.get("reference");
		 refDisplay = 
		     "<a href=/servlets/TairObject?id=" + ref.get("reference_id") 
		          + "&type=" + ref.get("reference_type") + ">"
		          + EmptyTextConverter.convert(reference) + "</a>";
		} else if ( (Boolean)phenotype.get("has_reference") == null || !((Boolean)phenotype.get("has_reference")) && shouldDisplayReference)
		{ 
                 refDisplay = phenotype.get("has_reference") + "  Phenotype curated by ABRC";
		}
    //
    // check where the phenotpe description location is. If it is an enhancer trap phenotype, pull
    // fromt that table as opposed to the field from the Phenotype table
    // 
    String phenotype_description = "";
    String enhancer_phenotype_id = (String) phenotype.get("enhancer_trap_phenotype_id");
    if ( enhancer_phenotype_id == null || enhancer_phenotype_id.equals("") ) {
        phenotype_description = EmptyTextConverter.convert((String)phenotype.get("phenotype"));
    } else { 
        phenotype_description = "GFP Expressed in:<br /> " + EmptyTextConverter.convert((String)phenotype.get("gfp_expression"));
        phenotype_description = phenotype_description + " <br /><br />";
        phenotype_description = phenotype_description + "GFP expression level: <br /> " + EmptyTextConverter.convert((String)phenotype.get("gfp_expression_level"));
        phenotype_description = phenotype_description + " <br /><br />";
        phenotype_description = phenotype_description + "Detailed GFP expression pattern:<br />" + EmptyTextConverter.convert((String)phenotype.get("details"));
	}
    if( (Boolean)phenotype.get("has_reference") != null && (Boolean)phenotype.get("has_reference") && shouldDisplayBullet )
	{
		if( displayHelper.getShouldDisplayAnyBullets() )
		{
%>
	     <TD class="sm"><ul><li><%= phenotype_description %> <%= refDisplay %></li></ul></TD>
<%
		}
		else
		{
%>
	     <TD class="sm"><%= phenotype_description %> <%= refDisplay %></TD>
<%
		}
	}
	else
	{
		if( displayHelper.getShouldDisplayAnyBullets() )
		{
%>
	     <TD class="sm"><ul style="list-style-type: none;"><li><%= phenotype_description %> <%= refDisplay %></li></ul></TD>
<%
		}
		else
		{
%>
	     <TD class="sm"><%= phenotype_description %> <%= refDisplay %></TD>
<%
		}
	}
%>
     <TD class="sm">&nbsp;&nbsp;</TD>
    </TR>
<%
    }
%>
    </TABLE>
		</TD>
    </TR>
<%
}
%>
<!-- images -->
<% Map imageInfo = details.imageInfo; %>
 <% if ( (Boolean) imageInfo.get("has_image") ) { %>
   <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Images</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">
          <% List<Map<String,Object>> images = (List<Map<String,Object>>) imageInfo.get("images");
             for ( Map<String,Object> image : images ) {
          %>
               <% if ( (Boolean) image.get("has_thumbnail") ) { %>
	       <% Map<String,Object> thumb = (Map<String,Object>) image.get("thumbnail"); %>
                   <a href="/jsp/common/image.jsp?id=<%= image.get("image_id") %>&format=<%= TfcImage.getLinkSuffix((String) image.get("file_format")) %>"><img src="/servlets/images/thumb_<%= image.get("image_id") %>.<%= TfcImage.getLinkSuffix((String) image.get("file_format")) %>" border="0"></a>
               <% } else { %>
                    <a href="/jsp/common/image.jsp?id=<%= image.get("image_id") %>&format=<%= TfcImage.getLinkSuffix((String) image.get("file_format")) %>">View Image</a>
               <% } %>


          <% } %>
        </td>
   </tr>
  <% } %>

<!--description-->
 <% if ( details.germplasm.get_description() != null ) { %>
    <TR <%=myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">Additional Information<%= DefinitionsLookup.createPopupLink("Germplasm","description") %></TH>
     <TD class="sm">&nbsp;&nbsp;</TD>
     <TD class="sm"><%= EmptyTextConverter.convert(details.germplasm.get_description()) %></TD>
    </TR>
 <% } %>

<!-- stock description  -->
<% if ( details.stock != null && details.stock.get_description() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
      <th class="sm" align="left" valign="top"></th>
      <TD class="sm" >&nbsp;&nbsp;</TD>
      <TD class="sm">
	<table width="100%" border="0" cellpadding="1">
	  <tr>
	    <TD class="sm" ><%= EmptyTextConverter.convert(details.stock.get_description())  %> </TD>
	  </tr>
	</table>
      </td>
    </tr>
<% } %>

<!-- abrc comments -->
<% if ( details.stock != null && details.stock.get_ABRC_comments() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top"  align="left">
      <th class="sm" align="left">ABRC Comments<%= DefinitionsLookup.createPopupLink("Stock","ABRC_comments") %></th>
      <TD class="sm" >&nbsp;&nbsp;</TD>
      <TD class="sm">
	<table width="100%" border="0" cellpadding="1">
          <TR align="left">
	    <TD class="sm"><%= EmptyTextConverter.convert(details.stock.get_ABRC_comments())  %></TD>
	  </tr>
	</table>
      </td>
    </tr>
<% } %>
<!-- urls -->
<%
Map URLInfo = details.URLInfo;

if ( (Boolean) URLInfo.get("has_urls") ){
%>
    <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" valign="top" align="left">Associated URLs</th>
        <td>&nbsp;</td>
        <td class="sm">
        <%
        List<Map<String,Object>> urls = (List<Map<String,Object>>) URLInfo.get("urls");
        for ( Map<String,Object> url : urls ) {
            String web_site_name = EmptyTextConverter.convert( (String) url.get("web_site_name") );
            String web_url = EmptyTextConverter.convert( (String) url.get("url") );
            if ( web_site_name == null || web_site_name.equals( "" )){
            %>
                <a href="<%=web_url%>"><%=web_url%><br />
            <% } else { %>
                <a href="<%=web_url%>"><%=web_site_name%><br />
            <%
            }
        }
        %>
        </td>
    </tr>
<%
}
%>


        <!-- publication -->
<%
Map publicationInfo = details.publicationInfo;
%>
     <% if ( (Boolean) publicationInfo.get("has_publications") ) { 

Map<String,Boolean> headerInfo = (Map<String,Boolean>) publicationInfo.get("header_info");
Boolean publicationTitle = (Boolean) headerInfo.get("has_title");
Boolean publicationSource = (Boolean) headerInfo.get("has_name");
Boolean publicationDate = (Boolean) headerInfo.get("has_year");

%>
          <TR <%= myBgColor.toggleBgColor() %> >
          <TH class="sm" valign="top" align="left">Publications<%= DefinitionsLookup.createPopupLink("Publication","class") %> </TH>
          <TD class="sm">&nbsp;&nbsp;</TD>
          <TD class="sm">
                  <table>
                <TR align="left">
<% if  (publicationTitle != null && publicationTitle) { %>
                   <TH class="sm">Title</TH>
                   <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
<% } %>
<% if (publicationSource != null && publicationSource) { %>
                   <TH class="sm">Source<%= DefinitionsLookup.createPopupLink("Source","class") %></TH>
                   <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
<% } %>
<% if  (publicationDate != null && publicationDate) { %>
                   <TH class="sm">Date</TH>
<% } %>
               </TR>

                  <%
		    List<Map<String,Object>> publications = (List<Map<String,Object>>) publicationInfo.get("publications");
                    for ( Map<String,Object> publication : publications ) {
            %>

               <TR>
<% if  (publicationTitle != null && publicationTitle) { %> 
                  <TD class="sm"><a href=/servlets/TairObject?type=publication&id=<%= publication.get("reference_id") %>><%= EmptyTextConverter.convert( (String) publication.get("title") )%></a></TD>
                  <TD class="sm" nowrap>&nbsp; &nbsp;</TD>
<% } %>
<% if (publicationSource != null && publicationSource) { %> 
                     <TD class="sm"><%=EmptyTextConverter.convert( (String) publication.get("name") )%></TD>
                  <TD class="sm" nowrap>&nbsp; &nbsp;</TD>
<% } %>
<% if  (publicationDate != null && publicationDate) { %>
                    <TD class="sm"><%=EmptyTextConverter.convert((String) publication.get("year") )%></TD>
<% } %>
                 </TR>
                <% } %>
                </table>
          </TD>
           </TR>
        <% } %>
<!-- growth condition -->
 <% if ( details.germplasm.get_special_growth_conditions() != null ) { %>
    <TR <%=myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">Special Growth Conditions<%= DefinitionsLookup.createPopupLink("Germplasm","special growth conditions") %></TH>
     <TD class="sm">&nbsp;&nbsp;</TD>
     <TD class="sm"><%= EmptyTextConverter.convert(details.germplasm.get_special_growth_conditions()) %></TD>
    </TR>
 <% } %>


<!-- release date -->

<% if ( details.stock != null && details.stock.get_release_date() != null ) { %>  
<tr  <%= myBgColor.toggleBgColor() %> >  
  <th class="sm" align="left">Date Released</th>
  <TD class="sm" >&nbsp;&nbsp;</TD>
  <TD class="sm">
    <table width="50%" border="0" cellpadding="1">
      <TR align="left">
        <TD class="sm" ><%=  details.stock.get_release_date()   %></TD>
      </tr>
    </table>
  </TD>
</tr>
<% } %>



<!-- fees -->

<% if ( details.stock != null ) { %>  
<tr  <%= myBgColor.toggleBgColor() %> >  
  <th class="sm" align="left" valign="top">Fees</th>
  <TD class="sm" >&nbsp;&nbsp;</TD>
  <TD class="sm">
    <table width="100%" border="0" cellpadding="1">
      <TR align="left" valign="top">
	<TH class="sm" align="left">Academic<%= DefinitionsLookup.createPopupLink("Glossary","academic fee") %> 
	  / Commercial<%= DefinitionsLookup.createPopupLink("Glossary","comm fee") %></TH>
<%	if (details.stock.get_express_shipping_required() != null && details.stock.get_express_shipping_required().booleanValue()) { %>
	<TH class="sm" align="left">Express Shipping Required</TH>
<%      } %>
      </TR>
      <TR align="left" valign="top">
        <TD class="sm" align="left"><%= details.stock.get_format_base_price()  %> / <%= details.stock.get_format_commercial_price() %></TD>
	<% if ( details.stock.get_express_shipping_required() != null && details.stock.get_express_shipping_required().booleanValue() ) { %>
	<TD class="sm" align="left"><%=  details.stock.get_format_express_shipping_charge() %></TD>
	<% } else { %>
	<% } %>
      </tr>
    </table>
  </td>
</tr>
<% } %>


<!-- restrictions -->
<% if ( details.stock != null ) { %>  
<tr  <%= myBgColor.toggleBgColor() %> >  
  <th class="sm" align="left" valign="top">Restrictions</th>
  <TD class="sm" >&nbsp;&nbsp;</TD>
  <TD class="sm">
    <table width="100%" border="0" cellpadding="1">
      <TR align="left" valign="bottom">
	<TH class="sm" align="left">MTA signature required before shipping?</TH>
<%      if (details.stock.get_is_restricted() != null && details.stock.get_is_restricted().booleanValue()) { %>
	<TH class="sm" align="left">Restricted to academic organizations?</TH>
<%      } %>
      </TR>

      <TR align="left" valign="top">
	<% if (details.stock.get_MTA_signature() != null && details.stock.get_MTA_signature().booleanValue()) { %>
	<TD class="sm" align="left">Yes</TD>
	<% } else { %>
	<TD class="sm" align="left">No</TD>
	<% } %>

	<% if ( details.stock.get_is_restricted() != null && details.stock.get_is_restricted().booleanValue() ) { %>
	<TD class="sm" align="left">Yes</TD>
	<% } else { %>
	<% } %>

      </tr>
    </table>
  </td>
</tr>
<% } %>

<!-- shipping -->
<% if ( details.stock != null) { %>  
<tr  <%= myBgColor.toggleBgColor() %> >  
  <th class="sm" align="left" valign="top">Format Shipped</th>
  <TD class="sm" >&nbsp;&nbsp;</TD>
  <TD class="sm">
    <table width="100%" border="0" cellpadding="1">
      <TR align="left" valign="bottom">
	<TH class="sm" align="left"># Seeds per vial</TH>
<%      if(details.stock.get_number_in_set() != null && details.stock.get_number_in_set().intValue() > 1) { %>
	<TH class="sm" align="left"># Tubes in Set</TH>
<%      } %>
<%      if(details.stock.get_num_lines() != null && details.stock.get_num_lines().intValue() > 1) { %>
	<TH class="sm" align="left"># Lines Represented</TH>
<%      } %>
      </TR>

      <TR align="left" valign="top">
        <TD class="sm" align="left"><%= details.stock.get_format_shipped() %></TD>
<%      if(details.stock.get_number_in_set() != null && details.stock.get_number_in_set().intValue() > 1) { %>
        <TD class="sm" align="left"><%= details.stock.get_number_in_set() %></TD>
<%      } %>
<%      if(details.stock.get_num_lines() != null && details.stock.get_num_lines().intValue() > 1) { %>
        <TD class="sm" align="left"><%= details.stock.get_num_lines() %></TD>
<%      } %>
      </tr>

    </table>
  </td>
</tr>
<% } %>


<!-- type-->
<% Map typeInfo = details.typeInfo; %>
<% if ( (Boolean) typeInfo.get("has_type") ) { %>
<%
   String type = (String) typeInfo.get("type");
   Collection stockTypes = (Collection) typeInfo.get("stockTypes");
%>
  <TR <%=myBgColor.toggleBgColor()%> >
    <TH class="sm" align="left" valign="top">Type<%= DefinitionsLookup.createPopupLink("Germplasm","type") %></TH>
    <TD class="sm" >&nbsp;&nbsp;</TD>
    <TD class="sm" ><%= type %>
<%
   Iterator typeIter = stockTypes.iterator();
   while (typeIter.hasNext()) {
       HashMap sType = (HashMap) typeIter.next();
%>
     &nbsp;
     <%= sType.get("display") %><%= DefinitionsLookup.createPopupLink("Stock", (String) sType.get("type")) %>
<%
   }
%>
    </TD>
  </TR>
<% } %>

<!-- show associated stocks, if any of above were pooled stocks -->
<% Map includedSetPoolInfo = details.includedSetPoolInfo; %>
<% if ( (Boolean) includedSetPoolInfo.get("has_included_set_pool") ) {

Map<String,Boolean> headerInfo = (Map<String,Boolean>) includedSetPoolInfo.get("header_info");

Boolean has_pool_name = (Boolean) headerInfo.get("has_name");
Boolean has_pool_type = (Boolean) headerInfo.get("has_stock_type_id");
%>
<TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" align="left" valign="top">Stocks Included in Set / Pool</TH>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm">
      <table width="100%" border="0" cellpadding="1" cellspacing="0">
            <TR align="left" >

<% if (has_pool_name) { %>
                <TH class="sm" align="left">Stock #<%= DefinitionsLookup.createPopupLink("Stock","class") %></TH>
                <TH class="sm" align="left">&nbsp;</TH>
<% } %>
<% if (has_pool_type) { %>
                <TH class="sm" align="left">Type</TH>
                <TH class="sm" align="left">&nbsp;</TH>
<% } %>
            </TR>
  <%
     Iterator memberIter = null;
     List<Map<String,Object>> included_set_pool = (List<Map<String,Object>>) includedSetPoolInfo.get("included_set_pool");
     for (Map<String,Object> pool : included_set_pool) {
   %>
          <TR align="left" >

<% if (has_pool_name) { %>
                <TD class="sm" align="left" valign=top ><a href="/servlets/TairObject?type=stock&id=<%= pool.get("stock_id") %>"><%= pool.get("name") %></TD>
		<TD class="sm" align="left">&nbsp;</TD>
<% } %>
<% if (has_pool_type) { %>
                <% String type = null;
		   if ((Boolean) pool.get("has_type")) {
		     Map<String,Object> t = (Map<String,Object>) pool.get("type");
		     type = (String) t.get("stock_type");
		   }
		 %>
                <TD class="sm" align="left" valign=top ><%= EmptyTextConverter.convert (type) %></TD>
                <TD class="sm" align="left">&nbsp;</TD>
<% } %>
          </TR>
 
 
      <% } // pool while %>

      <!-- show link to display all member stocks of current pool, if collection is abbreviated -->
      <% if ( ((Integer) includedSetPoolInfo.get("count")) > GermplasmDetailLite.SET_POOL_LIMIT && details.stock != null) { %>
           <tr>
              <td class="sm" colspan="9">
                  <br>
                  <a href="/servlets/Search?type=seed&search_action=search&parent_id=<%= details.stock.get_tair_object_id() %>&parent_name=<%= URLEncoder.encode( details.stock.get_name() ) %>">View Complete List</a>
                  &nbsp;
                  (<%= GermplasmDetailLite.SET_POOL_LIMIT %> of <%= includedSetPoolInfo.get("count") %> displayed)
              </td>
           </tr>
      <% } %>
 

      </table>
     </TD>
</TR>
<% } // pool if %>

    <!-- show stock pools/sets if any of stocks above were members of pool/set -->
<% Map memberSetPoolInfo = details.memberSetPoolInfo; %>
<% if ( (Boolean) memberSetPoolInfo.get("has_member_set_pool") ) { 

Map<String,Boolean> headerInfo = (Map<String,Boolean>) memberSetPoolInfo.get("header_info");

Boolean has_name = (Boolean) headerInfo.get("has_name");
Boolean has_type = (Boolean) headerInfo.get("has_stock_type_id");
Boolean has_description = (Boolean) headerInfo.get("has_descriptions");
%>
      <tr <%= myBgColor.toggleBgColor() %> valign="top"  align="left">
        <th class="sm">Member of Set / Pool</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">
               <table cellpadding="2" cellspacing="2" border="0">
                   <tr>
<% if (has_name) { %>
                      <th class="sm" align="left">Stock #<%= DefinitionsLookup.createPopupLink("Stock","class") %></th>
                      <td class="sm" align="left">&nbsp;</td>
<% } %>
<% if (has_type) { %>
                      <th class="sm" align="left">Stock Type</th>
                      <td class="sm" align="left">&nbsp;</td>
<% } %>
<% if (has_description) { %>
                      <th class="sm" align="left">Additional Information</th>
<% }%>
                   </tr>

                 <% 
		    List<Map<String,Object>> member_set_pool = (List<Map<String,Object>>) memberSetPoolInfo.get("member_set_pool");
                    for ( Map<String,Object> pool : member_set_pool ) {
                 %>

                 <tr valign="top">
<% if (has_name) { %>
                          <td class="sm"><a href="/servlets/TairObject?type=stock&id=<%= pool.get("stock_id") %>"><%= pool.get("name") %></a></td>
                          <td class="sm" align="left">&nbsp;</td>
<% } %>
<% if (has_type) { %>
                <% String type = null;
		   if ((Boolean) pool.get("has_type")) {
		     Map<String,Object> t = (Map<String,Object>) pool.get("type");
		     type = (String) t.get("stock_type");
		   }
		 %>
                          <td class="sm"><%= type %></td>
                          <td class="sm" align="left">&nbsp;</td>
<% } %>
<% if (has_description) { %>
                <TD class="sm" align="left" valign=top >
		 <%
		   if ((Boolean) pool.get("has_descriptions")) {
		      List<Map<String,Object>> ds = (List<Map<String,Object>>) pool.get("descriptions");
		      for (Map<String,Object> d : ds) {
		 %>
		  <%= EmptyTextConverter.convert((String) d.get("description")) %><br>
		   <% } %>
		 <% } %>
		</TD>

<% } %>
                 </tr>
                <% } // end while%>
            </table>
          </td>
       </tr>
<% } // end membersetpool if%>

 <!-- tair accession-->
<% Map tairAccessionInfo = details.tairAccessionInfo; %>
     <TR <%=myBgColor.toggleBgColor()%> >
         <TH class="sm" align="left" valign="top">TAIR Accessions</TH>
	 <TD class="sm" >&nbsp;&nbsp;</TD>
	 <TD class="sm">
	   <table width="100%" border="0" cellpadding="1">
	     <tr>
	       <TD class="sm" align="left" valign="top"><%= (String) tairAccessionInfo.get("germplasm_accession") %></TD>
	     </tr>
	<% if (tairAccessionInfo.get("stock_accession") != null) { %>
	     <tr>
	       <TD class="sm" align="left" valign="top"><%= (String) tairAccessionInfo.get("stock_accession") %></TD>
	     </tr>
        <% } %>
	  </table>
	</td>
     </TR>
        <!-- attribution -->
<% Map attributionInfo = details.attributionInfo; %>
     <% if ( (Boolean) attributionInfo.get("has_attribution") ) { 

Map<String,Object> headerInfo = (Map<String,Object>) attributionInfo.get("header_info");
Boolean has_type = (Boolean) headerInfo.get("has_type");
Boolean has_name = (Boolean) headerInfo.get("has_community");
Boolean has_date = (Boolean) headerInfo.get("has_attribution_date");
%>

            <TR <%= myBgColor.toggleBgColor() %> >
                <TH class="sm" valign="top" align="left">Attribution <%= DefinitionsLookup.createPopupLink("Attribution","class") %></TH>
                <TD class="sm">&nbsp;</TD>
                <TD class="sm">
                 <table>
                     <TR align="left">
<% if (has_type) { %>
                        <TH class="sm">Type</TH>
                        <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
<% } %>
<% if (has_name) { %>
                        <TH class="sm">Name</TH>
                        <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
<% } %>
<% if (has_date) { %>
                        <TH class="sm">Date</TH>
<% } %>
                     </TR>
                 <%
		   List<Map<String,Object>> attributions = (List<Map<String,Object>>) attributionInfo.get("attributions");
                   for ( Map<String,Object> attribution : attributions ) {
                 %>
                     <TR>
<% if (has_type) { %>
 <% if ( (Boolean) attribution.get("has_type") ) { 
    Map<String,Object> t = (Map<String,Object>) attribution.get("type");
 %>
                        <TD class="sm"><%= EmptyTextConverter.convert( (String) t.get("attribution_type") ) %></TD>
 <% } %>
                        <TD class="sm" nowrap>&nbsp; &nbsp;</TD>
<% } %>
<% if (has_name) { %>
 <% if ( (Boolean) attribution.get("has_community") ) { 
      List<Map<String,Object>> communities = (List<Map<String,Object>>) attribution.get("community");
      for ( Map<String,Object> c : communities ) {
 %>
                           <TD class="sm"><a href=/servlets/Community?action=view&type=<%= org.tair.community.ListCommunity.getLinkType((String) c.get("type")) %>&communityID=<%= c.get("community_id") %>><%= c.get("name") %></a></TD>
 <%   }
    } %>
                        <TD class="sm" nowrap>&nbsp; &nbsp;</TD>
<% } %>
<% if (has_date) { %>
<% String date = EmptyTextConverter.convert( (String) attribution.get("attribution_date") );
   if ( date != null && date.length() >= 10 ) {
      date = date.substring(0,10);
   }
%>
                           <TD class="sm"><%= date %></TD>
<% } %>
                     </TR>
                 <% } %>
                </table>
          </TD>
          </TR>

     <% } %>


 <!-- date_last_modified-->
   <% if ( details.germplasm.get_date_last_modified() != null ) { %>
    <TR  <%= myBgColor.toggleBgColor() %> >

   <TH class="sm" align="left">Date Last Modified<%= DefinitionsLookup.createPopupLink("Germplasm","date_last_modified") %></th>
      <TD class="sm">&nbsp;&nbsp;</TD>
      <TD class="sm"><%=  details.germplasm.get_date_last_modified()  %></TD>
   </TR>
  <% }  %>



<!-- external_link -->
<% Map externalLinkInfo = details.externalLinkInfo; %>
 <%  if ( (Boolean) externalLinkInfo.get("has_external_link") ){ %>

  <TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" valign="top" align="left">External Link<%= DefinitionsLookup.createPopupLink("Glossary","external link") %></TH>
     <TD class="sm">&nbsp;&nbsp;</TD>
     <TD class="sm">
     <table>
 <%  
    List<Map<String,Object>> links = (List<Map<String,Object>>) externalLinkInfo.get("external_links");
    for ( Map<String,Object> link : links ) {
           String url = (String) link.get("base_url");
           String var = (String) link.get("url_variable");
           String site_name = (String) link.get("web_site_name");
           String link_name = (String) link.get("link_name");
           String target = "\" target=\"_blank";
 
           String html = HTMLFactory.urlToHTML( url+var+" "+target, site_name+" "+link_name);


  %>  <TR>
     <TD class="sm"><%= html %>
     </TD>
     </TR>
<% } %>
     </TABLE></TD>
  </TR>
<% } %>

<!-- annotation -->
<% Map annotationInfo = details.annotationInfo; %>
 <% if ( (Boolean) annotationInfo.get("has_annotations") ) { 

Map<String,Boolean> headerInfo = (Map<String,Boolean>) annotationInfo.get("header_info");

Boolean has_date = (Boolean) headerInfo.get("has_date_entered");
Boolean has_source = (Boolean) headerInfo.get("has_annotated_by_id");
Boolean has_annotation = (Boolean) headerInfo.get("has_short") || (Boolean) headerInfo.get("has_long");
%>

 <TR <%= myBgColor.toggleBgColor() %> valign="top" >
         <TH class="sm" valign="top" align="left">Annotations<%= DefinitionsLookup.createPopupLink("Annotation","class") %></TH>
         <TD class="sm">&nbsp;</TD>
         <TD class="sm">
              <table>
              <TR align="left">
<% if (has_date) { %>
                <TH class="sm">date</TH>
<% } %>
<% if (has_source) { %>
                <TH class="sm">by</TH>
<% } %>
<% if (has_annotation) { %>
                <TH class="sm">annotation</TH>
<% } %>
              </TR>

                <%
		   List<Map<String,Object>> annotations = (List<Map<String,Object>>) annotationInfo.get("annotations");
		   for ( Map<String,Object> annotation : annotations ) {
                %>

                 <TR valign="top">
<% if (has_date) { %>
<% String date = EmptyTextConverter.convert( (String) annotation.get("date_entered") );
   if ( date != null && date.length() >= 10 ) {
      date = date.substring(0,10);
   }
%>
                   <TD class="sm"><%= EmptyTextConverter.convert( date )%></TD>
<% } %>
<% if (has_source) { %>
   <% if ((Boolean) annotation.get("has_source")) {
        Map<String,Object> source = (Map<String,Object>) annotation.get("source");
    %>
                   <TD class="sm"><%= EmptyTextConverter.convert( (String) source.get("name") ) %></TD>
   <% } %>&nbsp;
<% } %>
<% if (has_annotation) { %>
                   <TD class="sm" colspan="2"><%= EmptyTextConverter.convert((String) annotation.get("short_annotation") ) + " " + EmptyTextConverter.convert((String) annotation.get("long_annotation") ) %></TD>
<% } %>
                </TR>
                 <% } %>
              </table>
            </TD>
      </TR>
       <% } %>


  <!--comment-->
 <%
    String commentColor =  myBgColor.toggleBgColor() ;
    Map commentInfo = details.commentInfo;
 %>
      <form action="/servlets/updater" method="post">
        <tr  <%=  commentColor  %>  valign="top">
           <th class="sm" align="left">Comments <%= DefinitionsLookup.createPopupLink("Glossary","Comments") %> <br>(shows only the most recent comments by default)
             <input type="hidden" name="type" value="notepad">
             <input type="hidden" name="update_action" value="add">
             <input type="hidden" name="tair_object_id" value="<%= details.germplasm.get_tair_object_id() %>">
             <input type="hidden" name="accession" value="<%= (String) details.tairAccessionInfo.get("germplasm_accession")  %>" >

            <% String hideText = hidden ? "Show Comments" : "Hide Comments"; %>
            <% boolean hideOption = !hidden; %>
            <% String allText = showAll ? "Show Recent Comments" : "Show All Comments"; %>
            <% boolean showAllOption = !showAll; %>

           </th>

        <% if ( !hidden && (Boolean) commentInfo.get("has_comments") ) { %>

                <td class="sm">&nbsp;</td>
                <td class="sm">
                  <table cellpadding="2" width="100%">
                    <tr align="left">
                      <th class="sm">entered by</th>
                   <th class="sm">date</th>
                   <th class="sm">comment</th>
                 </tr>
                 <%
		   List<Map<String,Object>> notes = (List<Map<String,Object>>) commentInfo.get("comments");
		   if (!showAll) {
		       notes = notes.subList(0, Math.min(notes.size(), GermplasmDetailLite.COMMENT_LIMIT)); 
		   }
                   for ( Map<String,Object> note : notes ) {
                      String display_note = (String) note.get("notepad_comment");
		      String date = (String) note.get("date_entered");
		      if (date != null && date.length() >= 10) {
		          date = date.substring(0,10);
		      }
                      if ( display_note.length() > 100){
                          display_note =  TextConverter.truncateString( (String) note.get("notepad_comment"), 100 ) ;
                      }
                 %>
              <tr valign="top">
                           <td class="sm" nowrap><a href="/servlets/Community?action=view&type=person&communityID=<%= note.get("community_id") %>"><%= (String)note.get("first_name") + (String)note.get("last_name")%></a></td>
                        <td class="sm" nowrap><%= date %></td>
                           <td class="sm"><a href="/servlets/TairObject?type=notepad&id=<%= note.get("notepad_id") %>"><%= display_note  %></a></td>
                        </tr>
                 <% } %>
                </table>
              </td>


        <% } else { %>
           <td class="sm" colspan="2"> &nbsp;
          </td>
        <% } %>
      </tr>
      <tr color="<%= commentColor  %>"  valign="top"  %>
          <td class="sm" colspan=3 align=center>
          <input type="submit" name="submit" VALUE="Add My Comment">&nbsp;&nbsp;
          <input type="button" value="<%= hideText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= details.tairAccessionInfo.get("germplasm_accession") %>&hideNote=<%= hideOption %>'">&nbsp;&nbsp;
          <input type="button" value="<%= allText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= details.tairAccessionInfo.get("germplasm_accession")  %>&showAllNote=<%= showAllOption %>'">
           </td>

      </tr>
   </form>
<!-- communication -->
<% Map communicationInfo = details.communicationInfo; %>
  <% if ( (Boolean) communicationInfo.get("has_communications") ) { 

Map<String,Object> headerInfo = (Map<String,Object>) communicationInfo.get("header_info");
Boolean has_name = (Boolean) headerInfo.get("has_name");
Boolean has_author = (Boolean) headerInfo.get("has_author");
Boolean has_date = (Boolean) headerInfo.get("has_date");


%>
     <TR <%= myBgColor.toggleBgColor() %> >
      <TH class="sm" valign="top" align="left">Communication</TH>
      <TD class="sm">&nbsp;&nbsp;</TD>
      <TD class="sm">
           <table>
            <TR align="left">
<% if (has_name) { %>
            <TH class="sm">Name</TH>
            <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
<% } %>
<% if (has_author) { %>
            <TH class="sm">Author Name</TH>
            <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
<% } %>
<% if (has_date) { %>
               <TH class="sm">date</TH>
<% } %>
          </TR>

        <%
	   List<Map<String,Object>> communications = (List<Map<String,Object>>) communicationInfo.get("communications");
           for ( Map<String,Object> communication : communications ) {
        %>

          <TR>
<% if (has_name) { %>
             <TD class="sm"><a href=/servlets/TairObject?type=communication&id=<%= communication.get("reference_id") %>><%= EmptyTextConverter.convert((String) communication.get("name") )%></a></TD>
             <TD class="sm" nowrap>&nbsp; &nbsp;</TD>
<% } %>
<% if (has_author) { %>
                <TD class="sm"><%=EmptyTextConverter.convert( (String) communication.get("author_name") )%></TD>
                <TD class="sm" nowrap>&nbsp; &nbsp;</TD>
<% } %>
<% if (has_date) { %>
                <TD class="sm"><%= EmptyTextConverter.convert( (String) communication.get("date") ) %></TD>
<% } %>
             </TR>
         <% } %>
          </table>
      </TD>
       </TR>
   <% } %>


</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
