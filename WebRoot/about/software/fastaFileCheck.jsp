<HTML>
<HEAD>
<TITLE>fastaFileCheck.pl</TITLE>
<LINK REV="made" HREF="mailto:">
</HEAD>

<BODY>

<!-- INDEX BEGIN -->

<UL>

	<LI><A HREF="#Synopsys">Synopsys</A>
	<LI><A HREF="#Description">Description</A>
	<UL>

		<LI><A HREF="#Options">Options</A>
	</UL>

	<LI><A HREF="#Version">Version</A>
	<UL>

		<LI><A HREF="#Version_History">Version History</A>
	</UL>

	<LI><A HREF="#Author">Author</A>
</UL>
<!-- INDEX END -->

<HR>
<P>
<H1><A NAME="Synopsys">Synopsys</A></H1>
<P>
perl fastaFileCheck.pl [-simvh] dnafastafile

<P>
perl fastaFileCheck.pl -p[simvh] proteinfastafile

<P>
Checks the structure of a DNA fasta file (or protein fasta files using the
-p option and prints out various information.

<P>
<HR>
<H1><A NAME="Description">Description</A></H1>
<P>
The program checks

<DL>
<DT><STRONG><A NAME="item__1_">(1)</A></STRONG><DD>
<P>
if letters other than A,T,G,C and N occur in lines that do not start with
&gt; (or letters corresponding to the one letter amino acid code +X +* when
the protein option (-p) is used). Less than 80% A,T,G,C and N are
considered a severe problem (usually it is protein data or a return
character in the description line, errors which will break most programs).

<DT><STRONG><A NAME="item__2_">(2)</A></STRONG><DD>
<P>
that there are no empty lines in the files. 

<DT><STRONG><A NAME="item__3_">(3)</A></STRONG><DD>
<P>
whether duplicate identifiers are present in the file.

<DT><STRONG><A NAME="item__4_">(4)</A></STRONG><DD>
<P>
whether identifiers exceed a length of 50 characters.

<DT><STRONG><A NAME="item__5_">(5)</A></STRONG><DD>
<P>
whether there are lines that are over 100000 characters long (the total
sequence length of an entry can be infinitely long - that is not checked.
Line length here means a stream of characters until a carriage return is
encountered. Sometimes, fasta files have lines that are 50-100 letters
long, but is not required).

</DL>
<P>
Lines with more than 20% non-DNA characters are counted as severe errors,
minor error with less.

<P>
<HR>
<H2><A NAME="Options">Options</A></H2>
<DL>
<DT><STRONG><A NAME="item__p">-p</A></STRONG><DD>
<P>
File contains protein sequences.

<DT><STRONG><A NAME="item__s">-s</A></STRONG><DD>
<P>
Print summary only.

<DT><STRONG><A NAME="item__i">-i</A></STRONG><DD>
<P>
Print identifiers only, and summary.

<DT><STRONG><A NAME="item__m">-m</A></STRONG><DD>
<P>
Ignore minor problems.

<DT><STRONG><A NAME="item__v">-v</A></STRONG><DD>
<P>
Print version of the program.

<DT><STRONG><A NAME="item__h">-h</A></STRONG><DD>
<P>
Print help message

</DL>
<P>
<HR>
<H1><A NAME="Version">Version</A></H1>
<P>
Version 2.2 of September 17, 2002

<P>
<HR>
<H2><A NAME="Version_History">Version History</A></H2>
<P>
<PRE> 2.0 2002/02/08 Added command line options
 2.1 2002/02/16 Added protein option
                duplicate id checking
                line length checking
                help information
 2.2 2002/09/17 Fixed a bug that reported too many empty lines                                 
</PRE>
<P>
<HR>
<H1><A NAME="Author">Author</A></H1>
<P>
Lukas Mueller

<P>
<PRE> The Arabidopsis Information Resource. Copyright (c) 2001, 2002. 
 The Carnegie Institution of Washington, Department of Plant Biology. Copyright (c) 2001, 2002.
 All Rights Reversed.
</PRE>
<P>
Please report bugs to <A
HREF="mailto:mueller@acoma.stanford.edu.">mueller@acoma.stanford.edu.</A>

</BODY>

</HTML>
