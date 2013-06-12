<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!
String pageName = "Polymorphism/Allele";
String cssfile="/css/page/search.css";
String id="508";
%>

<%@page import="org.tair.utilities.*" %>

<SCRIPT LANGUAGE="JavaScript" src="/js/map.js"></SCRIPT>

<script language='JavaScript'>
var helpfile="/help/helppages/polyser.jsp";

<!--

function checkPolymorphismFeatures(checked_value) {
    // Enforce exclusion on the is_allele/is_not_allele pair.
    if (checked_value == "is_allele") {
        window.document.searchForm.is_not_allele.checked = false;
    }
    if (checked_value == "is_not_allele") {
        window.document.searchForm.is_allele.checked = false;
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

function resetHelper() {
    document.searchForm.low_unit.options.length = 0;
    document.searchForm.low_unit.options[0] = new Option("none", "unit" );

    document.searchForm.high_unit.options.length = 0;
    document.searchForm.high_unit.options[0] = new Option("none", "unit" );
}

// -->

</SCRIPT>

<!-- Start of template code (POST /HEAD) -->
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="508" />
</jsp:include>

<span class="mainheader">TAIR Polymorphism/ Allele Search</span>
<p id="help">[<a href="/help/helppages/polyser.jsp">Help</a>]</p>
<p class="intro">
    Polymorphisms and alleles may be searched by name, features, and/or
    location. Search for SNPs and visible polymorphisms (which were visible genetic markers) 
    by selecting "SNP" or "visible" under Polymorphism Type. Submitting the form 
    with no search criteria will return ALL polymorphisms in the database without restriction.
</p>

<FORM name="searchForm" method="get" action="<%=response.encodeURL("/servlet/Search")%>" id="searchForm">
    <p>
      <input type="hidden" name="type" value="polyallele">
      <input  type="hidden" name="action" value="search">
      <input  type="hidden" name="pageNum" value="1">
    </p>
    
    <div id="searchbox">
      <span class="search_buttons">
        <input type="reset" name="reset" value="Reset">
        <input type="submit" name="search" value="Submit Query">
        <input type="button" name="Expand All" value="Expand All" onclick="show_all('results'); return false;" class="largepad" />
        <input type="button" name="Collapse All" value="Collapse All" onclick="hide_all('results'); return false;" />
      </span>
      
    <fieldset>
        <legend>Search by Name or Phenotype<a href="/help/helppages/polyser.jsp#P.name" class="img_link" onclick="popwin(this.href); return false;">
        <img src="/i/icon_help.gif" alt="help" /></a></legend>
        <dl>
            <dt>
               <SELECT name="name_type1" class="large_sel">
                    <OPTION value="name" selected>name/symbol</OPTION>
                    <OPTION value="gene_name">gene name/symbol</OPTION> 
                    <OPTION VALUE="locus_name">locus name (e.g. At1g01030)</OPTION>
                    <OPTION VALUE="phenotype">phenotype (e.g. round leaves)</OPTION>
                    <OPTION VALUE="submitter">submitter last name</OPTION>                
                    <OPTION VALUE="submitter_org">submitter organization name</OPTION>
                    <OPTION value="accession">GenBank Accession</option>                
		        </SELECT> 
            </dt>
            <dd>
               <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method1", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %> 
               <INPUT type="text" name="term1" size="30"> AND
           </dd>

            <dt>
                <SELECT name="name_type2" class="large_sel">
                    <OPTION value="name">name/symbol</OPTION>
                    <OPTION value="gene_name">gene name/symbol</OPTION> 
                    <OPTION VALUE="locus_name" selected>locus name (e.g. At1g01030)</OPTION>                
                    <OPTION VALUE="phenotype">phenotype (e.g. round leaves)</OPTION>
                    <OPTION VALUE="submitter">submitter last name</OPTION>
                    <OPTION VALUE="submitter_org">submitter organization name</OPTION>
                    <OPTION value="accession">GenBank Accession</option>
                </SELECT>
            </dt>
            <dd>
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method2", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                <INPUT type="text" name="term2" size="30">
            </dd>
        </dl>
    </fieldset>
    
    <div id="results">
    
    <fieldset>
    <legend>Restrict by Features<a href="/help/helppages/polyser.jsp#features" class="img_link" onclick="popwin(this.href); return false;">
    <img src="/i/icon_help.gif" alt="help" /></a></legend>
        <dl>
            <dt>
                Polymorphism Features<a href="/help/helppages/polyser.jsp#P.features" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></A>
            </dt>
            <dd>
                <input type="checkbox" name="has_marker" value="true" onClick="checkPolymorphismFeatures('has_marker')">has associated genetic markers<br />
                <!--<input type="checkbox" name="has_observable_phenotype" value="true" onClick="checkPolymorphismFeatures('has_observable_phenotype')">has observable phenotype<br />-->
                <input type="radio" name="allele" value="is">&nbsp;Is allele<br />
                <input type="radio" name="allele" value="not">&nbsp;Is not an allele<br />
                <input type="radio" name="allele" value="any" checked>&nbsp;Any polymorphism
            </dd>
            
            <dt>
              Polymorphism Type<a href="/help/helppages/polyser.jsp#P.type" class="img_link" onclick="popwin(this.href); return false;">
              <img src="/i/icon_help.gif" alt="help" /></a>  
              <br /> (allows multiple selection)
            </dt>
            <dd>
               <SELECT name="poly_type" MULTIPLE size="4" onChange="checkSelectAll('poly_type')">   
                    <OPTION value="any" selected>Any</OPTION>
                    <OPTION value="substitution">substitution</OPTION>
                    <OPTION value="insertion">insertion</OPTION>
                    <OPTION value="deletion">deletion</OPTION>
                    <OPTION value="INDEL">INDEL</OPTION>
                    <OPTION value="SNP">SNP</OPTION>
                    <OPTION value="compound">compound</OPTION>
                    <OPTION value="digest_pattern">digest pattern</OPTION>
                    <OPTION value="PCR_product_length">PCR fragment length</OPTION>
                </SELECT> 
            </dd>
                
            <dt>
                Insertion Type<a href="/help/helppages/polyser.jsp#insertion_type" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
                <br /> (allows multiple selection)
            </dt>
            <dd>
                <SELECT name="insertion_type" MULTIPLE size="4" onChange="checkSelectAll('insertion_type')">
                    <OPTION value="any" selected>Any</OPTION>
                    <OPTION value="short">short</OPTION>
                    <OPTION value="T-DNA">T-DNA</OPTION>
                    <OPTION value="transposant">transposant</OPTION>
                </SELECT>
            </dd>
            
            <dt>
                Polymorphism Site<a href="/help/helppages/polyser.jsp#Poly_site" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
                <br /> (allows multiple selection)
            </dt>
            <dd>
                <SELECT name="poly_site" Multiple size ="4" onChange="checkSelectAll('poly_site')">
                    <OPTION selected value="any">Any</OPTION>
                    <OPTION value="intergenic_region">intergenic region</OPTION>
                    <OPTION value="exon">exon</OPTION>
                    <OPTION value="intron">intron</OPTION>
                    <OPTION value="splice_junction">splice junction</OPTION>
                </SELECT>
            </dd>
            
            <dt>
                Inheritance<a href="/help/helppages/polyser.jsp#inheritance" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></A>
            </dt>
            <dd>
                <SELECT name="inheritance" size="4" onChange="checkSelectAll('inheritance')">
                    <OPTION selected value="any">Any</OPTION>
                    <OPTION value="dominant">dominant</OPTION>
                    <OPTION value="incompletely_dominant">incompletely dominant</OPTION>
                    <OPTION value="recessive">recessive</OPTION>
                </SELECT>    
            </dd>
            
            <dt>
                Polymorphic Between<A href="/help/helppages/polyser.jsp#between" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></A>
            </dt>
            <dd>
                <SELECT name="ecoLow" class="med_large_sel">
                  <option value="any" selected>any</option>
                  <option value="ACHKARREN-2">Achkarren</option>
                  <option value="ARGENTAT">Ag</option>
                  <option value="ANTWERPEN">An</option>
                  <option value="ARABIDOPSIS LYRATA SSP. LYRATA ARLY 14">Arabidopsis lyrata ssp. lyrata</option>
                  <option value="BAYREUTH">Bay</option>
                  <option value="BENSHEIM">Be</option>
                  <option value="BILLABERGET">Bil</option>
                  <option value="BOECHERA DRUMMONDII">Boechera drummondii</option>
                  <option value="BORKY">Bor</option>
                  <option value="BRUNN">Br</option>
                  <option value="BURGHAUN">Bu</option>
                  <option value="BURREN">Bur</option>
                  <option value="C24">C24</option>
                  <option value="CIBC">CIBC</option>
                  <option value="COIMBRA">Co</option>
                  <option value="COLUMBIA">Col</option>
                  <option value="CATANIA">Ct</option>
                  <option value="CAPE VERDI ISLANDS">Cvi</option>
                  <option value="EDEN">Eden</option>
                  <option value="EDINBURGH">Edi</option>
                  <option value="EIFEL">Ei</option>
                  <option value="ENKHEIM">En</option>
                  <option value="ESTLAND">Est</option>
                  <option value="FABERGET">Fab</option>
                  <option value="ST. MARIA D. FEIRIA">Fei-0</option>
                  <option value="GABELSTEIN">Ga</option>
                  <option value="GOETTINGEN">Goettingen</option>
                  <option value="GY">Gy</option>
                  <option value="GLUECKINGEN">G&#146;</option>
                  <option value="HR">HR</option>
                  <option value="KAZAKHSTAN">KZ</option>
                  <option value="KASHMIR">Kas</option>
                  <option value="KINDALVILLE">Kin</option>
                  <option value="KNOX">Knox</option>
                  <option value="KONDARA">Kondara</option>
                  <option value="LANDSBERG ERECTA">Ler</option>
                  <option value="LIPOWIEC">Lip</option>
                  <option value="LLAGOSTERA">Ll</option>
                   <option value="LANDSBERG">Lnd</option>
                  <option value="LOVVIK">Lov</option>
                  <option value="LIPOVEC">Lp2</option>
                  <option value="LEZOUX">Lz</option>
                  <option value="MONTE">Mr</option>
                  <option value="MARKT">Mrk</option>
                  <option value="MOSCOW">Ms</option>
                  <option value="MARTUBA/CYRENAIKA">Mt</option>
                  <option value="MERZHAUSEN">Mz</option>
                  <option value="N">N</option>
                  <option value="NFA">NFA</option>
                  <option value="NIEDERZENZ">Nd</option>
                  <option value="NOSSEN">No</option>
                  <option value="NOORDWIJK">Nok</option>
                  <option value="OSTRA MOCKLO">Omo2</option>
                  <option value="OYSTESE">Oy</option>
                  <option value="PARK/NAPIER">Pna</option>
                  <option value="POPPELSDORF">Po</option>
                  <option value="PROAZA, ASTURIOS">Pro-0</option>
                  <option value="PRUDKA">Pu2</option>
                  <option value="RRS">RRS</option>
                  <option value="RANDAN">Ra</option>
                  <option value="RENNES">Rennes</option>
                  <option value="RLD">Rld</option>
                  <option value="RMX">Rmx</option>
                  <option value="SAN ELENO">Se</option>
                  <option value="SHAKDARA">Sha</option>
                  <option value="SORBO">Sorbo</option>
                  <option value="SPRATTEBODA">Spr1</option>
                  <option value="SQ">Sq</option>
                  <option value="SVEBOELLE">Sv</option>
                  <option value="T10">T10</option>
                  <option value="T104">T104</option>
                  <option value="T160">T160</option>
                  <option value="T20">T20</option>
                  <option value="T340">T340</option>
                  <option value="T350">T350</option>
                  <option value="T700">T700</option>
                  <option value="T81">T81</option>
                  <option value="T93">T93</option>
                  <option value="TAMMISARI">Tamm</option>
                  <option value="TOSSA DEL MAR">Ts</option>
                  <option value="TSU">Tsu</option>
                  <option value="ULLSTORP">Ull2</option>
                  <option value="UOD">Uod</option>
                  <option value="VANCOUVER">Vanc</option>
                  <option value="VARHALLARNA">Var2</option>
                  <option value="WARSAW">Wa</option>
                  <option value="WEININGEN">Wei</option>
                  <option value="WILNA">Wil</option>
                  <option value="WASSILEWSKIJA">Ws</option>
                  <option value="WIETZE">Wt</option>
                  <option value="YOSEMITE NAT. PARK">Yo</option>
                  <option value="ZDAREC">Zdr</option>
                </SELECT> and
                
                <SELECT name="ecoHi" class="med_large_sel">
                  <option value="any" selected>any</option>
                  <option value="ACHKARREN-2">Achkarren</option>
                  <option value="ARGENTAT">Ag</option>
                  <option value="ANTWERPEN">An</option>
                  <option value="ARABIDOPSIS LYRATA SSP. LYRATA ARLY 14">Arabidopsis lyrata ssp. lyrata</option>
                  <option value="BAYREUTH">Bay</option>
                  <option value="BENSHEIM">Be</option>
                  <option value="BILLABERGET">Bil</option>
                  <option value="BOECHERA DRUMMONDII">Boechera drummondii</option>
                  <option value="BORKY">Bor</option>
                  <option value="BRUNN">Br</option>
                  <option value="BURGHAUN">Bu</option>
                  <option value="BURREN">Bur</option>
                  <option value="C24">C24</option>
                  <option value="CIBC">CIBC</option>
                  <option value="COIMBRA">Co</option>
                  <option value="COLUMBIA">Col</option>
                  <option value="CATANIA">Ct</option>
                  <option value="CAPE VERDI ISLANDS">Cvi</option>
                  <option value="EDEN">Eden</option>
                  <option value="EDINBURGH">Edi</option>
                  <option value="EIFEL">Ei</option>
                  <option value="ENKHEIM">En</option>
                  <option value="ESTLAND">Est</option>
                  <option value="FABERGET">Fab</option>
                  <option value="ST. MARIA D. FEIRIA">Fei-0</option>
                  <option value="GABELSTEIN">Ga</option>
                  <option value="GOETTINGEN">Goettingen</option>
                  <option value="GY">Gy</option>
                  <option value="GLUECKINGEN">G&#146;</option>
                  <option value="HR">HR</option>
                  <option value="KAZAKHSTAN">KZ</option>
                  <option value="KASHMIR">Kas</option>
                  <option value="KINDALVILLE">Kin</option>
                  <option value="KNOX">Knox</option>
                  <option value="KONDARA">Kondara</option>
                  <option value="LANDSBERG ERECTA">Ler</option>
                  <option value="LIPOWIEC">Lip</option>
                  <option value="LLAGOSTERA">Ll</option>
                  <option value="LANDSBERG">Lnd</option>
                  <option value="LOVVIK">Lov</option>
                  <option value="LIPOVEC">Lp2</option>
                  <option value="LEZOUX">Lz</option>
                  <option value="MONTE">Mr</option>
                  <option value="MARKT">Mrk</option>
                  <option value="MOSCOW">Ms</option>
                  <option value="MARTUBA/CYRENAIKA">Mt</option>
                  <option value="MERZHAUSEN">Mz</option>
                  <option value="N">N</option>
                  <option value="NFA">NFA</option>
                  <option value="NIEDERZENZ">Nd</option>
                  <option value="NOSSEN">No</option>
                  <option value="NOORDWIJK">Nok</option>
                  <option value="OSTRA MOCKLO">Omo2</option>
                  <option value="OYSTESE">Oy</option>
                   <option value="PARK/NAPIER">Pna</option>
                  <option value="POPPELSDORF">Po</option>
                  <option value="PROAZA, ASTURIOS">Pro-0</option>
                  <option value="PRUDKA">Pu2</option>
                  <option value="RRS">RRS</option>
                  <option value="RANDAN">Ra</option>
                  <option value="RENNES">Rennes</option>
                  <option value="RLD">Rld</option>
                  <option value="RMX">Rmx</option>
                  <option value="SAN ELENO">Se</option>
                  <option value="SHAKDARA">Sha</option>
                  <option value="SORBO">Sorbo</option>
                  <option value="SPRATTEBODA">Spr1</option>
                  <option value="SQ">Sq</option>
                  <option value="SVEBOELLE">Sv</option>
                  <option value="T10">T10</option>
                  <option value="T104">T104</option>
                  <option value="T160">T160</option>
                  <option value="T20">T20</option>
                  <option value="T340">T340</option>
                  <option value="T350">T350</option>
                  <option value="T700">T700</option>
                  <option value="T81">T81</option>
                  <option value="T93">T93</option>
                  <option value="TAMMISARI">Tamm</option>
                  <option value="TOSSA DEL MAR">Ts</option>
                  <option value="TSU">Tsu</option>
                  <option value="ULLSTORP">Ull2</option>
                  <option value="UOD">Uod</option>
                  <option value="VANCOUVER">Vanc</option>
                  <option value="VARHALLARNA">Var2</option>
                  <option value="WARSAW">Wa</option>
                  <option value="WEININGEN">Wei</option>
                  <option value="WILNA">Wil</option>
                  <option value="WASSILEWSKIJA">Ws</option>
                  <option value="WIETZE">Wt</option>
                  <option value="YOSEMITE NAT. PARK">Yo</option>
                  <option value="ZDAREC">Zdr</option>
                </SELECT>
            </dd>
            <dt>
                Time Restriction<a href="/help/helppages/polyser.jsp#time_rest" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
            </dt>
            <dd>
                <INPUT type="checkbox" name="limit_time" value="60"> Search recent submissions ONLY (last 2 months)
            </dd>
                
            <dt>
                Transgene Construct Type<a href="/help/helppages/markerse.jsp#447722" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
                <br /> (allows multiple selection)
            </dt>
            <dd>
               <SELECT name="transgene" MULTIPLE size="4" onChange="checkSelectAll('transgene')">
                    <OPTION value="any" selected>Any</OPTION>
                    <OPTION value="activation_tag">activation tag</OPTION>
                    <OPTION value="enhancer_trap">enhancer trap</OPTION>
                    <OPTION value="gene_trap">gene trap</OPTION>     
                    <OPTION value="promoter_trap">promoter trap</OPTION>
                    <OPTION value="promoter_reporter">promoter reporter</OPTION>
                    <OPTION value="promoter_fusion">promoter fusion</OPTION>
                    <OPTION value="protein_fusion">protein fusion</OPTION>
                    <OPTION value="RNAi">RNAi</OPTION>
                    <OPTION value="antisense">antisense</OPTION>
                    <OPTION value="cre-lox_recombination">cre-lox recombination</OPTION>
                    <OPTION value="over-expression">over expression</OPTION>
                    <OPTION value="simple_insert">simple insert</OPTION>
                    <OPTION value="unknown">unknown</OPTION>
                </SELECT> 
            </dd>
                
            <dt>
                Mutagen<a href="/help/helppages/polyser.jsp#mutagen" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
                <br /> (allows multiple selection)
            </dt>
            <dd>
                <SELECT name="mutagen" MULTIPLE size="4" onChange="checkSelectAll('mutagen')">
                    <OPTION value="any" selected>Any</OPTION>
                    <OPTION value="transposon insertion">transposon insertion
                    <OPTION value="T-DNA insertion">T-DNA insertion
                    <OPTION value="Agrobacterium transformation">Agrobacterium transformation
                    <OPTION value="diepoxybutane">diepoxybutane (DEB)
                    <OPTION value="ethylmethane sulfonate">ethylmethane sulfonate (EMS)
                    <OPTION value="ethyl-nitrosourea">ethyl-nitrosourea (ENU)
                    <OPTION value="gamma rays">gamma-rays
                    <OPTION value="fast neutrons">fast neutrons
                    <OPTION value="nitrosomethyl urea">nitrosomethyl urea (NMU)
                    <OPTION value="tissue culture">tissue culture
                    <OPTION value="x-rays">x-rays
                    <OPTION value="unknown">unknown
	           	</SELECT>
            </dd>
        </dl>
    </fieldset>
    
    <fieldset>
    <legend>
        Restrict by Map Location<a href="/help/helppages/polyser.jsp#maplocation" class="img_link" onclick="popwin(this.href); return false;">
        <img src="/i/icon_help.gif" alt="help" /></a>
    </legend>
        <dl>
            <dt>
                Chromosome<a href="/help/helppages/polyser.jsp#chromosome" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
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
                Map Type<a href="/help/helppages/polyser.jsp#maptype" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>    
            </dt>
            <dd>
            <select name="map_type" id="map_type" onchange="updateUnits(this.options[this.selectedIndex].value)">
                <option value="" selected="selected">select</option>
                <option value="AGI">AGI</option>
                <option value="classical">Classical</option>
                <option value="RI">RI</option>
            </select>

            </dd>
            
            <dt>
                Range<a href="/help/helppages/polyser.jsp#range"class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a>
            </dt>
            <dd>
                <SELECT size="1" name="range_type" onChange="checkRange()" class="small_sel">
		          <option value="between" selected>between</option>
                  <option value="around">around</option>
                </SELECT>
                <INPUT type="text" name="low_range" size="8" >
                <SELECT size="1" name="low_unit" class="tiny_sel">
                  <OPTION>none</OPTION>
                </SELECT>
                and
                <INPUT type="text" name="high_range" id="high_range" size="8">
                <SELECT size="1" name="high_unit" class="tiny_sel">
                      <OPTION>none</OPTION>
                </SELECT> 
            </dd>
        </dl>
    </fieldset>
    </div>
    <fieldset>
      <legend>Output Options<a href="/help/helppages/polyser.jsp#output" class="img_link" onclick="popwin(this.href); return false;">
      <img src="/i/icon_help.gif" alt="help" /></a></legend>
        <dl>
            <dt>
                number of records/page
            </dt>
            <dd>
                <SELECT name="size">
                    <OPTION value="25" selected>25
                    <OPTION value="50">50
                    <OPTION value="100">100    
                    <OPTION value="200">200
                </SELECT>
            </dd>
            
            <dt>
                sort records by
            </dt>
            <dd>
                <SELECT name="order" onChange="checkPosition()">
                    <OPTION value="name" selected>name</OPTION>
                    <OPTION value="type">type</OPTION>
                    <OPTION value="position">position</OPTION>
                </SELECT>
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
               
