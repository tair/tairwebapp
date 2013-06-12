<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*,org.tair.querytools.gbrowse.*, org.tair.utilities.*, java.util.*" %>

<%
    GBrowseGeneModel gene = null;
    if (request.getAttribute("gene") != null){
        gene = (GBrowseGeneModel) request.getAttribute("gene");
    }
%>


<html>
    <head>
        <title>Gene Description for GBrowse</title>
    </head>
    <center>
    <% if (gene != null){ %>
        <%=gene.get_name()%><br />
    <%
        Collection<TfcSymbol> symbols;
        if (gene.getSymbols() != null ) {
    %>        
    <%
            symbols = gene.getSymbols();
            Iterator iter = symbols.iterator();
            while (iter.hasNext() && iter != null){
                TfcSymbol symbol = (TfcSymbol) iter.next();
    %>
                <%=symbol.get_symbol()%> 
                <% if ((String) symbol.get_full_name() != null ) { %>
                    (<%=symbol.get_full_name()%>) <br />
                <% } %>
    <%  } } %>
    <br /><br /><%=gene.get_description()%>
    
    <% } %>
    </center>
</html>

