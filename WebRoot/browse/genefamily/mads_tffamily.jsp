<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "MADS Transcription Factor Family";
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
<h2>MADS Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Parenicova, L.,de Folter, S.,Kieffer, M.,Horner, D. S.,Favalli, C.,Busscher, J.,Cook, H. E.,Ingram, R. M.,Kater, M. M.,Davies, B.,Angenent, G. C.,Colombo, L.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501707748">Molecular and phylogenetic analyses of the complete MADS-box transcription factor family in Arabidopsis: new openings to the MADS world.</a> THE PLANT CELL <b>15</b>
</li> <li>
<b>Riechmann, J. L.,Wang, M.,Meyerowitz, E. M.</b> (1996) <a href="/servlets/TairObject?type=publication&amp;id=3751">DNA-binding properties of Arabidopsis MADS domain homeotic proteins APETALA1, APETALA3, PISTILLATA and AGAMOUS.</a> NUCLEIC ACIDS RESEARCH [COMPUTER FILE] <b>24</b>
</li> <li>

<b>Coen, E. S.,Meyerowitz, E. M.</b> (1991) <a href="/servlets/TairObject?type=publication&amp;id=5499">The war of the whorls: genetic interactions controlling flower development.</a> NATURE <b>353</b>
</li> <li>
<b>Sieburth, L. E.,Running, M. P.,Meyerowitz, E. M.</b> (1995) <a href="/servlets/TairObject?type=publication&amp;id=4335">Genetic separation of third and fourth whorl functions of AGAMOUS.</a> THE PLANT CELL <b>7</b>
</li> <li>
<b>Kohler, Claudia,Hennig, Lars,Spillane, Charles,Pien, Stephane,Gruissem, Wilhelm,Grossniklaus, Ueli</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501706915">The Polycomb-group protein MEDEA regulates seed development by controlling expression of the MADS-box gene PHERES1.</a> GENES AND DEVELOPMENT <b>17</b>
</li> <li>
<b>Bowman, J. L.,Smyth, D. R.,Meyerowitz, E. M.</b> (1989) <a href="/servlets/TairObject?type=publication&amp;id=5700">Genes directing flower development in Arabidopsis.</a> THE PLANT CELL <b>1</b>
</li> <li>
<b>Immink, R. G.,Ferrario, S.,Busscher-Lange, J.,Kooiker, M.,Busscher, M.,Angenent, G. C.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501683364">Analysis of the petunia MADS-box transcription factor family.</a> MOLECULAR GENETICS AND GENOMICS <b>268</b>
</li> <li>
<b>Honma, T.,Goto, K.</b> (2001) <a href="/servlets/TairObject?type=publication&amp;id=501680357">Complexes of MADS-box proteins are sufficient to convert leaves into floral organs.</a> NATURE <b>409</b>
</li> <li>

<b>Alvarez, Buylla Elena R.,Liljegren, Sarah J.,Pelaz, Soraya,Gold, Scott E.,Burgeff, Caroline,Ditta, Gary S.,Vergara, Silva Francisco,Yanofsky, Martin F.</b> (2000) <a href="/servlets/TairObject?type=publication&amp;id=501679588">MADS-box gene evolution beyond flowers: Expression in pollen, endosperm, guard cells, roots and trichomes.</a> THE PLANT JOURNAL <b>24</b>
</li> <li>
<b>Becker, A.,Theissen, G.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501711446">The major clades of MADS-box genes and their role in the development and evolution of flowering plants.</a> MOLECULAR PHYLOGENETICS AND EVOLUTION <b>29</b>
</li> <li>

<b>Bowman, J. L.,Drews, G. N.,Meyerowitz, E. M.</b> (1991) <a href="/servlets/TairObject?type=publication&amp;id=5513">Expression of the Arabidopsis floral homeotic gene AGAMOUS is restricted to specific cell types late in flower development.</a> THE PLANT CELL <b>3</b>
</li> <li>
<b>Yanofsky, M. F.,Ma, H.,Bowman, J. L.,Drews, G. N.,Feldmann, K. A.,Meyerowitz, E. M.</b> (1990) <a href="/servlets/TairObject?type=publication&amp;id=5621">The protein encoded by the Arabidopsis homeotic gene agamous resembles transcription factors.</a> NATURE <b>346</b>
</li> <li>
<b>Becker, A.,Kaufmann, K.,Freialdenhoven, A.,Vincent, C.,Li, M. A.,Saedler, H.,Theissen, G.</b> (2002) <a href="/servlets/TairObject?type=publication&amp;id=1547280">A novel MADS-box gene subfamily with a sister-group relationship to class B floral homeotic genes.</a> MOLECULAR GENETICS AND GENOMICS <b>266</b>
</li> <li>
<b>Winter, K. U.,Saedler, H.,Theissen, G.</b> (2002) <a href="/servlets/TairObject?type=publication&amp;id=501681775">On the origin of class B floral homeotic genes: functional substitution and dominant inhibition in Arabidopsis by expression of an orthologue from the gymnosperm Gnetum.</a> THE PLANT JOURNAL <b>31</b>
</li> <li>
<b>Kohler C, Page DR, Gagliardini V, Grossniklaus U</b> (2005) <a href="/servlets/TairObject?type=publication&amp;id=501714524">The Arabidopsis thaliana MEDEA Polycomb group protein controls expression of PHERES1 by parental imprinting.</a> NATURE GENETICS <b>37</b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b>Bowman, J. L.,Smyth, D. R.,Meyerowitz, E. M.</b> (1991) <a href="/servlets/TairObject?type=publication&amp;id=5540">Genetic interactions among floral homeotic genes of Arabidopsis.</a> DEVELOPMENT <b>112</b>
</li> <li>
<b>Martinez-Castilla, L. P.,Alvarez-Buylla, E. R.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501711487">Adaptive evolution in the Arabidopsis MADS-box gene family inferred from its complete resolved phylogeny.</a> PROCEEDINGS OF THE NATIONAL ACADEMY OF SCIENCES OF THE UNITED STATES OF AMERICA <b>100</b>
</li> <li>
<b>Zhang, H.,Forde, B. G.</b> (1998) <a href="/servlets/TairObject?type=publication&amp;id=2847">An Arabidopsis MADS box gene that controls nutrient-induced changes in root architecture.</a> SCIENCE <b>279</b>
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
	<tr class="alt">
		<td>MADS Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g18960">At4g18960</a></td>
		<td>AG</td>
		<td>floral homeotic protein agamous (AGAMOUS)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g58780">At3g58780</a></td>
		<td>AGL1</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g26310">At1g26310</a></td>
		<td>AGL10</td>
		<td>floral regulatory gene CAULIFLOWER</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g17310">At1g17310</a></td>
		<td>AGL100</td>
		<td>MADS-box protein, AGL100</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g27050">At5g27050</a></td>
		<td>AGL101</td>
		<td>MADS-box protein, AGL101</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g47760">At1g47760</a></td>
		<td>AGL102</td>
		<td>MADS-box protein, AGL102</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g18650">At3g18650</a></td>
		<td>AGL103</td>
		<td>MADS-box protein, contains Pfam profile, AGL103</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22130">At1g22130</a></td>
		<td>AGL104</td>
		<td>MADS-box protein, AGL104</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g37420">At5g37420</a></td>
		<td>AGL105</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g09960">At4g09960</a></td>
		<td>AGL11</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g71692">At1g71692</a></td>
		<td>AGL12</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61120">At3g61120</a></td>
		<td>AGL13</td>
		<td>MADS-box protein, AGL13</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g11880">At4g11880</a></td>
		<td>AGL14</td>
		<td>MADS-box protein AGL14</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g13790">At5g13790</a></td>
		<td>AGL15</td>
		<td>floral homeotic protein, AGL15</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g57230">At3g57230</a></td>
		<td>AGL16</td>
		<td>MADS-box protein, AGL16</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22630">At2g22630</a></td>
		<td>AGL17</td>
		<td>MADS-box protein AGL17</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g57390">At3g57390</a></td>
		<td>AGL18</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g22950">At4g22950</a></td>
		<td>AGL19</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g15800">At5g15800</a></td>
		<td>AGL2</td>
		<td>MADS-box protein AGL2</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g45660">At2g45660</a></td>
		<td>AGL20</td>
		<td>MADS-box protein (AGL20)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g37940">At4g37940</a></td>
		<td>AGL21</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22540">At2g22540</a></td>
		<td>AGL22</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g65360">At1g65360</a></td>
		<td>AGL23</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g24540">At4g24540</a></td>
		<td>AGL24</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g10140">At5g10140</a></td>
		<td>AGL25</td>
		<td>MADS box protein FLOWERING LOCUS F (FLF)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g26870">At5g26870</a></td>
		<td>AGL26</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77080">At1g77080</a></td>
		<td>AGL27</td>
		<td>MADS affecting flowering 1(MAF1)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g01530">At1g01530</a></td>
		<td>AGL28</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g34440">At2g34440</a></td>
		<td>AGL29</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g03710">At2g03710</a></td>
		<td>AGL3</td>
		<td>MADS-box protein (AGL3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g03060">At2g03060</a></td>
		<td>AGL30</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65050">At5g65050</a></td>
		<td>AGL31</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g23260">At5g23260</a></td>
		<td>AGL32</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g26320">At2g26320</a></td>
		<td>AGL33</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g26575">At5g26575</a></td>
		<td>AGL34</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g26630">At5g26630</a></td>
		<td>AGL35</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g26650">At5g26650</a></td>
		<td>AGL36</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g65330">At1g65330</a></td>
		<td>AGL37</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g65300">At1g65300</a></td>
		<td>AGL38</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g27130">At5g27130</a></td>
		<td>AGL39</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g02310">At3g02310</a></td>
		<td>AGL4</td>
		<td>floral homeotic protein AGL4, SEPALLATA2 (SEP2)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36590">At4g36590</a></td>
		<td>AGL40</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g26880">At2g26880</a></td>
		<td>AGL41</td>
		<td>MADS-box protein, AGL41</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62165">At5g62165</a></td>
		<td>AGL42</td>
		<td>MADS-box protein, AGL42</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g40220">At5g40220</a></td>
		<td>AGL43</td>
		<td>MADS-box protein, AGL43</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g14210">At2g14210</a></td>
		<td>AGL44</td>
		<td>MADS-box protein ANR1</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g05860">At3g05860</a></td>
		<td>AGL45</td>
		<td>MADS-box protein, AGL45</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28700">At2g28700</a></td>
		<td>AGL46</td>
		<td>MADS-box protein, AGL46</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g55690">At5g55690</a></td>
		<td>AGL47</td>
		<td>MADS-box protein, AGL47</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g40210">At2g40210</a></td>
		<td>AGL48</td>
		<td>putative MADS-box protein, AGL48</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60040">At1g60040</a></td>
		<td>AGL49</td>
		<td>MADS-box protein, AGL49</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42830">At2g42830</a></td>
		<td>AGL5</td>
		<td>floral homeodomain transcription factor (AGL5)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g59810">At1g59810</a></td>
		<td>AGL50</td>
		<td>MADS-box protein, AGL50</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g02240">At4g02240</a></td>
		<td>AGL51</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g11250">At4g11250</a></td>
		<td>AGL52</td>
		<td>MADS-box hypothetical protein, AGL52</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g27070">At5g27070</a></td>
		<td>AGL53</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g27090">At5g27090</a></td>
		<td>AGL54</td>
		<td>MADS-box protein, AGL54</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60920">At1g60920</a></td>
		<td>AGL55</td>
		<td>MADS-box protein, contains SRF-type TF, AGL55</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60880">At1g60880</a></td>
		<td>AGL56</td>
		<td>MADS-box protein, contains SRF-type TF, AGL56</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g04100">At3g04100</a></td>
		<td>AGL57</td>
		<td>MADS-box protein, AGL57</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28450">At1g28450</a></td>
		<td>AGL58</td>
		<td>MADS-box protein, AGL58</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28460">At1g28460</a></td>
		<td>AGL59</td>
		<td>MADS-box protein, AGL59</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g45650">At2g45650</a></td>
		<td>AGL6</td>
		<td>MADS-box protein (AGL6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g72350">At1g72350</a></td>
		<td>AGL60</td>
		<td>MADS-box protein, AGL60</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g24840">At2g24840</a></td>
		<td>AGL61</td>
		<td>MADS-box protein, AGL61</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60440">At5g60440</a></td>
		<td>AGL62</td>
		<td>MADS-box protein, AGL62</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g31140">At1g31140</a></td>
		<td>AGL63</td>
		<td>MADS-box protein, AGL63</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g29960">At1g29960</a></td>
		<td>AGL64</td>
		<td>hypothetical protein, AGL64</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g18750">At1g18750</a></td>
		<td>AGL65</td>
		<td>MADS-box protein, AGL65</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77980">At1g77980</a></td>
		<td>AGL66</td>
		<td>hypothetical protein, AGL66</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77950">At1g77950</a></td>
		<td>AGL67</td>
		<td>MADS box transcription factor, putative, AGL67</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65080">At5g65080</a></td>
		<td>AGL68</td>
		<td>MADS-box protein, AGL68</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65070">At5g65070</a></td>
		<td>AGL69</td>
		<td>MADS-box protein, AGL69</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69120">At1g69120</a></td>
		<td>AGL7</td>
		<td>floral homeotic gene APETALA1</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65060">At5g65060</a></td>
		<td>AGL70</td>
		<td>MADS-box protein, AGL70</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g51870">At5g51870</a></td>
		<td>AGL71</td>
		<td>MADS-box protein, AGL71</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g51860">At5g51860</a></td>
		<td>AGL72</td>
		<td>MADS-box protein, AGL72</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g38620">At5g38620</a></td>
		<td>AGL73</td>
		<td>MADS-box protein, AGL73</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g48150">At1g48150</a></td>
		<td>AGL74</td>
		<td>MADS-box protein, AGL74</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g41200">At5g41200</a></td>
		<td>AGL75</td>
		<td>MADS-box protein, AGL75</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g40120">At5g40120</a></td>
		<td>AGL76</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g38740">At5g38740</a></td>
		<td>AGL77</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65330">At5g65330</a></td>
		<td>AGL78</td>
		<td>MADS-box protein, AGL78</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g30260">At3g30260</a></td>
		<td>AGL79</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60910">At5g60910</a></td>
		<td>AGL8</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g48670">At5g48670</a></td>
		<td>AGL80</td>
		<td>MADS-box protein, AGL80</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39750">At5g39750</a></td>
		<td>AGL81</td>
		<td>MADS-box protein, AGL81</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g58890">At5g58890</a></td>
		<td>AGL82</td>
		<td>MADS-box protein, AGL82</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g49490">At5g49490</a></td>
		<td>AGL83</td>
		<td>MADS-box protein, AGL83</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g49420">At5g49420</a></td>
		<td>AGL84</td>
		<td>MADS-box protein, AGL84</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g54760">At1g54760</a></td>
		<td>AGL85</td>
		<td>MADS-box protein, AGL85</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g31630">At1g31630</a></td>
		<td>AGL86</td>
		<td>MADS-box protein, AGL86</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22590">At1g22590</a></td>
		<td>AGL87</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g11990">At2g11990</a></td>
		<td>AGL88</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g27580">At5g27580</a></td>
		<td>AGL89</td>
		<td>MADS-box hypothetical protein, AGL89</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g24260">At1g24260</a></td>
		<td>AGL9</td>
		<td>MADS-box protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g27960">At5g27960</a></td>
		<td>AGL90</td>
		<td>MADS-box protein, AGL90</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g66656">At3g66656</a></td>
		<td>AGL91</td>
		<td>MADS-box protein, AGL91</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g31640">At1g31640</a></td>
		<td>AGL92</td>
		<td>MADS-box protein, AGL92</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g26950">At5g26950</a></td>
		<td>AGL93</td>
		<td>MADS-box protein, AGL93</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69540">At1g69540</a></td>
		<td>AGL94</td>
		<td>MADS-box protein, AGL94</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g15660">At2g15660</a></td>
		<td>AGL95</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g06500">At5g06500</a></td>
		<td>AGL96</td>
		<td>MADS-box protein, AGL96</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g46408">At1g46408</a></td>
		<td>AGL97</td>
		<td>MADS-box protein, AGL97</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39810">At5g39810</a></td>
		<td>AGL98</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g04640">At5g04640</a></td>
		<td>AGL99</td>
		<td>MADS-box protein, AGL99</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g54340">At3g54340</a></td>
		<td>AP3</td>
		<td>floral homeotic protein APETALA3 (AP3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g33070">At1g33070</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g20240">At5g20240</a></td>
		<td>PI</td>
		<td>MADS-box protein</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
