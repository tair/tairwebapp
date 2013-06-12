<html>
<head>
<title>TAIR Help:Germplasm Search</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<p>
<a name="germ1"></a><h2>Using the Germplasm Search</h2>
<p>
<a name="germ2"></a><font class ="cont">The germplasm search allows you to search TAIR's database for individual and  pooled lines, and to place orders for seeds that are ABRC stocks. You can perform simple searching by name or add certain restrictions to narrow down the results. If you want to search only Ecotypes and restrict by geographic features (e.g. collection site, country of origin), please try the <a href="/servlets/Search?type=ecotype&search_action=new_search">Ecotype/Species Search</a>.For help on searching Ecotypes/Species see <a href="ecosearch.jsp">Ecotype/Species Search Help</a></font>
<p>
<a name="germ3"></a><h2>Search by germplasm type</h2>
<p>
<a name="germ4"></a><font class="cont">Use this drop down menu to select from the following types. Choosing 'Any Germplasm type" will return all types.</font>
<ul>
<li><u>individual line</u>: A germplasm from a single plant. For example mutant lines, transgenic lines and ecotypes.
<li><u>individual pool</u>: A mixture of germplasms from a number of individual plants. For example, individual T-DNA insertion lines that have been pooled together to facilitate screening and genotyping.
<li><u>sets of lines</u>: Individual lines that can be obtained as sets of related lines. For example, sets of individual recombinant inbred lines for mapping, or sets of individual GFP lines for examining gene expression patterns.
<li><u>sets of pools</u>: Pooled lines that have been grouped into larger sets. For example, pools of insertion lines are available as larger sets. These sets of pools are used for the initial screening to identify smaller sets of pools and then individual pools containing the individual line(s) of interest.
</li></ul>

<a name="germ5"></a><h2>Search by species, name, description and stock number</h2>
<a name="germ6"></a><font class="cont">You can restrict your search to one or more of the following features. Note that if you choose to search by multiple features, only germplasms that meet ALL of the entered criteria will be returned. For example a search for gene name starts with GA AND description contains dwarf will NOT return results for all strains that are dwarf.</font>
<a name="germ7"></a><h4>Species</a></h4>
<a name="germ7"></a><font class="cont">The majority of germplasms in TAIR are from Arabidopsis thaliana.  However, some other species are also available from the ABRC.The default parameter is set to Arabidopsis thaliana.</font>
<a name="germ8"></a><h4>Germplasm name and stock number</h4>
<a name="germ9"></a><font class="cont">For germplasm that are ABRC seed stocks, the germplasm name usually corresponds to the ABRC stock id. The stock id begins with CS followed by a numerical  accession (e.g. CSnnnn).  Notable exceptions to this rule are all of the SALK T-DNA insertion lines which retain their SALK ids.</font>
<a name="germ10"></a><h4>Description</h4>
<a name="germ11"></a><font class="cont"> Use this field to search within the description. For example, if you are searching for strains that are both male sterile and have lobed leaves, enter description contains 'male sterile' in one row and  description contains 'lobed leaves' in the second row.
<a name="germ11"></a><h4>Other names</h4>
<a name="germ12"></a><font class="cont">You can also search by gene names, locus name and donor last name and donor organization name (for seed stocks).Searching by donor name is a quick way to stocks developed as part of functional genomics projects.</font>
<a name=""></a><h4>Donor Names</h4>
<a name=""></a><font class="cont">You can search for seed stocks by the name of the donor. If the donor is an individual use the Donor Last Name option (e.g. Weigel). Dontations from organizations (rather than individuals) use the name of the organization (e.g. SSP Consortium).</font>
<ul>Examples:
<li>To find any strain carrying ANY mutation in the CAL gene choose:Gene symbol EXACTLY "CAL"
<li>To find sets of activation tagged lines from the Weigel lab choose: Donor name EXACTLY 'Weigel"
</li></ul>
<a name="germ13"></a><h2>Search by Allele</h2>
<a name="germ14"></a><font class="cont">Use this search to find strains with specific alleles or combinations of alleles. Note that if you search for multiple alleles, you will only see results where ALL alleles are found in the same strain. To find strains with either AP1 or CAL mutant alleles you will need to perform two separate searches.</font>
<ul>Examples:
<li>To find lines containing mutant alleles of both CAL and AP1: in the first row type in AP1 and in the second row type in CAL.
<li>To find any line  heterozygous for AP1 choose: AP1 and select heterozygous from the drop down menu.
</li></ul>
<a name="germ15"></a><h2>Restrict by Features</h2>
<a name="germ16"></a><font class="cont">If you have a very specific search in mind you can choose one or more features to return only those germplasms that meet these parameters. NOTE:These parameters may be used in addition to name and genotype restrictions but more complicated queries will be very slow and may return  less than the number of expected results. These features are useful to return broad categories of germplasm.</font>
<a name="germ16"></a><h4>Germplasm Features</h4>
<font class="cont">Germplasms can be searched by a number of features.You can choose more than one option. Note that choosing more than one treats the search as a logical 'AND'. For example, is ABRC stock AND is transgenic.
<ul>
<li>is ABRC stock: Restricts your search to include only germplasm that are ABRC stocks in the results.
<li>has observable phenotype: Restricts your search to only include germplasm that have an assay-able phenotype (e.g. visible or biochemical traits).
<li>has polymorphisms: Restricts your search to include only germplasm associated with known variants (e.g. alleles, T-DNA insertions, small insertions or deletions, single base pair substitutions).
<li>is transgenic: Restricts your search to only include germplasm that contains a transgene.
<li>is mapping/RI line: Restricts your search to include only germplasm that are used for genetic mapping with visible or molecular markers.
<li>is ecotype: Restricts your search to include only strains that are natural accessions.
</ul></font>
<a name="germ17"></a><h4>Chromosomal Constitution</h4>
<font class="cont">This feature allows you to limit your search to certain chromosomal variants.Checking is aneuploid will include only aneuploids in your search. You can also specify the aneuploid chromosome. For example, if you want to search for germplasms that are trisomic.
<a name="germ18"></a><h4>Background Ecotype</h4>
<font class="cont">This feature allows you to limit your results to only include strains having one or more specified ecotypes in its genetic background. To select multiple ecotypes, hold down the APPLE key (MAC) or CTRL key (PC) while selecting from the list..</font>
<a name="germ19"></a><h4>Mutagen</h4>
<font class="cont">You can restrict your search to include only germplasms that have been treated with one or more specific mutagens.To select multiple mutagens (e.g. you want strains that have been either treated with X-rays or mutated with EMS), hold down the APPLE key (MAC) or CTRL key (PC) while selecting from the list.</font>
<a name="germ20"></a><h4>Insertion type</h4>
<font class="cont">For strains that contain insertions (e.g.transposons,  or T-DNAs) this feature allows you to define the type of insertion to include in the results.</font>
<a name="germ21"></a><h4>Transgene Construct type</h4>
<font class="cont">For germplasms that contain a transgenic DNA construct, this feature allows you to restrict your search to only those strains having a specified construct.</font>
<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
