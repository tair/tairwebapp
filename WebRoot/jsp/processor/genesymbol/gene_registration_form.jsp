<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*,java.sql.*, org.tair.processor.genesymbol.* "
%>

<%!
String pageName = "Gene Registration";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<% CompositeGeneClassSymbol cgs = new CompositeGeneClassSymbol() ;
   TfcGeneClassSymbol symbol  = new TfcGeneClassSymbol();
   if (request.getAttribute("geneSymbol")!=null){
      cgs = (CompositeGeneClassSymbol)(request.getAttribute("geneSymbol") );
      //symbol = cgs.getGeneClassSymbol();
   }
%>

<table width="100%" border="1" colspan="2" cellspacing="0" >
 
 <TR>
   <td colspan=2>
   <b><font size="+1">Gene Symbol Registration</font></b>
   <br>
   <B>To registrate A Gene symbol,You will need to provide Gene Symbol related information, Associated Loci information, and associated Publication information. Please provide these information by in this page. </B> 
   </TD>
 </TR>

 <!--symbol information-->
 <form action="/servlets/processor">
 <input type=hidden name="type" value="genesymbol" >
 <input type=hidden name="update_action" value="add_symbol"> 

 <TR> 
   <TD valign=top>
        <B>Gene Symbol Information</B>
        <BR> <input type="submit" name="submit" value="SAVE" >
   </TD>

   <TD> 
     <table>
       <tr> 
          <th align=left>Symbol Name</th>
          <td> <input size=10 name="gene_symbol" 
               value="<%=  EmptyTextConverter.convert (symbol.get_symbol()) %>">
          </TD>
       </tr>
   
       <TR> 
        <Th align=left >Description</TH>
        <TD>           
          <TEXTAREA col=100 name="symbol_description" size=300 rows=2  wrap=soft><%--
          --%><%= EmptyTextConverter.convert( symbol.get_descriptive_symbol()) %></TEXTAREA>	  
        </TD>
       </TR>
     
       <TR> 
         <TH align=left>Chromosome</TH>
         <TD><SELECT NAME="chromosome">
           <OPTION VALUE="1">chromosome 1
           <OPTION VALUE="2">chromosome 2
           <OPTION VALUE="3">chromosome 3
           <OPTION VALUE="4">chromosome 4
           <OPTION VALUE="5">chromosome 5
           <OPTION VALUE="6">chromosome 6
           <OPTION VALUE="c">chloroplast
           <OPTION VALUE="m">mitochondria
          </SELECT>
         </TD>
       </TR>
      
       <TR> 
          <TH align=left >Mutant Phenotype/class</TH>
          <TD>           
             <TEXTAREA col=100  name="phenotype" size=300 rows=2  wrap=soft><%--
             --%><%= EmptyTextConverter.convert(symbol.get_mutant_phenotype_class())%></TEXTAREA>
          </TD>
       </TR>
                    
       <TR> 
        <TH align=left>Further comments</TH>
        <TD> <TEXTAREA col=100 name="comments"  size=300 rows=2><%--
             --%><%= EmptyTextConverter.convert( symbol.get_comments())%> 
             </TEXTAREA>	  
        </TD>
       </TR>
      </table></TD>
   </TR>
   </form>


  <!-- locus -->
  
  <form action="/servlets/processor">
  <input type=hidden name="type" value="genesymbol" >
  <input type=hidden name="update_action" value="search">
  <input type=hidden name="search_type" value="locus">

     
  <TR> <TD valign=top><B> Suggested Associated Loci</B>
      
       </TD>


       <TD align=center>
 <%  if( cgs.hasLoci()){ 
      GeneSymbolLocusCollection  loci = cgs.getLoci();
      for (int i = 0; i< loci.size(); i++){
         GeneSymbolLocus  locus= loci.elementAt(i);
%>

         <%= locus.get_name() %>

<% } } %>

<BR>
Add associated loci in the following input box, if mutiple, use ";" to seperate, then click "Add Loci" button, we will search throught tair loci database and bring a list of loci for your future selection       
       <BR> <input name = "locus_name" size="30" >  <input type=submit  name="sumbit" value ="Add Loci"> 
       </TD>
  </TR>
  
  
    
 </form> 

  <!-- publication -->
  
  <form action="/servlets/processor">
  <input type=hidden name="type" value="genesymbol" >
  <input type=hidden name="update_action" value="addpublication"> 

     
  <TR> <TD valign=top><B> Suggested Associated Publication</B>
       <br> <A href="/servlets/Search?action=new_search&type=publication"> Search Publication </A> 
       </TD>
       <TD align=center>Add Publication ID  in the following input box
         <BR> <input name = "publication" size="20" >
       </TD>
  </TR>
  
  
    
 </form>       

</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
