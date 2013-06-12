<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR Nomenclature Guidelines";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1170" />
</jsp:include>

<jsp:include page="/jsp/includes/nomenclatureSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Arabidopsis Nomenclature" />
</jsp:include>

<div id="rightcolumn">
<!--CONTENT HERE-->
      <span class="mainheader">Arabidopsis Nomenclature</span> 

      <p>This page provides information about and guidelines for nomenclature used for
      Arabidopsis loci, genes,markers, polymorphisms, clones,vectors and stocks from the
      ABRC. Use the outline below to find information for nomenclature of specific data
      types in TAIR.</p>

<p>Please READ: Community Standards for Arabidopsis Genetics <a href="/links/comm_stan.pdf">[download PDF]</a>.Standards of gene nomenclature  have been adopted by the Arabidopsis community and should be followed in publications and presentations. </p>
      <p>TAIR provides a <a href="/jsp/processor/genesymbol/symbol_main.jsp">Gene Class
      Symbol Registry</a>. You can register a gene symbol currently in use by your lab
      (e.g. <i>STM</i>) or reserve a gene class symbol (e.g. <i>CYP</i>) here.</p>

      <p><img src="/images/new.gif" alt="new" />TAIR is now the central agency responsible for
      assigning Arabidopsis locus identifiers. Consistency of locus identifiers and
      avoidance of duplication can only be achieved if individuals do not assign locus
      identifiers on their own. If you would like TAIR to assign a locus identifier for
      you, please follow the instructions found on the <a
      href="/submit/locus_identifier_request.jsp">locus identifier request page</a>.</p>

      <dl>
        <dt>Contents</dt>

        <dd>
          <ul>
            <li>
              <a href="#locus">Locus Nomenclature</a> 

              <ul>
                <li><a href="#guide">Guidelines used by TAIR for chromosome based locus
                identifiers</a></li>

                <li><a href="#editing">Adding,editing,splitting and merging</a></li>

                <li><a href="#tracking">Locus History Tracking and Viewing</a></li>

                <li><a href="#notes">Notes on chromosome based locus identifiers from
                MIPS</a></li>

                <li><a href="#original">Original document on creating AGI locus
                identifiers</a></li>
              </ul>
            </li>

            <li>
              <a href="#genes">Gene Nomenclature</a> 

              <ul>
                <li><a href="/portals/nomenclature/tigr_naming.jsp">TIGR Gene naming conventions</a></li>

                <li><a href="#problems">Problems with gene nomenclature</a></li>

                <li><a href="#mutant">Naming genes based upon mutant phenotype</a></li>

                <li><a href="#function">Naming genes based upon function</a></li>

                <li><a href="#symbol">Gene name and symbol selection</a></li>

                <li><a href="#unique">Choosing a unique gene symbol</a></li>

                <li><a href="#alias">Gene names and aliases in TAIR</a></li>

                <li><a href="#priority">Priority of gene names</a></li>
              </ul>
            </li>

            <li>
              <a href="#marker">Genetic markers, polymorphisms and transgenic line
              nomenclature</a> 

              <ul>
                <li><a href="#gmarkers">Suggestions for naming markers and
                polymorphisms.</a></li>

                <li><a href="#transgenics">Suggestions for naming transgenic
                lines</a></li>
              </ul>
            </li>
          </ul>

          <ul class="noindent">
            <li><a href="#snp">Common SNP and Insertion/Deletion names</a></li>

            <li><a href="#TDNA">Common T-DNA Insertion Line Names</a></li>

            <li><a href="#clones">Clone and Vector Names</a></li>

            <li><a href="#genbank">GenBank Accessions</a></li>
          </ul>
        </dd>
      </dl>

      <dl>
        <dt><a id="locus" name="locus">Locus Nomenclature</a>(Modified from <a
        href="http://mips.gsf.de/proj/thal/db/about/codes.html">MIPS AGI-codes
        section)</a></dt>

        <dd>Designation of unique locus identifiers is performed as part of the genome
        sequence annotation at TAIR. The following section describes the syntax of
        chromosome based locus nomenclature and how locus identifiers are assigned. In
        some cases locus identifiers have been made obsolete. If you have information
        about a sequenced locus that has not been given a locus identifier, please
        contact curator@arabidopsis.org.</dd>

        <dt><a id="guide" name="guide">Guidelines for use of unique gene id's (modified
        from MIPS)</a></dt>

        <dd>
          <ul>
            <li>Format of chromosomal based nomenclature</li>

            <li style="list-style: none">
              <ul>
                <li>AT (Arabidopsis thaliana)</li>

                <li>1,2,3,4,5 (chromosome number) or M for mitochondrial or C for
                chloroplast.</li>

                <li>G (gene), other letters possible for repeats etc.)</li>

                <li>12300 (five-digit code, numbered from top/north to bottom/south of
                chromosome)</li>
              </ul>
            </li>

            <li>Chromosome based locus identifiers are assigned to</li>

            <li style="list-style: none">
              <ul>
                <li>protein-coding genes</li>

                <li>RNA coding genes (sn, r, tRNAs)</li>

                <li>pseudogenes</li>
              </ul>
            </li>

            <li>Chromosome based locus identifiers are not assigned to</li>

            <li style="list-style: none">
              <ul>
                <li>transposons</li>
              </ul>
            </li>

            <li>Usage</li>

            <li style="list-style: none">
              <ul>
                <li>The first AGI locus identifier release made use of locus identifiers
                ending in zero, eg 10010, 10020, 10030 and so on so that intervening
                numbers could be used for newly discovered genes.</li>

                <li>Where there are gaps in the sequence, the first release skipped at
                least 200 codes for each 100 kb of gap.</li>

                <li>In the first release, some genes were present as fragments as they
                lie across the boundary of two BACS. Each fragment got its own locus
                identifier if there was no way to represent the whole gene. There gene
                fragments were merged into a single locus in later releases, and one of
                the AGI locus identifiers became obsolete.</li>
              </ul>
            </li>
          </ul>
        </dd>

        <dt><a id="editing" name="editing"></a>Adding, deleting, editing,merging and
        splitting</dt>

        <dd>
          <ul>
            <li>Adding new genes</li>

            <li style="list-style: none">
              <ul>
                <li>If there are free ATxGxxxx0 locus identifiers, TAIR assigns those
                first as in the rules above. If not, TAIR uses the last digit, leaving
                space as appropriate, i.e. ...5 if the new gene is in the middle or ...8
                if it is close to the neighbor with higher identifier. If there are no
                free identifiers between the neighboring genes at all, we use the nearest
                free identifier. We will do our best not to disturb the sequential
                numbering of genes along the chromosome, but users should be aware that
                adjacent loci are often not in sequential order. This may be due to
                reorientation of BACS, or if genes are addedin an interval in which no
                sequential identifiers remain.</li>
              </ul>
            </li>

            <li>
              <u>Deleting genes</u>: 

              <ul>
                <li>Deleted genes are kept in the database so they can be retrieved by
                searching for the identifier, but are marked "obsolete" and do not appear
                in database displays. Identifiers from deleted genes are not used
                again.</li>
              </ul>
            </li>

            <li>
              <u>Editing genes</u>: 

              <ul>
                <li>Consensus in the AGI was that identifiers should be kept constant as
                long as there are no major changes in the gene model. As long as
                modifications in the gene model do not lead to a completely new protein
                (e.g. through use of a different reading frame), the identifier will be
                kept, even if exon boundaries change or individual exons are
                added/removed.</li>
              </ul>
            </li>

            <li>
              <u>Merging and splitting genes</u>: 

              <ul>
                <li>Splitting Genes: When it is determined that a locus identifier
                actually refers to more than one gene (e.g. two genes were mistakenly
                predicted to be one gene), one of the genes will retain the original gene
                name and the second will get a new gene name. Rules for deciding which
                gene retains the original identifier is based on which gene contains the
                majority of sequence from the original locus.</li>

                <li>Merging Genes: In the case where experimental evidence is found to
                indicate that two genes are actually a single locus (e.g. a full length
                cDNA is obtained) the two locus entries will be merged into one and the
                name that corresponds to the locus with the majority of sequence will be
                retained. The second locus identifier will be made obsolete (but kept
                associated to the locus identifier of the merged gene.</li>
              </ul>
            </li>
          </ul>

          <p><b><a id="tracking" name="tracking">Tracking history:</a></b></p>

          <ul class="noindent">
            <li>Notes about splits and merges will be kept as well as the different
            versions of the locus sequence. Versions are identified by locus identifier,
            source, and date. For example AT2G18190 later becomes split into two entries
            AT2G18190 and AT2G18193 with a note that indicates that the second entry
            resulted from a split of AT2G18190. You can search TAIR for the annotation <a
            href="/tools/bulk/locushistory/">Locus Histories</a> and download lists of
            locus names that are <a
            href="ftp://ftp.arabidopsis.org/home/tair/Genes/Locus_history/">
            obsolete</a> or <a
            href="ftp://ftp.arabidopsis.org/home/tair/Genes/Locus_history/">
            in use</a>.</li>

            <li>
              What terms in history tracking refer to: 

              <ul>
                <li>delete means a gene model has been eliminated</li>

                <li>merge means a gene model has been merged with another gene but
                retained old name</li>

                <li>mergedelete means a gene model has been merged but its name has not
                been retained</li>

                <li>insert means a gene model has been inserted from scratch</li>

                <li>split means a gene model has been split but has retained its
                name</li>

                <li>splitinsert means a gene model has been split and has a new name</li>

                <li>new means a gene model has been generated</li>

                <li>obsoleted means a gene model has disappeared</li>
              </ul>
            </li>

            <li>
              The terms new and obsoleted may describe MIPS data when it is unknown if an
              insert or delete was due to a splitinsert or mergedelete. 

              <p><b>Other Notes</b>:<br />
               Generally, the idea is to be as conservative as possible. The identifiers
              should identify a specific chromosome locus, not a particular protein, and
              even if this identifier is used in an old publication, it should still
              direct a user to the current annotation for that locus, so that he will be
              able to see that the protein sequence has changed in the meantime. This is
              preferable to having a new identifier after modifications, where the user
              will first have to look up what is the current annotation for this locus.
              Keeping backwards-compatible versions of all entries cannot be achieved,
              and identifiers should not be a way of "versioning" genes.</p>

              <p><br />
              <b><a id="notes" name="notes">Important notes from MIPS</a><br />
              </b></p>

              <p>Most people assume that if they sort the identifiers by ascending
              numbers they get a list of genes that represents the order along the
              chromosome. This was true originally, but no longer: Some BACS needed to be
              flipped, i.e. their orientation reversed, as new data on overlaps was
              generated. So all genes on these BACS now number the wrong way round. At
              MIPS, we decided it is more important to conserve the identifiers than the
              order, as the order can also be sorted by coordinates. Generally, the
              identifier still gives a good idea of the location on the chromosomes, only
              local reversals are expected. If you need a list of identifiers in the
              order along the chromosome, contact us. Once the orientation of BACS seems
              stable, this may be corrected by assigning new identifiers to the affected
              genes, as this will be more intuitive for users (This would be a breach of
              our "be conservative" rule, but the "be user-friendly" rule is more
              important).<br />
              </p>
            </li>
          </ul>
          <br />
          <br />
           

          <p><b><a id="original" name="original">Original document on creating AGI gene
          codes.</a></b><br />
          </p>

          <p>A uniform gene nomenclature system for Arabidopsis was discussed at an
          impromptu meeting at GSAC in Miami attended by Daphne Preuss, Chris Somerville,
          Claire Fraser, Xiaoying Lin and Mike Bevan on Sept. 18th.</p>

          <p>It was decided that the following uniform system will be used in the
          forthcoming publication of the sequence of chr 2 and chr 4. A rapid decision
          was needed due to the time needed to implement the new names.</p>

          <p>AT =organism 1,2,3,4,5 =chromosome G =gene 00010 =gene id</p>

          <p>The 'G' convention is useful as repeats (r) will soon be annotated, initially
          as markers. Pseudogenes will be numbered like functional genes.<br />
          Gene are numbered in order from the top to bottom of the chromosomes. In the
          case of chr 2 and 4 this boundary is known due to the presence of rDNA
          clusters. Gene AT4G00010 is the first gene south of the cluster. Gene order is
          defined in units of 10 ie. 00010, 00020, 00030, etc allowing 9000 genes per
          chromosome.<br />
          If new genes are found between two annotated genes, either by experiment or
          improved gene finding programs, these will be numbered as: 00010, 00012,3,4,-9.
          This give plenty of room for expansion.<br />
          Different versions of a gene product, eg a differentially spliced gene , are
          denoted as 00010.1,2,3 etc.<br />
          Where there are sequence gaps, often of uncertain size and content (eg CEN2 and
          CEN4), the sequence groups will leave a space the equivalent of 100 - 200
          genes. Where the top arm telomeres have not yet been reached, a gap equivalent
          to about 50 genes should be left, ie numbering will start 05000, 05010,
          etc.<br />
          The numbering of repeats will follow an independent system, where repeat ids
          are not interpolated between gene identities.<br />
          Please don't worry that the BAC naming conventions will be lost or erased from
          the records. We realize these are presently the most commonly used names,
          therefore the databases will have a simple way of relating the two naming
          conventions. Note that a single "AT4G00650" gene can have two BAC names, due to
          overlaps, and this is one of the reasons for implementing the new nomenclature.
          You will be able to search for an individual gene with this new name.<br />
          We believe this system conforms to that used in other organisms, and will be
          very useful to the community.</p>

          <p><b><a id="genes" name="genes">Gene Nomenclature</a></b><br />
           This section addresses how gene names/symbols are assigned and also
          illustrates some of the problems associated with gene nomenclature. We suggest
          guidelines for naming genes to avoid propagation of duplicated or misleading
          names.</p>

          <p>Gene names should convey some meaning as to the function of the gene
          product. Names based upon a quantifiable feature such as biochemical assay,
          protein-protein or genetic interaction, or mutant phenotype are preferred to
          names based upon sequence similarity alone. Regardless of the derivation, it is
          not likely that a name can convey all that is known about a particular gene and
          names have changed to reflect new knowledge. Many of the problems associated
          with gene nomenclature may eventually be resolved by adoption of a standard
          rule for gene nomenclature that is accepted by the research community. At this
          time, at TAIR, we are not adopting a standardized system of gene nomenclature.
          We will concentrate our efforts on making associations of gene names and
          aliases so that information relating to each gene can be obtained regardless of
          the variable nomenclature. One of our goals is to relate all the diverse
          information about an object, such as a genetic locus, so that it can be !
          accessed by researchers using a simple query. Furthermore, the data and
          annotations are ascribed to their sources so that the experimental evidence can
          be evaluated.</p>
          <br />
           

          <p><u><a id="problems" name="problems">Problems with gene
          nomenclature:</a></u><br />
          </p>

          <p>A major source of problems occurs when more than one published name is
          associated with the same gene or when the same gene symbol is assigned to more
          than one gene. An example of the former is <i>EMB30</i> which is also known as
          <i>GNOM</i>,and of the latter is the symbol <i>FDH</i> which has been used for
          both <i>FORMATE DEHYDROGENASE</i> and <i>FIDDLEHEAD</i>.These problems have
          been addressed, in part, by the establishment of a gene name registry for genes
          identified by mutation (Meinke and Koornneef, 1997). As there are many cases
          where same gene has been published under many names, TAIR maintains a list of
          aliases associated with each gene (see below). See section:<a
          href="#unique">Choosing a unique gene symbol</a>.</p>

          <p>Another problem that occurs is the tendency for error propagation with names
          based upon sequence similarity alone. For example, a gene is named <i>YFG2</i>
          based upon sequence similarity to <i>YFG1</i>, gene <i>YFG3</i> is then named
          based on similarity to <i>YFG2</i> and <i>YFG4</i> is named based upon
          similarity to <i>YFG3</i>. <i>YFG3</i> and <i>YFG4</i> may be quite distantly
          related to <i>YFG1</i> so in this case, the relationship inferred by the name
          is misleading. Gene names that imply functional or process equivalence should
          be avoided unless that function is experimentally verified.If a name is
          assigned based upon sequence similarity alone, the appropriateness of a name
          should be carefully considered. It is better to use the name <i>NITRATE
          REDUCTASE-LIKE</i>, than to use the name <i>NITRATE REDUCTASE5</i> if there is
          no experimental evidence to support the biological function the name
          implies.<br />
          </p>

          <p>Caution should be exercised in assigning names to ORFs identified as part of
          bulk expression experiments.For example, a microarray experiment might identify
          23 ORFs that are potentially up-regulated in response to a specific treatment.
          Unless sequence identity indicates an ORF corresponds to a known gene, or there
          is other experimental data for gene function, it is better to publish using the
          standard ORF name(s) along with a description (for example: At1g02730,
          cellulose synthase catalytic subunit, putative ). Where possible, TAIR is
          making associations between sequences represented in commonly accessed arrays
          (e.g. AFGC arrays and Affymetrix chips) and their corresponding gene entries in
          TAIR.</p>

          <p>Gene names should not be assigned to ORFs whose expression has not been
          proven (i.e. hypothetical proteins). At a minimum, full-length cDNA sequence
          should be obtained and analyzed to confirm its expression and gene structure.
          An alternative strategy might be to perform RT-PCR analysis of expression and
          sequence the RT-PCR product in cases where a cDNA sequence proves elusive (i.e.
          for genes expressed at very low levels).</p>

          <p><u><a id="mutant" name="mutant">Naming genes based upon mutant
          phenotype:</a></u><br />
          </p>
          Please refer to <a href="/portals/nomenclature/namerule.jsp">Meinke and Koornneef, 1997</a> for
          a discussion and examples of naming genes based upon mutant phenotype. This
          manuscript provides instructions for developing mutant gene names/symbols,
          proper nomenclature for publication and community standards for genetic
          analysis of mutant phenotypes. Mutant gene names are generally based upon one
          or more aspects of the mutant phenotype (e.g.<i>NON-PHOTOTROPIC HYPOCOTYL1)</i>
          or a genetic interaction such as <i>SUPPRESSOR OF PHYA-105</i>. Gene symbols
          are three letters and may or may not derive from the full name (e.g.
          <i>NON-PHOTOTROPIC HYPOCOTYL1</i>; <i>NPH1</i> or <i>ENHANCER OF AGAMOUS</i>;
          <i>HUA</i>). For publications and presentations, mutant gene names and symbols
          are lowercase and italicized and wild type alleles are uppercase and
          italicized. Protein products of genes are uppercase and not italicized. To help
          alleviate the problems associated with duplication of gene names, a mutant gene
          name registry has been created. Names and symbols for mutant genes should be
          registered with the curator of mutant gene names (Dr. David Meinke) along with
          map location and a description of the mutant phenotype (<a
          href="http://mutant.lse.okstate.edu/genepage/genepage.html">http://mutant.lse.okstate.edu/genepage/genepage.html</a>).
          

          <p><u><a id="function" name="function">Naming genes based upon
          function:</a></u><br />
          </p>

          <p>Ideally gene names based upon function should indicate something about the
          quantifiable feature of the gene product. For example, <i>FATTY ACID
          DESATURASE</i> is a molecular function as determined by a biochemical assay or
          <i>PHYTOCHROME INTERACTING FACTOR</i> can be shown by protein-protein
          interaction. Enzyme names should be the standard name as defined by the <a
          href="http://www.chem.qmw.ac.uk/iubmb/enzyme/">Enzyme Commission</a>. Names
          that correspond to a function should be reserved for those genes that have been
          experimentally proven to have that biological activity.</p>

          <p><u><a id="symbol" name="symbol">Gene name and symbol
          selection:</a></u><br />
          Meinke and Koorneeff suggest a 3-letter code for gene symbols whereas the 
          Commission on Plant Gene Nomenclature (CPGN) allows for up to 8 characters 
          (although currently only up to 5 characters are used). Although a number of 
          classical genetic loci were assigned 2-letter symbols years ago, the continued 
          use of 2-letter symbols to name new loci is strongly discouraged except in cases 
          where there is a compelling reason based on the underlying science. A similar 
          justification should be provided for the use of gene class symbols with more than 
          3 letters. This number should be more than enough coverage for all ~25,000 genes, 
          provide a greater range of letter
          combinations for creating mnemonic symbols, and will not require renaming of
          CPGN designated gene names. Meinke and Koorneeff also describe numbering
          conventions to be used for genes and alleles. However, if a published gene name
          does not include a numeric suffix, it is inferred to be one (e.g. <i>sqt</i> =
          <i>sqt1</i>).The use of organism specific prefixes such as <i>At</i> or
          <i>Ath</i> is discouraged as this is redundant and leads to a lot of genes
          named <i>'Arabidopsis thaliana X'</i>. Relationships between genes and the
          organisms they are derived from are easily maintained within databases and do
          not need to! be reflected in the name. Organism specific prefixes that are
          appended for clarity in publications should not be part of the gene name.</p>

          <p><u><a id="unique" name="unique">Choosing a unique gene symbol:</a></u><br />
           Before selecting a gene name/symbol check for name/symbol on the <a
          href="Gene_Symbols.jsp">Mutant Gene Symbol list</a> or use <a
          href="/cgi-bin/geneform/geneform.pl">Arabidopsis GeneHunter</a>. The Gene
          Hunter program is a text based searching tool that scans TAIR, the Mutant Gene
          Name Registry, GenBank, PubMed, Swiss-Pro, PIR, MIPS, AGR, Mendel-CPGN and the
          journals, Plant Cell and Plant Physiology for the input string (e.g. gene name
          or symbol) and, where appropriate, the term Arabidopsis thaliana. Do not use
          names or symbols for Arabidopsis genes that are already in use by other
          researchers.</p>

          <p><u><a id="alias" name="alias">Gene names and aliases in TAIR:</a></u><br />
           In TAIR, a gene is referred to by the symbol (gene name) or the full name
          (e.g. <i>DYP</i>=gene name;<i>DYAD POLLEN</i>=gene full name). Many genes are
          associated with more than one name. For example,<i>FRUITFULL</i> is also known
          as <i>AGAMOUS-LIKE8 (AGL8)</i>. In TAIR, a gene name is determined by
          precedence of publication ( see below) and all other names are maintained as
          aliases. As with the names, aliases are searchable within the database. In this
          way, TAIR maintains the connection between different publications that have
          referred to the same gene under various names. Therefore, a search for
          <i>AGL8</i> would retrieve the record for <i>FRUITFULL</i> and <i>AGL10</i>
          will bring up the record for <i>CAULIFLOWER</i>. We encourage the community to
          contact us when aliases are missing from the database. Authors should use the
          standard gene name in publications.</p>

          <p><u>Making associations to BAC-based and chromosome-based names:</u><br />
          <br />
           Many groups and individual researchers are in the process of identifying cDNAs
          that may correspond to gene models predicted by the AGI. A predicted gene model
          might be verified by the complete cDNA sequence, or be improved and
          re-annotated based upon the cloned cDNA sequence. Sequence matching of cDNA
          sequences with the predicted ORFs/genome sequences will also identify 'missed
          ORFs' (i.e. ones that were not predicted by automated methods) and identify
          hypothetical proteins as being real (i.e.they are expressed). While TAIR will
          primarily use BLAST to make the associations between experimentally verified
          cDNAs and ORFs, it would be helpful if such information were included in the
          definition lines for the cDNA sequences submitted to Genbank. For example:
          Arabidopsis thaliana clone R09083 (FL5-10-H3)unknown protein
          (F14H20.12/AT2G02050) mRNA, complete cds, includes the BAC-based and
          chromosome-based names associated with this cDNA. In the event that a cDNA
          corresponds to mo! re than one predicted ORF, both standard ORF names should be
          included in the definition line.</p>

          <p><u><a id="priority" name="priority">Priority of gene names in
          TAIR:</a></u><br />
           Precedence of publication is the primary determinant of a gene name unless the
          community chooses otherwise. If sequence (i.e. sequence identity) or genetic
          (i.e. allelism) analysis confirms that more than one name has been associated
          with a gene, the individual researchers should contact each other and agree
          upon a mutually acceptable name. Names of published mutants will have
          precedence over cloned gene names (based upon prior publication) unless the
          alternative (cloned) name is preferred by the community.</p>

          <p><b><a id="marker" name="marker">Suggestions for Genetic Markers,
          Polymorphisms and transgenic strain nomenclature:</a></b><br />
          <br />
          <u><a id="gmarkers" name="gmarkers">Suggestions for Genetic Markers and
          Polymorphisms</a></u><br />
           The tremendous variability in naming markers creates problems for both
          research community and database curators. In many cases more than one type of
          marker has the same name as other objects in the database. For example, CTR1 is
          a gene, a CAPS and an SSLP marker. Ideally, a marker name should be; 1) unique,
          and 2) contain information about its type (e.g. SSLP, CAPS). We would like to
          propose a system of nomenclature that uses a lab organization specific prefix
          to designate marker origin followed by a simple accession number. This system
          is already in use for naming SNP polymorphisms (e.g. SGCSNP1-9299 = Stanford
          Genome Center SNP 1-9299, and the CER SNPs). An organization may be a lab,
          university, or a company. A three letter prefix should be more than enough to
          provide a unique code (&gt;17000 possible combinations) for every lab. For
          example, markers developed by researchers at the Carnegie Institution of
          Washington (Stanford, CA) have the prefix CIW followed by some unique integer
          (e.g. CIWCAPS12, CIWSSLP34, etc.). Potential new marker names should be
          searched for in TAIR to avoid duplication of names.<br />
          </p>

          <p><a id="transgenics" name="transgenics"><u>Naming transgenic lines</u></a>:</p>
          <p> Nomenclature for transgenic strains is also quite variable and not always
          informative. It would be helpful if the name would convey some information
          about the lines. We propose a system of prefixes and accessions similar to that
          described for markers except that an additional prefix would be added to
          indicate the type of transgene. In addition to the lab designation, each
          transgenic strain name would have a symbol indicating the type of
          construct.</p>

          <ul>
            <li>TG: Transgenes such as co-suppression constructs, promoter:GUS/GFP
            construct.</li>

            <li>ET: Enhancer trap.</li>

            <li>GT: Gene trap.</li>

            <li>AT: Activation tag.</li>

            <li>TP: Transposon tag (e.g. Ac/Ds, Spm/dSpm insertions).</li>

            <li>TD: T-DNA insertion.</li>

            <li>PT: Promoter trap.</li>
          </ul>
          <br />
           Each unique transgenic germplasm would be given a new accession (unique
          integer). For example, the insertion lines from the IMA are designated as SET#
          (enhancer trap) or SGT# (gene trap). If it turns out that two different names
          are associated with the same insertion event, appropriate aliases will be made
          in the database. <br />
          <br />
           

          <p><a id="snp" name="snp"><u>Names used for large sets of SNPs and
          insertion/deletions</u></a>:<br />
          <p>The following table lists prefixes used by functional genomics projects for
          naming T-DNA insertions. This information can be used to search for all of the
          . For example, to find all of the deletions identified by the Stanford Genome
          Sequencing Center you can search by Polymorphism name starts with SGC and type
          is deletion.</p>
           

          <table border="1" summary="table of snps and indels">
            <tr>
              <th>Prefix</th>

              <th>Source</th>

              <th>Comment</th>
            </tr>

            <tr>
              <td>SGC</td>

              <td>Stanford Genome Center</td>

              <td>Includes insertions, deletions and single nucleotide polymorphisms</td>
            </tr>

            <tr>
              <td>CER</td>

              <td>Cereon Genomics</td>

              <td>Includes insertions, deletions and single nucleotide polymorphisms.
              Available only to registered users from non-profit and academic
              institutions.</td>
            </tr>
          </table>
          <br />
          <br />
           

          <p><a id="TDNA" name="TDNA"><u>Names used for large sets of T-DNA or transposon
          insertions</u></a>:<br /></p>
          <p>The following table lists prefixes used by functional genomics
          projects for naming T-DNA insertions. This information can be used to search
          for all of the insertion lines generated by a project. For example, to find all
          of the T-DNA insertion lines generated by Joe Ecker's group at the SALK
          institute you can search by Polymorphism name starts with SALK.</p>

          <table border="1" summary="table of TDNA and transposon insertion lines">
            <tr>
              <th>Prefix</th>

              <th>Source</th>

              <th>Comment</th>
            </tr>

            <tr>
              <td>SALK</td>

              <td>Joe Ecker et.al.</td>

              <td>Sequence indexed library of insertion mutations generated using the
              pROK2 T-DNA vector.</td>
            </tr>

            <tr>
              <td>SGT</td>

              <td>V.Sundareson et.al.</td>

              <td>Gene trap lines from the Institute for Molecular Agrobiology (IMA)</td>
            </tr>

            <tr>
              <td>SET</td>

              <td>V.Sundareson et.al.</td>

              <td>Enhancer trap lines from Institute for Molecular Agrobiology (IMA)</td>
            </tr>
          </table>

          <p><a id="clones" name="clones"><u>Clone and Vector Names</u></a>:</p>
         <p> Arabidopsis clones are usually named with the acronym of the vector followed by
          the plate and row numbers of the isolated clone. For example, CIC (YAC), T
          (TAMU BAC), F (IGF BAC) are some common vector acronyms.The following table
          gives information about nomenclature for clones and vectors in TAIR. You can
          use the prefix in a wild card search for all clones from a particular source or
          vector. For example, you can use the DNA search to find all TAMU clones by
          choosing clone name [starts with] T.</p>
          <table border="1" summary="table of clone and vector names">
            <tr>
              <th>Vector type</th>

              <th>Clone Prefix</th>

              <th>Vector Name</th>

              <th>Source</th>

              <th>Description</th>
            </tr>

            <tr>
              <td>BAC</td>

              <td>T</td>

              <td>pBeLoBAC11</td>

              <td>TAMU (Texas A&amp;M University)</td>

              <td>from bacterial artificial chromosome library used for genomic
              sequencing</td>
            </tr>

            <tr>
              <td>BAC</td>

              <td>F</td>

              <td>pBELoBACkan</td>

              <td>IGF (Institut fur Genbiologische)</td>

              <td>from bacterial artificial chromosome library used for genomic
              sequencing</td>
            </tr>

            <tr>
              <td>P1</td>

              <td>M</td>

              <td>pAd10sacBII</td>

              <td>Mitsui et.al.</td>

              <td>from Bacteriophage P1 library used for genomic sequencing</td>
            </tr>

            <tr>
              <td>TAC</td>

              <td>K</td>

              <td>pTAC-YL7</td>

              <td>Kazuza</td>

              <td>transformation-competent bacterial artificial chromosome vector</td>
            </tr>

            <tr>
              <td>YAC</td>

              <td>CIC</td>

              <td>pYAC4</td>

              <td>CEPH/INRA/CNRS</td>

              <td>From yeast artificial chromosome libary</td>
            </tr>

            <tr>
              <td>YAC</td>

              <td>EG</td>

              <td>pYAC41</td>

              <td>Grill and Somerville</td>

              <td>from EG1 yeast artificial chromosome library</td>
            </tr>

            <tr>
              <td>YAC</td>

              <td>EW</td>

              <td>pYAC3</td>

              <td>E. Ward et.al.</td>

              <td>from yeast artificial chromosome library</td>
            </tr>

            <tr>
              <td>YAC</td>

              <td>yUP</td>

              <td>pYAC4</td>

              <td>Joe Ecker et.al.</td>

              <td>yeast artificial chromosome library</td>
            </tr>

            <tr>
              <td>Cosmid</td>

              <td>G</td>

              <td>
              </td>

              <td>Howard Goodman et.al.</td>

              <td>From cosmid library prepared by H.Goodman et.al.</td>
            </tr>
          </table>

          <p><a id="genbank" name="genbank"><u>GenBank Accessions</u></a>:<br />
          Certain objects such as genes, clones, clone ends and some insertions in TAIRs
          database can be accessed by searching with the associated Genbank accession
          number. Each accession number in GenBank is unique. See <a
          href="http://www.ncbi.nlm.nih.gov/Sitemap/samplerecord.html#AccessionB">http://www.ncbi.nlm.nih.gov/Sitemap/samplerecord.html#AccessionB</a>
          for information about GenBank accession numbers. <!--  //--></p>
        </dd>
      </dl>
<center>Last modified on April 25, 2007</center>
                </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

