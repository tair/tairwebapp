<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!String pageName = "TAIR - About TAIR";
  String cssfile = "/css/page/pagelevels.css";%>


<%@ page errorPage="/jsp/common/gen_error.jsp"
	import="org.tair.tfc.*,org.tair.querytools.*,org.tair.utilities.*,java.util.*,java.net.*"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
	<jsp:param name="id" value="403" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
	<jsp:param name="sidebarName" value="Citing TAIR" />
</jsp:include>

<div id="rightcolumn">


	<!--		
			Content goes here
			
		//-->
	<span class="mainheader">Citing TAIR</span>
	<dl>

		If you used specific pages in TAIR for your research, we would be
		thrilled if you cited us in your article. Please use the following
		format for citing TAIR:
		<BR>
		<BLOCKQUOTE>
			The Arabidopsis Information Resource (TAIR), [the URL of the page
			being referred to], on www.arabidopsis.org, [date].
		</BLOCKQUOTE>
		Example:
		<BLOCKQUOTE>
			The Arabidopsis Information Resource (TAIR),
			www.arabidopsis.org/aboutarabidopsis.html, on www.arabidopsis.org,
			Oct 24, 2000
		</BLOCKQUOTE>

		If TAIR was useful generally in your research, please cite one of the
		following publications in your article:
		<br>

		<dt>
			<a
				href="http://nar.oxfordjournals.org/content/early/2011/12/02/nar.gkr1090.full">Philippe
				Lamesch; Tanya Z. Berardini; Donghui Li; David Swarbreck;
				Christopher Wilks; Rajkumar Sasidharan; Robert Muller; Kate Dreher;
				Debbie L. Alexander; Margarita Garcia-Hernandez; Athikkattuvalasu S.
				Karthikeyan; Cynthia H. Lee; William D. Nelson; Larry Ploetz;
				Shanker Singh; April Wensel; Eva Huala</a> Download
			<a
				href="http://nar.oxfordjournals.org/content/early/2011/12/02/nar.gkr1090.full.pdf">[PDF]</a>
		</dt>
		<dd>
			The Arabidopsis Information Resource (TAIR): improved gene annotation
			and new tools. Nucleic Acids Research 2011 doi: 10.1093/nar/gkr1090.
			<br />
		</dd>
		<dt>
			<a
				href="http://nar.oxfordjournals.org/cgi/content/full/36/suppl_1/D1009">David
				Swarbreck*, Christopher Wilks, Philippe Lamesch, Tanya Z. Berardini,
				Margarita Garcia-Hernandez, Hartmut Foerster, Donghui Li, Tom Meyer,
				Robert Muller, Larry Ploetz, Amie Radenbaugh, Shanker Singh, Vanessa
				Swing, Christophe Tissier, Peifen Zhang and Eva Huala </a> Download
			<a href="/about/D1009.pdf">[PDF]</a>
		</dt>
		<dd>
			The Arabidopsis Information Resource (TAIR): gene structure and
			function annotation.
			<br />
			Nucleic Acids Research 2008 36:D1009-D1014
			<br />
		</dd>
		<dt>
			<a href="http://nar.oupjournals.org/cgi/content/full/31/1/224">Rhee
				SY, Beavis W, Berardini TZ, Chen G, Dixon D, Doyle A,
				Garcia-Hernandez M, Huala E, Lander G, Montoya M, Miller N, Mueller
				LA, Mundodi S, Reiser L, Tacklind J, Weems DC, Wu Y, Xu I, Yoo D,
				Yoon J, Zhang P.</a>
		<dd>
			The Arabidopsis Information Resource (TAIR): a model organism
			database providing a centralized, curated gateway to Arabidopsis
			biology, research materials and community.
			<br>
			Nucleic Acids Research 2003 31(1):224
			<br>
			Download
			<a href="/about/23690.pdf">[PDF]</a>
		<dt>

			<a
				href="http://link.springer.de/link/service/journals/10142/contents/02/00077/">Garcia-Hernandez,
				M.; Berardini, T. Z.; Chen, G.; Crist, D.; Doyle, A.; Huala, E.;
				Knee, E.; Lambrecht, M.; Miller, N.; Mueller, L. A.; Mundodi, S.;
				Reiser, L.; Rhee, S. Y.; Scholl, R.; Tacklind, J.; Weems, D. C.; Wu,
				Y.; Xu, I.; Yoo, D.; Yoon, J.; Zhang, P.</a>
			<br>
		<dd>
			TAIR: a resource for integrated Arabidopsis data.
			<br>
			Functional and Integrative Genomics 2002 2(6):239
			<br>
			Download
			<a href="/about/23226.pdf">[PDF]</a>
		<dt>
			<a
				href="/servlets/TairObject?type=publication&id=5948">Huala,
				E; Dickerman, A; Garcia-Hernandez, M; Weems, D; Reiser, L; LaFond,
				F; Hanley, D; Kiphart, D; Zhuang, J; Huang, W; Mueller, L;
				Bhattacharyya, D; Bhaya, D; Sobral, B; Beavis, B, Somerville, C; and
				Rhee, SY</a>
			<br>
		<dd>
			The Arabidopsis Information Resource (TAIR): A comprehensive database
			and web-based information retrieval, analysis, and visualization
			system for a model plant.
			<br>
			Nucleic Acids Res. 2001 Jan 1;29(1):102-5.
			<P>
			<center>
				<a href="/about/tairpubs.jsp">More TAIR Publications</a>
			</center>
	</DL>
	<P>
	<center>
		Date last modified: March 31, 2005
	</center>
	</P>
</div>
<!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
