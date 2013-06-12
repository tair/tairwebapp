<html>
<head>
<title>TAIR:Locus History Search</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeHeader();
</script>
<!-- End of header -->
</HEAD>
<BODY>
<CENTER>
<table width=600><TR><TD>

  <H2><a name="loc1"></a>Locus History Search Help</H2>
		    <BR>

<P>
<H4><a name="loc2"></a>General</H4><br>
<P>In the course of different releases of the genome, loci may change due to
		    splitting or merging of two or more loci. Also,
		    some loci may be deleted due to insufficient
		    evidence and new ones inserted. The locus history
		    search is intended to give information on these
		    modifications. The locus history search can also
		    be used to find a locus name that has not
		    previously been used when naming a new locus. 
<P>
Currently, the history search takes into account the following
		      releases:
<BR>
1. January, 15, 2001<BR>
2. March 30, 2001<BR>
3. June 13, 2001<BR>
4. August 10, 2001<BR>
5. January 7, 2002<BR>
6.July 25, 2002<br>
7.April 16, 2003<br>
<BR>
For the first 4 releases, only the presence or absence of a locus
				    identifier was tracked. No
				    information is available whether
				    the disappearence or appearance of
				    a locus name is due to a split,
				    merge, or direct insert or
				    delete. A given locus could have
				    completely changed it sequence
				    between to releases; the
				    comparison done for this purpose
				    only reports on what happended to
				    the identifier. The following
				    nomenclature is used: 
<P><UL>
<LI>For a locus identifier that appeared, the word 'new' is used.
<LI>For a locus identifier that disappeared, the word 'obsoleted' is used.
</UL>
<BR>
<P>For the January 7 release, detailed information is available. The
				      following nomenclature is used:
<p><UL>
<LI>For a locus that was created, the word 'insert' is used.
<LI>For a locus that was deleted, the word, 'delete' is used.
<LI>For a locus that was merged with another locus but retained its
					      name, the word 'merge'
					      is used.
<LI>For a locus that was merged but didn't retain its name, the word
						'mergedelete' is used.
<LI>When a locus is split in two or more loci, one locus keeps to old
						  name. For this locus,
						  the word 'split' is used.
<LI>For a locus that was split but acquired a new name, the word
						    'splitinsert' is
						    used.
</UL>

<br>
<br>
<H4><a name="loc3"></a>How to use the Locus History Search</H4>
<BR><p>
Paste locus identifiers (such as At1g01030) into the text box and
					    click on the 'Get Locus
					    History' button. The
					    history for each locus
					    will be listed ordered by
					    date. 'In use' means that
					    the locus identifier is
					    currently used and
					    valid. 'obsoleted' means
					    that the identifier has
					    been used in the past but
					    is not currently in use.
					    'not in use' means that
					    the locus identifier has
					    never been used and may be
					    used to designate a new locus.
 <p>
</TD></TR>
</TABLE> <!-- main document table -->
</center>
<!-- FOOTER -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeFooter();
</script>

</body>
</html>

<br>


