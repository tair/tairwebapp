<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR -Clones/DNA resources-Immature Seed EST Clones from Benning";
String highlight = "7";
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

<jsp:include page="/jsp/includes/clonesSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>


<div id="rightcolumn">
<!--CONTENT IN HERE -->


<span class="mainheader">Immature Seed ESTs from Christoph Benning</span>

<dl>
<dt>LIBRARY INFORMATION</dt>

<dd>Plate position Prefix: M</dd>
<dd>Tissue source: immature seeds</dd>
<dd>Vector: pBluescript SK-</dd>
<dd>Cloning enzymes: EcoRI and XhoI</dd>
<dd>Host strain DH10B or XL1blue (see details below)</dd>
<dd>Library comments: 5 to 13 day old seeds of Arabidopsis thaliana ecotype Col2.</dd>
<dd>Vector = Uni-ZAP TMXR oriented</dd>
<p />
</dl>
<p>A subset of clones deposited in Genbank was generated based on
Blast analysis against the Newman EST library to identify unique
clones to be maintained and distributed by the stock center. Clones
are distributed as bacterial stabs and should be grown on media
containing Ampicillin (50 ug/ml). The original clones from this
collection were donated in two separate forms and will be referred to
as data set 1 and data set 2. Data set 1 clone names begin with M7
through M61. Data set 2 clone names begin with M62 through M79. The
handling of the two data sets is described below.</p>


<p>Data set 1 was received in the form of DNA that had been
re-arrayed from the original 96 well plates prepared for the
sequencing reactions using a Beckman Biomek 2000. The DNA was diluted
using a Beckman Biomek 2000 and quantified using Pico Green reagent
and a BioRad molecular imager FX. DNA was transformed into calcium
chloride competent cells of E. coli, strain DH10B. A single colony
was selected and grown to generate duplicate glycerol stocks in
individual cryovials.</p>

<p>Data set 2 was received as glycerol stocks in 384 well plates
re-arrayed by Incyte Pharmaceuticals from an initial set of plates.
Clones were struck out for single colony isolation and duplicate
glycerol stocks in individual cryovials were generated. These clones
are in the original host strain XL1Blue MRF' used for excision from
the Unizap vector. We have encountered some viability problems with
these clones. These clones are unstable in the host strain and the
cells tend to lyse when stressed. This is potentially due to residual
helper phage from the original excision. We recommend streaking out
the clone from the stab on selective media (Ampicillin 50 ug/ml) as
soon as you receive it. Select a single colony to inoculate selective
liquid media and incubate at 37C with shaking for no more than 14
hours. Then prepare plasmid DNA by mini-prep to be transformed into a
different host strain, such as DH10B.</p>



<p>None of the clones from this library have been sequence verified.
If you sequence a clone as part of your research please send us the
sequence for our records and for the benefit of other researchers.
For more information concerning the library see <a href="http://benningnt.bch.msu.edu/index.htm">http://benningnt.bch.msu.edu/index.htm</a>
If you have difficulty growing or obtaining DNA from the clone, or if
you have further questions, please contact Emma Knee (email:
knee.2@osu.edu telephone: (614) 292-2988).</p>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>