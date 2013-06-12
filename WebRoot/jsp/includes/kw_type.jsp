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

<fieldset>
<legend>Search by Associated Keyword<a href="/help/helppages/publicsearch.jsp#pub26" class="img_link" onclick="popwin(this.href); return false;">
<img src="/i/icon_help.gif" alt="help" /></a></legend>
    <dl>
        <dt>
           Keyword Term<%= DefinitionsLookup.createPopupLink("Keyword","class") %>
        </dt>
        <dd>
            <%= HTMLFactoryWithCSS.createSearchMethodSelect( "keyword_method", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %> 
            <INPUT type="text" name="keyword_term" size="30">
        </dd>
        
        <dt>
           Keyword Type<%= DefinitionsLookup.createPopupLink("KeywordType","keyword_type") %> 
        </dt>
        <dd>
            <SELECT name="keyword_type" MULTIPLE size="4" onChange="checkSelectAll('keyword_type')">
                <OPTION value="any" selected>Any</OPTION>         
                <OPTION value="func" >GO Molecular Function</OPTION>
                <OPTION value="proc">GO Biological Process</OPTION>
                <OPTION value="comp">GO Cellular Component</OPTION>
                <OPTION value="stru">Plant Structure</OPTION>
                <OPTION value="grow">Growth and Developmental Stage</OPTION>
                <OPTION value="meth">Experimental Method</OPTION>
            </SELECT>
        </dd>
    </dl>
</fieldset>
    
