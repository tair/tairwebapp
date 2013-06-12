<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "Gene Search";
String cssfile="/css/page/search.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="503" />
</jsp:include>	
<script type="text/javascript" src="/js/map.js"></script>
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

    modelTypeAnyChecked = true;

}
// manually ensure that Any and other gene model type
// selections are mutually exclusive
var modelTypeAnyChecked = true;
function checkGeneModelTypeAny() {
      var selectMenu = document.searchForm.gene_model_type;

      // if another option was just selected, make sure "any" is no longer selected
      if ( modelTypeAnyChecked == true  ) {
          selectMenu.options[ 0 ].selected = false;
          modelTypeAnyChecked = false;

      // if any flag isn't set, check if "any" option is now selected.  if so,
      // make sure all other options are no longer selected
      } else {
         if ( selectMenu.options[ 0 ].selected == true ) {
              for ( i = 1; i < selectMenu.length; i++ ) {
                 selectMenu.options[ i ].selected = false;
              }
              modelTypeAnyChecked = true;
          }
      }
}
// If "any" is selected, deselect anything else that's been selected.
function checkSelectAll(selected_table) {
    select_box = document.searchForm[selected_table];

    if ( isAnyAndOnlyOneOtherSelected(select_box) ) {
        for(i = 0; i < select_box.options.length; i++) {
             option = select_box.options[i];
             if (option.selected && option.value=='any') {
                  option.selected=false;
             }
        }
        return;
    }

    if (! isAnySelected(select_box)) {
        return;
    }
    for (i = 0; i < select_box.options.length; i++) {
        option = select_box.options[i];
        if (option.value == 'any') {
             // do nothing
        }
        else {
            option.selected = false;
        }
    }
}

function isAnySelected(select_box) {
    options = select_box.options;
    for (i = 0; i < options.length; i++) {
        if (options[i].selected == true && options[i].value == 'any') {
            return true;
        }
    }
    return false;
}

function isAnyAndOnlyOneOtherSelected(select_box) {
    options = select_box.options;
    any = false;
    other = 0;
    for(i = 0; i < options.length; i++) {
        if (options[i].selected && options[i].value == 'any') {
            any = true;
        }
        else if(options[i].selected && options[i].value != 'any') {
            other++;
        }
    }
    return (any && other == 1);
}
-->
</script>
    
                <span class="mainheader">TAIR Gene Search</span>
		<p id="help">[ <a href="#">Help</a> ]</p>

		<p class="intro">Genes may be searched by name, keywords, features, and/or location. In TAIR, a 
		<a href="/help/helppages/generesu.jsp#GeneModel">Gene Model</a> is defined as any description of a gene product from a 
		variety of sources including computational prediction, mRNA sequencing, or genetic characterization. A 
		<a href="/help/helppages/generesu.jsp#Locus">locus</a> is defined as the genomic sequence corresponding to a transcribed unit
		(e.g. AT2G03340) in the genome. In TAIR, many gene models can exist for	a given locus, therefore a search for a gene may result 
		in multiple hits for the same gene name. </p>
                <form name="searchForm" method="post" action=<%=response.encodeURL("/servlets/Search")%> id="searchForm">		
              <input type="hidden" name="type" value="gene">
              <input type="hidden" name="action" value="search">
              <input type="hidden" name="pageNum" value="1">
		<div id="searchbox">
                    <span class="search_buttons">
			<input type="reset" name="reset" value="Reset" onClick="resetHelper()" />
                        <input type="submit" name="search" value="Submit Query" />
                    </span>
		<fieldset>
		<legend>Search by Name or Phenotype<a href="/help/helppages/genesear.jsp#447938" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a></legend>
			<dl>
				<dt>
					<label for="taxon">
						Species:
					</label>
				</dt>
				<dd>
						<select name="taxon" id="taxon" class="medium_sel">
							<option value="any">any</option>
							<option value="1" selected="selected">Arabidopsis thaliana</option>
							<option value="500500021">Arabidopsis lyrata</option>
						</select>
				</dd>
			</dl>

			<dl>
				<dt>
					<label for="name_type">
					<select name="name_type" id="name_type" class="medium_sel">
						<option value="name" selected>Gene name</option>
						<option value="description">description</option>
                        <OPTION value="phenotype">phenotype</OPTION>
						<option value="accession">GenBank accession</option>
						<option value="genbank_gi">GenBank gi</option>
					</select>
					</label>
			
				</dt>
				<dd>
					<select name="method" id="method" class="small_sel">
						<option value="1" >contains</option>
						<option value="2" selected="selected">starts with</option>
						<option value="3" >ends with</option>
						<option value="4" >exactly</option>

					</select>
                                        <input type="text" name="name" id="name" size="12" maxlength="62" class="box" /><br />
                                        <span class="small">(leaving the input box blank will retrieve all entries)</span>
				</dd>
                                <dt>
                                        <label for="is_obsolete">Include obsoleted genes</label>
                                </dt>
                                <dd>
                                        <input type="checkbox" name="is_obsolete" id="is_obsolete" value="true" />
                                </dd>
	
			</dl>
		</fieldset>
		<div id="results">
                <fieldset>
                                <legend>Search by Associated Keyword 
<a href="/help/helppages/genesear.jsp#key" class="img_link" onclick="popwin(this.href); return false;">
<img src="/i/icon_help.gif" alt="help" /></a></legend>
                        <dl>
                                <dt>
                                        <label for="keyword_term">Keyword Term<a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(623);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></label>
                                </dt>
                                
                                <dd>
                                        <select name="keyword_method" id="keyword_method" class="small_sel">

                                               <option value="1" >contains</option>
                                               <option value="2" selected="selected">starts with</option>
                                               <option value="3" >ends with</option>
                                               <option value="4" >exactly</option>
                                        </select>
					<input type="text" name="keyword_term" id="keyword_term" size="35" class="box" />
                                </dd>
                                <dt>
                                        <label for="extdb_id">GO/PO ID (exact match only)</label>
                                </dt>
                                <dd>
                                        <input type="text" name="extdb_id" id="extdb_id" size="35" class="box" />
                                </dd>
                                <dt>

                                        <label for="keyword_type">Keyword Type</label>
                                </dt>
                                <dd>
                                        <select name="keyword_type" id="keyword_type" multiple="multiple" size="4" onchange="checkSelectAll('keyword_type')">
                                              <option value="any" selected="selected">Any</option>
                                              <option value="func" >GO Molecular Function</option>
                                              <option value="proc">GO Biological Process</option>
                                              <option value="comp">GO Cellular Component</option>
                                              <option value="stru">Anatomy</option>
                                              <option value="grow">Developmental Stage</option>
                                        </select>
                                </dd>

                                <dt>
                                        <label for="evidence">Evidence<a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101506);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></label>

                                </dt>
                                <dd>
                                        <select name="evidence" id="evidence" multiple="multiple" size="4" onchange="checkSelectAll('evidence')">
                                              <option value="any" selected="selected">Any</option>
                                              <option value="IDA">inferred from direct assay</option>
                                              <option value="IEA">inferred from electronic annotation</option>
                                              <option value="IEP">inferred from expression pattern</option>

                                              <option value="IGI">inferred from genetic interaction</option>
                                              <option value="IMP">inferred from mutant phenotype</option>
                                              <option value="IPI">inferred from physical interaction</option>
                                              <option value="ISS">inferred from sequence or structural similarity</option>
                                              <option value="NAS">non-traceable author statement</option>
					      <option value="RCA">reviewed computational analysis</option>
					      <option value="IC">inferred by curator</option>
                                              <option value="ND">no biological data available</option>

                                              <option value="TAS">traceable author statement</option>
                                        </select>
                                </dd> 

			</dl>
		</fieldset>
		<fieldset>
					<legend>Restrict by Features <a href="/help/helppages/genesear.jsp#447227" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a></legend>

					<dl>
						<dt>
							<label for="gene_model_type">Gene Model Type<a href="/help/helppages/genesear.jsp" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a></label>
						</dt>
						<dd>
							<select name="gene_model_type" size="4" multiple="multiple" onchange="checkGeneModelTypeAny()">
								<option value="any" selected="selected">Any</option>
								<option value="pre_trna">pre trna</option>
                                <option value="transposable_element_gene">transposable element gene</option>
								<option value="protein_coding">protein coding</option>
								<option value="pseudogene">pseudogene</option>
								<option value="ribosomal_rna">ribosomal rna</option>
								<option value="small_nuclear_rna">small nuclear rna</option>
								<option value="small_nucleolar_rna">small nucleolar rna</option>
								<option value="miRNA">miRNA</option>
								<option value="other_rna">other rna</option>
								<option value="unknown">unknown</option>

							</select>
						</dd>
						
						<dt>
							<label for="gene_model_advanced">Advanced</label>
						</dt>
						<dd>
							<select name="gene_model_advanced" size="4" multiple="multiple">
								<option value="is_predicted">gene structure predicted</option>

								<option value="has_publication">has associated literature</option>
								<option value="is_sequenced">is sequenced</option>
								<option value="is_not_sequenced">is not sequenced</option>
								<option value="has_cDNA_or_EST">has cDNA or EST</option>
								<option value="has_full_length_cDNA">has full-length cDNA</option>
								<option value="is_genetic_marker">is genetic marker</option>

								<option value="is_on_a_map">is on a map</option>
							</select>
						</dd>
						<dt>
							<label for="limit_time">Time Restriction<a href="/help/helppages/genesear.jsp" class="img_link" onclick="popwin(this.href); return false;">
                            <img src="/i/icon_help.gif" alt="help" /></a></label><br />
						</dt>
                        <dd>

							<input type="checkbox" name="limit_time" value="60" />
                            only search last 2 months
						</dd>
					</dl>
				</fieldset>
				
				<fieldset>
					<legend>Restrict by Map Locations <a href="/help/helppages/genesear.jsp#447894" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a></legend>
					<dl>

						<dt>
							<label for="chromosome">Chromosome<a href="/help/helppages/genesear.jsp#447975" class="img_link" onclick="popwin(this.href); return false;">
                            <img src="/i/icon_help.gif" alt="help" /></a></label>
						</dt>
						<dd>
							<select name="chromosome" id="chromosome">
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
							<label for="map_type">Map Type<a href="/help/helppages/genesear.jsp#447600" class="img_link" onclick="popwin(this.href); return false;">
                            <img src="/i/icon_help.gif" alt="help" /></a></label>
						</dt>
						<dd>
							<select name="map_type" id="map_type" onchange="updateUnits(this.options[this.selectedIndex].value)">
								<option value="" selected="selected">select</option>
								<option value="physical">Physical</option>
								<option value="classical">Classical</option>

								<option value="AGI">AGI</option>
							</select>
						</dd>
						<dt>
							<label for="range_type">Range<a href="/help/helppages/genesear.jsp#447520" class="img_link" onclick="popwin(this.href); return false;">
                            <img src="/i/icon_help.gif" alt="help" /></a></label>				
						</dt>
                        <dd>
							<select name="range_type" onchange="checkRange()" class="small_sel">

								<option value="between" selected="selected">between</option>
								<option value="around">around</option>
							</select>

							<input type="text" name="low_range" maxlength="30" class="tiny_sel" />
							
							<select size="1" name="low_unit" class="small_sel">
								<option selected="selected">none</option>
							</select>

							
							and
							
							<input type="text" name="high_range" id="high_range" maxlength="30" class="tiny_sel" />
							
							<select size="1" name="high_unit" class="small_sel">
								<option selected="selected">none</option>
							</select>
						</dd>
					</dl>
				</fieldset>
				</div>
				<fieldset>
					<legend>Output Options<a href="/help/helppages/genesear.jsp#out1" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a></legend>
					<dl>
						<dt>
							<label for="">Number of records per page</label>
						</dt>
						<dd>

							<select name="size">
								<option value="25" selected="selected">25</option>
								<option value="50">50</option>
								<option value="100">100</option>
								<option value="200">200</option>
							</select>
						</dd>

						
						<dt>
							<label for="map_type">Sort records by</label>
						</dt>
						<dd>
							<select name="order" onchange="checkPosition()">
								<option value="name" selected="selected">name</option>
								<option value="position">position</option>

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
        
        
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
