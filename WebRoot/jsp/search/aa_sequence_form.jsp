<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.utilities.*"
%>

<%!
String pageName = "TAIR Protein Search";
String cssfile="/css/page/search.css";
%>

<% request.setAttribute("helpfile", "/help/helppages/prosearch.jsp"); %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="509" />
</jsp:include>

<script language="text/javascript" src="/js/map.js"></script>

<!--
// reset form to initial values
function resetHelper() {
    document.searchForm.low_unit.options.length = 0;
    document.searchForm.low_unit.options[0] = new Option("none", "unit" );

    document.searchForm.high_unit.options.length = 0;
    document.searchForm.high_unit.options[0] = new Option("none", "unit" );

    // flag in map.js that tracks whether sort by option has been chosen or not
    sortSelected = false;

}


// flag to record whether "any" option is checked on structural class
// type menu
var classTypeAnyChecked = true

// function to ensure that "any" and other options are mutually
// exclusive on structural class type menu
function checkClassTypeAny( selectMenu, anyFlag ) {

      var selectMenu = document.searchForm.structural_class_type_id;

      // if another option was just selected, make sure "any" is no longer selected
      if ( classTypeAnyChecked == true  ) {
          selectMenu.options[ 0 ].selected = false;
          classTypeAnyChecked = false;

      // if any flag isn't set, check if "any" option is now selected.  if so,
      // make sure all other options are no longer selected 
      } else {
         if ( selectMenu.options[ 0 ].selected == true ) {
              for ( i = 1; i < selectMenu.length; i++ ) {
                 selectMenu.options[ i ].selected = false;
              }
              classTypeAnyChecked = true;
          }
      }

}

//-->
</script>

<!--Content-->

<form name="searchForm" method="post" action="/servlets/Search">
<input type="hidden" name="type" value="protein">
<input type="hidden" name="search_action" value="search">
<input type="hidden" name="pageNum" value="1">

<span class="mainheader">TAIR Protein Search</span>
<p id="help">[<a href="/help/helppages/prosearch.jsp">Help</a>]</p>

<p class="intro">
    This page allows you to search for protein information using a variety of
    parameters, including gene information, domain information, and genome
    position, among others. If you want to search for protein information in a
    batch mode using a list of locus names, please use our<a href="/tools/bulk/protein/index.jsp"> Bulk Protein Search
    </a> tool .
</p>

<div id="searchbox">
    <span class="search_buttons">
        <input type="reset" name="reset" value="Reset" onClick="resetHelper()">
        <input type="submit" name="search" value="Submit Query">
    </span>
    
    <fieldset>
        <dl>
            <dt>
                Search Name:<a href="/help/helppages/prosearch.jsp#name" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></A>
            </dt>
            <dd>
                <select name="name_type" class="sm_med_sel">
                  <option value="locus" selected>Locus name</option>
                  <option value="gene_symbol">Gene symbol</option>
                  <option value="gene_product">Product name</option>
                  <option value="gene_description">Gene description</option>
                  <!-- <option value="EC_number">EC number</option> -->
                  <!-- <option value="pir">PIR ID</option> -->
                  <!-- <option value="swissprot">SwissPROT ID</option> -->
                  <option value="genpept">GenPept ID</option>
                </select>
            
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "name_method", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                <input type="text" name="name" size="11" id="name" maxlength="50">
            </dd>
            
            <dt>
               Structural Class Type<a href="/help/helppages/prosearch.jsp#struc" class="img_link" onclick="popwin(this.href); return false;">
               <img src="/i/icon_help.gif" alt="help" /></a> 
               <br />(allows multiple selection)
            </dt>
            <dd>
                <select name="structural_class_type_id" size="8" multiple onChange="checkClassTypeAny()">
                  <option value="any" selected>Any</option>
                  <option value="a">All alpha proteins</option>
                  <option value="b">All beta proteins</option>
                  <option value="c">Alpha and beta proteins (a/b)</option>
                  <option value="d">Alpha and beta proteins (a+b)</option>
                  <option value="e">Multi-domain proteins (alpha and beta)</option>
                  <option value="f">Membrane and cell surface proteins and peptides</option>
                  <option value="g">Small proteins</option>
                </select>
            </dd>
        </dl>
    </fieldset>
    
    <div id="results">
    <fieldset>
    <legend>Search by Physio-chemical Properties<a href="/help/helppages/prosearch.jsp#prop" class="img_link" onclick="popwin(this.href); return false;">
    <img src="/i/icon_help.gif" alt="help" /></a></legend>
        <dl>
            <dt>
                <input type="checkbox" name="search_length" id="search_length" value="true"> length
            </dt>
            <dd>
                between <input type="text" name="length_from" size="4" value="0" maxlength="10" onChange="javascript:document.getElementById('search_length').checked='true';">
                and <input type="text" name="length_to" size="4" value="2000" maxlength="10" onChange="javascript:document.getElementById('search_length').checked='true';"> residues
            </dd>
            
            <dt>
                <input type="checkbox" name="search_MW" value="true" id="any"> calculated MW
            </dt>
            <dd>
                between <input type="text" name="calc_MW_from" size="4" value="0" maxlength="10" onChange="javascript:document.getElementById('any').checked='true';">
                and <input type="text" name="calc_MW_to" size="4" value="500" maxlength="10" onChange="javascript:document.getElementById('any').checked='true';"> kDa
            </dd>
            
            <dt>
                <input type="checkbox" name="search_pI" value="true" id="search_pI"> calculated PI
            </dt>
            <dd>
                between <input type="text" name="calc_pI_from" size="4" value="1" maxlength="10" onChange="javascript:document.getElementById('search_pI').checked='true';">
                and <input type="text" name="calc_pI_to" size="4" value="14" maxlength="10" onChange="javascript:document.getElementById('search_pI').checked='true';">
            </dd>
        </dl>
    </fieldset>
    
    <fieldset>
    <legend>Search by Domains<a href="/help/helppages/prosearch.jsp#domain" class="img_link" onclick="popwin(this.href); return false;">
    <img src="/i/icon_help.gif" alt="help" /></a></legend>
            <dt>
                contains
                <select name="domain_match_method_1" class="small_sel">
                  <option value="less than">&lt;</option>
                  <option value="greater than" selected>&gt;</option>
                  <option value="equals">=</option>
                </select>
            </dt>
            <dd>
                <input type="text" name="domain_match_1" size="2" maxlength="4">
                
                <select name="domain_type_1" class="small_sel">
                  <option value="interpro" selected>Interpro</option>
                  <option value="pfam">Pfam</option>
                  <option value="prints">Prints</option>
                  <option value="prosite">Prosite</option>
                  <option value="prodom">ProDom</option>
                  <option value="smart">SMART</option>
                  <option value="superfam">Superfamily</option>
                </select> 
                
                <select name="domain_element_1" class="small_sel">
                  <!-- <option value="description">domain description</option> -->
                  <option value="name" selected>name</option>
                  <option value="accession">identifier</option>
                </select> 
            
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "domain_method_1", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
            
                <input type="text" name="domain_name_1" size="8" maxlength="50">
            </dd>
            
            <dt>
                contains
                <select name="domain_match_method_2" class="small_sel">
                  <option value="less than">&lt;</option>
                  <option value="greater than" selected>&gt;</option>
                  <option value="equals">=</option>
                </select>
            </dt>
            <dd>
                <input type="text" name="domain_match_2" size="2" maxlength="4">
                
                <select name="domain_type_2" class="small_sel">
                  <option value="interpro">Interpro</option>
                  <option value="pfam" selected>Pfam</option>
                  <option value="prints">Prints</option>
                  <option value="prosite">Prosite</option>
                  <option value="prodom">ProDom</option>
                  <option value="smart">SMART</option>
                  <option value="superfam">Superfamily</option>
                </select>
                
                <select name="domain_element_2" class="small_sel">
                  <!-- <option value="description">domain description</option> -->.
                  <option value="name">name</option>
                  <option value="accession" selected>identifier</option>
                </select> 
                
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "domain_method_2", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                
                <input name="domain_name_2" type="text" size="8" maxlength="50"></td>
            </dd>
            
            <dt>
                contains
                <select name="domain_match_method_3" class="small_sel">
                  <option value="less than">&lt;</option>
                  <option value="greater than" selected>&gt;</option>
                  <option value="equals">=</option>
                </select>
            </dt>
            <dd>
                <input type="text" name="domain_match_3" size="2" maxlength="4">
                
                <select name="domain_type_3" class="small_sel">
                  <option value="interpro">Interpro</option>
                  <option value="pfam">Pfam</option>
                  <option value="prints" selected>Prints</option>
                  <option value="prosite">Prosite</option>
                  <option value="prodom">ProDom</option>
                  <option value="smart">SMART</option>
                  <option value="superfam">Superfamily</option>
                </select>
                
                <select name="domain_element_3" class="small_sel">
                  <!-- <option value="description">domain description</option> -->.
                  <option value="name">name</option>
                  <option value="accession" selected>identifier</option>
                </select>
                
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "domain_method_3", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                
                <input name="domain_name_3" type="text" size="8" maxlength="50">
            </dd>
        </dl>
    </fieldset>
    
    <fieldset>
    <legend>Restrict by Date<a href="/help/helppages/prosearch.jsp#time" class="img_link" onclick="popwin(this.href); return false;">
    <img src="/i/icon_help.gif" alt="help" /></a></legend>
        <dl>
            <dt>
                Last updated between
            </dt>
            <dd>
                <input type="text" name="restrict_date_from" size="10" maxlength="10"><font color="#666666">(mm/dd/yyyy)</font>
                &#160;&#160; and &#160;&#160; 
                <input type="text" name="restrict_date_to" size="10" maxlength="10"><font color="#666666">(mm/dd/yyyy)</font>
            </dd>
       </dl>
    </fieldset> 
    
   
    <fieldset>
    <legend>Restrict by Map Location<a href="/help/helppages/prosearch.jsp#loc" class="img_link" onclick="popwin(this.href); return false;">
    <img src="/i/icon_help.gif" alt="help" /></a></legend>
        <dl>
            <dt>
                Chromosome<a href="/help/helppages/prosearch.jsp#loc1" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
            </dt>
            <dd>
                <select name="chromosome" class="medium_sel">
                        <option value="" selected="selected">select</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="C">chloroplast genome</option>
                        <option value="M">mitochondrial genome</option>
                    </select>
            </dd>
            
            
            <dt>
                Map Type<a href="/help/helppages/prosearch.jsp#loc2" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
            </dt>
            
            
            <dd> <select name="map_type" class="medium_sel" onchange="updateUnits(this.options[this.selectedIndex].value)">
                    <option value="" selected="selected">select</option>
                    <option value="AGI">AGI</option>
                </select>
            </dd>
         
            <dt>
                Range<a href="/help/helppages/prosearch.jsp#loc3" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
            </dt>
            <dd>
                <select size="1" name="range_type" onChange="checkRange()" class="small_sel">
                  <option value="between" selected>between</option>
                  <option value="around">around</option>
                </select>
                <input type="text" name="low_range" size="10" maxlength="50">
                <select size="1" name="low_unit" class="tiny_sel">
                  <option selected>none</option>
                </select>
                and
                <input type="text" name="high_range" id="high_range" size="10" maxlength="50">
                <select size="1" name="high_unit" class="tiny_sel">
                  <option selected>none</option>
                </select>
            </dd>
            
        </dl>
    </fieldset>
    </div>
    
    <fieldset>
    <legend>Output Options</legend>
        <dl>
            <dt>
                number of records/page
            </dt>
            <dd>
                <select name="size">
                  <option value="25" selected>25
                  <option value="50">50
                  <option value="100">100
                  <option value="200">200
                </select>
            </dd>
            
            <dt>
                sort records by
            </dt>
            <dd>
                <select name="order" onChange="checkPosition()">
                  <option value="name" selected>name</option>
                  <option value="position">position</option>
                  <option value="locus">locus name</option>
                </select>
            </dd>
        </dl>
    </fieldset>
    
   
		<span class="search_buttons">
            <input type="reset" name="reset" value="Reset" onClick="resetHelper()" />
            <input type="submit" name="search" value="Submit Query" />
        </span>
  </div>
</form>


<!-- End of Content -->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
    


