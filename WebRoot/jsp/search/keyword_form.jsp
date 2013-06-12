<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.utilities.*,org.tair.tfc.*"
%>
<%!
String pageName = "Keyword Search and Browse";
String cssfile="/css/page/search.css";
%>

<script language="JavaScript" src="/js/navbar.js"></script>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/search.css">
<script language='JavaScript'>
var highlight = 0; var helpfile="/help/helppages/initials.jsp";
</script>



<!-- End of template code -->

	
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="504" />
</jsp:include>

<%
String mode = ( request.getParameter( "mode" ) != null ) ? ( String )request.getParameter( "mode" ) : " "; 
%>

<!--Content -->

<span class="mainheader">TAIR Keyword Search and Browse</span>
<p class="intro">Search and browse for a term to view term details and relationships among terms.  
It includes links to genes, publications, microarray experiments and annotations associated with 
the term or any children terms.</p>

<FORM name="keyword_form1" action=<%=response.encodeURL("/servlet/Search")%> method="get">
 <input type="hidden" name="type" value="keyword">
 <input type="hidden" name="action" value="search">
 <input type="hidden" name="origForm" value="keyword">
 <input type="hidden" name="mode" value=<%=mode%>>		

<div id="searchbox">
    

    <fieldset>
        <legend>Keyword Search</legend>
        
        <p id="help">[<a href="/help/helppages/keyser.jsp" target="_blank">Help</a>]</p>
        <span class="search_buttons">
            <input type="reset" name="reset" value="Reset" onClick="resetHelper()">
            <input type="submit" name="search" value="Submit Query">
        </span>
      
        <dl>
            <dt>
            <label>keyword</label>
            </dt>
            <dd>
                <SELECT name="method" class="small_sel">
        			<OPTION value="1">contains</OPTION>
        			<OPTION value="2"selected>starts with</OPTION>
        			<OPTION value="3">ends with</OPTION>	   
        			<OPTION value="4">exactly</OPTION>
      			</SELECT>
            
                <INPUT type="text" name="name" size="20">
            </dd>
        </dl>
        
        <dl>
            <dt>
            <label>GO/PO ID (exact match only)</label>
            </dt>
            <dd>
            <input type="text" name="extdb_id"></input></p>
            &nbsp;&nbsp;(ie: GO:0005942 OR PO:0020133)
            </dd>
            
        </dl>
        
            <p>Restrict your search to keyword category by checking the box below</p>
            
           
            <dl>        
            <dt>
                <input type="checkbox" name="category" value="comp">GO Cellular Component
            </dt>
            <dt>
                <input type="checkbox" name="category" value="proc">GO Biological Process
            </dt>
            <dt>   
                <input type="checkbox" name="category" value="func">GO Molecular Function
            </dt>
            <dt style="width: 250px";>    
                <input type="checkbox" name="category" value="grow">Plant Growth and Development Stages
            </dt>
            
            <dt>
                <input type="checkbox" name="category" value="stru">Plant Anatomical Entity
            </dt>
            <dt>   
                <input type="checkbox" name="category" value="meth">Experimental Method
            </dt>
        </dl>

    </fieldset>
    
    <fieldset>
        <legend>Keyword Browse</legend>
        <p id="help">[<A href="/help/helppages/keybrowse.jsp" target="_blank">Help</A>]</p>
        <p>Click on the link to browse the category</p>
        <dl>
            <dt>
                <%
                TfcKeyword.setAspects();
                String nodeID = TfcKeyword.getAspectID( "cellular_component" ).toString();
                %>
                <A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"target="_other">GO Cellular Component</A>
            </dt>
            <dd>
                Component of the cell where a gene product may be localized.
            </dd>
            <dt>
                <%
                nodeID = TfcKeyword.getAspectID( "biological_process" ).toString();
                %>
                <A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"target="_other">GO Biological Process</A>
            </dt>
            <dd>
                Biological process that involve one or more gene products in an overall, ordered assembly of molecular functions.
            </dd>
            <dt>
                <%
                nodeID = TfcKeyword.getAspectID( "molecular_function" ).toString();
                %>
                <A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"target="_other">GO Molecular Function</A>
            </dt>
            <dd>
                Describes the function or activities of a gene product.
            </dd>
            <dt>
                <%
                nodeID = TfcKeyword.getAspectID( "plant structure development stage" ).toString();
                %>
                <A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"target="_other">Plant Growth and Development Stages</A>
            </dt>
            <dd>
                Describes growth and development stages in the life cycle of an organism. <br /><br />
            </dd>
            <dt>
                <%
                nodeID = TfcKeyword.getAspectID( "plant anatomical entity" ).toString();
                %>
                <A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"target="_other">Plant Anatomical Entity</A>
            </dt>
            <dd>
                Describes a part of an organism and the components of those parts.
            </dd>
            <dt>
                <%
                nodeID = TfcKeyword.getAspectID( "experimental method" ).toString();
                %>
                <A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"target="_other">Experimental Method</A>
            </dt>
            <dd>
                Experimental method
            </dd>
        </dl>
    </fieldset>
<!-- FF needs this it seems, although only for certain machines -->
         <script type="text/javascript">setFooter();</script>
     </div>
</form>


<!--End Content-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

            
            
