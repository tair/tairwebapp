<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Syntaxins, Other SNAREs & SNARE interacting proteins";
	String highlight = "3";
	String helpfile="";
	String cssfile="/css/page/pagelevels.css";
%>
<%@ page
	errorPage="/jsp/common/gen_error.jsp"
	import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
	<jsp:param name="helpfile" value="<%= helpfile %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<!-- Content goes here //-->

<h2><b><i>Arabidopsis</i> Syntaxins Gene Families</B></h2>

<table><tr>

<td><b>Source:</b></td> <td><A HREF="http://www.tc.umn.edu/~sande099/atsnare.htm"> Genomic Analysis of Arabidopsis SNAREs and associated proteins</A></td></tr> 

<tr><td valign=top><b>Gene Family<br>Criteria:</b></td>
<td> The Syntaxins are defined by a common protein motif that is known from functional and structural studies.</td></tr>

<tr><td><b>Contact:</b></td>
<td><A HREF="/servlets/Community?action=view&type=person&communityID=2595" target="display">Anton Sanderfoot</A></td></tr>

</table> 
    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="0">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th> 
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=2 valign="top"><B>Syntaxin;<br>SYP11</B></TD>
        <TD>AtSYP111<br>(<i>KNOLLE</i>)</TD>
        <TD>F22O13_4<BR><a href="/servlets/TairObject?type=locus&name=At1g08560 "/>At1g08560</a></TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=U39451&form=6&db=n&Dopt=g">U39451</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08560">putative syntaxin-related protein (U39451)</A></TD>
            </TR>

<tr class="alt">   
        
        <TD>AtSYP112</TD>
        <TD>T30D6_23<BR><a href="/servlets/TairObject?type=locus&name=At2g18260 "/>At2g18260</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAD15510&form=6&db=p&Dopt=g">AAD15510</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18260">putative syntaxin </A></TD>
 </TR>

<TR>    <TD ROWSPAN=5 valign=top><B>Syntaxin;<br>SYP12</B></TD>
        <TD>AtSYP121</TD>
        <TD>F26K24_11<BR><a href="/servlets/TairObject?type=locus&name=At3g11820 /">At3g11820</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AF112864&form=6&db=n&Dopt=g">AF112864</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11820">putative syntaxin</A></TD>
            </TR>	    
<TR>    
        <TD>AtSYP122</TD>
        <TD>F22O6_220<BR><a href="/servlets/TairObject?type=locus&name=At3g52400 "/>At3g52400</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AJ245407&form=6&db=n&Dopt=g">AJ245407</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g52400">syntaxin-like protein synt4</A></TD>
</TR>
<TR>   
        <TD>AtSYP123</TD>
        <TD>F4C21_26<BR><a href="/servlets/TairObject?type=locus&name=At4g03330 "/>At4g03330</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAD14461&form=6&db=p&Dopt=g">AAD14461</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g03330">SYR1-like syntaxin</A></TD>
            </TR>

<TR>    
        <TD>AtSYP124</TD>
        <TD>T1F9_22<BR><a href="/servlets/TairObject?type=locus&name=At1g61290 "/>At1g61290</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAC13912&form=6&db=p&Dopt=g">AAC13912</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61290">syntaxin-related protein Nt-syr1, putative</A></TD>
	    </TR>

<TR>   
        <TD>AtSYP125</TD>
        <TD>T28P6_10<BR><a href="/servlets/TairObject?type=locus&name=At1g11250 "/>At1g11250</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAD50004&form=6&db=p&Dopt=g">AAD50004</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11250">syntaxin-related protein At-SYR1, putative</A></TD>
	    </TR>
<tr class="alt">
	<TD ROWSPAN=2 valign=top><B>Syntaxin;<br>SYP13</B></TD>
        <TD>AtSYP131</TD>
        <TD>F20H23_28<BR><a href="/servlets/TairObject?type=locus&name=At3g03800 "/>At3g03800</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAF00648&form=6&db=p&Dopt=g">AAF00648</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03800">s-syntaxin-like protein</A></TD>
	    </TR>
<tr class="alt">
	<TD>AtSYP132</TD>
        <TD>T22D6_20<BR><a href="/servlets/TairObject?type=locus&name=At5g08080 "/>At5g08080</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=CAB93709&form=6&db=p&Dopt=g">CAB93709</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g08080">syntaxin-like protein</A></TD>
	    </TR>

<TR>
	<TD ROWSPAN=4 valign=top><B>Syntaxin;<br>SYP2</B></TD>
        <TD>AtSYP21</TD>
        <TD>F5E19_170<BR><a href="/servlets/TairObject?type=locus&name=At5g16830 "/>At5g16830</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=L41651&form=6&db=n&Dopt=g">L41651</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16830">syntaxin homologue</A></TD>
	    </TR>
<TR>
	<TD>AtSYP22</TD>
        <TD>MSD23_4<BR><a href="/servlets/TairObject?type=locus&name=At5g46860 "/>At5g46860</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=U88045&form=6&db=n&Dopt=g">U88045</A></TD>
	    <TD>&nbsp;</TD>
	    </TR>
<TR>
	<TD>AtSYP23</TD>
        <TD>dl14901w<BR><a href="/servlets/TairObject?type=locus&name=At4g17730 "/>At4g17730</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=U85036&form=6&db=n&Dopt=g">U85036</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17730">syntaxin</A></TD>


<TR>    <TD>&nbsp;</TD>
        <TD>F27G20_2<BR><a href="/servlets/TairObject?type=locus&name=At1g32270 "/>At1g32270</a></TD>
	<TD>&nbsp;</TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32270">syntaxin, putative</A></TD>    



	  </TR>

<tr class="alt">
	<TD ROWSPAN=2 valign=top><B>Syntaxin;<br>SYP3</B></TD>
        <TD>AtSYP31</TD>
        <TD>MJJ3_17<BR><a href="/servlets/TairObject?type=locus&name=At5g05760 "/>At5g05760</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AF051853&form=6&db=n&Dopt=g">AF051853</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05760">t-SNARE SED5 (gb|AAC06291.1)</A></TD>
</TR>

<tr class="alt">
        <TD>AtSYP32</TD>
        <TD>K7M2_10<BR><a href="/servlets/TairObject?type=locus&name=At3g24350 "/>At3g24350</a></TD>
        <TD>unpublished</TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g24350">syntaxin-like protein</A></TD>
	    </TR>
<TR>
	<TD ROWSPAN=3 valign=top><B>Syntaxin;<br>SYP4</B></TD>
        <TD>AtSYP41</TD>
        <TD>F2P16_240<BR><a href="/servlets/TairObject?type=locus&name=At5g26980 "/>At5g26980</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AF067789&form=6&db=n&Dopt=g">AF067789</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26980">tSNARE AtTLG2a </A></TD>
</TR>

<TR>
	<TD>AtSYP42</TD>
        <TD>T10M13_19<BR><a href="/servlets/TairObject?type=locus&name=At4g02195 "/>At4g02195</TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AF154574&form=6&db=n&Dopt=g">AF154574</A></TD>
	    <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G02195">syntaxin SYP42 (TLG2b)</A></TD>
	    </TR>


        <TD>AtSYP43</TD>
        <TD>F18C1_2<BR><a href="/servlets/TairObject?type=locus&name=At3g05710 "/>At3g05710</a></TD>
        <TD><A href="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AJ245408&form=6&db=n&Dopt=g">AJ245408</A></TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05710">putative syntaxin protein, AtSNAP33 </A></TD>
	    </TR>
<tr class="alt">
	<TD ROWSPAN=2 valign=top><B>Syntaxin;<br>SYP5</B></TD>
        <TD>AtSYP51</TD>
        <TD>F3O9.4<BR><a href="/servlets/TairObject?type=locus&name=At1g16240 "/>At1g16240</a></TD>
        <TD>AF355755</TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16240">unknown protein</A></TD>
	    </TR>

<tr class="alt">    
        <TD>AtSYP52</TD>
        <TD>F20B17.2<BR><a href="/servlets/TairObject?type=locus&name=At1g79590 "/>At1g79590</a></TD>
        <TD>AF355756</TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79590">unknown protein </A></TD>
	    </TR>

<TR>    <TD valign=top><B>Syntaxin;<br>SYP6</B></TD>
        <TD>AtSYP61</TD>
        <TD>F3M18.7<BR><a href="/servlets/TairObject?type=locus&name=At1g28490 "/>At1g28490</a></TD>
        <TD>AF355754</TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28490">hypothetical protein </A></TD>
	    </TR>
	    
<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Syntaxin;<br>SYP7</B></TD>
        <TD>AtSYP71</TD>
        <TD>F11F8.33<BR><a href="/servlets/TairObject?type=locus&name=At3g09740 "/>At3g09740</a></TD>
        <TD>AF355757</TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09740">unknown protein</A></TD>
	    </TR>

<tr class="alt">   
        <TD>AtSYP72</TD>
        <TD>F18N11.40<BR><a href="/servlets/TairObject?type=locus&name=At3g45280 "/>At3g45280</a></TD>
        <TD>AF355758</TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45280">putative protein </A></TD>
	    </TR>
	    
<tr class="alt">  
        <TD>AtSYP73</TD>
        <TD>F2A19.50<BR><a href="/servlets/TairObject?type=locus&name=At3g61450 "/>At3g61450</a></TD>
        <TD>AF355759</TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g61450">putative protein </A></TD>
	    </TR>
	    
<TR>    <TD valign=top><B>Syntaxin;<br>SYP8</B></TD>
        <TD>AtSYP81</TD>
        <TD>F19C24_5<BR><a href="/servlets/TairObject?type=locus&name=At1g51740 "/>At1g51740</a></TD>
        <TD>unpublished</TD>
	    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51740">hypothetical protein</A></TD>
	    </TR>

	    
	    
 </TABLE>
<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
 <BR>
 <BR>
 <BR>

    <A NAME="OtherSNAREs"><h2><b><i> Arabidopsis</i> Other SNAREs</B></A></h2>

<table><tr>
<td><b>Source:</b></td> <td><A HREF="http://www.tc.umn.edu/~sande099/atsnare.htm"> Genomic Analysis of Arabidopsis SNAREs and associated proteins</A></td></tr> 


<tr><td valign=top><b>Gene Family<br>Criteria:</b></td>
<td> The SNAREs are defined by a common protein motif that is known from functional and structural studies. Almost half of the Arabidopsis SNAREs have now been at least partially characterized in Arabidopsis, always confirming their proposed roles as SNAREs, and helping to verify the assignments for the other members of this gene family.</td></tr>

<tr><td><b>Contact:</b></td>
<td><A HREF="/servlets/Community?action=view&type=person&communityID=2595" target="display">Anton Sanderfoot</A></td></tr>

</table> 



 
    <p>

 
<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
       
        
<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</B></TH>
      </TR>
	     
<tr class="alt">    <TD ROWSPAN=3 valign=top><B>SNAP25-like; <br>SNAP33 Gene Family</B></TD>
        <TD>AtSNAP33</TD>
	<TD>MAF19_6<BR><a href="/servlets/TairObject?type=locus&name=At5g61210 "/>At5g61210</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=X92419&form=6&db=n&Dopt=g">X92419</A></TD>
	   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61210">snap25a</A></TD> </TR>
<tr class="alt">
        <TD>AtSNAP29</TD>
	<TD>MXM12_4<BR><a href="/servlets/TairObject?type=locus&name=At5g07880 "/>At5g07880</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=CAB62600&form=6&db=p&Dopt=g">CAB62600</A></TD>
   <TD bgcolor=
D5D9DD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07880">synaptosomal associated protein SNAP25-like</A></TD> </TR>
<tr class="alt">
        <TD>AtSNAP30</a></TD>
	<TD>F16A14_10<BR><a href="/servlets/TairObject?type=locus&name=At1g13890 "/>At1g13890</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAF79396&form=6&db=p&Dopt=g">AAF79396</A></TD>
  <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13890">synaptosomal associated protein (SNAP25A), putative</A></TD> </TR>
	
<TR>	<TD ROWSPAN=3 valign=top><B>Other SNARE; VTI1 Gene Family</B></TD>
        <TD>AtVTI11</TD>
	<TD>MUL8_190<BR><a href="/servlets/TairObject?type=locus&name=At5g39510 "/>At5g39510</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AF114750&form=6&db=n&Dopt=g">AF114750</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39510">v-SNARE AtVTI1a (ZIG)</A></TD> </TR>	    

<TR>
        <TD>AtVTI12</TD>
        <TD>T24P13.5<BR><a href="/servlets/TairObject?type=locus&name=At1g26670 "/>At1g26670</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AF114751&form=6&db=n&Dopt=g">AF114751</A></TD>   
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26670">v-SNARE protein AtVTI1b, putative</A></TD> </TR>	    

<TR>
        <TD>AtVTI13</TD>
	<TD>MXE2_6<BR><a href="/servlets/TairObject?type=locus&name=At3g29100 "/>At3g29100</a></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=BAB01986&form=6&db=p&Dopt=g">BAB01986</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g29100">putative vesicle transport protein</A></TD> </TR>

<tr class="alt">	<TD ROWSPAN=2 valign=top><B>Other SNAREs;<br>GOS1 Gene Family</B></TD>    
        <TD>AtGOS11</TD>
	<TD>F7H2_21<BR><a href="/servlets/TairObject?type=locus&name=At1g15880 "/>At1g15880</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAF82157&form=6&db=p&Dopt=g">AAF82157</A></TD>  
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15880">cis-Golgi SNARE protein, putative</A></TD> </TR>
<tr class="alt">	    
        <TD>AtGOS12</TD>
	<TD>F4L23_8<BR><a href="/servlets/TairObject?type=locus&name=At2g45200 "/>At2g45200</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAB82642&form=6&db=p&Dopt=g">AAB82642</A></TD>    
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45200">putative cis-Golgi SNARE protein</A></TD>	</TR>

<TR>	<TD ROWSPAN=2 valign=top><b>Brevin Group;<br>BET1 Gene Family</b></TD>    
        <TD>AtBET11</TD>
	<TD><a href="/servlets/TairObject?type=locus&name=AT4G14449 "/>AT4G14449</a></TD> 
        <TD>&nbsp;</TD>
	<TD>&nbsp;</TD>  
</TR>
	    
<TR>    <TD>AtBET12</TD>
	<TD>dl3265w<BR><a href="/servlets/TairObject?type=locus&name=At4g14450 "/>At4g14450</a></TD> 
        <TD>Mis-predicted as<BR>Adenylate cyclase</TD><TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14450">hypothetical protein</A></TD>
</TR>

<tr class="alt">	<TD ROWSPAN=2 valign=top><B>Other SNAREs;<br>Membrin </B></TD>    
        <TD>AtMEMB11</TD>
	<TD>T1J8_8<BR><a href="/servlets/TairObject?type=locus&name=At2g36900 "/>At2g36900</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAD31575&form=6&db=p&Dopt=g">AAD31575</A></TD>  
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36900">putative cis-Golgi SNARE protein </A></TD> </TR>
       
<tr class="alt">	   
        <TD>AtMEMB12</TD>
	<TD>MXI22.16<BR><a href="/servlets/TairObject?type=locus&name=At5g50440 "/>At5g50440</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=BAB09463&form=6&db=p&Dopt=g">BAB09463</A></TD>  
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g50440">golgi SNARE protein</A></TD> </TR>

<TR>	<TD ROWSPAN=3 valign=top><B>Other SNAREs;<br>Novel Plant Group</B></TD>    
        <TD>AtNPSN11</TD>
	<TD>T4C15_14<BR><a href="/servlets/TairObject?type=locus&name=At2g35190 "/>At2g35190</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAC61818&form=6&db=p&Dopt=g">AAC61818</A></TD>  
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35190">unknown protein</A></TD> </TR>
       
<TR>
        <TD>AtNPSN12</TD>
	<TD>F11A17_20<BR><a href="/servlets/TairObject?type=locus&name=At1g48240 "/>At1g48240</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAD49774&form=6&db=p&Dopt=g">AAD49774</A></TD>  
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48240">hypothetical protein</A></TD> </TR>

	<TR>	   
        <TD>AtNPSN13</TD>
	<TD>MTO12_3<BR><a href="/servlets/TairObject?type=locus&name=At3g17440 "/>At3g17440</a></TD>
	<TD>BAA99791</TD>  
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g17440">unknown protein</A></TD> </TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Longin Group;<br>SEC22 Gene Family</B></TD>
        <TD>AtSEC22</TD>
	<TD>F12F1_27<BR><a href="/servlets/TairObject?type=locus&name=At1g11890 "/>At1g11890</a></TD>
	<TD> <A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAC17634&form=6&db=p&Dopt=g">AAC17634</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11890">putative vesicle transport protein</A></TD>    
</TR>
	    

<TR>
<TD ROWSPAN=2 valign=top><B>Longin Group;<br>YKT6 Gene Family</B></TD>
           <TD>AtYKT61</TD>
	<TD>K21L19_5<BR><a href="/servlets/TairObject?type=locus&name=At5g58060 "/>At5g58060</a></TD>
	<TD> <A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=BAB10997&form=6&db=p&Dopt=g">BAB10997</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58060">ATGP1</A></TD>   
	    </TR>

<TR>   
        <TD>AtYKT62</TD>
	<TD>MCK7_5<BR><a href="/servlets/TairObject?type=locus&name=At5g58180 "/>At5g58180</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=BAA96909&form=6&db=p&Dopt=g">BAA96909</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58180">ATGP1-like protein</A></TD>
	    </TR>

<tr class="alt">
<TD ROWSPAN=4 valign=top><B>Longin Group;<br>VAMP71 Gene Family</B></TD>
   
        <TD>AtVAMP711</TD>
	<TD>F10N7_40<BR><a href="/servlets/TairObject?type=locus&name=At4g32150 "/>At4g32150</a></TD>
	<TD> <A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=T04630&form=6&db=p&Dopt=g">T04630</A></TD>
	 <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g32150">synaptobrevin-like protein</a></TD>
	    </TR>	    
	    
<tr class="alt">    
        <TD>AtVAMP712</TD>
	<TD>T22F11_7<BR><a href="/servlets/TairObject?type=locus&name=At2g25340 "/>At2g25340</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAD23657&form=6&db=p&Dopt=g">AAD23657</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25340">putative synaptobrevin </A></TD>    
	    </TR>
	    
<tr class="alt">    
        <TD>AtVAMP713</TD>
	<TD>F2I11_40<BR><a href="/servlets/TairObject?type=locus&name=At5g11150 "/>At5g11150</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=CAB96650&form=6&db=p&Dopt=g">CAB96650</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g11150"> putative protein</A></TD>    
	    </TR>

<tr class="alt">    
        <TD>AtVAMP714</TD>
	<TD>MWD9_16<BR><a href="/servlets/TairObject?type=locus&name=At5g22360 "/>At5g22360</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=BAB08335&form=6&db=p&Dopt=g">BAB08335</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g22360">synaptobrevin-like protein</A></TD>
	    </TR>    
	
<TR>
<TD ROWSPAN=8 valign=top><B>Longin Group;<br>VAMP72 Gene Family</B></TD>
   
        <TD>AtVAMP721</TD>
	<TD>T1G11_1<BR><a href="/servlets/TairObject?type=locus&name=At1g04750 "/>At1g04750</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAB80624&form=6&db=p&Dopt=g">AAB80624</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04750"> putative vesicle-associated membrane protein, synaptobrevin 7B</A></TD>   
	    </TR>

<TR>   
        <TD>AtVAMP722</TD>
	<TD>F25I18_14<BR><a href="/servlets/TairObject?type=locus&name=At2g33120 "/>At2g33120</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAC04921&form=6&db=p&Dopt=g">AAC04921</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33120">putative synaptobrevin</A></TD>
	    </TR>
	    
<TR>   
        <TD>AtVAMP723</TD>
	<TD>F25I18_15<BR><a href="/servlets/TairObject?type=locus&name=At2g33110 "/>At2g33110</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAF40460&form=6&db=p&Dopt=g">AAF40460</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33110">putative synaptobrevin</A></TD>   
      </TR>
	    
<TR>   
        <TD>AtVAMP724</TD>
	<TD>dl3930c<BR><a href="/servlets/TairObject?type=locus&name=At4g15780 "/>At4g15780</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=CAB10356&form=6&db=p&Dopt=g">CAB10356</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15780"> SYBL1 like protein</A></TD>  
	    </TR>
<TR>   
        <TD>AtVAMP725</TD>
	<TD>F24L7_19<BR><a href="/servlets/TairObject?type=locus&name=At2g32670 "/>At2g32670</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAC04496&form=6&db=p&Dopt=g">AAC04496</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32670">putative synaptobrevin</A></TD>    
	    </TR>	    

<TR>  
        <TD>AtVAMP726</TD>
	<TD>F13M7_25<BR><a href="/servlets/TairObject?type=locus&name=At1g04760 "/>At1g04760</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAF40460&form=6&db=p&Dopt=g">AAF40460</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04760"> synaptobrevin 7B, putative </A></TD>   
	    </TR>	
<TR>   
        <TD>AtVAMP727</TD>
	<TD>F24B22_260<BR><a href="/servlets/TairObject?type=locus&name=At3g54300 "/>At3g54300</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=CAB71004&form=6&db=p&Dopt=g">CAB71004</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g54300">synaptobrevin -like protein</A></TD>
      </TR>

<TR>   
        <TD>&nbsp;</TD>
	    <TD>K7P8.18<BR><a href="/servlets/TairObject?type=locus&name=At3g24890 "/>At3g24890</a></TD>
		<TD>&nbsp;</TD>
	   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g24890">synaptobrevin, putative</A></TD> </TR>	


</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
 <BR>
 <BR>
 <BR>



    <A NAME="SNAREinteract"><h2><B><i>Arabidopsis</i> SNARE interacting proteins</B></h2></A>

<table><tr>

<td><b>Source:</b></td> <td><A HREF="http://www.tc.umn.edu/~sande099/atsnare.htm"> Genomic Analysis of Arabidopsis SNAREs and associated proteins</A></td></tr> 

<tr><td valign=top><b>Gene Family<br>Criteria:</b></td>
<td> SNARE interactin proteins have been defined based on homology with the proteins in other systems.  This is either functional homology (known for a few) or sequence homology where common motifs are found in the homologues, and the homology is over the entire length of the proteins.</td></tr>

<tr><td><b>Contact:</b></td>
<td><A HREF="/servlets/Community?action=view&type=person&communityID=2595" target="display">Anton Sanderfoot</A></td></tr>

</table> 
<br>
 
<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    
        
<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><B>TIGR Annotation:</B></th></TR>    
    

<tr class="alt">	<TD ROWSPAN=2 valign=top><B>NSF and SNAP Proteins; <br>alpha-SNAP Gene Family</B></TD>    
        <TD>alpha-SNAP1</TD>
	<TD>T5P19.100<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At3g56450</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=7594523&dopt=GenPept">CAB88048</A></TD>  
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56450">alpha-soluble NSF attachment protein-like</A></TD> </TR>

<tr class="alt">	   
        <TD>alpha-SNAP2</TD>
	<TD>F18O21_150<BR><a href="/servlets/TairObject?type=locus&name=At3g56190 "/>At3g56190</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=7572917&dopt=GenPept">CAB87418</A></TD>  
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56190">alpha-soluble NSF attachment protein</A></TD> </TR>

<TR>    
<TD ROWSPAN=1 valign=top><B>NSF and SNAP Proteins; <br>gamma-SNAP Gene Family</B></TD>
        <TD>gamma-SNAP</TD>
	<TD>F9F13_60<BR><a href="/servlets/TairObject?type=locus&name=At4g20410 "/>At4g20410</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=5262164&dopt=GenPept">CAB45807</A></TD>  
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g20410">putative protein</A></TD> </TR>
 
<tr class="alt">	<TD ROWSPAN= 1 valign=top><B>NSF and SNAP Proteins; <br>NSF Gene Family</B></TD>    
        <TD>NSF</TD>
	<TD>T1J1_4<BR><a href="/servlets/TairObject?type=locus&name=At4g04910 "/>At4g04910</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=7267250&dopt=GenPept">CAB81033</A></TD>  
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04910">putative component of vesicle-mediated transport </A></TD> </TR>

<TR>
<TD ROWSPAN= 3 valign=top><B>AAA-type ATPases</B><br>* Source <A href="/servlets/Community?action=view&type=person&communityID=711949">Sookhee Park</A></TD>
	<TD>CDC48a</TD>
        <TD>F8A24_11<BR><a href="/servlets/TairObject?type=locus&name=At3g09840 "/>At3g09840</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6681343">AAF23260</A></TD>    
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09840">putative transitional endoplasmic reticulum ATPase</A></TD></TR>

<TR>	<TD>CDC48b</TD>
        <TD>T4D2.160<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At3g53230</a></TD>
	<TD>&nbsp;</TD>    
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53230">CDC48 - like protein</A></TD></TR>

<TR>	<TD>CDC48c</TD>
        <TD>F12E4.70<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At5g03340</a></TD>
	<TD>&nbsp;</TD>    
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03340">putative protein</A></TD></TR>	


	    
<tr class="alt">    <TD ROWSPAN=3 valign=top><B>SEC1 Proteins; <br>KEULE Gene Family</B></TD>
        <TD>KEULE</TD>
        <TD>F5O11_8<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At1g12360</a></TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAF79632&form=6&db=p&Dopt=g">AAF79632</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12360">expressed protein</A></TD>    
	    
</TR>

<tr class="alt">
        <TD>AtSEC1a</TD>
        <TD>T17I23_1<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At1g02010</a></TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAF76479&form=6&db=p&Dopt=g">AAF76479(5'end)</A><BR><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAC24365&form=6&db=p&Dopt=g">AAC24365(3'end)</A></TD><TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02010">hypothetical protein</A></TD>
</TR>

<tr class="alt">
        <TD>AtSEC1b</TD>
        <TD>F16J13_190<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At4g12120</a></TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=CAB40953&form=6&db=p&Dopt=g">CAB40953</A></TD><TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g12120">putative protein</A></TD>
</TR>



<TR>	
<TD ROWSPAN=1 valign=top><B>SEC1 Proteins; <br>VPS33 Gene Family</B></TD>

<TD>AtVPS33</TD>
        <TD>F28P10_160<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At3g54860</a></TD>
        <TD>AF357527</TD><TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g54860">vacuolar protein sorting protein 33a-like protein</A></TD>
</TR>
<tr class="alt">	
<TD ROWSPAN=1 valign=top><B>SEC1 Proteins; <br>VPS45 Gene Family</B></TD>
        <TD>AtVPS45</TD>
        <TD>T14N5_2<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At1g77140</a></TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AF036234&form=6&db=n&Dopt=g">AF036234</A></TD><TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77140">vacuolar protein sorting homolog</A></TD>
</TR>


<TR>	
<TD ROWSPAN=1 valign=top><B>SEC1 Proteins; <br>SLY1 Gene Family</B></TD>

<TD>AtSLY1</TD>
	<TD>T27K22_15<BR><a href="/servlets/TairObject?type=locus&name=AT "/>At2g17980</a></TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAD20128&form=6&db=p&Dopt=g">AAD20128</A></TD><TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17980">putative SEC1 family transport protein</A></TD>
</Tr>
</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
