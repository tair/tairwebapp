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


<% CompositeGeneClassSymbol symbol = new CompositeGeneClassSymbol() ;
 
   if (request.getAttribute("symbol")!=null){
      symbol = (CompositeGeneClassSymbol)(request.getAttribute("symbol") );
   }
   boolean is_mutant = symbol.get_has_mutant_phenotype().booleanValue();
%>

<table width="100%" border="0" colspan="2" cellspacing="0" >
 
 <TR>
   <td colspan=3>
   <b><font size="+1">
      <%= is_mutant?"Mutant Phenotype":"Gene Product" %> Symbol Registration</font></b>
   <br><BR>
   <B>Your proposed symbol is available for registration. Please provide the information requested. Fields marked with <font color=red>*</font> are required. <BR><BR>
   </TD>
 </TR>

 <!--symbol information-->
 <form action="/servlets/processor" name="registration" method=post>
 <input type=hidden name="type" value="genesymbol" >
 <input type=hidden name="update_action" value="save_symbol">
 <tr> <th align=left>&nbsp;</TH> 
     <th align=left >Registration Form </th>
     <th align=left>
        Example of Completed Form
     </Th>
 </tr>
 
 <tr><td colspan=3>&nbsp;</TD> </tr> 

 <tr> 
     <th align=left>Gene Class Symbol</th>
     <td> 
        
       <%=  EmptyTextConverter.convert (symbol.get_symbol() ) %>
       
      </TD>
      <TD><%= is_mutant?"[AN]":"[AGL]" %></TD>      
 </tr>
   
 <TR> 
     <Th align=left >Full Name<font color=red> *</font></TH>
     <TD>           
          <input type=text name="symbol_full_name" size=20
           value="<%= EmptyTextConverter.convert(symbol.get_descriptive_symbol()) %>">	  
     </TD>
     <TD><%= is_mutant? "[Angustifolia]":"[AGAMOUS-Like]" %></TD>    	
 </TR>

  <% if(is_mutant){ %>                 
 <TR> 
       <TH align=left nonwrap >Phenotype Class<font color=red> *</font></TH>
       <TD>           
             <TEXTAREA col=100  name="phenotype" size=300 rows=2  wrap=soft><%  if ( symbol.get_mutant_phenotype_class() !=null ){  %><%= TextConverter.dbToText( symbol.get_mutant_phenotype_class() ) %><% }  %></TEXTAREA> 
       </TD>
      <TD>[Altered Leaf Morphology]</TD> 	  
 </TR>
                    
 <% } %>

 <TR> 
     <Th align=left >Additional Details</TH>
     <TD>           
          <TEXTAREA col=100 name="description"  rows=3  wrap=soft size=300 ><%--
          --%><%  if ( symbol.get_description() !=null ){  %><%= TextConverter.dbToText( symbol.get_description() ) %><% }  %></TEXTAREA> 
     </TD>

     <TD><%= is_mutant? "[Narrow Leaves]":"[Sequence Similar to AGAMOUS]" %></TD> 
 </TR>

 
   <TR> 
        <TH align=left>Number of Associated Loci</TH>
        <TD>
           <select name="associated_loci_count">
	<% String loci = null;
	   loci = symbol.get_associated_loci_count() != null ? symbol.get_associated_loci_count():"";
	%> 
               <option value="single_locus" <%=  loci.equals("single_locus")?"selected":""  %> >
		  Symbol Describes 1 Gene

               <option value="multiple_loci" <%=  loci.equals("multiple_loci")? "selected":"" %> >
		  Symbol Describes >1 Gene
               <option value="number_of_loci_unknown"  default
	         <%=  loci.equals("number_of_loci_unknown")? "selected":"" %> >
		 Number of Genes Unknown 
           </select>
         </TD>
	 <TD>[Symbol Describes >1 Gene]</TD> 
  </TR>
       
  <TR> 
        <TH align=left>Reference Lab</TH>
        <TD>
	    <%=  EmptyTextConverter.convert(symbol.getAssociatedOrgName( ) )  %> 
        </TD>
	 <TD><input type=submit name=submit value="search lab">
	 	 (Other Lab)</TD> 
  </TR>
       

  <TR> 
        <TH align=left>Comments</TH>
        <TD> <TEXTAREA col=100 name="comments"  size=300 rows=3 wrap=soft><%  if ( symbol.get_comments() !=null ) {  %><%= TextConverter.dbToText( symbol.get_comments() ) %><%  }  %></TEXTAREA>
            
 </TD>
	
	<TD>[Space for Comments to Curators]
         </TD>  
  </TR>

  <TR> 
        <TD><input type="reset" name="reset" value="reset"></TD>
	<TD>&nbsp;</TD> 
        <TD><input type="submit" name="submit" value="submit"></TD>
  </TR>
  </form>

  </table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
