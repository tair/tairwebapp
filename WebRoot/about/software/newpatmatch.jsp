<HTML>
<HEAD>
<TITLE>newpatmatch</TITLE>
<LINK REV="made" HREF="mailto:none">
</HEAD>

<BODY>

<A NAME="__index__"></A>
<!-- INDEX BEGIN -->

<UL>

	<LI><A HREF="#synopsis">SYNOPSIS</A></LI>
	<LI><A HREF="#version">VERSION</A></LI>
	<LI><A HREF="#description">DESCRIPTION</A></LI>
	<UL>

		<LI><A HREF="#installation">Installation</A></LI>
		<LI><A HREF="#configuring newpatmatch">Configuring newpatmatch</A></LI>
		<LI><A HREF="#the .conf file">The .conf file</A></LI>
	</UL>

	<LI><A HREF="#authors">AUTHORS</A></LI>
</UL>
<!-- INDEX END -->

<HR>
<P>
<H1><A NAME="synopsis">SYNOPSIS</A></H1>
<P>newpatmatch is a updated version of patmatch that runs using the normal blast datasets.</P>
<P>
<HR>
<H1><A NAME="version">VERSION</A></H1>
<P>1.0, of November 15, 2001</P>
<P>
<HR>
<H1><A NAME="description">DESCRIPTION</A></H1>
<P>
<H2><A NAME="installation">Installation</A></H2>
<P>newpatmatch is a cgi application that should reside in a subdirectory of $HOST/cgi-bin. It
requires Bioperl 0.71 to be installed on the system and 
comprises the following programs:</P>
<DL>
<DT><STRONG><A NAME="item_newpatmatch">newpatmatch</A></STRONG><BR>
<DD>
This is the main program that should be called by the web-browser. If no parameters are 
supplied, an input form is shown, otherwise the patmatch search is launched with the 
parameters supplied.
<P></P>
<DT><STRONG><A NAME="item_patTable%2Epl">patTable.pl</A></STRONG><BR>
<DD>
This is a new perl program that replaces the old patTable C-program. It is called by 
newpatmatch to display the results.
<P></P>
<DT><STRONG><A NAME="item_newGetSequence%2Epl">newGetSequence.pl</A></STRONG><BR>
<DD>
This is also a new perl program that replaces the old getSequence.pl perl program. The 
new program relies on bioperl for indexing fasta files.
<P></P>
<DT><STRONG><A NAME="item_STOP%2Epl">STOP.pl</A></STRONG><BR>
<DD>
STOP.pl takes care of aborting a search by deleting the temporary files.
<P></P>
<DT><STRONG><A NAME="item_scan_for_matches_50M">scan_for_matches_50M</A></STRONG><BR>
<DD>
This is the actual C-program that is called to do the searching. It has been modified for
newpatmatch, to handle fasta entries that are larger than 10MB. The new limit is 50MB. 
This is necessary for searching complete pseudochromosomes in future applications.
<P></P></DL>
<P>
<H2><A NAME="configuring newpatmatch">Configuring newpatmatch</A></H2>
<P>To make configuration simpler, a newpatmatch.conf file has been added, which is used to
setup the datasets, temp-directories etc.</P>
<P>
<H2><A NAME="the .conf file">The .conf file</A></H2>
<P>The structure of the .conf file is self-explanatory. An example is given here:
Note that # denotes a comment line.</P>
<PRE>
 #
 # newpatmatch.conf
 # ================
 #
 # This is the newpatmatch configuration file. There are 5 different types of entries:
 #
 # tempdir       gives the location of the tmp dir to be used.
 # datadir       gives the loacation of the data files (fasta format)
 # dataset       gives the type (DNA or Protein), filename (without path), a file description and a date for a dataset.
 # indexfiledir  points to the directory where the indexfiles are kept. If automatic indexing is used,
 #               nobody needs to have write access there.
 # debug         if a value other than the null string is entered, additional information will be output.
 #
 # This file is read by both newpatmatch and by patTable.pl
 # All lines are tab delimited text.
 #
 #
 # Values
 # ======
 #
 # The tmp directory
 #
 tempdir tmp
 #
 # The datadir
 #
 datadir /export/home/arabidopsis/data/FASTA
 #
 # The indexfiledir
 #
 indexfiledir    /export/home/arabidopsis/cgi-bin/newpatmatch/indexfiles
 #
 # The datasets
 #
 dataset Protein ATH1_pep        All Proteins from AGI, Total Genome
 dataset DNA     ATH1_seq        Genes from AGI, Total Genome
 dataset DNA     ATH1_cds        CDS from AGI, Total Genome
 dataset DNA     ATH1_bacs_con   TIGR BAC Sequences
 dataset DNA     AGI_BAC GenBank AGI BAC Sequences
 dataset Protein ArabidopsisP    GenPept, PIR and SwissProt
 dataset DNA     AtBACEND        Genbank and Kazusa BAC ends
 dataset DNA     AtEST   Genbank ESTs (DNA)
 dataset DNA     AtANNOT GenBank, minus ESTs and BACC ends
 dataset DNA     ArabidopsisN    GenBank, including ESTs and BAC ends
 #
 # Print debug info (add TRUE if you want debug info, leave blank or comment out otherwise)
 #
 debug</PRE>
<P>
<HR>
<H1><A NAME="authors">AUTHORS</A></H1>
<P>patmatch was written by Shuai Wei of SGD.</P>
<P>newpatmatch was worked upon by Lukas Mueller of TAIR.
<A HREF="mailto:mueller@acoma.stanford.edu">mueller@acoma.stanford.edu</A></P>

</BODY>

</HTML>
