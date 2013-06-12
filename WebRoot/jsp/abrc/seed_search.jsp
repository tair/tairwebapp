<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page errorPage = "/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Seed Search"; 
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<!-- Main content here -->
    <table width="100%" align="center">
	<tr>
	  <td><h1>Seed Stock Search</h1></td>
	</tr>
	<tr>
	  <td>
	  The Seed Stock Search has been phased out and replaced by our new <a href="/servlets/Search?action=new_search&type=germplasm">Germplasm Search</a> which includes more options for searching
including mutagen, genotype, and transgene construct type, among others. Please also try our new <a href="/servlets/Search?action=new_search&type=ecotype">Ecotype/Species Search</a> which allows you to find
Arabidopsis natural accessions as well as related genera and species based on collection details.

	</td>
	</tr>
      </table>
<!--
<p>
The SALK group sends their lines to ABRC within a few weeks of actual 
	  sequencing and posting their sequence data to their database.  SALK 
	  ships approximately 6000 lines at the end of every month, and ABRC is 
	  releasing these stocks within a few days of receipt.  If the line in 
	  which you are interested is unavailable, please search again during 
	  the second week of every month for newly released lines.
	  <p>
	    Typing information in two or more windows is
	    allowed and formulates a joint search for the two items with a logical"<i>and</i>."
	    <p>
	    Fields designated as "contains" will return results where the search field contain the entered search term; 
	    fields designated as "exact match only" will only return results where search field exactly
	    matches the entered search term.
	  </td>
	</tr>
      </table>
    
    <form method="POST" action="/servlets/SeedSearcher">
      <input type="hidden" name="action" value="search">

      <table border="0" cellpadding="3" cellspacing="0" align="center" bgcolor="#d5d9dd" width="100%">
	<tr>
	  <td colspan="4">&nbsp;</td>
	</tr>

	<tr>
	  <td align="right">Stock number:</td>
	  <td><input type="text" size="15" maxlength="30" name="stock_number"><br>(exact match only)</td>
	  <td align="right">Records/page:</td>
	  <td>
	    <select name="size">
	      <option value="25" selected>25</option>
	      <option value="50">50</option>
	      <option value="100">100</option>
	    </select>
	  </td>
	</tr>

	<tr>
	  <td align="right">Gene symbol:</td>
	  <td><input type="text" size="15" maxlength="20" name="gene_symbol"><br>(contains)</td>
	  <td align="right">Gene name:</td>
	  <td><input type="text" size="15" maxlength="20" name="gene_name"><br>(contains)</td>
	</tr>

	<tr>
	  <td align="right">Allele symbol:</td>
	  <td><input type="text" size="15" maxlength="20" name="allele_symbol"><br>(contains)</td>
	  <td align="right">Allele name:</td>
	  <td><input type="text" size="15" maxlength="20" name="allele_name"><br>(contains)</td>
	</tr>

	<tr>
	  <td align="right">Phenotype:</td>
	  <td><input type="text" size="15" maxlength="50" name="phenotype_1"><br>(contains)</td>
	  <td align="right">2nd Pheno. term:</td>
	  <td><input type="text" size="15" maxlength="50" name="phenotype_2"><br>(contains)</td>
	</tr>

	<tr>
	  <td align="right">Background:</td>
	  <td><input type="text" size="15" maxlength="30" name="background"><br>(contains)</td>
	  <td align="right">Type:  (mutant, lab, ecotype/field)</td>
	  <td>
	    <select name="type" >
	      <option value="" selected>Any type
	      <option value="mutant">mutant
	      <option value="lab">lab strain
	      <option value="field">ecotype/field strain 
	    </select> 
	  </td>
	</tr>

	<tr>
	  <td align="right">Donor name:</td>
	  <td><input type="text" size="15" maxlength="30" name="donor_name"><br>(contains)</td>
	  <td align="right">Donor stock number:</td>
	  <td><input type="text" size="15" maxlength="30" name="donor_stock_number"><br>(contains)</td>
	</tr>
	
	<tr>
	  <td align="right">Stock Release Date:</td>
	  <td colspan="3">
	    <input type="text" size="10" maxlength="10" name="from_date">
	    - <input type="text" size="10" maxlength="10" name="to_date"> (mm/dd/yyyy)
	  </td>
	</tr>

	<tr>
	  <td>&nbsp;</td>

	  <td>
	    <input type="submit" value="Submit"> <input type="reset" value="Reset">
	  </td>
	  <td colspan="2">&nbsp;</td>
	</tr>

</form>
      </table>
-->




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

