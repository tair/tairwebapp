<TR align="center" bgcolor="#F1EFEC"> 
	<TD colspan="1"><B><FONT size="4"><BR><A href="/search/markerse.htm#447549">Search by Controlled Vocabulary</A>
	                   </FONT></B><BR></TD>
</TR>
<TR bgcolor="#F1EFEC"> 
<TD valign="top" colspan="1">
<TABLE border="0" align="center">
<TR>
	<TD align="center">Relationship</TD>
	<TD align="center">Vocabulary Type</TD>
	<TD align="center">Search Method</TD>
	<TD align="center">Vocabulary Term</TD>
        <TD></TD>
	<TD></TD> 
	<TD></TD> 
</TR>
<TR>
	<TD valign="top"> <SELECT name="relationship1">                
                <OPTION value="any" selected>Any</OPTION>
                <OPTION value="13">matches</OPTION>
     		 </SELECT></TD>
	<TD valign="top"> <SELECT name="keyword_type1">                
                <OPTION value="any" selected>Any</OPTION>
                <OPTION value="func">GO Molecular Function</OPTION>
                <OPTION value="proc">GO Biological Process</OPTION>
                <OPTION value="comp">GO Cellular Component</OPTION>
	        <OPTION value="stru">Plant Structure</OPTION>
		<OPTION value="grow">Growth and Developmental Stage</OPTION>
		<OPTION value="meth">Experimental Method</OPTION>
     		 </SELECT></TD>
	<TD valign="top"><%= HTMLFactory.createSearchMethodSelect( "method1", DataConstants.SEARCH_STARTS, false ) %></TD>
	<TD valign="top"><INPUT type="text" name="keyword_term1" size="25"></TD>
        <TD>and</TD>
        <TD></TD>
	<TD></TD> 
</TR>
<TR>
	<TD valign="top"> <SELECT name="relationship2">                
                <OPTION value="any" selected>Any</OPTION>
                <OPTION value="13">matches</OPTION>                
     		 </SELECT></TD>
	<TD valign="top"> <SELECT name="keyword_type2">                
                <OPTION value="any" selected>Any</OPTION>
                <OPTION value="func">GO Molecular Function</OPTION>
                <OPTION value="proc">GO Biological Process</OPTION>
                <OPTION value="comp">GO Cellular Component</OPTION>
	        <OPTION value="stru">Plant Structure</OPTION>
		<OPTION value="deve">Developmental Stage</OPTION>
		<OPTION value="meth">Experimental Method</OPTION>
     		 </SELECT></TD>
	<TD valign="top"><%= HTMLFactory.createSearchMethodSelect( "method2", DataConstants.SEARCH_STARTS, false ) %></TD>
	<TD valign="top"><INPUT type="text" name="keyword_term2" size="25"></TD>
        <TD>and</TD>
        <TD></TD>
	<TD></TD> 
</TR>
<TR>
	<TD valign="top"> <SELECT name="relationship3">                
                <OPTION value="any" selected>Any</OPTION>
                <OPTION value="13">matches</OPTION>                   
     		 </SELECT></TD>
	<TD valign="top"> <SELECT name="keyword_type3">                
                <OPTION value="any" selected>Any</OPTION>
                <OPTION value="func">GO Molecular Function</OPTION>
                <OPTION value="proc">GO Biological Process</OPTION>
                <OPTION value="comp">GO Cellular Component</OPTION>
	        <OPTION value="stru">Plant Structure</OPTION>
		<OPTION value="deve">Developmental Stage</OPTION>
		<OPTION value="meth">Experimental Method</OPTION>
     		 </SELECT></TD>
	<TD valign="top"><%= HTMLFactory.createSearchMethodSelect( "method3", DataConstants.SEARCH_STARTS, false ) %></TD>
	<TD valign="top"><INPUT type="text" name="keyword_term3" size="25"></TD>
	<TD></TD>
        <TD></TD>
	<TD></TD> 
</TR>
</TABLE>
</TD>
</TR>
