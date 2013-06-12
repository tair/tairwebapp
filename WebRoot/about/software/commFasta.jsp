<HTML>
<HEAD>
<TITLE>commFasta.pl</TITLE>
<LINK REV="made" HREF="mailto:">
</HEAD>

<BODY>

<!-- INDEX BEGIN -->

<UL>

	<LI><A HREF="#NAME">NAME</A>
	<LI><A HREF="#SYNOPSIS">SYNOPSIS</A>
	<LI><A HREF="#VERSION">VERSION</A>
	<UL>

		<LI><A HREF="#Version_history">Version history</A>
	</UL>

	<LI><A HREF="#DESCRIPTION">DESCRIPTION</A>
	<LI><A HREF="#OPTIONS">OPTIONS</A>
	<LI><A HREF="#AUTHOR">AUTHOR</A>
</UL>
<!-- INDEX END -->

<HR>
<P>
<H1><A NAME="NAME">NAME</A></H1>
<P>
<STRONG>commFasta.pl</STRONG>



<P>
<HR>
<H1><A NAME="SYNOPSIS">SYNOPSIS</A></H1>
<P>
<CODE>perl commFasta.pl [-cdivh] file1 file2</CODE>



<P>
<HR>
<H1><A NAME="VERSION">VERSION</A></H1>
<P>
1.2 of October 1, 2002

<P>
<HR>
<H2><A NAME="Version_history">Version history</A></H2>
<P>
1.2 : [October 1, 2002] The program also returns the sequences that have no
match in file2. 1.1 : [October 24, 2001] some bug fixes

<P>
<HR>
<H1><A NAME="DESCRIPTION">DESCRIPTION</A></H1>
<P>
commFasta.pl takes two fasta formatted files and compares all sequences in
file1 to file2. If it finds two identical sequences, it prints out the
sequence in fasta format, concatenating the two ids with a %==% sign, and
also concatenating the description with %==%. The sequence is then printed
once. If it does not find an identical sequence in file2 it prints the
sequence identifier, followed by %!=%, followed by the sequence, in fasta
format. The number of identical sequences and the number of sequences that
didn't match any sequence in file2 are printed at the end of the program.
With the -i option (identifiers only), the program prints the two
identifiers of matching sequences. If the identifiers themselves are
identical, it appends an = sign, otherwise it prints a # sign.

<P>
<HR>
<H1><A NAME="OPTIONS">OPTIONS</A></H1>
<DL>
<DT><STRONG><A NAME="item__i">-i</A></STRONG><DD>
<P>
prints identifiers only, no sequence or fasta format output is generated.

<DT><STRONG><A NAME="item__d">-d</A></STRONG><DD>
<P>
prints fasta sequences of file1 that cannot be found in file2.

<DT><STRONG><A NAME="item__di">-di</A></STRONG><DD>
<P>
prints out file1 identifiers for only those sequences that don't appear in
file2.

<DT><STRONG><A NAME="item__h">-h</A></STRONG><DD>
<P>
-h prints a help message

<DT><STRONG><A NAME="item__v">-v</A></STRONG><DD>
<P>
-v prints a version number.

<DT><STRONG><A NAME="item__c">-c</A></STRONG><DD>
<P>
-c analyzes a file for duplicate sequence entries. Only 1 argument
(filename) has to be supplied.

<P>
<CODE>perl commFasta.pl crappyfile.fasta</CODE>



</DL>
<P>
<HR>
<H1><A NAME="AUTHOR">AUTHOR</A></H1>
<P>
Lukas Mueller (bug reports to: <A
HREF="mailto:mueller@acoma.stanford.edu)">mueller@acoma.stanford.edu)</A>

</BODY>

</HTML>
