<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "B3 DNA Binding Superfamily";
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
<h2>B3 DNA Binding Superfamily</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Romanel EA, Schrago CG, Cou&ntilde;ago RM, Russo CA, Alves-Ferreira M. </b> (2009) Evolution of the B3 DNA binding superfamily: new insights into REM family gene diversification. PLoS One <b>4(6):e5791</b><br/>
(for complete set of papers for members of this gene family please refer to the complete gene family table on our ftp site via the <a href="ftp://ftp.arabidopsis.org/home/tair/Genes/Gene_families/">DOWNLOAD</a> button) 
</li> </ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>Defined by the presence of at least one B3 domain. Other domains include EAR, ARF, AP2, III and IV AUX/IAA. </td></tr>
	<tr><th valign="top">Contact:</th> <td>
    Marcio Alves-Ferreira: <a href="mailto:alvesfer@biologia.ufrj.br">alvesfer@biologia.ufrj.br</a> or Elisson Romanel: <a href="mailto:elissonromanel@yahoo.com.br">elissonromanel@yahoo.com.br</a> </td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Super Family</b></th>
		<th><b>Gene Family</b></th>
		<th><b>Genomic Locus</b></th>
		<th><b>Gene Name</b></th>
	</tr>
	<tr class="alt">
		<td>B3 DNA Binding Superfamily</td>
		<td>ABI3</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g24650">At3g24650 </a></td>
		<td>ABI3</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
        <td>ABI3</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28300">At1g28300</a></td>
		<td>LEC2</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
        <td>ABI3</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g26790">At3g26790</a></td>
		<td>FUS3</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>HSI</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g30470">At2g30470</a></td>
		<td>HSI2/VAL1</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>HSI</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g32010">At4g32010</a></td>
		<td>HSI2 L1/VAL2</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>HSI</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g21550">At4g21550</a></td>
		<td>HSI2 L2/VAL3</td>
	</tr>
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ I / IA</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g19220">At1g19220</a></td>
		<td>ARF19</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ I / IA</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g19850">At1g19850</a></td>
		<td>ARF5</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ I / IA</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g30330">At1g30330</a></td>
		<td>ARF6</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ I / IA</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g20730">At5g20730</a></td>
		<td>ARF7</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ I / IA</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g37020">At5g37020</a></td>
		<td>ARF8</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ I /  IB</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g33860">At2g33860</a></td>
		<td>ARF3</td>
	</tr>
    
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ I /  IB</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60450">At5g60450</a></td>
		<td>ARF4</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IIB</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g59750">At1g59750</a></td>
		<td>ARF1</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IIB</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62000">At5g62000</a></td>
		<td>ARF2</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IIC</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46530">At2g46530</a></td>
		<td>ARF11</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IIC</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61830">At3g61830</a></td>
		<td>ARF18</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IIC</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g23980">At4g23980</a></td>
		<td>ARF9</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IID</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34170">At1g34170</a></td>
		<td>ARF13</td>
	</tr>
    
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IID</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34310">At1g34310</a></td>
		<td>ARF12</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IID</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34390">At1g34390</a></td>
		<td>ARF22</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IID</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34410">At1g34410</a></td>
		<td>ARF21</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IID</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g35240">At1g35240</a></td>
		<td>ARF20</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IID</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g35520">At1g35520</a></td>
		<td>ARF15</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IID</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g35540">At1g35540</a></td>
		<td>ARF14</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ II /  IID</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g43950">At1g43950</a></td>
		<td>ARF23</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ III</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77850">At1g77850</a></td>
		<td>ARF17</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ III</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28350">At2g28350</a></td>
		<td>ARF10</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>ARF/ III</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g30080">At4g30080</a></td>
		<td>ARF16</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g01030">At1g01030</a></td>
		<td>NGA3</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g36080">At2g36080</a></td>
		<td>RAV-like 1</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46870">At2g46870</a></td>
		<td>NGA1</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g11580">At3g11580</a></td>
		<td>RAV-like 2</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61970">At3g61970</a></td>
		<td>NGA2</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g01500">At4g01500</a></td>
		<td>NGA4</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g06250">At5g06250</a></td>
		<td>RAV-like 3</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV (AP2)/ II</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g50680">At1g50680</a></td>
		<td>RAV-like 4</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV (AP2)/ II</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g51120">At1g51120</a></td>
		<td>RAV-like 5</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV (AP2)/  I</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g13260">At1g13260</a></td>
		<td>RAV1</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV (AP2)/  I</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g25560">At1g25560</a></td>
		<td>TEM1</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV (AP2)/  I</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g25730">At3g25730</a></td>
		<td>RAV1-like</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>RAV (AP2)/  I</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68840">At1g68840</a></td>
		<td>RAV2/TEM2</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM I</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g19184">At3g19184</a></td>
		<td>REM 1</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM I</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g42700">At5g42700</a></td>
		<td>REM 2</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM I</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g58280">At5g58280</a></td>
		<td>REM 3</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VI</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49480">At1g49480</a></td>
		<td>RTV1/REM 4 </td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VI</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g18990">At3g18990</a></td>
		<td>VRN1/REM 5</td>
	</tr>
    
   
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g33280">At4g33280</a></td>
		<td>REM 6</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g18960">At3g18960</a></td>
		<td>REM 7</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g01580">At4g01580</a></td>
		<td>REM 8</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49475">At1g49475</a></td>
		<td>REM 9</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g66980">At5g66980</a></td>
		<td>REM10</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60140">At5g60140</a></td>
		<td>REM 11</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60130">At5g60130</a></td>
		<td>REM 12</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g46770">At3g46770</a></td>
		<td>REM 13</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g16640">At1g16640</a></td>
		<td>REM 14</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g57720">At5g57720</a></td>
		<td>REM 15</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g53310">At3g53310</a></td>
		<td>REM 16</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g34400">At4g34400</a></td>
		<td>REM 17</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g06160">At3g06160</a></td>
		<td>REM 18</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VIII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g06220">At3g06220</a></td>
		<td>REM 19</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g18000">At5g18000</a></td>
		<td>REM 20</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g18090">At5g18090</a></td>
		<td>REM 21</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g17010">At3g17010</a></td>
		<td>REM 22</td>
	</tr>
         <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g35310">At2g35310</a></td>
		<td>REM 23</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g16210">At2g16210</a></td>
		<td>REM 24</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g09780">At5g09780</a></td>
		<td>REM 25</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25475">At5g25475</a></td>
		<td>REM 26
</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM VII</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25470">At5g25470</a></td>
		<td>REM 27</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g26680">At1g26680</a></td>
		<td>REM 28</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g24650">At2g24650</a></td>
		<td>REM 29</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g24680">At2g24680</a></td>
		<td>REM 30</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g24690">At2g24690</a></td>
		<td>REM 31</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g24700">At2g24700</a></td>
		<td>REM 32</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00260">At4g00260</a></td>
		<td>REM 33</td>
	</tr>
    
      <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31610">At4g31610</a></td>
		<td>REM 34</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31615">At4g31615</a></td>
		<td>REM 35</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31620">At4g31620</a></td>
		<td>REM 36</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31630">At4g31630</a></td>
		<td>REM 37</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31640">At4g31640</a></td>
		<td>REM 38</td>
	</tr>
 
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31650">At4g31650</a></td>
		<td>REM 39</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31660">At4g31660</a></td>
		<td>REM 40</td>
	</tr>
    
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31680">At4g31680</a></td>
		<td>REM 41</td>
	</tr>
       <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM IX</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31690">At4g31690</a></td>
		<td>REM 42</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM X</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g20600">At1g20600</a></td>
		<td>REM 43</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM X</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g03170">At4g03170</a></td>
		<td>REM 44</td>
	</tr>
    <tr class="alt">
		<td>&nbsp;</td>
        <td>REM/ REM V</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g05930">At1g05930</a></td>
		<td>REM 45</td>
	</tr>
    
    
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
