<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*" %>

<%!
String pageName = "Publication";
String cssfile="/css/page/search.css";

    /** 
     * Creates an HTML SELECT form field for displaying all years within range 
     * defined by submitted values for fromYear and toYear.  Menu will include
     * all years between the two values, including the defining years themselves; 
     * if fromYear = 1 and toYear = 4, the menu will contain 1,2,3,4. The years 
     * will be listed in either ascending (lowest value at top of menu) or 
     * descending (lowest value at bottom of menu) according to the value of 
     * sortDescending.
     *
     * @param fieldName - The name to be given to the form field
     * @param selected - The option value that should show as pre-selected.  If
     *  this value is null or empty, the top value of the menu will display.
     * @param fromYear Low end of year range to create values for
     * @param toYear High end of year range to create values for
     * @param topDisplay Display value to use for top (unselected) option
     * @param sortDescending If <code>true</code> years will be listed with 
     *  toYear (high value) as the top option, and fromYear (low value) as bottom
     *  option; if <code>false</code>, fromYear is top option and toYear is bottom
     *  option
     * @return String containing HTML to create select form field
     */
private String createYearSelect( String fieldName, 
                                 String selected )
{

    // get start and end years for creating dynamic menus
    // of publication years that always builds from 1947 to last year
    int fromYear = 1947;
    int toYear = Calendar.getInstance().get( Calendar.YEAR );


    // create array with all select years, plus extra
    // row that displays "current" with current year as
    // value
    int arraySize = toYear - fromYear + 3;
    String[] yearValues = new String[ arraySize ];
    String[] yearDisplays = new String[ arraySize ];

    yearValues[ 0 ] = String.valueOf( toYear );
    yearDisplays[ 0 ] = "Present";

    // decrement toYear to create entries for all other
    // years preceding
    //toYear--;

    // loop through years and make entries w/year as both
    // display value and option value.  Show years in
    // descending order
    int index = 1;
    while ( toYear >= fromYear ) {
        yearValues[ index ] = String.valueOf( toYear );
        yearDisplays[ index ] = String.valueOf( toYear );
        index++;
        toYear--;
    } 

    yearValues[ index ] = "";
    yearDisplays[ index ] = "Any";

    boolean showTop = false;    

    return HTMLFactory.createSelect( fieldName, 
                                     selected, 
                                     yearValues, 
                                     yearDisplays,
                                     showTop );

}

%>

<%
// determine if publication search called as part of
// another tool's functionality (i.e. from gene symbol
// registry, or community profile)
String mode = request.getParameter( "mode" );

%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="511" />
</jsp:include>

<!--Content-->

<FORM name="searchForm" action="<%=response.encodeURL("/servlets/Search")%>" method="post">
    <input type="hidden" name="pageNum" value="1">
    <input type="hidden" name="type" value="publication">
    <input type="hidden" name="action" value="search">

    <% if ( !TextConverter.isEmpty( mode ) ) { %>
       <input type="hidden" name="mode" value="<%= mode %>">

    <% } %>
    
    <span class="mainheader">TAIR Publication Search</span> 
    <p id="help">[<a href="/help/helppages/publicsearch.jsp">Help</a>]<p>
    
    <p class="intro">
	  Use this page to search for Arabidopsis publications including: journal
	  articles, books, dissertations, abstracts from conference proceedings including the Annual <i>Arabidopsis</i> Meeting abstracts,
	  Electronic Arabidopsis Information Service (AIS) and Weeds World. Go 
	  <a href ="/browse/electricarab.jsp">HERE</a> to browse the  past volumes of AIS and Weeds World.
    </p>

    <p class="intro"> 
      Arabidopsis publications in TAIR are compiled primarily from PubMed records. 
      For the years 2000-2005, the National Agricultural Library provided additional 
      Agricola and Biosis records for Arabidopsis publications that were not available 
      through PubMed.</p>
     
      <p class="intro">
      <img alt="new" src="/i/new.gif" />
        To search the full text of articles, please try 
        <a href="http://www.textpresso.org/arabidopsis/">Textpresso for Arabidopsis.</a></p> 
        
    
      
    <div id="searchbox">
    
    <span class="search_buttons">
        <input type="reset" name="reset" value="Reset" onClick="resetHelper()">
        <input type="submit" name="search" value="Submit Query">
    </span>
    
    <fieldset>
        <dl>
            <dt>
              Search Term(s)  
            </dt>
            <dd>
                <SELECT name="type1" class="medium_sel">
                    <OPTION value="abstract">Abstract</OPTION>
                    <OPTION value="author" selected>Author (eg. Smith, J)</OPTION>
                    <OPTION value="journal">Journal/Book Title</OPTION>	   
                    <OPTION value="title">Title</OPTION>
                    <OPTION value="title_abstract">Title/Abstract</OPTION>
                    <OPTION value="url">URL</OPTION>
                    <OPTION value="pubmed_id">PubMed ID</OPTION>
                </SELECT>
                
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method1", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
                <INPUT type="text" name="term1" size="25" maxlength="62">
            </dd>
            
            <dt>
                &nbsp;
            </dt>
            <dd>
                <SELECT name="type2" class="medium_sel">
                    <OPTION value="abstract">Abstract</OPTION>
                    <OPTION value="author">Author (eg. Smith, J)</OPTION>
                    <OPTION value="journal">Journal/Book Title</OPTION>	   
                    <OPTION value="title" selected>Title</OPTION>
                    <OPTION value="title_abstract">Title/Abstract</OPTION>
                    <OPTION value="url">URL</OPTION>
                    <OPTION value="pubmed_id">PubMed ID</OPTION>
                </SELECT>
                
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method2", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
                <INPUT type="text" name="term2" size="25" maxlength="62">
            </dd>
            
            <dt>
                &nbsp;
            </dt>
            <dd>
                <SELECT name="type3" class="medium_sel">
                    <OPTION value="abstract" selected>Abstract</OPTION>
                    <OPTION value="author">Author (eg. Smith, J)</OPTION>
                    <OPTION value="journal">Journal/Book Title</OPTION>	   
                    <OPTION value="title">Title</OPTION>
                    <OPTION value="title_abstract">Title/Abstract</OPTION>
                    <OPTION value="url">URL</OPTION>
                    <OPTION value="pubmed_id">PubMed ID</OPTION>
                </SELECT>
                
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method3", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
                <INPUT type="text" name="term3" size="25" maxlength="62">
            </dd>
            
            <dt>
                Year From
            </dt>
            <dd>
                <%= createYearSelect( "from", "" ) %> To
                <%= createYearSelect( "to", Integer.toString(Calendar.getInstance().get(Calendar.YEAR))  ) %>
            </dd>
            
            <dt>
                Publication Type
            </dt>
            <dd>
                <SELECT name="publication_type">
                    <OPTION value="all" selected>All
                    <OPTION value="book">Book
                    <OPTION value="conference_proceedings">Conference Proceedings   
                    <OPTION value="dissertation">Dissertation
                    <OPTION value="research_article">Journal Article	   
                    <OPTION value="press_article">News Article
                    <OPTION value="review">Review
                </SELECT>
            </dd>
           
        </dl>
    </fieldset>
    
    <%@ include file="/jsp/includes/kw_type.jsp" %>
    
    <fieldset>
    <legend>Output Options</legend>
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
                <SELECT name="sort">
       				<OPTION value="date" selected>Date
       				<OPTION value="author">Author
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
