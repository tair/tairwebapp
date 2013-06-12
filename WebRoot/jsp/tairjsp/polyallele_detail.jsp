<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<%@ page import="org.tair.tfc.*, org.tair.search.*, org.tair.querytools.*, org.tair.utilities.*, java.util.*, java.net.*, org.tair.bs.community.*" %>

<%!
String pageName = "PolyAllele Detail";
%>

<%
PolyAlleleDetail object= (PolyAlleleDetail) request.getAttribute("detail");
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

<table width="100%" border="0" colspan="2" cellspacing="0" >

    <tr>
        <td colspan="3"><b><font size="+1">Polymorphism: <%= object.get_original_name() %></font></b></td>
    </tr>

    <!-- ORIGINAL_NAME-->

    <% if ( object.get_original_name() != null ) { %>
        <tr  <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Name<%= DefinitionsLookup.createPopupLink("Polymorphism","name") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%=  object.get_original_name()  %></td>
        </tr>
    <% }  %>

    <!-- DATE_LAST_MODIFIED-->

    <% if ( object.get_date_last_modified() != null ) { %>
        <tr  <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Date last modified<%= DefinitionsLookup.createPopupLink("Polymorphism","date_last_modified") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%=  object.get_date_last_modified()  %></td>
        </tr>
    <% }  %>

    <!-- ALIAS-->

    <% if ( object.get_alias_string() != null ) { %>
        <tr  <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Aliases<%= DefinitionsLookup.createPopupLink("Alias","class") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%=  EmptyTextConverter.convert(object.get_alias_string())  %></td>
        </tr>
    <% }  %>

    <!-- TAIR ACCESSION-->

    <% if ( object.get_tair_object_type() != null ) { %>
        <tr  <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Tair Accession<%= DefinitionsLookup.createPopupLink("Glossary","TAIR accession") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%=  EmptyTextConverter.convert(object.getAccession()) %></td>
        </tr>
    <% }  %>

    <!-- TYPE-->

    <% if ( object.get_type() != null ) { %>
        <tr  <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Type<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td>
                <table>
                    <tr>
                        <td class="sm"><%=  EmptyTextConverter.convert(object.get_type()) %></td>
                        <% if ( object.get_insertion_type() != null ) { %>
                            <td class="sm">&nbsp;&nbsp;</td>
                            <th class="sm" align="left">Insertion Type<%= DefinitionsLookup.createPopupLink("Polymorphism","insertion_type") %></th>
                            <td class="sm">&nbsp;&nbsp;</td>
                            <td class="sm" valign="top"> <%= EmptyTextConverter.convert(object.get_insertion_type()) %> </td>
                        <% } else { %>
                            <td  class="sm" colspan=4>&nbsp;&nbsp;</td>
                        <% } %>
                    </tr>
                </table>
            </td>
        </tr>
    <% }  %>

    <!-- CHROMOSOME -->

    <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" align="left" valign="top">Chromosome<%= DefinitionsLookup.createPopupLink("Polymorphism","chromosome") %></th>
        <td class="sm" >&nbsp;</td>
        <td class="sm" > <%= Units.translateChromosome( object.get_chromosome() ) %></td>
    </tr>

    <!-- HAS OBSERVABLE PHENOTYPE -->

   <%-- <tr  <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">Has observable phenotype<%= DefinitionsLookup.createPopupLink("Polymorphism","has_observable_phenotype") %></th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= TextConverter.booleanToWord( object.get_has_observable_phenotype() ) %></td>
    </tr>--%>

    <!--CONStrUCT TYPE-->

    <% if ( object.get_clone_id() != null ) {  %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Construct Type<%= DefinitionsLookup.createPopupLink("Clone","construct type") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%=  EmptyTextConverter.convert(object.get_construct_type()) %> </td>
        </tr>
    <%  }  %>

    <!-- GENE MODELS/LOCUS -->

    <% if (object.get_gene_models() !=null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> valign="top">
            <th class="sm" valign="top" align="left">Associated Genes<%= DefinitionsLookup.createPopupLink("Glossary","associated_genes") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table cellpadding="2" border="0" width="100%">
                    <tr align="left" valign="top">
                        <th class="sm" align="left">Gene Model<%= DefinitionsLookup.createPopupLink("Gene","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">Locus<%= DefinitionsLookup.createPopupLink("Locus","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <!-- <th class="sm" valign= "top">Description<%= DefinitionsLookup.createPopupLink("Gene","description") %></th>
                        <th class="sm">&nbsp;</th>-->
                        <th class="sm">Polymorphism site</th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">Association Type<%= DefinitionsLookup.createPopupLink("Gene_MapElement", "relationship_type") %></th>
                    </tr>
                    <%
                    Iterator genemodelIter = object.get_gene_models();
                    while ( genemodelIter.hasNext() ) {
                        GeneModel  gene = (GeneModel)genemodelIter.next();
                        %>
                        <tr valign="top" align="left">
                            <td class="sm"><a href=/servlets/TairObject?type=gene&id=<%= gene.get_gene_id() %>><%=EmptyTextConverter.convert( gene.get_name() )%></a></td>
                            <td class="sm">&nbsp;</td>
                            <!-- loci of this gene -->
                            <td class="sm">
                                <% if ( gene.hasLocus() ) {
                                    Iterator loci_iter =  gene.getLocus();
                                    while ( loci_iter.hasNext() ) {
                                        TfcLocus locus = (TfcLocus)loci_iter.next();
                                        %>
                                        <A href= "/servlets/TairObject?type=locus&id=<%= locus.get_locus_id() %>" >
                                        <%= EmptyTextConverter.convert(locus.get_name()) %></A><BR>
                                    <% } %>
                                <% } else { %>
                                    &nbsp;
                                <% } %>
                            </td>
                            <td class="sm">&nbsp;</td>
                            <!-- <td class="sm"><%=EmptyTextConverter.convert( gene.get_description() )%></td>
                            <td class="sm">&nbsp;</td> -->
                            <td class="sm"><%= EmptyTextConverter.convert( gene.get_gene_feature_site() ) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm"> <%=  EmptyTextConverter.convert(gene.get_relationship_type()).replace('_', ' ')  %></td>
                        </tr>
                        <tr>
                            <th class="sm" valign= "top">Description<%= DefinitionsLookup.createPopupLink("Gene","description") %></th>
                            <td class="sm" colspan="6"><%=EmptyTextConverter.convert(gene.get_description())%></td>
                        </tr>
                        <% if(genemodelIter.hasNext()) { %>
                            <tr><td colspan="7"><hr></td></tr>
                        <% } %>
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!--LOCI-->

    <% if ( object.hasLocus() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left" valign="top">Associated Loci<%= DefinitionsLookup.createPopupLink("Glossary","associated loci") %></th>
            <td class="sm">&nbsp;</td>
            <%
            String loci = "";
            Iterator loci_iter =  object.getLocus();
            while ( loci_iter.hasNext() ) {
                TfcLocus locus = (TfcLocus)loci_iter.next();
                loci += "<A href= '/servlets/TairObject?type=locus&id="+ locus.get_locus_id()+"'>" + locus.get_name() + "</A>, ";
            }
            loci = loci.substring (0, loci.lastIndexOf(",")); // remove the last ","
            %>
            <td class="sm"><%= loci %></td>
        </tr>
    <% } %>

    <!-- MUTAGEN-->

    <% if ( object.get_mutagen() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Mutagen<%= DefinitionsLookup.createPopupLink("Polymorphism","mutagen") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%= EmptyTextConverter.convert( object.get_mutagen() ) %> </td>
        </tr>
    <% } %>

    <!--MUTATION SITE-->

    <%  if ( object.get_mutation_site() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Mutation Site<%= DefinitionsLookup.createPopupLink("Polymorphism","chromosome_feature_site") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%= EmptyTextConverter.convert( object.get_mutation_site() ).replace('_',' ') %> </td>
        </tr>
    <% } %>

    <!-- INHERITANCE-->

    <%
    if ( object.get_inheritance() != null ) {
        String  inheritance = object.get_inheritance();
        if (inheritance.equals("incompletely_dominan") ) {
            inheritance = "incompletely_dominant";
        }
        %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Inheritance<%= DefinitionsLookup.createPopupLink("Polymorphism","inheritance") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%=  inheritance %> </td>
        </tr>
    <% }  %>

    <!-- ALLELE TYPE-->

    <% if ( object.get_allele_mode() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Allele Type<%= DefinitionsLookup.createPopupLink("Polymorphism","allele_mode") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%=  EmptyTextConverter.convert(object.get_allele_mode()) %> </td>
        </tr>
    <% }  %>

    <!-- DESCRIPTION-->

    <% if ( object.get_description() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left" valign="top">Description<%= DefinitionsLookup.createPopupLink("Polymorphism","description") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%= EmptyTextConverter.convert(object.get_description()) %> </td>
        </tr>
    <% }  %>

    <!--POLYMORPHISMS-->

    <%
    String bgColor="" ;
    if ( ( object.get_polymorphisms("insertion") != null ) ||
         ( object.get_polymorphisms("substitution") != null ) ||
         ( object.get_polymorphisms( "PCR_product_length" ) != null ) ||
         ( object.get_polymorphisms( "INDEL" ) != null ) ||
         ( object.get_polymorphisms( "deletion" ) != null ) ||
         ( object.get_polymorphisms( "digest_pattern" ) != null ) ||
         ( object.get_polymorphisms( "compound" ) != null ) ) {
        bgColor = myBgColor.toggleBgColor();
        %>
        <tr <%= bgColor %> >
            <th class="sm" align="left" colspan="3">Associated Polymorphisms<%= DefinitionsLookup.createPopupLink("Glossary","associated polymorphisms") %></th>
        </tr>
    <% } %>

    <!-- INSERTION -->

    <% if ( object.get_polymorphisms("insertion")!=null ) { %>
        <tr <%= bgColor %> >
            <th class="sm" valign="top" align="left">Insertion<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left" valign="top">
                        <th class="sm">Species Variant (attribution)<%= DefinitionsLookup.createPopupLink("SpeciesVariant","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Length<%= DefinitionsLookup.createPopupLink("Polymorphism","length") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Polymorphic Sequence<%= DefinitionsLookup.createPopupLink("Polymorphism","polymorphic_sequence") %></th>
                        <th class="sm">&nbsp;</th>
               <th class="sm" align=center>Polymorphism Verified</th>
               <th class="sm">&nbsp;</th>
                    </tr>
                    <%
                    Iterator iter = object.get_polymorphisms( "insertion" );
                    while ( iter.hasNext() ) {
                        PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
                        String length =  "unknown";
                        if ( polymorphism.get_format_lengths() !=null ) {
                            length =  polymorphism.get_format_lengths();
                        }
			Iterator statusIter = polymorphism.getStatuses ();
			Map seen = new HashMap();
                  while ( statusIter.hasNext()){
		  %><tr align="left" valign="top"><td class="sm"><%
		  String  status = (String)statusIter.next();
		  String abbrev_name = polymorphism.get_abbrev_species_variant_name( status );
		  String[] names = abbrev_name.split("; ");
		  for(int i = 0;i < names.length; i++)
		  {
		  	Long tair_id = polymorphism.getTairObjectIDForVariantAbbrevName(names[i]);
			if(tair_id == 0)
			{
				if(polymorphism.hasAttributions())
					tair_id = polymorphism.get_tair_object_id();
			}
		  	if(i+1 < names.length)
				names[i] = names[i]+"; ";
			if(tair_id!=0)
			{
				%><a href="/servlets/TairObject?id=<%= tair_id %>&type=attrib"><%= EmptyTextConverter.convert(names[i]) %></a><%
			}
			else
			{
				%><%=EmptyTextConverter.convert(names[i])%><%
			}

		  }%>
		<BR></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert( length ) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_polymorphic_sequence()) %></td>
                            <td class="sm">&nbsp;</td>
                   <td class="sm" align=center><%= status %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center>
                            </td>
                        </tr>
              <% } %>
                    <% } %>
                </table>
            </td>
        </tr
    <% } %>

    <!-- DELETION -->

    <% if ( object.get_polymorphisms("deletion")!=null ) { %>
        <tr <%= bgColor %> >
            <th class="sm" valign="top" align="left">Deletion<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left" valign="top">
                        <th class="sm">Species Variant<%= DefinitionsLookup.createPopupLink("SpeciesVariant","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">Length<%= DefinitionsLookup.createPopupLink("Polymorphism","length") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">Polymorphic Sequence<%= DefinitionsLookup.createPopupLink("Polymorphism","polymorphic_sequence") %></th>
                        <th class="sm">&nbsp;</th>
               <th class="sm"> Polymorphism Verified</th>
               <th class="sm">&nbsp;</th>
                        <th class="sm">Attribution</th>
                    </tr>
                    <%
                    Iterator iter = object.get_polymorphisms( "deletion" );
                    while ( iter.hasNext() ) {
                        PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
                        Iterator statusIter = polymorphism.getStatuses ();
			Map seen = new HashMap();
                  while ( statusIter.hasNext()){
		  %><tr align="left" valign="top"><td class="sm"><%
		  String  status = (String)statusIter.next();
		  String abbrev_name = polymorphism.get_abbrev_species_variant_name( status );
		  String[] names = abbrev_name.split("; ");
		  for(int i = 0;i < names.length; i++)
		  {
		  	Long tair_id = polymorphism.getTairObjectIDForVariantAbbrevName(names[i]);
			if(tair_id == 0)
			{
				if(polymorphism.hasAttributions())
					tair_id = polymorphism.get_tair_object_id();
			}
		  	if(i+1 < names.length)
				names[i] = names[i]+"; ";
			if(tair_id!=0)
			{
				%><a href="/servlets/TairObject?id=<%= tair_id %>&type=attrib"><%= EmptyTextConverter.convert(names[i]) %></a><%
			}
			else
			{
				%><%=EmptyTextConverter.convert(names[i])%><%
			}

		  }%>
		<BR></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_format_lengths()) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_polymorphic_sequence()) %></td>
                            <td class="sm">&nbsp;</td>
                   <td class="sm"  align=center><%= status %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center>
                            </td>
                        </tr>
                    <% } %>
                    <% } %>
             </table>
            </td>
        </tr
    <% } %>

    <!-- SUBSTITUTION -->

    <% if ( object.get_polymorphisms("substitution")!=null ) { %>
        <tr <%= bgColor %> >
            <th class="sm" valign="top" align="left">Substitution<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left" valign="top">
                        <th class="sm">Species Variant (attribution)<%= DefinitionsLookup.createPopupLink("SpeciesVariant","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">Length<%= DefinitionsLookup.createPopupLink("Polymorphism","length") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Polymorphic Sequence<%= DefinitionsLookup.createPopupLink("Polymorphism","polymorphic_sequence") %></th>
                        <th class="sm">&nbsp;</th>
               <th class="sm" align=center> Polymorphism Verified</th>
               <th class="sm">&nbsp;</th>
                    </tr>
                    <%
                    Iterator iter = object.get_polymorphisms( "substitution" );
                    while ( iter.hasNext() ) {
                        PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
			Iterator statusIter = polymorphism.getStatuses ();
			Map seen = new HashMap();
                  while ( statusIter.hasNext()){
		  %><tr align="left" valign="top"><td class="sm"><%
		  String  status = (String)statusIter.next();
		  String abbrev_name = polymorphism.get_abbrev_species_variant_name( status );
		  String[] names = abbrev_name.split("; ");
		  for(int i = 0;i < names.length; i++)
		  {
		  	Long tair_id = polymorphism.getTairObjectIDForVariantAbbrevName(names[i]);
			if(tair_id == 0)
			{
				if(polymorphism.hasAttributions())
					tair_id = polymorphism.get_tair_object_id();
			}
		  	if(i+1 < names.length)
				names[i] = names[i]+"; ";
			if(tair_id!=0)
			{
				%><a href="/servlets/TairObject?id=<%= tair_id %>&type=attrib"><%= EmptyTextConverter.convert(names[i]) %></a><%
			}
			else
			{
				%><%=EmptyTextConverter.convert(names[i])%><%
			}

		  }%>
		<BR></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_format_lengths()) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_polymorphic_sequence()) %></td>
                            <td class="sm">&nbsp;</td>
                   <td class="sm"  align=center><%= status %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center>
                            </td>
                        </tr>
              <% } %>
                    <% } %>
                </table>
            </td>
        </tr
    <% } %>

    <!-- COMPOUND -->

    <% if ( object.get_polymorphisms("compound")!=null ) { %>
        <tr <%= bgColor %> >
            <th class="sm" valign="top" align="left"> Compound<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left" valign="top">
                        <th class="sm">Species Variant<%= DefinitionsLookup.createPopupLink("SpeciesVariant","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Length<%= DefinitionsLookup.createPopupLink("Polymorphism","length") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Polymorphic Sequence<%= DefinitionsLookup.createPopupLink("Polymorphism","polymorphic_sequence") %></th>
                        <th class="sm">&nbsp;</th>
               <th class="sm" align=center> Polymorphism Verified</th>
               <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Attribution</th>
                    </tr>
                    <%
                    Iterator iter = object.get_polymorphisms( "compound" );
                    while ( iter.hasNext() ){
                        PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
                  Iterator statusIter = polymorphism. getStatuses ();
                  while ( statusIter.hasNext()){
                            String  status = (String)statusIter.next();
              %>
                        <tr align="left" valign="top">
                            <td class="sm"><%= EmptyTextConverter.convert(polymorphism.get_abbrev_species_variant_name( status)) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_format_lengths()) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_polymorphic_sequence()) %></td>
                            <td class="sm">&nbsp;</td>
                   <td class="sm"  align=center ><%= status %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm">
                                <% if ( polymorphism.hasAttributions() ) { %>
                                    <a href="/servlets/TairObject?id=<%= polymorphism.get_tair_object_id() %>&type=attrib">attribution</a>
                                <% } else { %>
                                    &nbsp;
                                <% } %>
                            </td>
                        </tr>
                    <% }} %>
                </table>
            </td>
        </tr
    <% } %>

    <!-- INDEL-->

    <% if ( object.get_polymorphisms("INDEL")!=null ) { %>
        <tr <%= bgColor %> >
            <th class="sm" valign="top" align="left">INDEL<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left" valign="top">
                        <th class="sm">Species Variant<%= DefinitionsLookup.createPopupLink("SpeciesVariant","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Length<%= DefinitionsLookup.createPopupLink("Polymorphism","length") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Polymorphic Sequence<%= DefinitionsLookup.createPopupLink("Polymorphism","polymorphic_sequence") %></th>
                        <th class="sm">&nbsp;</th>
               <th class="sm" align=center> Polymorphism Verified</th>
               <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Attribution</th>
                    </tr>
                    <%
                    Iterator iter = object.get_polymorphisms( "INDEL" );
                    while ( iter.hasNext() ){
                        PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
                        Iterator statusIter = polymorphism.getStatuses ();
                  while ( statusIter.hasNext()){
                           String  status = (String)statusIter.next();
              %>
                        <tr align="left" valign="top">
                            <td class="sm"><%= EmptyTextConverter.convert(polymorphism.get_abbrev_species_variant_name(status)) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center ><%= EmptyTextConverter.convert(polymorphism.get_format_lengths()) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_polymorphic_sequence()) %></td>
                            <td class="sm">&nbsp;</td>
                   <td class="sm" align=center><%=  status %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center >
                                <% if ( polymorphism.hasAttributions() ) { %>
                                    <a href="/servlets/TairObject?id=<%= polymorphism.get_tair_object_id() %>&type=attrib">attribution</a>
                                <% } else { %>
                                    &nbsp;
                                <% } %>
                            </td>
                        </tr>
                    <% } } %>
                </table>
            </td>
        </tr
    <% } %>

    <!-- PCR PRODUCT LENGTH -->

    <% if ( object.get_polymorphisms( "PCR_product_length" ) != null ) {  %>
        <tr <%= bgColor %> >
            <th class="sm" valign="top" align="left">PCR Product Length<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left" valign="top">
                        <th class="sm">Species Variant<%= DefinitionsLookup.createPopupLink("SpeciesVariant","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">Product Length<%= DefinitionsLookup.createPopupLink("Polymorphism","length") %></th>
                        <th class="sm">&nbsp;</th>
               <th class="sm"> Polymorphism Verified</th>
               <th class="sm">&nbsp;</th>
                        <th class="sm">Attribution</th>
                    </tr>
                    <%
                    Iterator iter = object.get_polymorphisms( "PCR_product_length" );
                    while ( iter.hasNext() ){
                        PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
                        Iterator statusIter = polymorphism.getStatuses ();
                  while ( statusIter.hasNext() ){
                            String  status = (String)statusIter.next();
              %>
                        <tr align="left" valign="top">
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_abbrev_species_variant_name(status)) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= EmptyTextConverter.convert(polymorphism.get_format_lengths()) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=center><%= status %></td>
                            <td class="sm">&nbsp;</td>
                   <td class="sm" align=center>
                                <% if ( polymorphism.hasAttributions() ) { %>
                                    <a href="/servlets/TairObject?id=<%= polymorphism.get_tair_object_id() %>&type=attrib">attribution</a>
                                <% } else { %>
                                    &nbsp;
                                <% } %>
                            </td>
                        </tr>
                    <% }}  %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- DIGEST PATTERN-->

    <% if ( object.get_polymorphisms( "digest_pattern")!= null ) { %>
        <tr <%= bgColor %> >
            <th class="sm" valign="top" align="left">Digest Pattern<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left" valign="top">
                        <th class="sm">Species Variant<%= DefinitionsLookup.createPopupLink("SpeciesVariant","class") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>REnzyme</th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Num Sites</th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Fragment Length<%= DefinitionsLookup.createPopupLink("Polymorphism","length") %></th>
                        <th class="sm">&nbsp;</th>
               <th class="sm" align=center>Polymorphism Verified</th>
               <th class="sm">&nbsp;</th>
                        <th class="sm" align=center>Attribution</th>
                    </tr>

     <% Iterator iter = object.get_polymorphisms( "digest_pattern" );
        while ( iter.hasNext() ) {
            PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
            Iterator statusIter = polymorphism.getStatuses ();
            while ( statusIter.hasNext()){
                String  status = (String)statusIter.next();
                String is_ref="F";
                if (polymorphism.get_polymorphism_id().compareTo(polymorphism.get_ref_polymorphism_id()) == 0) {
                     is_ref = "T";
                }
                Iterator enzymeIter = polymorphism.get_restriction_enzymes();
                if ( enzymeIter != null ) {
                   boolean first = true;
                   while ( enzymeIter.hasNext() ) {
                   PolymorphismRestrictionEnzyme enzyme = (PolymorphismRestrictionEnzyme) enzymeIter.next();
                       if ( first ) {
     %>
                    <tr>
                         <td class="sm"><%= EmptyTextConverter.convert( polymorphism.get_abbrev_species_variant_name() ) %></td>
                         <td class="sm">&nbsp;</td>
                         <td class="sm" align=center><a href="/servlets/TairObject?type=restrictionenzyme&id=<%= enzyme.get_restriction_enzyme_id() %>"><%= EmptyTextConverter.convert( enzyme.get_name() ) %></a></td>
                         <td class="sm">&nbsp;</td>
                         <td class="sm" align=center><%= EmptyTextConverter.convert( enzyme.get_num_sites() ) %></td>
                         <td class="sm">&nbsp;</td>
                         <td class="sm" align=center><%= EmptyTextConverter.convert( polymorphism.get_format_lengths() ) %></td>
                         <td class="sm">&nbsp;</td>
                   <td class="sm"  align=center><%=  status %></td>
                         <td class="sm">&nbsp;</td>
                         <td class="sm">
                    <% if ( polymorphism.hasAttributions() ){ %>
                             <a href="/servlets/TairObject?id=<%=polymorphism.get_tair_object_id() %>&type=attrib">attribution</a>
                    <% } else { out.print ("&nbsp;"); }       %>
                          </td>
                    </tr>
                    <% }// end if first
                         else if ( enzyme.get_name() != null || enzyme.get_num_sites() != null ) {
                    %>
                    <tr>
                         <td class="sm" colspan=2 >&nbsp;</td>
                         <td class="sm" align=center><a href="/servlets/TairObject?type=restrictionenzyme&id=<%= enzyme.get_restriction_enzyme_id() %>"><%= EmptyTextConverter.convert( enzyme.get_name() ) %></a></td>
                          <td class="sm">&nbsp;</td>
                          <td class="sm" align=center ><%= EmptyTextConverter.convert( enzyme.get_num_sites() )%></td>
                          <td class="sm" colspan=6>&nbsp;</td>
                    </tr>
                    <% }// end else if
                        first = false;
                    }  // end ( while ( enzymeIter.hasNext() ) )
               }// end ( if ( enzymeIter != null ))
             }
            }
         %>
               </table>
            </td>
        </tr>
    <% } %>

    <!--ASSOCIATED NUCLEOTIDE SEQUENCES-->

    <%
    String seqColor = "";
    if ( object.get_sequences() != null ||
         object.get_flanking_sequence() != null ) {
        seqColor = myBgColor.toggleBgColor();
        %>
        <tr <%= seqColor %> >
            <th class="sm" align="left" colspan="3">Associated  Nucleotide Sequences<%= DefinitionsLookup.createPopupLink("Glossary","associated nuc seq") %></th>
        </tr>
    <% } %>

    <% if ( object.get_sequences() != null ) { %>
        <tr <%= seqColor %> >
            <th class="sm" valign="top" align="left">Insertion Flanking Sequence</th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm">
                <table>
                    <%
                    Iterator seqIter = object.get_sequences();
                    while ( seqIter.hasNext() ) {
                        Sequence sequence = (Sequence) seqIter.next();
                        String seq_name = sequence.get_format_sequence_name();
                        if (sequence.get_sequence() != null ) {
                            %>
                            <tr valign="top" <%= seqColor %>>
                                <td colspan="3" class="sm">
                                    <p style="font-family: monospace">
                                        <%
                                        String sequence_content =sequence.get_sequence().trim();
                                        int seqLength = sequence_content.length();
                                        int length_per_row = 60;
                                        int rows = (int) Math.ceil( ( (double) seqLength)/ ( (double) length_per_row ) );
                                        for ( int i = 0; i < rows; i++ ) {
                                            if (i > 0 ) {
                                                out.write( "<br>" );
                                            }
                                            out.write( sequence_content.substring( length_per_row * i,
                                            Math.min( length_per_row * ( i + 1 ), seqLength ) ) );
                                        }
                                        out.write( "  (Length:"+ seqLength+ ")" );
                                        %>
                                    </p>
                                </td>
                            </tr>
                        <% } %>
                        <% if ( sequence.get_ic_accession() != null ) { %>
                            <tr <%= seqColor %>  >
                                <th class="sm" align="left">GenBank Accession</th>
                                <td class="sm">&nbsp;&nbsp;</td>
                                <td class="sm"><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?db=nucleotide&val=<%= sequence.get_ic_accession() %>" target=_blank><%= sequence.get_ic_accession() %></a></td>
                            </tr>
                        <% } %>
                        <!-- ending display sequence detail-->
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- FLANKING SEQUENCE-->

    <% if ( object.get_flanking_sequence("flank")!=null ) { %>
        <tr <%= seqColor %> >
            <th class="sm" align="left">Flanking Sequence<%= DefinitionsLookup.createPopupLink("FlankingSequence","type") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm">
                <table>
                    <%
                    Iterator flanIter = object.get_flanking_sequence("flank");
                    while ( flanIter.hasNext() ) {
                        TfcFlankingSequence flank = (TfcFlankingSequence)flanIter.next();
                        %>
                        <tr><td class="sm">flank 1:<p style="font-family: monospace"><%= flank.get_sequence1_with_breaks("<br>") %></p></td></tr>
                        <tr><td class="sm">flank 2:<p style="font-family: monospace"><%= flank.get_sequence2_with_breaks("<br>") %></p></td></tr>
                    <% } %>
                </table>
            </td>
        </tr>
    <% }  %>

    <!-- PCR_primer -->

    <% if ( object.get_flanking_sequence("PCR_primer")!=null ) { %>
        <tr <%= seqColor %> >
            <th class="sm" align="left">PCR Primer</th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm">
                <table>
                    <%
                    Iterator flanIter = object.get_flanking_sequence("PCR_primer");
                    while ( flanIter.hasNext() ) {
                        TfcFlankingSequence flank = (TfcFlankingSequence)flanIter.next();
                        %>
                        <tr><td class="sm">primer 1:<p style="font-family: monospace"><%= flank.get_sequence1_with_breaks("<br>") %></p></td></tr>
                        <tr><td class="sm">primer 2:<p style="font-family: monospace"><%= flank.get_sequence2_with_breaks("<br>") %></p></td></tr>
                    <% } %>
                </table>
            </td>
        </tr>
    <% }  %>

    <!--ALLELE PROBE-->

    <% if ( object.get_flanking_sequence( "allele_probe" ) != null ) { %>
        <tr <%= seqColor %> >
            <th class="sm" align="left" valign="top">Allele Specific Probe</th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm">
                <table>
                    <%
                    if ( object.get_polymorphisms() != null ) {
                        Iterator polyIter = object.get_polymorphisms();
                        while ( polyIter.hasNext() ) {
                            PolymorphismObject polymorphism = (PolymorphismObject) polyIter.next();
                            if ( polymorphism.get_species_variants() != null &&
                                 polymorphism.get_flanking_sequence( "allele_probe" ) != null ) {
                                Iterator fvIter = polymorphism.get_flanking_sequence( "allele_probe" );
                                while ( fvIter.hasNext() ) {
                                    TfcFlankingSequence fs = (TfcFlankingSequence) fvIter.next();
                                    %>
                                    <tr>
                                        <td>probe (<%= polymorphism.get_species_variant_name() %>): </td>
                                        <td><p style="font-family: monospace"><%= fs.get_sequence1_with_breaks("<br>") %></p></td>
                                    </tr>
                                    <%
                                }
                            }
                        }
                    }
                    %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- GENETIC_MARKER_VECTOR -->

    <% if ( object.get_genetic_markers() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Genetic Markers<%= DefinitionsLookup.createPopupLink("GeneticMarker","class") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr valign="top" align="left">
                        <th class="sm">Name<%= DefinitionsLookup.createPopupLink("GeneticMarker","name") %></th>
                        <th class="sm">&nbsp; </th>
                        <th class="sm">Type<%= DefinitionsLookup.createPopupLink("GeneticMarker","type") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">Alias</th>
                        <th class="sm">&nbsp; </th>
                        <th class="sm">Chromosome <%= DefinitionsLookup.createPopupLink("GeneticMarker","chromosome") %></th>
                        <th class="sm">&nbsp; </th>
                        <th class="sm">Position</th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">Map</th>
                    </tr>
                    <%
                    Iterator markerIter = object.get_genetic_markers();
                    while ( markerIter.hasNext() ) {
                        GeneticMarker genetic_marker = (GeneticMarker) markerIter.next();
                        Iterator markerAssignIter = genetic_marker.getGlobalAssignments();
                        if ( markerAssignIter != null ) {
                            boolean first = true;
                            while ( markerAssignIter.hasNext() ) {
                                TfcGlobalAssignment globalAssignment = (TfcGlobalAssignment) markerAssignIter.next();
                                %>
                                <tr>
                                    <td class="sm">
                                        <% if ( first ) { %>
                                            <a href="/servlets/TairObject?accession=<%= "marker:" + genetic_marker.get_tair_object_id() %>"><%= EmptyTextConverter.convert( genetic_marker.get_name() ) %></a>
                                        <% } %>
                                        &nbsp;
                                    </td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                    <td class="sm">
                                        <% if ( first ) { %>
                                            <%= EmptyTextConverter.convert( genetic_marker.get_type() ) %>
                                        <% } %>
                                        &nbsp;
                                    </td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                    <td class="sm">
                                        <% if ( first ) { %>
                                            <%= EmptyTextConverter.convert( genetic_marker.get_alias_string() ) %>
                                        <% } %>
                                        &nbsp;
                                    </td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                    <td class="sm"><%=EmptyTextConverter.convert( genetic_marker.get_chromosome() ) %></td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                    <td class="sm"><%= globalAssignment.getFormatStartPosition() + "-" + globalAssignment.getFormatEndPosition() + " " + globalAssignment.getUnits() %></td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                    <td class="sm">
                                        <% if ( first && object.showMapViewerLink() ) { %>
                                            <a href="/servlets/mapper?value=<%= object.get_name() %>&action=search">mapviewer</a>
                                        <% } %>
                                        &nbsp;
                                    </td>
                                </tr>
                                <%
                                first = false;
                            }
                        }
                        else {
                        %>
                            <tr>
                                <td class="sm"><a href="/servlets/TairObject?accession=<%= "marker:" + genetic_marker.get_tair_object_id() %>"><%= EmptyTextConverter.convert( genetic_marker.get_name() ) %></a>&nbsp;</td>
                                <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                <td class="sm"><%= EmptyTextConverter.convert( genetic_marker.get_type() ) %>&nbsp;</td>
                                <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                <td class="sm"><%= EmptyTextConverter.convert( genetic_marker.get_alias_string() ) %>&nbsp;</td>
                                <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                <td class="sm"><%=EmptyTextConverter.convert( genetic_marker.get_chromosome() ) %></td>
                                <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                <td class="sm">&nbsp;</td>
                                <td class="sm" nowrap>&nbsp; &nbsp;</td>
                                <td class="sm">
                                    <% if ( object.showMapViewerLink() ) { %>
                                        <a href="/servlets/mapper?value=<%= object.get_name() %>&action=search">mapviewer</a>
                                    <% } %>
                                    &nbsp;
                                </td>
                            </tr>
                        <% } %>
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- MAP_LOCATIONS -->

    <% if ( object.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
        <jsp:include page="/jsp/includes/map_locations.jsp" flush ="true"/>
    <% } %>

    <!-- CREATE LINKS TO VIEWERS IF POSSIBLE -->

    <% if ( object.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Map Links<%= DefinitionsLookup.createPopupLink("Glossary","Map Links") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr>
                        <td class="sm">
                            <%= HTMLFactory.createSeqViewerLinks( "Sequence Viewer", object.get_seqviewer_type(), object.get_tair_object_id(), object.getAGIChromosomes(), "&nbsp;" ) %>
                            &nbsp;&nbsp;&nbsp;
                            <a href="/cgi-bin/gbrowse/arabidopsis/?name=<%= object.get_original_name()  %>">GBrowse</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- EXTERNAL_LINK -->

    <% if ( object.get_external_links() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">External Link<%= DefinitionsLookup.createPopupLink("Glossary","external link") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm">
                <table>
                    <%
                    Iterator iter = object.get_external_links();
                    while ( iter.hasNext() ) {
                        ExternalLinkObject elo = (ExternalLinkObject) iter.next();
                        String web_site_name = elo.get_web_site_name();
                        %>
                        <tr> <td class="sm"><%= elo.get_external_HTML_link( web_site_name ) %> </td> </tr>
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- GERMPLASM -->
    <%
         String self_url = "/servlets/TairObject?germdisp=all&type=polyallele&id=" + request.getParameter("id");
         int germs_size= object.getGermplasmCount();
         String germdisp = request.getParameter("germdisp");
         int disp_germs = java.lang.Math.min(germs_size,10);
         if(germdisp != null)
           disp_germs = germdisp.equals("all") ? germs_size : java.lang.Math.min(germs_size,Integer.parseInt(germdisp));
    %>
    <% if ( object.get_germplasms()!= null ) { %>
        <%  boolean polyHasStock = false; //true if at least one of germplasm has stock  %>
        <tr <%= myBgColor.toggleBgColor() %>>
            <th class="sm" valign="top" align="left">
               Germplasm<BR><%= DefinitionsLookup.createPopupLink("Germplasm","class") %><br>
               Showing <%=disp_germs%> of <%=germs_size%> entries<br>
               <%if(disp_germs != germs_size){%>
                 <a href="<%=self_url%>">Show all</a>
               <%}%>
            </th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <form action="/servlets/Order/current" method="POST"  onSubmit="orderFormWindow( this )">
                    <input type="hidden" name="state" value="addStock">
                    <table  cellpadding="2" border="0" class="germ_band">
                        <%
			boolean isFirstGermplasm = true;
                        Iterator germplasmIter = object.get_germplasms();
                        Germplasm germplasm = null;
                        int germ_count = 0;
                        while ( germplasmIter.hasNext() && germ_count++ < disp_germs) {
			%>
			<%
				if( false == isFirstGermplasm )
				{
			%>
				<tr><td colspan="9"><hr></td></tr>
			<%
				}
				isFirstGermplasm = false;
			%>
                        <tr align="left">
                            <th class="sm" align="left" valign="top">Name/Image<%= DefinitionsLookup.createPopupLink("Germplasm","name") %></th>
                            <th class="sm">&nbsp;</th>
                            <th class="sm" valign="top">Polymorphisms<%= DefinitionsLookup.createPopupLink("Glossary","associated polymorphism") %></th>
                            <th class="sm">&nbsp;</th>
                            <th class="sm" valign="top">Background</th>
                            <th class="sm">&nbsp;</th>
                            <th class="sm" valign="top">Stock Name<%= DefinitionsLookup.createPopupLink("Stock","name") %></th>
                            <th class="sm">&nbsp;</th>
                            <th class="sm" valign="top">Select</th>
                        </tr>
			<%
                            germplasm = (Germplasm) germplasmIter.next();
                            %>
                            <tr valign="top">
                                <td class="sm"> <a href="/servlets/TairObject?type=germplasm&id=<%= germplasm.get_tair_object_id() %>"> <%= germplasm.get_name() %></a>
		               <% if ( germplasm.hasImages() ) { 
		                      out.println( "<br>" );
 		                      Iterator imageIter = germplasm.getImages();
		                      TfcImage image = null;
		                      boolean firstImage = true;
		                      while ( imageIter.hasNext() ) { 
		                          image = (TfcImage) imageIter.next();
		                          if ( !firstImage ) {
		                              out.write( "<br>" );
		                          }
		                          firstImage = false;
		        %>
                	          <a href="/jsp/common/image.jsp?id=<%= image.get_image_id() %>&format=<%= image.getLinkSuffix() %>"><img src="/images/camera.gif" border="0"></a>
		            <% } %>
	               <% } %>
				</td>
                                <td class="sm" nowrap>&nbsp;</td>
                                <td class="sm"> <%= EmptyTextConverter.convert(germplasm.getPolymorphismsNameString()) %></td>
                                <td class="sm" nowrap>&nbsp;</td>
                                <td class="sm" nowrap> <%= EmptyTextConverter.convert (germplasm.get_species_variant_abbrev_name()) %> </td>
</td>
                                <% if ( !germplasm.hasStocks() ) {  %>
                                    <td class="sm" nowrap>&nbsp;</td>
                                    <td class="sm"> not an ABRC stock</td>
                                    <td class="sm" colspan = "2"> &nbsp;</td>
                                    </tr>
                                <% } else {
                                    polyHasStock = true;
                                    %>
                                    <td class="sm" nowrap>&nbsp;</td>
                                    <%
                                    Iterator iter = germplasm.getStocks();
                                    StockObject stock = null;
                                    boolean firststock =  true ;
                                    while ( iter.hasNext() ) {
                                        stock = (StockObject) iter.next();
                                        String stock_number = stock.get_name();
                                        if ( ! firststock) {
                                            %>
                                            <tr>
                                                <td class="sm" nowrap colspan = "5"> &nbsp;</td>
                                        <% } %>
                                        <td class="sm" align="left" valign="top"> <A href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"> <%= stock_number %></A> </td>
                                        <td class="sm" nowrap>&nbsp;</td>
                                        <td class="sm" align="left" valign="top" >
                                        <% if ( DataConstants.getAvailableStock().equals( stock.get_stock_availability_type() ) ) { %>
                                            <input type="checkbox" name="stock_number" value="<%= stock_number %>" >
                                        <% }
					   else {%>
					    not available
					<% }
					%>
                                        &nbsp;
                                        </td>
                                        <% firststock = false ;  %>
                                        </tr>
                                    <% } // end stock pool while loop  %>
                                <% } // end else %>

                        <%
			 // zero or more phenotypes per germplasm.
                          PhenotypeCollection ptc = germplasm.get_phenotypes();
                          if( ptc != null )
                          {
                              Iterator ptiter = ptc.iterator();
			%>
			  <TR>
	                  <TH class="sm" valign="top" align="left" colspan="9">
			<%
				if( ptc.size() > 1 )
				{
					%>Phenotypes<%= DefinitionsLookup.createPopupLink("Phenotype","class") %><%
				}
				else
				{
					%>Phenotype<%= DefinitionsLookup.createPopupLink("Phenotype","class") %><%
				}
			%>
			  </TH>
			  </TR>
                          <TR><TD class="sm" valign="top" colspan="9">
                          <ul>
			<%
			      if( ptc.size() == 0 )
			      {
                                 %>None available<%
			      }
			      else {
	                              while( ptiter.hasNext() )
	                              {
	                                  Phenotype pt = (Phenotype)ptiter.next();
        	                          TfcReference ref = pt.get_reference();
			                  %> <li><%= EmptyTextConverter.convert(pt.get_phenotype()) %> <%

	                                  if( ref == null || ref.get_reference_id() == null )
        	                          {
                                              %>Phenotype curated by ABRC. <%
                	                  }
                        	          else
                                	  {
                                          String type = pt.get_reference().get_reference_type();
                                          String label = null;
                               
                                          if (type.compareToIgnoreCase("publication") == 0) {
                                              label = pt.get_publication().getReferenceLabel();
                                          } else if (type.compareToIgnoreCase("communication") == 0) {
                                              label = pt.get_communication().getReferenceLabel();
                                          } else if (type.compareToIgnoreCase("analysis_reference") == 0) {
                                              label = pt.get_analysis_reference().getReferenceLabel();
                                          }
                                              %><a href="/servlets/TairObject?id=<%= ref.get_reference_id() %>&type=<%= ref.get_reference_type() %>"><%= EmptyTextConverter.convert(label).trim() %></a><%
	                                  }
                                          %> </li> <%
	                              } // end while
                              } // end else
                         %>
                          </ul>
                          </TD></TR>
                         <% } %>


                        <% }  %>

                        <% if (polyHasStock ) {  %>
                            <tr>
                                <td colspan="9" nowrap>
                                    <input type="submit" name="submit" value="Order from ABRC">
                                    &nbsp;
                                    <input type="reset" name="reset" value="Reset">
                                    &nbsp;
                                    <input type="button" value="Order from NASC"
                                    onClick="document.location.href='http://seeds.nottingham.ac.uk/Nasc/action.lasso?-response=/Nasc/information/ordering.lasso'"> (European Users)
                                </td>
                            </tr>
                        <% }  %>
                    </table>
                </form>
            </td>
        </tr>
    <% } %>


 <!-- annotation -->
 <% if ( object.get_annotations() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top" >
     <th class="sm" valign="top" align="left">Annotations<%= DefinitionsLookup.createPopupLink("Annotation","class") %></th>
     <td class="sm">&nbsp;</td>
     <td class="sm">
        <table>
         <tr align="left">
             <th class="sm">date</th>
             <th class="sm">by</th>
             <th class="sm">annotation</th>
         </tr>

      <%
         Iterator annotationIter = object.get_annotations();
         while ( annotationIter.hasNext() ) {
             AnnotationObject annotation = (AnnotationObject) annotationIter.next();
      %>

            <tr valign="top">
                <td class="sm"><%= EmptyTextConverter.convert( annotation.get_date_entered() )%></td>
                <td class="sm"><%= EmptyTextConverter.convert( annotation.get_annotation_source() ) %></td>
                <td class="sm" colspan="2"><%= EmptyTextConverter.convert( annotation.get_short_annotation() ) + " " + EmptyTextConverter.convert( annotation.get_long_annotation() ) %></td>
            </tr>
      <% } %>
         </table>
         </td>
      </tr>
  <% } %>

  <!--comment-->
 <%
    String commentColor =  myBgColor.toggleBgColor() ;
 %>
        <tr  <%=  commentColor  %>  valign="top">
           <th class="sm" align="left">Comments<%= DefinitionsLookup.createPopupLink("Glossary","Comments") %>(shows only the most recent comments by default)
           <form action="/servlets/updater" method="post">
             <input type="hidden" name="type" value="notepad">
             <input type="hidden" name="update_action" value="add">
             <input type="hidden" name="tair_object_id" value="<%= object.get_tair_object_id() %>">
             <input type="hidden" name="accession" value="<%= object.getAccession() %>" >

            <% String hideText = hidden ? "Show Comments" : "Hide Comments"; %>
            <% boolean hideOption = !hidden; %>
            <% String allText = showAll ? "Show Recent Comments" : "Show All Comments"; %>
            <% boolean showAllOption = !showAll; %>

           </th>

        <% if ( !hidden && object.hasNotepad() ) { %>
                <td class="sm">&nbsp;</td>
                <td class="sm">
                  <table cellpadding="2" width="100%">
                    <tr align="left">
                      <th class="sm">entered by</th>
                   <th class="sm">date</th>
                   <th class="sm">comment</th>
                 </tr>
                 <%
                   Iterator noteIter = object.getNotepad( showAll );
                   Notepad note = null;
                   while ( noteIter.hasNext() ) {
                      note = (Notepad) noteIter.next();
                      String display_note = note.get_comment() ;
                      if ( display_note.length() > 100) {
                          display_note =  TextConverter.truncateString( note.get_comment(), 100 );
                      }
                 %>
              <tr valign="top">
                           <td class="sm" nowrap><a href="/servlets/Community?action=view&type=person&communityID=<%= note.get_community_id() %>"><%= note.get_person_name() %></a></td>
                        <td class="sm" nowrap><%= TextConverter.dateToString( note.get_date_entered() ) %></td>
                           <td class="sm"><a href="/servlets/TairObject?type=notepad&id=<%= note.get_notepad_id() %>"><%= display_note  %></a></td>
                        </tr>

                 <% } %>
                </table>
              </td>


        <% } else { %>
           <td class="sm" colspan="2"> &nbsp;
          </td>
        <% } %>
      </tr>
      <tr <%= commentColor  %>  valign="top" >
          <td class="sm" colspan=3 align="center">
          <input type="submit" VALUE="Add My Comment">&nbsp;&nbsp;
          <input type="button" value="<%= hideText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= object.getAccession() %>&hideNote=<%= hideOption %>'">&nbsp;&nbsp;
          <input type="button" value="<%= allText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= object.getAccession() %>&showAllNote=<%= showAllOption %>'">
           </td>

      </tr>
   </form>


  <!-- attribution -->
     <% if ( object.get_attributions() != null ) { %>
            <tr <%= myBgColor.toggleBgColor() %> >
                <th class="sm" valign="top" align="left">Attribution<%= DefinitionsLookup.createPopupLink("Attribution","class") %></th>
                <td class="sm">&nbsp;</td>
                <td class="sm">
                 <table>
                     <tr align="left">
                        <th class="sm">type</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">name</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">date</th>
                     </tr>
                 <%
                   for ( BsAttribution attribution : object.get_attributions() ) {
                 %>
                     <tr>
                        <td class="sm"><%= EmptyTextConverter.convert( attribution.getType().getAttributionType() ) %></td>
                        <td class="sm" nowrap>&nbsp; &nbsp;</th>
                           <td class="sm"><a href=/servlets/Community?action=view&type=<%= attribution.getCommunityLinkType() %>&communityID=<%= attribution.getCommunityId().toString() %>><%= attribution.getCommunity().getName() %></a></td>
                        <td class="sm" nowrap>&nbsp; &nbsp;</th>
                           <td class="sm"><%= TextConverter.dateToString( attribution.getAttributionDate() ) %></td>
                       </tr>
                 <% } %>
                </table>
          </td>
          </tr>
        <% } %>

   <!-- communication -->
  <% if ( object.get_communication_references() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
      <th class="sm" valign="top" align="left">Communication</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm">
           <table>
            <tr align="left">
            <th class="sm">Name</th>
            <th class="sm" nowrap>&nbsp; &nbsp;</th>
            <th class="sm">Author Name</th>
            <th class="sm" nowrap>&nbsp; &nbsp;</th>
               <th class="sm">date</th>
          </tr>

        <%
             Iterator comIter = object.get_communication_references() ;
             while ( comIter.hasNext() ) {
                CommunicationObject  communication = (CommunicationObject)comIter.next();
        %>

          <tr>
             <td class="sm"><a href=/servlets/TairObject?type=communication&id=<%= communication.get_reference_id() %>><%= EmptyTextConverter.convert(communication.get_name() )%></a></td>
             <td class="sm" nowrap>&nbsp; &nbsp;</th>
                <td class="sm"><%=EmptyTextConverter.convert( communication.get_author_name() )%></td>
                <td class="sm" nowrap>&nbsp; &nbsp;</td>

                <td class="sm"><%= EmptyTextConverter.convert( communication.get_date() ) %></td>
             </tr>
         <% } %>
          </table>
      </td>
       </tr>
   <% } %>


  <!-- publication -->
  <% if ( object.get_publications() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
      <th class="sm" valign="top" align="left">Publication<%= DefinitionsLookup.createPopupLink("Publication","class") %></th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm">
           <table>
          <tr align="left">
            <th class="sm">title</th>
            <th class="sm" nowrap>&nbsp; &nbsp;</th>
            <th class="sm">source</th>
            <th class="sm" nowrap>&nbsp; &nbsp;</th>
               <th class="sm">date</th>
          </tr>

        <%
             Iterator pubIter = object.get_publications();
             while ( pubIter.hasNext() ) {
                PublicationObject publication = (PublicationObject) pubIter.next();
        %>

          <tr>
             <td class="sm"><a href=/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>><%= EmptyTextConverter.convert( publication.get_title() )%></a></td>
             <td class="sm" nowrap>&nbsp; &nbsp;</th>
                <td class="sm"><%=EmptyTextConverter.convert( publication.get_pub_source_name() )%></td>
                <td class="sm" nowrap>&nbsp; &nbsp;</td>

                <td class="sm"><%= EmptyTextConverter.convert( publication.get_year() ) %></td>
             </tr>
         <% } %>
          </table>
      </td>
       </tr>
   <% } %>

</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

