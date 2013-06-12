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

<%

    TairObjectAnnotationDetail  object = (TairObjectAnnotationDetail) request.getAttribute("detail");
    
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

<TR>
   <TD colspan="3"><h1>Annotations for <%= object.getTairObjectTable() %>: <%=  object.getName() %> </h1></TD>

</TR>

<TR>
  <TD width="602" colspan=3> 

  <table border="0"  cellspacing="0" cellpadding="2"> 

  <tr <%= myBgColor.toggleBgColor() %>>   
      <TH class="sm" valign="top" align="left">Category<%= DefinitionsLookup.createPopupLink("KeywordType","keyword_type") %></TH>
      <TH class="sm">&nbsp;</TH>
      <TH class="sm" valign="top" nowrap>Relationship<br>Type<%= DefinitionsLookup.createPopupLink("RelationshipType","class") %></TH>
      <TH class="sm" nowrap>&nbsp; </TH>
      <TH class="sm" align="left" valign="top">Keyword<%= DefinitionsLookup.createPopupLink("Keyword","class") %></TH>
      <TH class="sm" nowrap>&nbsp; </TH>
    <% if (object.getTairObjectTable().equalsIgnoreCase("locus") ){  %>  
      <TH class="sm" align="left" valign="top">Gene Annotated</TH>
      <TH class="sm" nowrap>&nbsp; </TH>
    <%  }  %>  
      <TH class="sm" valign="top" nowrap align=left>
          <I>Evidence Code</I><%= DefinitionsLookup.createPopupLink("EvidenceDescription","evidence_code") %> <B>:</B>
	  <BR>Evidence Description<%= DefinitionsLookup.createPopupLink("EvidenceDescription","description") %><B>:</B>
	  <BR>Evidence With<%= DefinitionsLookup.createPopupLink("TairObjKeyEvidence","evidence_with") %><B>:</B>
	  <BR>Reference<%= DefinitionsLookup.createPopupLink("Reference","type") %>
      </TH>  
      <TH class="sm" nowrap>&nbsp;</TH>
      <TH class="sm" valign="top"  align=left nowrap>Annotated by/<BR>date</TH>
  </TR>

<% if(object.hasKeywords()){ 
     Iterator kwIter = object.getKeywords();
     TairObjectKeyword  kw = null;
     while ( kwIter.hasNext() ) {
         kw = (TairObjectKeyword)kwIter.next();
%>

 <tr <%= myBgColor.toggleBgColor() %>>  
     <TD class="sm" valign="top" align="left">
         <%= EmptyTextConverter.convert(kw.getKeywordDisplayType() ) %> &nbsp;
     </TD>
     <TD class="sm">&nbsp;</TD>
 <% if(kw.getRelationshipTypes() !=null ){ 
     Iterator relationIter = kw.getRelationshipTypes();
       String relation = null;
       boolean firstRelation = true;
       while ( relationIter.hasNext() ) {
         relation = (String)relationIter.next();
 %>
 <% if ( !firstRelation ){ %>
  <TR> <TD class="sm"  colspan=2> &nbsp; </TD>
 <% } %>  
       <TD class="sm" valign="top" align="left"><%=  relation  %></TD>
       <TD class="sm">&nbsp;</TD>
       <TD class="sm" valign="top" align="left">
         <A href="/servlets/TairObject?type=keyword&id=<%=kw.getKeywordID() %>"> 
         <%= EmptyTextConverter.convert( kw.getKeywordName()  ) %>
         </A>
       </TD>
       <TD class="sm">&nbsp;</TD>
   <% if (object.getTairObjectTable().equalsIgnoreCase("locus") ){  %>  
       <TD class="sm" valign="top" align="left">
	 <A href="/servlets/TairObject?accession=gene:<%=  kw.getTairObjectID() %>"> <%= EmptyTextConverter.convert( kw.getTairObjectName()  ) %></A>
       </TD>
       <TD class="sm">&nbsp;</TD>
   <% }  %>    
<%      TairObjKeyEvidence toke = null ;
        if (kw.getEvidences(relation)!=null ){
           Iterator tokeIter = kw.getEvidences(relation);
           boolean firstToke = true ;
           while ( tokeIter.hasNext() ) {
                toke = (TairObjKeyEvidence)tokeIter.next (); 
%>  

<%  if (!firstToke) {   %>
  <% if (object.getTairObjectTable().equalsIgnoreCase("locus") ){  %>      
    <TR <%= myBgColor.sameBgColor() %> > <TD class="sm"  colspan=8>&nbsp; </TD>
  <% }else { %>
     <TR <%= myBgColor.sameBgColor() %> > <TD class="sm"  colspan=6>&nbsp; </TD>
<% }} %>
      <TD  class="sm" valign="top" align="left"> 
            <I><%= EmptyTextConverter.convert(toke.get_evidence_code_full()) %></I>
             <B>:</B><BR> <%= EmptyTextConverter.convert(toke.get_evidence_description()) %><B>:</B><BR>
	   <% if (toke.get_evidence_with() != null ){ %>
	     <%= EmptyTextConverter.convert(toke.get_evidence_with() ) %><B>:</B><BR>
	   <%  }else { %>
            None<B>:</B><BR>
	   <% } %>
             <A href="/servlets/TairObject?type=<%= toke.getReferenceType() %>&id=<%= toke.getReferenceID() %>">
             <%= EmptyTextConverter.convert(toke.getReferenceLabel()) %>  </A>
      </TD>
      <TD class="sm">&nbsp;</TD>         
      <TD class="sm" valign=top align=left > 
             <%= EmptyTextConverter.convert(toke.get_annotated_by_name()).equals("") ? 
                       "" : EmptyTextConverter.convert(toke.get_annotated_by_name())+" / "
                        %>
                       <%= EmptyTextConverter.convert(toke.get_date_last_modified()) %>
      </TD>         
<% 
   firstToke = false;
   }
%> 
   </TR> 
<% }else{ %>
        <TD class="sm"  colspan=3>&nbsp; </TD>
   </TR>
<% } %>     

<%  firstRelation = false ;
   } // end  relationIter.hasNext() 
%>
   </TR>
 
<% } else { %>
      <TD class="sm"  colspan=7>&nbsp; </TD>
      </TR>
<% } %>
  

<%  }} %>
</table>
 </TD>
 </TR>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
