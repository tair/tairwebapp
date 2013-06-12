<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>

<%!
String pageName = "Germplasm Search";
String cssfile="/css/page/search.css";
%>

<% String currentDate = TextConverter.dateToString( new java.util.Date() ); %>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="512" />
</jsp:include>

<script language="javascript" src="/js/map.js"></script>

<script type="text/javascript">

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


// generic function to make any/other options mutually exclusive in submitted checkbox group
function checkAny( boxName, anyChecked ) {
    var checkboxGroup = eval( 'document.searchForm.' + boxName );
    var anyBox = eval( 'document.searchForm.' + boxName + '_any' );

    if ( anyChecked == true ) {
        for ( i = 0; i < checkboxGroup.length; i++ ) {
            checkboxGroup[ i ].checked = false;
         }
    } else {
        for ( i = 0; i < checkboxGroup.length; i++ ) {
             anyBox.checked = false;
         }
    }
}


// generic function to make any/other options mutually exclusive in submitted
// select menu. Return new value to set for flag that tracks "any" option's status for each menu
function checkSelectAny( selectMenu, anyFlag ) {
      // if another option was just selected, make sure "any" is no longer selected
      if ( anyFlag == true  ) {
          selectMenu.options[ 0 ].selected = false;
          anyFlag = false;

      // if any flag isn't set, check if "any" option is now selected.  if so,
      // make sure all other options are no longer selected 
      } else {
         if ( selectMenu.options[ 0 ].selected == true ) {
              for ( i = 1; i < selectMenu.length; i++ ) {
                 selectMenu.options[ i ].selected = false;
              }
              anyFlag = true;
          }
      }

      return anyFlag;
}


var mutagenAnyChecked = true;
function checkMutagenAny() {
      var selectMenu = document.searchForm.mutagen;
      mutagenAnyChecked = checkSelectAny( selectMenu, mutagenAnyChecked );
}

var insertionAnyChecked = true;
function checkInsertionAny() {
      var selectMenu = document.searchForm.insertion_type;
      insertionAnyChecked = checkSelectAny( selectMenu, insertionAnyChecked );
}

var constructAnyChecked = true;
function checkConstructAny() {
      var selectMenu = document.searchForm.construct_type;
      constructAnyChecked = checkSelectAny( selectMenu, constructAnyChecked );
}

var backgroundAnyChecked = true;
function checkBackgroundAny() {
      var selectMenu = document.searchForm.background;
      backgroundAnyChecked = checkSelectAny( selectMenu, backgroundAnyChecked );
}

// -->
</script>

<!--Content-->

<p class="mainheader">Germplasm Search<span style="float: right"><a href="/servlets/Search?type=ecotype&amp;search_action=new_search">Ecotype (Natural Variant) Search</a></span></p>
<p id="help">[<a href="/help/helppages/germsearch.jsp">Help</a>]</p>
<br/>
<p class="intro">
	This search form allows you to search for germplasms/seed stocks using
	a number of parameters. If you are looking for specific natural
	variants, please use our
	<a href="/servlets/Search?type=ecotype&amp;search_action=new_search">Ecotype
		(Natural Variant) Search</a> which allows you to narrow your search using
	collection details.
<p>

<form name="searchForm" method="get" action="/servlets/Search">
<input type="hidden" name="type" value="germplasm">
<input type="hidden" name="search_action" value="search">
<input type="hidden" name="pageNum" value="1">

<div id="searchbox">
    <span class="search_buttons">
        <input type="reset" name="reset" value="Reset" onClick="resetHelper()">
        <input type="submit" name="search" value="Submit Query">
    </span>
    
    <fieldset>
        <dl>
            <dt>
                Search for:
            </dt>
            <dd>
                <select name="germplasm_type">
                <option value="any" selected>any germplasm type</option>
                <option value="individual_line">individual lines</option>
                <option value="individual_pool">individual pools</option>
                <option value="set_of_lines">sets of lines</option>
                <option value="set_of_pools">sets of pools</option>
              </select>
            </dd>
        </dl>
    </fieldset>
    
    <fieldset>
    <legend>Search by Name, Phenotype or Stock Number</legend>
        <dl>
            <dt>
                Species:
            </dt>
            <dd>
             <%= HTMLFactory.createGermplasmTaxonSelect( "taxon", "1", false ) %>
            </dd>
            
            <dt>
                <select name="name_type_1" class="large_sel">
		  <option value="gene_name" selected>gene name (e.g. CULLIN 1, CUL1, AT4G02570)</option>
                  <option value="germplasm_stock_name">germplasm/stock name (e.g. CS28, SALK_007042)</option>
                  <option value="germplasm_phenotype">phenotype/description (e.g. round leaves)</option>
                  <option value="donor">donor (e.g. Koornneef, Syngenta)</option>
                  <option value="promoter">construct promoter name (e.g. 35S)</option>
                  <option value="reporter">construct reporter name (e.g. GFP)</option>
                  <option value="germplasm_all">all fields</option>
                </select>
            </dt>
            <dd>
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_1", DataConstants.SEARCH_STARTS, false, "medium_sel", "" ) %>
                <input type="text" name="name_1" size="12" maxlength="62"> and 
            </dd>
            
            <dt>
                <select name="name_type_2" class="large_sel">
		  <option value="gene_name">gene name (e.g. APETALA1, AP1, AT1G69120)</option>
                  <option value="germplasm_stock_name">germplasm/stock name (e.g. CS28, SALK_007042)</option>
                  <option value="germplasm_phenotype" selected>phenotype/description (e.g. round leaves)</option>
                  <option value="donor">donor (e.g. Koornneef, Syngenta)</option>
                  <option value="promoter">construct promoter name (e.g. 35S)</option>
                  <option value="reporter">construct reporter name (e.g. GFP)</option>
                  <option value="germplasm_all">all fields</option>
                </select> 
            </dt>
            <dd>
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_2", DataConstants.SEARCH_CONTAINS, false, "medium_sel", "" ) %>
                <input type="text" name="name_2" size="12" maxlength="62"> and
            </dd>
            
            <dt>
                <select name="name_type_3" class="large_sel">
		  <option value="gene_name">gene name (e.g. APETALA1, AP1, AT1G69120)</option>
                  <option value="germplasm_stock_name" selected>germplasm/stock name (e.g. CS28, SALK_007042)</option>
                  <option value="germplasm_phenotype">phenotype/description (e.g. round leaves)</option>
                  <option value="donor">donor (e.g. Koornneef, Syngenta)</option>
                  <option value="promoter">construct promoter name (e.g. 35S)</option>
                  <option value="reporter">construct reporter name (e.g. GFP)</option>
                  <option value="germplasm_all">all fields</option>
                  </select>
            </dt>
            <dd>
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_3", DataConstants.SEARCH_EXACT, false, "medium_sel", "" ) %>
                <input type="text" name="name_3" size="12" maxlength="62">
            </dd>
        </dl>
    </fieldset>
    
    <div id="results">
    
    <fieldset>
    <legend>Search by Allele</legend>
        
        <dl>
            <dt>
                mutant allele 1 (eg. stm-1)
            </dt>
            <dd>
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "allele_method_1", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                <input type="text" name="allele_name_1" size="12" maxlength="62">
                is 
                <select name="genotype_1" class="medium_sel">
                    <option value="any">any</option>
                    <option value="homozygous" selected >homozygous</option>
                    <option value="heterozygous">heterozygous</option>      
                    <option value="hemizygous">hemizygous</option>
                </select>
                and
            </dd>
            
            <dt>
                mutant allele 2 (eg. clv3-1)
            </dt>
            <dd>
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "allele_method_2", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                <input type="text" name="allele_name_2" size="12" maxlength="62">
                is 
                <select name="genotype_2" class="medium_sel">
                    <option value="any">any</option>
                    <option value="homozygous">homozygous</option>
                    <option value="heterozygous">heterozygous</option>      
                    <option value="hemizygous">hemizygous</option>
                </select>
                and 
            </dd>
            
            <dt>
               mutant allele 3 (eg. hst-7) 
            </dt>
            <dd>
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "allele_method_3", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                <input type="text" name="allele_name_3" size="12" maxlength="62">
                is 
                <select name="genotype_3" class="medium_sel">
                    <option value="any">any</option>
                    <option value="homozygous">homozygous</option>
                    <option value="heterozygous">heterozygous</option>      
                    <option value="hemizygous">hemizygous</option>
                </select>
            </dd>
        </dl>
    </fieldset>
    
    <fieldset>
    <legend>Restrict by Features</legend>
        
        <dl>
            <dt>
                Germplasm Features
            </dt>
            <dd>
                  <input type="checkbox" name="is_abrc_stock" value="true"> is ABRC stock<br>
                  <input type="checkbox" name="has_observable_phenotype" value="true"> has observable phenotype<br>
                  <input type="checkbox" name="has_polymorphisms" value="true"> has polymorphism<br>
                  <input type="checkbox" name="has_foreign_dna" value="true"> is transgenic<br>   
                  <input type="checkbox" name="is_mapping_strain" value="true"> is mapping/RI line<br>
                  <input type="checkbox" name="has_images" value="true"> has images<img src="/images/camera.gif" border="0"><br>
                  <input type="checkbox" name="is_natural_variant" value="true"> is ecotype <a href="/servlets/Search?type=ecotype&amp;search_action=new_search">Advanced Search</a>
            </dd>
            
            <dt>
                Chromosomal Constitution
            </dt>
            <dd>
                ploidy
                <select name="ploidy" class="tiny_sel">
                    <option value="" disabled="disabled" selected="selected">Any</option>
                    <option value="2n">2n</option>
                    <option value="not_2n">not 2n</option>
                </select>
                
                <br />
                
                <input type="checkbox" name="is_aneuploid" value="true"> is aneuploid
                
                <br />
                
                variant chromosome 
              <select name="aneuploid_chromosome" class="tiny_sel">
                <option value="" selected>Any</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>         
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </dd>
            
            <dt>
                Background Ecotype
                <br />(allows multiple selection)
            </dt>
            <dd>
                <%= HTMLFactory.createGermplasmSpeciesVariantSelect( "background", 8, "Any", "onChange=\"checkBackgroundAny()\"" ) %>
            </dd>
            
            <dt>
                Mutagen
                <br />(allows multiple selection)
            </dt>
            <dd>
                <select name="mutagen" multiple size="4" onChange="checkMutagenAny()">
                    <option value="any" selected>Any</option>
                    <option value="transposon insertion">transposon insertion
                    <option value="T-DNA insertion">T-DNA insertion
                    <option value="Agrobacterium transformation">Agrobacterium transformation
                    <option value="5-bromouracil">5-bromouracil (5-BU)
                    <option value="diepoxybutane">diepoxybutane (DEB)
                    <option value="ethylmethane sulfonate">ethylmethane sulfonate (EMS)
                    <option value="ethyl-nitrosourea">ethyl-nitrosourea (ENU)
                    <option value="gamma-rays">gamma-rays
                    <option value="ionizing radiation">ionizing radiation
                    <option value="fast neutrons">fast neutrons
                    <option value="nitroguanidine">nitroguanidine (NQ)
                    <option value="nitrosomethyl biuret">nitrosomethyl biuret (NMB)
                    <option value="nitrosomethyl urea">nitrosomethyl urea (NMU)
                    <option value="spontaneous">spontaneous
                    <option value="tissue culture">tissue culture
                    <option value="X-rays">X-rays
                    <option value="unknown">unknown
                  </select>
            </dd>
            
            <dt>
                Insertion Type
                <br />(allows multiple selection)
            </dt>
            <dd>
                <select name="insertion_type" multiple size="4" onChange="checkInsertionAny()">
                    <option value="any" selected>Any</option>
                    <option value="transposant">transposant</option>
                    <option value="T-DNA">T-DNA</option>
                    <option value="short">short</option>
                 </select>
            </dd>
            
            <dt>
                Transgene Construct Type
                <br />(allows multiple selection)
            </dt>
            <dd>
                <select name="construct_type" multiple size="4" onChange="checkConstructAny()">
                    <option value="any" selected>Any</option>
                    <option value="antisense"> antisense</option>
                    <option value="activation_tag"> activation tag</option>
                    <option value="cre-lox_recombination"> cre-lox recombination</option>
                    <option value="enhancer_trap"> enhancer trap</option>
                    <option value="gene_trap"> gene trap</option>
                    <option value="over-expression"> over-expression</option>
                    <option value="protein_fusion"> protein fusion</option>
                    <option value="promoter_reporter"> promoter reporter</option>
                    <option value="promoter_trap"> promoter trap</option>
                    <option value="RNAi"> RNAi</option>
                    <option value="simple_insert"> simple insert</option>
                  </select>
            </dd>
        </dl>
    </fieldset>
    
    <fieldset>
    <legend>Restrict by Date<a href="/help/helppages/clonesea.jsp#447634" class="img_link" onclick="popwin(this.href); return false;">
    <img src="/i/icon_help.gif" alt="help" /></a></legend>
        
        <dl>
            <dt>
                modified between
            </dt>
            <dd>
                <input type="text" name="restrict_date_from" size ="10" maxlength="10" value=""> and 
                <input type="text" name="restrict_date_to" size ="10" maxlength="10" value="<%= currentDate %>">(mm/dd/yyyy)
            </dd>
        </dl>
    </fieldset>
    
    <fieldset>
    <legend>Restrict by Map Location (of Associated Polymorphisms)<a href="/help/helppages/clonesea.jsp#447590" class="img_link" onclick="popwin(this.href); return false;">
    <img src="/i/icon_help.gif" alt="help" /></a></legend>
        
        <dl>
            <dt>
                Chromosome<a href="/help/helppages/genesear.jsp#447975" class="img_link" onclick="popwin(this.href); return false;">
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
                Map Type<a href="/help/helppages/clonesea.jsp#447600" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
            </dt>
            
            
            <dd> <select name="map_type" class="medium_sel" onchange="updateUnits(this.options[this.selectedIndex].value)">
                    <option value="" selected="selected">select</option>
                    <option value="AGI">AGI</option>
                </select>
            </dd>
         
            <dt>
                Range<a href="/help/helppages/genesear.jsp#447520" class="img_link" onclick="popwin(this.href); return false;">
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
                <select name="order">
                    <option value="germplasm_name" selected>germplasm name</option>
                    <option value="polymorphism_name">polymorphism name</option>
                    <option value="type">germplasm type</option>    
                    <option value="stock_number">stock number</option>
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
    


            
