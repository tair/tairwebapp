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
String pageName = "Gene Registration";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
 <table width="100%" border="0" colspan="2" cellspacing="0" >
 <TR>
   <TD colspan=2>
   <b><font size="+1">Gene Symbol Registration</font></b>
   <br>
   <FORM method="post" action="/servlets/processor">
   <input type=hidden name="type" value="genesymbol" >
   <input type=hidden name="update_action" value="search">
   <input type=hidden name="search_type" value="symbol"> 

   On this page you can register a gene symbol with a mutant phenotype. Before proceeding, please read the guidelines on what is considered a mutant phenotype for these purposes. Please also read the <a href="/links/nomenclature.jsp">TAIR Gene Nomenclature</a> pages before submitting a gene. As the first step, we check if the new gene symbol is still available. Please input the gene symbol below.<br><br>
   </TD>
 </TR>
 
 

 <TR>
    <TD colspan=2>&nbsp;</TD>
 </TR>

 <TR> 
     <TD align=right>
        <B>Proposed Gene Symbol</B>
     </TD>
     <TD align=left>  
         <Input type="text" name="gene_symbol" size="10">
      </TD>
 </TR>

 <TR>
    <TD colspan=2>&nbsp;</TD>
 </TR>

<TR>
   <TD align=right valign=top>  
     Acceptable Search Terms:
   </TD>
   <TD align=left> ABA<br>
                   CH
   </TD>
 </TR>
  
 <TR> 
    <TD align=right valign=top>
       Not Acceptable:
    </TD>
    <TD>  AXR1<br>
          XXR1-1 <br>
          CH 6  
    </TD>
 </TR>

  <TR>
    <TD colspan=2>&nbsp;</TD>
  </TR>
		    
 <TR> 
    <TD align="center"> 
         <INPUT type="reset" name="reset" value="reset" >
    </TD>
    <TD align="center"> 
         <INPUT type="submit" name="submit" value="submit"
    </TD>
 </TR>
      
</form>  


</TABLE>

	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />





