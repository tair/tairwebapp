<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>

<%!
String pageName = "Annotation Detail";
%>

<%  KeywordAllAnnotationDetail object = (KeywordAllAnnotationDetail) request.getAttribute("detail");
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" border="0" colspan="2" cellspacing="0" >

<TR>
   <TD colspan="3"><b><font size="+1">Annotations associated with term and it's children term: <%=  object.getKeywordName() %> </font></b></TD>

</TR>

<TR>
  <TD width="602" colspan=3> 
  <table border="0"  cellspacing="0" cellpadding="2"> 

  <% if(object.hasChildEvidences()  ){
     Iterator kecIter = object.getChildEvidences();
     TairObjKeyEvidenceCollection   kec = null;
      while ( kecIter.hasNext() ) {
         kec = (TairObjKeyEvidenceCollection)kecIter.next();
         Iterator keIter = kec.iterator();
         if(keIter !=null){
  %>

  <tr bgcolor=#D5D9DD >
      <tH colspan=11 align="left"> <% if ( kec.createdByKeyword() ) {  %>
	              <%=  kec.getCreatedByKeywordName()  %>
	   <%   String display = kec.getCountForCreatedByKeyword() > 1 ? "annotations": "annotation" ;   %>
	             ( <%=  kec.getCountForCreatedByKeyword()+ " " +display %> )
	              <% }  %> 
       </TH>
  </TR>
  
  <tr <%= myBgColor.sameBgColor() %> >   
      <TH class="sm" valign="top" align="left">Category<BR><%= DefinitionsLookup.createPopupLink("KeywordType","keyword_type") %></TH>
      <TH class="sm">&nbsp;</TH>
      <TH class="sm" valign="top" nowrap>Gene Associated</TH>
      <TH class="sm" nowrap>&nbsp; </TH>
      <TH class="sm" valign="top" nowrap>Locus Associated</TH>
      <TH class="sm" nowrap>&nbsp; </TH> 
      <TH class="sm" align="left" valign="top">Relationship Type<BR><%= DefinitionsLookup.createPopupLink("RelationshipType","relationship_type") %></TH>
      <TH class="sm" nowrap>&nbsp; </TH>
      <TH class="sm" valign="top" nowrap align=left>
           <I>Evidence Code</I><B><%= DefinitionsLookup.createPopupLink("EvidenceDescription","evidence_code") %>:</B><BR>
	    Evidence Description<%= DefinitionsLookup.createPopupLink("EvidenceDescription","description") %><B>:</B><BR>
	    Evidence With<%= DefinitionsLookup.createPopupLink("TairObjKeyEvidence","evidence_with") %><B>:</B><BR>
	    Reference<%= DefinitionsLookup.createPopupLink("Reference","class") %>
      </TH>  
      <TH class="sm" nowrap>&nbsp;</TH>
      <TH class="sm" valign="top"  align=left nowrap>Annotated by/<BR>date</TH>
  </TR>

  <TR <%= myBgColor.sameBgColor() %> ><td colspan=11><HR></td></TR>
  
<%      while( keIter.hasNext()){
               TairObjKeyEvidence ke =(TairObjKeyEvidence) keIter.next();
%>
 
  <tr <%= myBgColor.sameBgColor() %>>  
     <TD class="sm" valign="top" align="left">
             <%= EmptyTextConverter.convert( ke.get_keyword_type()) %>
     </TD>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm" valign="top"><A href="/servlets/TairObject?accession=gene:<%=EmptyTextConverter.convert( ke.get_tair_object_id()) %>">
        <%= EmptyTextConverter.convert(ke.get_tair_object_name()) %></A>
     </TD>
     <TD class="sm">&nbsp;</TD>
       <TD class="sm" valign="top">
    <% if (ke.hasLocus() ){   
      Iterator loci_iter =  ke.get_locus();
        while ( loci_iter.hasNext() ) { 
            TfcLocus locus = (TfcLocus)loci_iter.next();
     %>  
         <A href= "/servlets/TairObject?type=locus&id=<%= locus.get_locus_id() %>" >              
         <%= EmptyTextConverter.convert(locus.get_name()) %></A><BR>
  
     <% } %>
     <%}else{ %>
         &nbsp;   
     <% } %>
     </TD>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm" valign="top" align="left"><%=  EmptyTextConverter.convert(ke.get_relationship_type())  %></TD>
     <TD class="sm">&nbsp;</TD>
     <TD  class="sm" valign="top" align="left"> 
            <I><%= EmptyTextConverter.convert(ke.get_evidence_code_full()) %></I><B>:</B><BR>
             <%= EmptyTextConverter.convert(ke.get_evidence_description()) %><B>:</B><BR>
           <% if (ke.get_evidence_with() != null ){ %>
	     <%= EmptyTextConverter.convert(ke.get_evidence_with() ) %><B>:</B><BR>
	   <%  }else { %>
              None<B>:</B><BR>
	   <% } %>
             <A href="/servlets/TairObject?type=<%=EmptyTextConverter.convert( ke.getReferenceType()) %>&id=<%= EmptyTextConverter.convert(ke.getReferenceID()) %>">
             <%= EmptyTextConverter.convert(ke.getReferenceLabel()) %>  </A>
     </TD>
     <TD class="sm">&nbsp;</TD>         
     <TD class="sm" valign=top align=left > 
             <%= EmptyTextConverter.convert(ke.get_annotated_by_name()).equals("") ? 
                       "" : EmptyTextConverter.convert(ke.get_annotated_by_name())+" / "
                        %>
                       <%= EmptyTextConverter.convert(ke.get_date_last_modified()) %>
     </TD>         

 </TR>
 

 
<%  }} }}  %>

</table>
 </TD>
 </TR>
 
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
