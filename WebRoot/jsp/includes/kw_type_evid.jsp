<script language='JavaScript'>

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

</script>

<TR align="center" bgcolor="#F1EFEC"> 
	<TD colspan="1"><B><FONT size="4"><BR><A href="/help/helppages/genesear.jsp#key">Search by Associated Keyword</A>
	                   </FONT></B><BR><BR></TD>
</TR>
<TR bgcolor="#F1EFEC"> 
<TD valign="top" colspan="1">
<TABLE border="0" align="center">
<TR>
	<TD>&nbsp;</TD>
	<TD valign="top"><B>Keyword Term<%= DefinitionsLookup.createPopupLink("Keyword","class") %></B><%= HTMLFactory.createSearchMethodSelect( "keyword_method", DataConstants.SEARCH_STARTS, false ) %></TD>
	<TD valign="top"><INPUT type="text" name="keyword_term" size="35"></TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
        <TD valign="top"><B>Keyword Type<%= DefinitionsLookup.createPopupLink("KeywordType","keyword_type") %></B><BR>    			    
	    <SELECT name="keyword_type" MULTIPLE size="4" onChange="checkSelectAll('keyword_type')">
                <OPTION value="any" selected>Any</OPTION>         
                <OPTION value="func" >GO Molecular Function</OPTION>
                <OPTION value="proc">GO Biological Process</OPTION>
                <OPTION value="comp">GO Cellular Component</OPTION>
	        <OPTION value="stru">Plant Structure</OPTION>
		<OPTION value="grow">Growth and Developmental Stage</OPTION>

            </SELECT>
        </TD>
        <TD valign="top"><B>Evidence<%= DefinitionsLookup.createPopupLink("EvidenceDescription","evidence_code") %></B><BR>    			    
	    <SELECT name="evidence" MULTIPLE size="4" onChange="checkSelectAll('evidence')">                
                <OPTION value="any" selected>Any</OPTION>
                <OPTION value="IDA">inferred from direct assay</OPTION>
                <OPTION value="IEA">inferred from electronic annotation</OPTION>
	        <OPTION value="IEP">inferred from expression pattern</OPTION>
		<OPTION value="IGI">inferred from genetic interaction</OPTION>
                <OPTION value="IMP">inferred from mutant phenotype</OPTION>
                <OPTION value="IPI">inferred from physical interaction</OPTION>
                <OPTION value="ISS">inferred from sequence or structural similarity</OPTION>
                <OPTION value="RCA">inferred from reviewed computational analysis</OPTION>
	        <OPTION value="NAS">non-traceable author statement</OPTION>
		<OPTION value="ND">no biological data available</OPTION>
	        <OPTION value="TAS">traceable author statement</OPTION>
      	    </SELECT>
        </TD>
	<TD>&nbsp;</TD>
</TR>

</TABLE>
</TD>
</TR>
