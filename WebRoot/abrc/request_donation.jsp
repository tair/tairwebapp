<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("ABRC_NASC_dontation_letter") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("0") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>

		

		<!--Set the name of the page to display//-->
<span class="header">ABRC and NASC Request Seed Donations</span><BR>
                    
		<!--Set the parameters for the miniheader here//-->


		<!--Content goes here//-->
<p>Below is the email message sent to all labs on December 8, 2004.  It provides complete details for making stock donations.</p>
<p>
Dear Colleague,</p>
<p>
The Arabidopsis Biological Resource Center (ABRC) and the Nottingham Arabidopsis Stock Centre (NASC) are
conducting a campaign for mutant donations.? It is our goal to procure as many of the published mutant strains
of Arabidopsis as possible. As you know, researchers who author refereed publications describing mutants and
other genetic stocks are expected to make these materials available to the scientific community, specifically
through the stock center collections. We hope that, as in the past, Arabidopsis researchers enthusiastically
support the sharing of genetic stocks through ABRC and NASC.
</p>
<p>
It should be noted that the continuing and accelerating rate of publication of new mutants in Arabidopsis has
produced a vast number of new named genes for which mutant alleles have been characterized. At present, only a
minority of these have been sent to our collections. As a consequence, we are now soliciting the donation of
all lines for which publications exist or are in press. We also welcome donation of unpublished mutants, if
they are known to occur at loci which are not represented in our collection. We urge the cooperation of all
members of the research community in updating our collections.
</p>
<p>
If you are uncertain whether a particular mutant is already included in our collections, stocks can be searched
by Locus or Allele Symbol in the Germplasm sections of NASC <a href="http://arabidopsis.info">http://arabidopsis.info</a> and TAIR
<a href="http://arabidopsis.org">http://arabidopsis.org</a>. To find a germplasm by locus or gene in TAIR, enter the desired gene symbol in a box
for which "gene symbol" type of search has been selected, and execute the search. A list of germplasms will
appear, and a stock ordering box will appear to the right of those that are available stocks.
</p>
<p>
The procedure for submission of seeds is very simple. Just follow the instructions in TAIR or on the NASC Web
site. We prefer to receive at least 0.8 ml of seeds packaged in cryovials. Smaller amounts can be accepted if
you cannot perform the seed increases necessary for donation of the larger quantity. Of course, donation of
distribution-level quantities of seed greatly enhance our efforts to release new stocks in a timely fashion.
For lines which may have been developed through heavy mutagenesis, we much prefer to receive material which has
been backcrossed to remove unrelated variability. Duplicate donations to NASC and ABRC are not required, as we
share all stocks.
</p>
<p>
You can provide the appropriate stock data for your donations by completing the donation forms available on the
TAIR or NASC Web sites. These forms are completely electronic and may forwarded to us by e-mail and/or filled
out on-line. The locations of the donation forms are:
</p>
<p>
ABRC - <a href="http://arabidopsis.orghttps://abrc.osu.edu/donate-stocks">http://arabidopsis.orghttps://abrc.osu.edu/donate-stocks</a><br>
NASC - left-hand bar (seed donation form) on <a href="http://arabidopsis.info">http://arabidopsis.info/</a>
</p>
<p>
We look forward to receiving your mutants. Do not hesitate to send any other lines or DNA stocks which you have
characterized and are not part of our collections. Natural accessions are an example of seed stocks which we
would be pleased to receive. Expression vectors, full length cDNA clones and novel libraries are DNA stocks in
which we would be very interested. We will publish lists of all stocks received.
</p>
<p>
Thank you for your assistance to us and to the Arabidopsis research community in this important endeavor. The
continued cooperation we have received from Arabidopsis researchers is greatly appreciated. We encourage you to
join us in continuing this important task.
</p>
<p>
Very sincerely,</br>
Randy Scholl (ABRC) &nbsp;&nbsp;&nbsp;&nbsp;Sean May (NASC) 
</p>





<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
