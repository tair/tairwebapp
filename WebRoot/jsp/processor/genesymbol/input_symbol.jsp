<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*, java.math.*"
%>

<%!
String pageName = "Gene Registration";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
 <table width="100%" border="0" cellspacing="0" >
 <TR>
   <TD colspan=3>
   <b><font size="+1">Gene Class Symbol Registration</font></b>
   <br>
   <FORM method="post" action="/servlets/processor">
   <input type=hidden name="type" value="genesymbol" >
   <input type=hidden name="update_action" value="search">
   <input type=hidden name="search_type" value="symbol"> 

       Please enter your proposed symbol here. Symbols should be 3 letters, if possible, and should not include numbers or the prefix "At".  Click here for information on <a href="/portals/nomenclature/index.jsp"> Arabidopsis Nomenclature</A> and <A href="/portals/nomenclature/what_constitutes_a_phenotype_symbol.jsp">What Constitutes a Gene Class Symbol</A>.   <BR><BR>
       If you submitted a gene class symbol to TAIR before, you can view/edit your submitted symbols
       <A href = "/servlets/processor?type=genesymbol&update_action=view_symbol&from_user=y">here</A>
  
   </TD>
 </TR>
 
 <TR>
    <TD colspan=3>&nbsp;</TD>
 </TR>

 <TR><TD>&nbsp;</TD>  
     <TD align=left>
        <B>Click on the Appropriate Button:</B>
     </TD>
     <TD>&nbsp;</TD> 
 </TR>
 
 <TR><TD>&nbsp;</TD>  
     <TD align=left>  
         <Input type="radio" name="has_mutant" value="y"> Mutant Phenotype Symbol 
      </TD>
     <TD>&nbsp;</TD>   
 </TR>
 
 <TR><TD>&nbsp;</TD>   
      <TD align=left>  
         <Input type="radio" name="has_mutant" value="n"> Gene Product Symbol 
      </TD>
      <TD>&nbsp;</TD>
 </TR>


 <TR>
    <TD colspan=3>&nbsp;</TD>
 </TR>

 <TR>
     <TD>&nbsp;</TD> 
     <TD align=left>
        <B>Proposed Gene Class Symbol</B>
 <%
   String gene_symbol = "";
   
   if ( request.getAttribute("gene_symbol") !=null ){
     gene_symbol = (String) request.getAttribute("gene_symbol");
   }

%> 
    
         <Input type="text" name="gene_symbol" size="10" value=<%= gene_symbol %> >

      </TD>
       
      <TD>&nbsp;</TD> 
 </TR>

 <%  if (request.getAttribute("warnning") != null){  %>
  <TR>  <TD colspan=3> <font color=red>
    Your proposed gene symbol starts with 'AT'. If the 'AT' refers to
'Arabidopsis thaliana', we recommend that you omit this prefix, to be
consistent with Arabidopsis gene nomenclature guidelines. Please
modify the name here or click the 'submit' button again.<%--, if the AT
does not refer to Arabidopsis thaliana.--%>
     </font>
    <input type=hidden name = "been_warned" value="yes">
 <% } %>
 <TR>
    <TD colspan=3>&nbsp;</TD>
 </TR>

<TR>
   <TD>&nbsp;</TD> 
   <TD align=left valign=top>  
     Acceptable examples:
     ABA, CH, XYZ
   </TD>
   <TD>&nbsp;</TD> 
 </TR>
  
 <TR><TD>&nbsp;</TD>  
    <TD align=left valign=top >
       Unacceptable examples:
       CH6, AtXYZ
          
    </TD>
    <TD>&nbsp;</TD>  
 </TR>
 
 <TR><TD>&nbsp;</TD>
    <TD colspan=2>All characters will be converted into uppercase</TD>
 </TR>

 
 
 <TR>
    <TD colspan=3>&nbsp;</TD>
 </TR>

 <TR> <TD>&nbsp;</TD>
    <TD colspan=2>
  <% String email  = null;
   if (request.getAttribute("email") !=null){
      email = (String)(request.getAttribute("email") );
   }
   BigInteger submitter_id =null;
   if ( request.getAttribute("submitter_id") !=null ){
      submitter_id = (BigInteger) request.getAttribute("submitter_id");
   }
   %>
 <%  if (request.getAttribute("warnning") == null){  %>
   <% if (email == null ) { %>   
   We don't have your email address in our databse,
  <% } else{ %>
   We will use the following email address to send further information:<BR>
     
   <%= email %><BR>
   <% }  %>  
    If you prefer another email address, please click
    <A href='/servlets/Community?action=edit&type=person&communityID=<%= submitter_id %>' target="_blank"> Here</A>
     to modify your profile.<%-- and then click the "submit gene class symbol" link from the personal page to come back to this page --%> <BR>
   <% }  %>   
 </TD></TR>
 
 <TR>
    <TD colspan=3>&nbsp;</TD>
 </TR>
 
 <TR>
   <TD>&nbsp;</TD>  
    <TD align="left"> 
         <INPUT type="reset" name="reset" value="reset" >
    </TD>
    <TD align="left"> 
         <INPUT type="submit" name="submit" value="submit"
    </TD>
 </TR>
      
</form>  


</TABLE>

	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />





