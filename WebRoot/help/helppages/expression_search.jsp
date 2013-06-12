<html>
<head>
<title>TAIR Help: Microarray Expression Search</title>
<link rel="stylesheet" type="text/css" href="/css/main.css" >
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("help_expression.jsp");
writeHeader();
</script>
<!-- End of header -->
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#F5F9FF">
<!-- End of header -->
<h2>Contents</h2>
<ul>
  <li><a href="#mic1">Description of data presented on the Microarray Expression Search</a> 
  <li><a href ="#mic21">Data Normalization</a> 
  <li><a href ="#mic2">Using the Expression Search</a> 
  <li><a href ="#mic3">Input Field and Column Name Definitions</a>
  <ul>
  	<li><a href ="#mic4">Array Element</a>
	<li><a href ="#mic5">Gene Name or Symbol</a>
	<li><a href ="#mic6">Locus</a>
	<li><a href ="#mic7">GenBank Accession</a>
	<li><a href ="#mic8">Array Design</a>
	<li><a href ="#mic9">Data from Arrays with Replicates/Data from All Arrays</a>
	<li><a href ="#mic10">Detection (Affymetrix only)</a>
	<li><a href ="#mic11">Signal (Affymetrix only)</a>
	<li><a href ="#mic12">Signal Percentile (Affymetrix only)</a>
	<li><a href ="#mic13">Absolute (cDNA microarrays only)</a>
	<li><a href ="#mic14">Relative (cDNA microarrays only)</a>
	<li><a href ="#mic15">Fold Change (cDNA microarrays only)</a>
	<li><a href ="#mic16">Fold Change Color (cDNA microarrays only)</a>
	<li><a href ="#mic17">Standard Error</a>
	<li><a href ="#mic18">Experiment name</a>
	<li><a href ="#mic19">Replicate Set</a>
	<li><a href ="#mic20">Slide</a>
	</ul>
</ul>
  
    <p> <br>
    <table width="602" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr> 
        <td>
          <H2><a name="mic1"></a>Description of data presented on the Microarray 
            Expression Search</H2>
          <p><font class="cont">Microarray Expression Search allows you to search 
            expression values across all public Arabidopsis microarray data stored 
            in the TAIR database. The data were obtained from individual submitters,
	    organizations, and large-scale projects, such as the Arabidopsis Functional 
	    Genomics Consortium (AFGC) in the US and AtGenExpress in Europe. TAIR accepts 
	    data generated with both dual- and single-channel platforms. For example, 
	    the AFGC data were produced using dual-channel platform, spotted DNA arrays; 
	    while the AtGenExpress data were produced using single-channel platform, Affymetrix GeneChips&reg;. 
          <h2><a name ="mic21"></a>Data Normalization</h2>
          <p> <font class="cont">For Microarray Expression Search tool, we normalized all dual-channel data using the 
	    print-tip-group lowess method implemented in the GeneSpring 6 software. As a normalization factor, 
	    20% width of the lowess smooth was used. Affymetrix GeneChip&reg; data were normalized 
	    using Affymetrix MAS 5 software. To make the Affymetrix data from different sources 
	    comparable, we scaled up or down all GeneChip&reg; data using Target intensity value (TGT) = 200, 
	    except for those chips that were already normalized so. </font> <br>
          <h2><a name ="mic2"></a>Using the Expression Search</h2>
          <p> <font class="cont">The Microarray Expression Search provides four 
            different ways of searching for a gene of interest: by array element 
            name (for the AFGC data, it is clone ID in most cases, e.g. 39B5T7; for the Affymerix data, 
	    it is a unique identifier of the probe set given by the manufacturer, e.g. 251059_at), 
            by gene name or symbol (e.g. AP1), by locus name (e.g. At5g01810), 
            and by GenBank Accession (e.g. T13762). To do bulk search, either 
            paste in a list of the element or locus names (maximum 100) separated by tabs, commas, 
            or carriage returns, or upload a file formatted the same way. 
            The following are descriptions of the search input fields and column names.</font> 
          <p>  
	  <h2><a name ="mic3"></a>Input Field and Column Name Definitions</h2>
          <p> 
          <h4><a name ="mic4"></a>Array Element</h4>
          <font class="cont"><a name="mic6"></a>This is the name of the element 
          on an array as given by the manufacturer.</font> 
          <p> 
          <h4><a name ="mic5"></a>Gene Name or Symbol</h4>
          <font class="cont">Published or commonly used symbolic name of a gene.</font> 
          <p> 
          <h4><a name ="mic6"></a>Locus</h4>
          <font class="cont">Systematic, chromosome based name of the open reading 
          frame (orf) given by the Arabidopsis Genome Initiative (AGI) annotators. 
          This is the unique identifier for a locus as agreed upon by the AGI, 
          TAIR, MIPS and TIGR. Microarray elements were assigned to a locus based 
          upon nucleotide sequence identity determined using BLAST (to learn how 
          we did it, click <a href="microarray_readme.jsp#mic26" target="_blank">here</a>). 
          Clicking on the locus name link on the search results page will take 
          you to the locus detail page in TAIR.</font> 
          <p> 
          <h4><a name ="mic7"></a>GenBank Accession</h4>
          <font class="cont">This is the unique identifier to a sequence in GenBank 
          that corresponds to the arrayed gene. Clicking on this link on the search 
          results page will open a browser window displaying the GenBank record 
          for the nucleotide sequence.</font> 
	  <p> 
          <h4><a name ="mic8"></a>Array Design</h4>
          <font class="cont">Name given to the array by the manufacturer.</font> 
	  <p> 
          <h4><a name ="mic9"></a>Data from Arrays with Replicates/Data from All Arrays</h4>
          <font class="cont">Select 'Data from Arrays with Replicates' to search 
	  expression values in replicate hybridization sets (only hybridizations that 
	  have replicates will be searched). Select 'Data from All Arrays' to search 
	  expression values for a given array element across all hybridizations regardless 
	  of the presence or absence of replicate hybridizations.</font> 	    
	  <p> 
          <h4><a name ="mic10"></a>Detection (Affymetrix only)</h4>
          <font class="cont">Affymetrix Detection algorithm uses probe pair intensities to generate a 
	  Detection p-value and assign a Present, Marginal, or Absent call. Each probe pair in a probe set 
	  is considered as having a potential vote in determining whether the measured transcript is detected 
	  (Present) or not detected (Absent). The p-value associated with this test reflects the confidence 
	  of the Detection call.</font> 
          <p> 
          <h4><a name ="mic11"></a>Signal (Affymetrix only)</h4>
          <font class="cont">Quantitative metric calculated for each probe set, which represents the relative 
	  level of expression of a transcript. Signal is calculated using the One-Step Tukey&#146;s Biweight 
	  Estimate which yields a robust weighted mean that is relatively insensitive to outliers, even when 
	  extreme. Each probe pair in a probe set is considered as having a potential vote in determining the 
	  Signal value. The vote is defined as an estimate of the real signal due to hybridization of the target. 
	  The mismatch intensity is used to estimate stray signal. The real signal is estimated by taking the 
	  log of the Perfect Match intensity after subtracting the stray signal estimate. The probe pair vote 
	  is weighted more strongly if this probe pair Signal value is closer to the median value for a probe set. 
	  Once the weight of each probe pair is determined, the mean of the weighted intensity values for a probe 
	  set is identified. This mean value is corrected back to linear scale and is output as Signal.</font> 
          <p> 
          <h4><a name ="mic12"></a>Signal Percentile (Affymetrix only)</h4>
          <font class="cont">Shows how a signal value of the array element compares to signal values of other array 
	  elements on the same slide or chip. For example, an array element at the 90th percentile has signal value 
	  greater than 90% of array elements on the chip.</font>   
          <p> 
          <h4><a name ="mic13"></a>Absolute (cDNA microarrays only)</h4>
          <font class="cont">Qualitative measure of gene expression as a function 
          of signal intensity. Possible values: 'expressed' for intensity values 
          >= 350 in both channels after background subtraction; 'not expressed' 
          for intensity values &lt; 350 in any channel after background subtraction; 
          'absent' for the data that were flagged as unreliable either by software 
          or manually.</font> 
          <p> 
          <h4><a name ="mic14"></a>Relative (cDNA microarrays only)</h4>
          <font class="cont">Direction of the gene expression change compared 
          to the control. Possible values: 'up' for expression values &gt;= 1.5 
          (fold change); 'down' for expression values &lt;= -1.5; 'both' for expression 
          values &gt;= 1.5 or &lt;= -1.5; 'unchanged' for expression values between 
          -1.5 and 1.5. 'Up' is for up-regulated genes and 'down' is for down-regulated 
          genes.</font> 
          <p> 
          <h4><a name ="mic15"></a>Fold Change (cDNA microarrays only)</h4>
          <font class="cont">How many times the expression signal for a given 
          transcript increased or decreased compared to the control.</font> 
          <p> 
          <h4><a name ="mic16"></a>Fold Change Color (cDNA microarrays only)</h4>
          <font class="cont">Colors used to display the direction of the gene 
          expression change compared to the control and the magnitude of this 
          change. The default color encoding is red for up-regulation and green 
          for down-regulation. This can be changed under the Output Options either 
          to red/blue or yellow/blue. </font>
	  <p> 
	  <h4><a name ="mic17"></a>Standard Error</h4>
          <font class="cont">This is the standard deviation of the sampling distribution 
	  of the mean value of Detection p-value, Signal, Signal Percentile, or Fold Change
	  for the array element in the replicate hybridization set.</font>
	  <p> 
          <h4><a name ="mic18"></a>Experiment name</h4>
          <font class="cont">Name of the hybridization set with a common experimental 
          goal and design.</font> 
	  <p> 
          <h4><a name ="mic19"></a>Replicate Set</h4>
          <font class="cont">The set of hybridizations that are replicates of each other, 
	  including the labeling agent, which may be averaged. Technical replicate indicates 
	  that the same RNA sample was used in both replicates, either with the same label or 
	  with the dyes swapped. Biological replicate means that both hybridizations use 
	  independently isolated RNA from identically treated plants.</font> 
          <p> 
          <h4><a name ="mic20"></a>Slide</h4>
          <font class="cont">Either TAIR or external identifier for an array (e.g. 
          AFGC:5198).</font> 
          <p> 
          <br> 
       </TD>
      </TR>
    </TABLE>
    <!-- footer using external javascript file starts here -->
    <jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
    <script>
setPrevious("");
setNext("help_expression.jsp");
writeFooter();
</script>
    <!-- FOOTER -->
    <br>
</ul>
</body>
</html>
