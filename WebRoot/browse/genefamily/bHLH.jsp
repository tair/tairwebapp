<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "bHLH Transcription Factor Family";
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
<h2>bHLH Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Bailey, P. C.,Martin, C.,Toledo-Ortiz, G.,Quail, P. H.,Huq, E.,Heim, M. A.,Jakoby, M.,Werber, M.,Weisshaar, B.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501711482">Update on the Basic Helix-Loop-Helix Transcription Factor Gene Family in Arabidopsis thaliana.</a> THE PLANT CELL <b>15</b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>A few representative proteins were used to perform a Blast on the TAIR website. The resultant sequences with an E-value smaller than 10-5 were considered a good match, then the last sequence was used in a subsequent Blast, and so forth until all similar sequences were identified, then they were aligned, and any mismatched sequences were discarded</td></tr>
	<tr><th valign="top">Contact:</th> <td></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name</b></th>
		<th><b>Submitter Description</b></th>
	</tr>
<tr>		<td>bHLH Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g41315">At5g41315</a></td>
		<td>AtbHLH1</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31220">At2g31220</a></td>
		<td>AtbHLH10</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g41240">At2g41240</a></td>
		<td>AtbHLH100</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g04150">At5g04150</a></td>
		<td>AtbHLH101</td>
		<td>myc - like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69010">At1g69010</a></td>
		<td>AtbHLH102</td>
		<td>putative DNA-binding protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g21340">At4g21340</a></td>
		<td>AtbHLH103</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g14410">At4g14410</a></td>
		<td>AtbHLH104</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g54680">At5g54680</a></td>
		<td>AtbHLH105</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g41130">At2g41130</a></td>
		<td>AtbHLH106</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g56770">At3g56770</a></td>
		<td>AtbHLH107</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g25310">At1g25310</a></td>
		<td>AtbHLH108</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68240">At1g68240</a></td>
		<td>AtbHLH109</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36060">At4g36060</a></td>
		<td>AtbHLH11</td>
		<td>putative Myc-type transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g27660">At1g27660</a></td>
		<td>AtbHLH110</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g31050">At1g31050</a></td>
		<td>AtbHLH111</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g61660">At1g61660</a></td>
		<td>AtbHLH112</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g19500">At3g19500</a></td>
		<td>AtbHLH113</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g05170">At4g05170</a></td>
		<td>AtbHLH114</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g51070">At1g51070</a></td>
		<td>AtbHLH115</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g26744">At3g26744</a></td>
		<td>AtbHLH116</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g22100">At3g22100</a></td>
		<td>AtbHLH117</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g25400">At4g25400</a></td>
		<td>AtbHLH118</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28811">At4g28811</a></td>
		<td>AtbHLH119</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00480">At4g00480</a></td>
		<td>AtbHLH12</td>
		<td>MYC1 transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g51790">At5g51790</a></td>
		<td>AtbHLH120</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g19860">At3g19860</a></td>
		<td>AtbHLH121</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g51140">At1g51140</a></td>
		<td>AtbHLH122</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g20640">At3g20640</a></td>
		<td>AtbHLH123</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46970">At2g46970</a></td>
		<td>AtbHLH124</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g62975">At1g62975</a></td>
		<td>AtbHLH125</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g25410">At4g25410</a></td>
		<td>AtbHLH126</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28815">At4g28815</a></td>
		<td>AtbHLH127</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g05805">At1g05805</a></td>
		<td>AtbHLH128</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g43140">At2g43140</a></td>
		<td>AtbHLH129</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g01260">At1g01260</a></td>
		<td>AtbHLH13</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42280">At2g42280</a></td>
		<td>AtbHLH130</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g38071">At4g38071</a></td>
		<td>AtbHLH131</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g62090">At3g62090</a></td>
		<td>AtbHLH132</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g20095">At2g20095</a></td>
		<td>AtbHLH133</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g15160">At5g15160</a></td>
		<td>AtbHLH134</td>
		<td>bHLH protein family, contains Pfam profile: PF0001</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g74500">At1g74500</a></td>
		<td>AtbHLH135</td>
		<td>bHLH protein family, contains Pfam profile: PF0001</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39860">At5g39860</a></td>
		<td>AtbHLH136</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g50915">At5g50915</a></td>
		<td>AtbHLH137</td>
		<td>bHLH protein family, contains Pfam profile: PF0001</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31215">At2g31215</a></td>
		<td>AtbHLH138</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g43175">At5g43175</a></td>
		<td>AtbHLH139</td>
		<td>bHLH protein family, contains Pfam profile: PF0001</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00870">At4g00870</a></td>
		<td>AtbHLH14</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g38860">At5g38860</a></td>
		<td>AtbHLH141</td>
		<td>bHLH protein family, contains Pfam profile: PF0001</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g64340">At5g64340</a></td>
		<td>AtbHLH142</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g09460">At5g09460</a></td>
		<td>AtbHLH143</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g29950">At1g29950</a></td>
		<td>AtbHLH144</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g50010">At5g50010</a></td>
		<td>AtbHLH145</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g30180">At4g30180</a></td>
		<td>AtbHLH146</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g17100">At3g17100</a></td>
		<td>AtbHLH147</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g06590">At3g06590</a></td>
		<td>AtbHLH148</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g09250">At1g09250</a></td>
		<td>AtbHLH149</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g20180">At2g20180</a></td>
		<td>AtbHLH15</td>
		<td>PHYTOCHROME-INTERACTING FACTOR 1</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g05800">At3g05800</a></td>
		<td>AtbHLH150</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g47270">At2g47270</a></td>
		<td>AtbHLH151</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22380">At1g22380</a></td>
		<td>AtbHLH152</td>
		<td>glycosyltransferase family, contains Pfam profile:</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g05710">At1g05710</a></td>
		<td>AtbHLH153</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31730">At2g31730</a></td>
		<td>AtbHLH154</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31280">At2g31280</a></td>
		<td>AtbHLH155</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g27230">At2g27230</a></td>
		<td>AtbHLH156</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g64625">At1g64625</a></td>
		<td>AtbHLH157</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g43060">At2g43060</a></td>
		<td>AtbHLH158</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g30410">At4g30410</a></td>
		<td>AtbHLH159</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00050">At4g00050</a></td>
		<td>AtbHLH16</td>
		<td>putative transcriptional regulator</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g71200">At1g71200</a></td>
		<td>AtbHLH160</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g47710">At3g47710</a></td>
		<td>AtbHLH161</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g20970">At4g20970</a></td>
		<td>AtbHLH162</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46510">At2g46510</a></td>
		<td>AtbHLH17</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22750">At2g22750</a></td>
		<td>AtbHLH18</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22760">At2g22760</a></td>
		<td>AtbHLH19</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g63650">At1g63650</a></td>
		<td>AtbHLH2</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22770">At2g22770</a></td>
		<td>AtbHLH20</td>
		<td>putative bHLH transcription factor, NAI1</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g16910">At2g16910</a></td>
		<td>AtbHLH21</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g21330">At4g21330</a></td>
		<td>AtbHLH22</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28790">At4g28790</a></td>
		<td>AtbHLH23</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36930">At4g36930</a></td>
		<td>AtbHLH24</td>
		<td>bHLH protein, SPATULA</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g37850">At4g37850</a></td>
		<td>AtbHLH25</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g02340">At1g02340</a></td>
		<td>AtbHLH26</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g29930">At4g29930</a></td>
		<td>AtbHLH27</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g46830">At5g46830</a></td>
		<td>AtbHLH28</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28160">At2g28160</a></td>
		<td>AtbHLH29</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g16430">At4g16430</a></td>
		<td>AtbHLH3</td>
		<td>transcription factor like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68810">At1g68810</a></td>
		<td>AtbHLH30</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g59640">At1g59640</a></td>
		<td>AtbHLH31</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g25710">At3g25710</a></td>
		<td>AtbHLH32</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12860">At1g12860</a></td>
		<td>AtbHLH33</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g23210">At3g23210</a></td>
		<td>AtbHLH34</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g57150">At5g57150</a></td>
		<td>AtbHLH35</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g51780">At5g51780</a></td>
		<td>AtbHLH36</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g50330">At3g50330</a></td>
		<td>AtbHLH37</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g56970">At3g56970</a></td>
		<td>AtbHLH38</td>
		<td>putative protein, ORG2</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g56980">At3g56980</a></td>
		<td>AtbHLH39</td>
		<td>putative protein, ORG3</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17880">At4g17880</a></td>
		<td>AtbHLH4</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00120">At4g00120</a></td>
		<td>AtbHLH40</td>
		<td>hypothetical protein, INDEHISCENT</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g56960">At5g56960</a></td>
		<td>AtbHLH41</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g09820">At4g09820</a></td>
		<td>AtbHLH42</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g09750">At5g09750</a></td>
		<td>AtbHLH43</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g18400">At1g18400</a></td>
		<td>AtbHLH44</td>
		<td>helix-loop-helix protein homolog, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g06120">At3g06120</a></td>
		<td>AtbHLH45</td>
		<td>putative helix-loop-helix DNA-binding protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g08130">At5g08130</a></td>
		<td>AtbHLH46</td>
		<td>myc-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g47640">At3g47640</a></td>
		<td>AtbHLH47</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42300">At2g42300</a></td>
		<td>AtbHLH48</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68920">At1g68920</a></td>
		<td>AtbHLH49</td>
		<td>putative DNA-binding protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g46760">At5g46760</a></td>
		<td>AtbHLH5</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g73830">At1g73830</a></td>
		<td>AtbHLH50</td>
		<td>putative helix-loop-helix DNA-binding protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g40200">At2g40200</a></td>
		<td>AtbHLH51</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g30670">At1g30670</a></td>
		<td>AtbHLH52</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g34820">At2g34820</a></td>
		<td>AtbHLH53</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g27740">At1g27740</a></td>
		<td>AtbHLH54</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12540">At1g12540</a></td>
		<td>AtbHLH55</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28800">At4g28800</a></td>
		<td>AtbHLH56</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g01460">At4g01460</a></td>
		<td>AtbHLH57</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36540">At4g36540</a></td>
		<td>AtbHLH58</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g02590">At4g02590</a></td>
		<td>AtbHLH59</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g32640">At1g32640</a></td>
		<td>AtbHLH6</td>
		<td>bHLH protein (RAP-1)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g57800">At3g57800</a></td>
		<td>AtbHLH60</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g10570">At5g10570</a></td>
		<td>AtbHLH61</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g07340">At3g07340</a></td>
		<td>AtbHLH62</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g34530">At4g34530</a></td>
		<td>AtbHLH63</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g18300">At2g18300</a></td>
		<td>AtbHLH64</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g59060">At3g59060</a></td>
		<td>AtbHLH65</td>
		<td>PHYTOCHROME-INTERACTING FACTOR 5</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g24260">At2g24260</a></td>
		<td>AtbHLH66</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61950">At3g61950</a></td>
		<td>AtbHLH67</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g29100">At4g29100</a></td>
		<td>AtbHLH68</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g30980">At4g30980</a></td>
		<td>AtbHLH69</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g03040">At1g03040</a></td>
		<td>AtbHLH7</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46810">At2g46810</a></td>
		<td>AtbHLH70</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g46690">At5g46690</a></td>
		<td>AtbHLH71</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g61270">At5g61270</a></td>
		<td>AtbHLH72</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g67110">At5g67110</a></td>
		<td>AtbHLH73</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g10120">At1g10120</a></td>
		<td>AtbHLH74</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g25330">At1g25330</a></td>
		<td>AtbHLH75</td>
		<td>helix-loop-helix protein homolog, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g26260">At1g26260</a></td>
		<td>AtbHLH76</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g23690">At3g23690</a></td>
		<td>AtbHLH77</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g48560">At5g48560</a></td>
		<td>AtbHLH78</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62610">At5g62610</a></td>
		<td>AtbHLH79</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g09530">At1g09530</a></td>
		<td>AtbHLH8</td>
		<td>putative phytochrome-associated protein 3</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g35460">At1g35460</a></td>
		<td>AtbHLH80</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g09180">At4g09180</a></td>
		<td>AtbHLH81</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g58010">At5g58010</a></td>
		<td>AtbHLH82</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g66470">At1g66470</a></td>
		<td>AtbHLH83</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g14760">At2g14760</a></td>
		<td>AtbHLH84</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g33880">At4g33880</a></td>
		<td>AtbHLH85</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g37800">At5g37800</a></td>
		<td>AtbHLH86</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g21330">At3g21330</a></td>
		<td>AtbHLH87</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g67060">At5g67060</a></td>
		<td>AtbHLH88</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g06170">At1g06170</a></td>
		<td>AtbHLH89</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g43010">At2g43010</a></td>
		<td>AtbHLH9</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g10610">At1g10610</a></td>
		<td>AtbHLH90</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31210">At2g31210</a></td>
		<td>AtbHLH91</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g43650">At5g43650</a></td>
		<td>AtbHLH92</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65640">At5g65640</a></td>
		<td>AtbHLH93</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22490">At1g22490</a></td>
		<td>AtbHLH94</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g49770">At4g49770</a></td>
		<td>AtbHLH95</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g72210">At1g72210</a></td>
		<td>AtbHLH96</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g24140">At3g24140</a></td>
		<td>AtbHLH97</td>
		<td>helix-loop-helix DNA-binding protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g53210">At5g53210</a></td>
		<td>AtbHLH98</td>
		<td>bHLH protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65320">At5g65320</a></td>
		<td>AtbHLH99</td>
		<td>bHLH protein</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
