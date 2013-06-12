<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  String pageName = "TAIR - Home Page";
  String highlight = "7";
  String helpfile = "";
  String cssfile = "/css/page/home.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
    <jsp:param name="pageName" value="<%=pageName%>" />
    <jsp:param name="highlight" value="<%=highlight%>" />
    <jsp:param name="helpfile" value="<%=helpfile%>" />
    <jsp:param name="cssfile" value="<%=cssfile%>" />
</jsp:include>

<div id="leftcolumn">
    <h2 class="header">The Arabidopsis Information Resource</h2>
    <p>
        The Arabidopsis Information Resource (TAIR) maintains a <a
            href="/search/ERwin/Tair.htm"
        >database</a> of genetic and <a href="/about/datasources.jsp">molecular
            biology data</a> for the model higher plant <i><a
            href="/portals/education/aboutarabidopsis.jsp"
        >Arabidopsis thaliana</a> </i>. Data available from TAIR includes the complete
        genome sequence along with gene structure, gene product information,
        metabolism, gene expression, DNA and seed stocks, genome maps, genetic
        and physical markers, publications, and information about the
        Arabidopsis research community. Gene product function data is updated
        every two weeks from the latest published research literature and
        community data submissions. Gene structures are updated 1-2 times per
        year using computational and manual methods as well as community
        submissions of new and updated genes. TAIR also provides extensive
        linkouts from our data pages to other Arabidopsis resources.
    </p>
    <p>
        The <a href="http://abrc.osu.edu/"
            onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');"
        >Arabidopsis Biological Resource Center</a> at The Ohio State University
        collects, reproduces, preserves and distributes seed and DNA resources
        of <i>Arabidopsis thaliana</i> and related species. Stock information
        and ordering for the ABRC are fully integrated into TAIR.
    </p>


    <p id="fund">
        <a href="http://www.ciw.edu/"><img src="/i/cis_logo.jpg" id="cis"
            alt="cis logo" width="69" height="35"
        /> </a><a href="http://www.nsf.gov/"><img src="/i/nsf.jpg" id="nsf"
            alt="nsf_logo" width="40" height="40"
        /> </a>TAIR is located at the <a href="http://carnegiedpb.stanford.edu/">Carnegie
            Institution for Science Department of Plant Biology</a> and funded by
        the <a href="http://www.nsf.gov/">National Science Foundation</a> with
        additional support from <a
            href="http://www.arabidopsis.org/doc/about/tair_sponsors/413"
        >TAIR sponsors</a>.
    </p>
    <p>
        Updates on TAIR funding are available <a
            href="/doc/about/tair_funding/410"
        ><strong>here</strong>. </a>
    </p>
    <div id="featured_img">
        <p>
            <a
                href="http://www.arabidopsis.org/doc/submit/functional_annotation/123"
            > <img src="/images/banners/banner_functional_tool_ready.jpg"
                border="3" alt="Functional annotation submission tool"
            /> </a>
        </p>
    </div>

    <p>
        <b>Note:</b> This site has been tested with Netscape 8.1, IE6.X(Win),
        Safari 1.0 and Firefox/Mozilla browsers. Some pages may not work as
        expected if you are using older browsers. For best results, update your
        browser and enable Javascript and cookies (see <a href="/help/">help</a>).
        <b>Scheduled Maintenance:</b> This site may be down for maintenance on
        any Saturday from 8 am to 10 am PDT.
    </p>
    <p>
        <a href="/sitemap.jsp"><span class="small">Site Map</span> </a> | <a
            href="/servlets/processor?type=tablestats"
        ><span class="small">TAIR Database Statistics</span> </a> | <a
            href="/tairusage/index.jsp"
        ><span class="small">TAIR Usage Statistics</span> </a> | <a
            href="/disclaimer.jsp"
        ><span class="small">Site disclaimer</span> </a>
    </p>
</div>
<div id="rightcolumn">
    <h4>Breaking News</h4>

    <div id="icon">
        <a href="/news/rss.xml"
            style="background: url('/i/icons/feed-icon-S.png') no-repeat; margin-top: 10px; padding-left: 19px;"
        >Subscribe to news feed</a>
    </div>

    <div style="padding-top: 5px">
        <a href="http://twitter.com/tair_news"
            style="background: url('/i/icons/twitter_icon14x14.png') no-repeat; margin-top: 10px; padding-left: 19px;"
        >Follow our Twitter feed</a>
    </div>

    <div style="padding-top: 5px">
        <a href="http://www.facebook.com/tairnews"
            style="background: url('/i/icons/facebook-icon14x14.png') no-repeat; margin-top: 10px; padding-left: 19px;"
        >Join our Facebook group</a>
    </div>


    <p>
        <a href="/doc/news/breaking_news/140#id44"><b>TAIR operating on
                servers at iPlant</b> </a><br> &#91;May 20, 2013&#093; <br />
        Ordering and registration services are available after the completion of
        the TAIR move to servers at iPlant.
    </p>
    <div class="hr"></div>
    <p>
        <a href="/doc/news/breaking_news/140#id43"><b>TAIR moving to
                servers at iPlant</b>
        </a><br> &#91;May 8, 2013&#093; <br /> Ordering and registration will
        be disabled from Friday May 17 to Monday May 20 while we move data files
        to the new server. All services will be restored on May 20 and the URL
        will remain the same.
    </p>
    <div class="hr"></div>
    <p>
        <b><a href="/doc/news/breaking_news/140#id42">ABRC Fee Increase</a><br>
            &#91;April 10, 2013&#093;</b> <br /> There will be a fee increase for
        stocks and orders beginning July 1, 2013. This raise in fees is in
        accordance to our Business Plan submitted to NSF.
    </p>
    <div class="hr"></div>
    <p>
        <b><a href="/doc/news/breaking_news/140#id41">New Set of
                Confirmed T-DNA Lines Available</a><br> &#91;November 28,
            2012&#093;</b> <br /> The fourth one-allele set of confirmed T-DNA
        lines representing 3,263 new loci is now available for ordering as <a
            href="http://www.arabidopsis.org/servlet/TairObject?id=4502045978&type=stock"
        >CS27944</a>.
    </p>
    <div class="hr"></div>
    <p>
        <b><a href="/doc/news/breaking_news/140#id40">New from ABRC
                Education and Outreach!</a><br> &#91;October 31, 2012&#093;</b> <br />
        ABRC is pleased to announce a re-designed Education and Outreach website
        at <a href="http://abrcoutreach.osu.edu">http://abrcoutreach.osu.edu</a>.
        The website allows quick and easy <a
            href="http://abrc.osu.edu/donate-stocks"
        >donation of education modules</a>, direct ordering and <a
            href="http://abrcoutreach.osu.edu/trained-educational-kits"
        >online evaluation of education kits</a>.
    </p>
    <div class="hr"></div>
    <p>
        <b><a href="/doc/news/breaking_news/140#id39">2012 MASC Report
                Now Available</a><br> &#91;July 11, 2012&#093;</b> <br /> Please
        check out the <a href="/portals/masc/2012_MASC_Report.pdf">latest
            report</a> from the Multinational Arabidopsis Steering Committee.
    </p>

    <div class="hr"></div>

</div>

<!-- 78D9DL6UnFwQ@greeneggs.arabidopsis.org -->
<!-- PtMuZcI3orB8@hamsand.arabidopsis.org -->
<!-- DNSt2Baqu8Zt@greeneggs.arabidopsis.org -->
<!-- cAnD91XlN3PX@hamsand.arabdidopsis.org -->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
    <jsp:param name="cssfile" value="<%=cssfile%>" />
</jsp:include>
