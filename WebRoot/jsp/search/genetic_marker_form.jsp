<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!
String pageName = "Genetic Marker";
String cssfile="/css/page/search.css";
%>

<%@page import="org.tair.utilities.*" %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="505" />
</jsp:include>

<SCRIPT type="text/javascript" src="/js/map.js"></SCRIPT>
<SCRIPT type="text/javascript">

var helpfile="/help/helppages/markerse.jsp";
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

// function to make any/other options mutually exclusive in marker type checkbox group
// "is_PCR" checkbox not actually part of this group, but appears there -- manually check it
// each time
function checkAny( anyChecked ) {
    var checkboxGroup = document.searchForm.marker_type;
    var anyBox = document.searchForm.marker_type_any;
    var pcrBox = document.searchForm.is_PCR;

    if ( anyChecked == true ) {
        for ( i = 0; i < checkboxGroup.length; i++ ) {
            checkboxGroup[ i ].checked = false;
         }
         pcrBox.checked = false;
    } else {
        for ( i = 0; i < checkboxGroup.length; i++ ) {
             anyBox.checked = false;
         }
    }
}

// -->
</SCRIPT>

<!--Content-->

<span class="mainheader">TAIR Marker Search</span>
<p id="help">[<a href="/help/helppages/markerse.jsp">Help</a>]</p>
<p class="intro">Markers may be searched by name, features, and/or location. Submitting the form with no 
search criteria will return ALL genetic markers in the database without restriction.</p>

<form name="searchForm" method="post" action="<%=response.encodeURL("/servlets/Search")%>" id="searchForm">
  <p>
      <input type="hidden" name="type" value="marker">
      <input type="hidden" name="action" value="search">
      <input type="hidden" name="pageNum" value="1">
  </p>
  <div id="searchbox">
    <span class="search_buttons">
        <input type="reset" name="reset" value="Reset" onClick="resetHelper()">
        <input type="submit" name="search" value="Submit Query">
    </span>

    <fieldset>
        <legend>Search by Name</legend>
        <dl>
            <dt>
                <select name = "name_type" class="medium_sel">
                  <option value="marker"> Marker Name</option>
                  <option value="gene"> Gene Name</option>
                  <option value="locus"> Locus Name</option>
                  </select>
                   <%-- <a href="/help/helppages/markerse.jsp#447213">Marker Name 
                     </a>:<br>&nbsp;<br><br></b> --%>
            </dt>
            <dd>
            <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
            <input type="text" name="name" size="26" maxlength="50" id="markerName"><br />(leaving the input box blank will retrieve all entries)
            </dd>
        </dl>
    </fieldset>
   
    <div id="results">
    <fieldset>    
        <legend>Restrict by Features</legend>
            <dl>
                <dt>
                    Genetic Marker<a href="/help/helppages/markerse.jsp#447589" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a><br />
                    <input type="checkbox" name="marker_type_any" value="true" onClick="checkAny( true )" checked>
                    Any<a href="/help/helppages/markerse.jsp#447808" class="img_link" onclick="popwin(this.href); return false;">
                    <img src="/i/icon_help.gif" alt="help" /></a><br />
            
                    <input type="checkbox" name="is_PCR" value="true" onClick="checkAny( false)">
                    All PCR<a href="/help/helppages/markerse.jsp#447698" class="img_link" onclick="popwin(this.href); return false;">
                    <img src="/i/icon_help.gif" alt="help" /></a><br />
            
                    <input type="checkbox" name="marker_type" value="CAPS" onClick="checkAny( false)">
                    CAPS<a href="/help/helppages/markerse.jsp#447704" class="img_link" onclick="popwin(this.href); return false;">
                    <img src="/i/icon_help.gif" alt="help" /></a><br />
            
                    <input type="checkbox" name="marker_type" value="SSLP" onClick="checkAny( false)">
                    SSLP<a href="/help/helppages/markerse.jsp#447710" class="img_link" onclick="popwin(this.href); return false;">
                    <img src="/i/icon_help.gif" alt="help" /></a> <br />
            
                    <input type="checkbox" name="marker_type" value="AFLP" onClick="checkAny( false)">
                    AFLP<a href="/help/helppages/markerse.jsp#447716" class="img_link" onclick="popwin(this.href); return false;">
                    <img src="/i/icon_help.gif" alt="help" /></a><br />
            
                    <input type="checkbox" name="marker_type" value="RFLP" onClick="checkAny( false)">
                    RFLP<a href="/help/helppages/markerse.jsp#447722" class="img_link" onclick="popwin(this.href); return false;">
                    <img src="/i/icon_help.gif" alt="help" /></a><br />
            
                    <input type="checkbox" name="marker_type" value="RAPD" onClick="checkAny( false)">
                    RAPD<a href="/help/helppages/markerse.jsp#447728" class="img_link" onclick="popwin(this.href); return false;">
                    <img src="/i/icon_help.gif" alt="help" /></a><br />
            
                    <input type="checkbox" name="marker_type" value="hyb_based" onClick="checkAny( false)">
                    Hybridization Based<a href="/help/helppages/markerse.jsp#447734" class="img_link" onclick="popwin(this.href); return false;">
                    <img src="/i/icon_help.gif" alt="help" /></a>
                </dt>
                
                <dt style="clear: none;">
                     Polymorphic Between<a href="/help/helppages/markerse.jsp#447786" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a><br />
                    Ecotype 
                    <select name="low_ecotype" class="tiny_sel">
                      <option value="any" selected>any</option>
                      <option value="Ws">Ws</option>
                      <option value="Nd">Nd</option>
                      <option value="No">No</option>
                      <option value="Rld">Rld</option>
                      <option value="Ler">Ler</option>
                      <option value="Col">Col</option>
                      <option value="C24">C24</option>
                      <option value="Cvi">Cvi</option>
                      <option value="En">En</option>
                      <option value="Be">Be</option>
                    </select>
                    and<br>
                    Ecotype 
                    <select name="high_ecotype" class="tiny_sel">
                      <option value="any" selected>any</option>
                      <option value="Ws">Ws</option>
                      <option value="Nd">Nd</option>
                      <option value="No">No</option>
                      <option value="Rld">Rld</option>
                      <option value="Ler">Ler</option>
                      <option value="Col">Col</option>
                      <option value="C24">C24</option>
                      <option value="Cvi">Cvi</option>
                      <option value="En">En</option>
                      <option value="Be">Be</option>
                    </select>
                </dt>
                
                <dt style="clear: none;">
                    Time Restriction<a href="/help/helppages/markerse.jsp" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a><br />
                    <input type="checkbox" name="limit_time" value="60">
                    only search last 2 months
                </dt>
            </dl>
        </fieldset>
        
        <fieldset>
        <legend>Restrict by Map Location<a href="/help/helppages/markerse.jsp#447590" class="img_link" onclick="popwin(this.href); return false;">
        <img src="/i/icon_help.gif" alt="help" /></a></legend>
            <dl>
                
                <!--<dt><a href="/help/helppages/markerse.jsp#447904">Chromosome</a><br />
                    <input type="radio" name="chromosome" value="1"> 1<br />
                    <input type="radio" name="chromosome" value="2"> 2<br />
                    <input type="radio" name="chromosome" value="3"> 3<br />
                    <input type="radio" name="chromosome" value="4"> 4<br />
                    <input type="radio" name="chromosome" value="5"> 5<br />
                    <input type="radio" name="chromosome" value="C">chloroplast genome<br />
                    <input type="radio" name="chromosome" value="M">mitochondrial genome
                </dt>
                -->
                
                <dt>Chromosome<a href="/help/helppages/markerse.jsp#447904" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a></dt>
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
                <!--
                <dt>
                    <a href="/help/helppages/markerse.jsp#447600">Map Type</a><br />
                    <input type="radio" name="map_type" value="AGI" onClick="updateUnits( 'AGI' )">AGI<br/>
                    <input type="button" name="Expand All" value="Expand All" onclick="show_all('results'); return false;" class="largepad" />
                    <input type="button" name="Collapse All" value="Collapse All" onclick="hide_all('results'); return false;" />
                </dt>
                -->
                
                <dt>Map Type<a href="/help/helppages/markerse.jsp#447600" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a></dt>
                <dd>
                    <select name="map_type" class="medium_sel" onchange="updateUnits(this.options[this.selectedIndex].value)">
                        <option value="" selected="selected">select</option>
                        <option value="AGI">AGI</option>
                        <option value="RI">RI</option>
                        <option value="classical">Classical</option>
                    </select>
                </dd>
                
                
                
                <dt>Range<a href="/help/helppages/markerse.jsp#447520" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a></dt>
                <dd>
                    <select size="1" name="range_type" onChange="checkRange()" class="small_sel">
                        <option value="between" selected>between</option>
                        <option value="around">around</option>
                    </select>
                    
                    <input type="text" name="low_range" size="10" maxlength="50">
                        <select size="1" name="low_unit" class="tiny_sel">
                          <option>none</option>
                        </select>
                        and
                        <input type="text" name="high_range" id="high_range" size="10" maxlength="50">
                        <select size="1" name="high_unit" class="tiny_sel">
                          <option>none</option>
                        </select>
                </dd>
                </dl>
    </fieldset>
    
    </div>
        
    <fieldset>
        <legend>Output Options</legend>
            <dl>
                <dt>number of records/page</dt>
                <dd>
                    <SELECT name="size">
                        <OPTION value="25" selected>25
                        <OPTION value="50">50
                        <OPTION value="100">100
                        <OPTION value="200">200
                    </SELECT>
                </dd>
                <dt>sort records by</dt>
                <dd>
                    <SELECT name="order" onChange="checkPosition()">
                        <OPTION value="name" selected>name
                        <OPTION value="type">type
                        <OPTION value="position">position
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
           
            
            
           
                 
            
            


