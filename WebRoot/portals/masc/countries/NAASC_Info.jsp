<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String pageName = "TAIR - NAASC Information";
String highlight = "4";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="North America"/>
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<span class="mainheader">The North American <I>Arabidopsis</I> Steering Committee</span>


<dl>
<dd>MASC representative (from the North American <i>Arabidopsis</i> Steering Committee)
<A HREF="mailto:meyers@dbi.udel.edu">Blake Meyers</A>, University of Delaware 
</dl>
<hr>
<IMG SRC="/images/redball.gif"> Following four years as MASC Coordinator, Joanna Friesner is now the North American
Arabidopsis (NAASC) Coordinator. NAASC is typically composed of U.S. researchers.
She can be reached at jdfriesner<img class="noborder" src="/images/at.gif" alt="at symbol">gmail.com
<hr>
    <p>
    
<IMG SRC="/images/redball.gif"><A HREF="#members"> <b>Go To List of Current and Past NAASC Members</b></A>  
<dl>
    <p><img src="/images/redball.gif"> <strong>New!</strong><a href="http://www.nsf.gov/pubs/2011/nsf11045/nsf11045.jsp"> Please see the 'Dear Colleague Letter for New Zeland and Japan' </a> from the U.S. National Science Foundation regarding
mechanisms in place at the NSF to respond to immediate research and education needs that may arise from unexpected events.<p>

<p><img src="/images/redball.gif"> <strong>New!</strong>
<li><a href="http://nipponsciencesupport.net/">Support for Japanese scientists </a> affected by the March 11, 2011 earthquake and tsunami in Japan.<p>
<li>A <a href="http://nipponsciencesupport.net/home-us.html">U.S.-based effort</a> has been established recently.</li><p>

<IMG SRC="/images/redball.gif"><b>The next International Conference on Arabidopsis Research 
to be organized by the NAASC will be held July 
    28- August 1, 2014; University of British Columbia (Vancouver, Canada)</b> 
 <p>
	<IMG SRC="/images/redball.gif"> <b>NAASC-organized workshop on Arabidopsis bioinformatics needs</b>: <p>
NAASC members Mark Estelle and Blake Meyers, assisted by the NAASC Coordinator, organized a May workshop to address solutions to long-term sustainability
of Arabidopsis bioinformatics resources. This workshop followed a MASC-organized workshop in the UK in April to assess the bioinformatics needs of the community.
<p>
<b>Outcomes</b>:<br>
<li> Results of discussions at the workshops were presented at the 2010 ICAR in Japan
<li> Ensuing reports will be posted on the MASC webpages at TAIR
<li> Workshop participants, led by US organizer Blake Meyers, developed a commentary to be published in The Plant Cell (August, 2010)
<li> Blake Meyers submitted an RCN proposal to the National Science Foundation to fund development of the International Arabidopsis Informatics Consortium which will draw
on the recommendations of the US and UK workshops to strengthen international collaborations and address current and future informatics needs of the plant biology communities.

<p>
<IMG SRC="/images/redball.gif"> <b>2012 NAASC Elections</b></a>:
<p> 2 new NAASC members have been elected by North American members of TAIR.
<p> The new members, serving from fall 2012 to fall 2016 are:</p>
<ol>
        <li>Siobhan Brady, University of California, Davis</li>
        <li>Keiko Torii, University of Washington</li>
</ol>
<dt>NAASC History</dt>
<dd>
During the first years of the <I>Arabidopsis</I> Genome Project, an 
<I>ad hoc</I> committee was formed to forge relationships and 
foster communication among the groups and countries 
world-wide who were involved in the genome sequencing 
effort. It was determined that the committee 
should be made up of three representatives from North 
America, two representatives each from continental 
Europe and the United Kingdom, and one representative 
each from Australia and Japan. These 
representatives would be elected by the groups that they 
would represent, and they would serve terms of three 
years. This committee was known as the 
Multinational Science Steering Committee.
</p>      
<p>In February of 1992, in response to the need for 
elected North American representatives to the 
Multinational Science Steering Committee, Howard 
Goodman, Elliot Meyerowitz and Chris Somerville called 
for the formation of a North American 
<I>Arabidopsis
</I> Steering Committee (NAASC). In the first election, 
six North American 
<I>Arabidopsis
</I> researchers were elected.
</p>    
<p>In its first year, the NAASC dealt with a number of issues 
including the decision to have a National 
<I>Arabidopsis
</I> meeting in Ohio in 1993, determining who should 
represent North America on the Multinational Science 
Steering Committee, and advising the NSF and other 
funding agencies of the community's needs for database 
services.
</p>    
<p>It was additionally determined that 
the committee would consist of six members and that 
members would serve for three years. Two new members 
would be elected annually via the 
<A HREF="http://www.bio.net/hypermail/ARABIDOPSIS">
<I>Arabidopsis
</I> Newsgroup
</A>, and two members would retire.
</p>    
<p>Since that time, the NAASC has evolved into the main 
organizing and fundraising body for the International 
Conference on 
<I>Arabidopsis
</I> Research when it is held in North America. This 
conference, now held annually, had over 815 
participants and more than 550 submitted abstracts in 2008, when it was held in Montreal, Canada.
</p>    
<p>The NAASC also helps ensure solicitation and choice 
of the site for two of three meetings, which are now held 
outside of North America following a recommendation by MASC in 2007. The NAASC solicits funds 
to help North American junior scientists travel to these 
international meetings. Since 2004, the NAASC also pursues funding to allow underrepresented 
minorities, and scientists from Historically Black Universities and Minority-Serving Institutions in the 
United States to fully participate in the Annual Arabidopsis meetings.  Additionally, the NAASC 
serves as a liaison between members of the community and 
government and not-for-profit granting agencies and 
provides representation of the community to service 
facilities such as 
<A HREF="http://abrc.osu.edu/">
ABRC
</A> and 
<A HREF="">
TAIR
</A>.
</p>    
<p>In 2000, the members of the NAASC unanimously voted 
to amend the process of election and alter the term of 
service for members to coincide with the annual conference 
rather than the calendar year. It was felt that this alteration 
would help to ensure continuity in the committee.  In 2003, the 
process was again amended, in the following ways:
<UL>
<LI>Each member of the committee will serve for four full years, 
to further aid in continuity in the committee
<LI>Members of the North American 
<I>Arabidopsis
</I> research community who have served previously on NAASC may 
be re-nominated for the election, and if elected, may serve 
another term on the committee
</UL>
</p>
<p>
</dd>
<A NAME="members"><b>Elected NAASC Members</b></a><p>
<dd>   
Members of the North American 
<I>Arabidopsis
</I> research community have been extremely generous in 
their willingness to serve on the NAASC. Since the 
initial call for an elected committee in 1992, 39 researchers  
have served on the committee. The members of the 
NAASC, past and present, are listed below.
</p>

<p>
<TABLE width="240" align="center" cellpadding="0.25">
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4646">
Elliot Meyerowitz
</A>
</TD>
<TD>1992 - 1994
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4537">
Chris Somerville
</A>
</TD>
<TD>1992 - 1994
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4604">
Fred Ausubel
</A>
</TD>
<TD>1992 - 1995
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4624">
Joe Ecker
</A>
</TD>
<TD>1992 - 1995
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4622">
Joanne Chory
</A>
</TD>
<TD>1992 - 1996
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4634">
David Meinke
</A>
</TD>
<TD>1992 - 1996
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4730">
Gloria Coruzzi
</A>
</TD>
<TD>1994 - 1997
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4617">
Mark Estelle
</A>
</TD>
<TD>1994 - 1997
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4754">
Pam Green
</A>
</TD>
<TD>1995 - 1998
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4575">
Rob Last
</A>
</TD>
<TD>1995 - 1998
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=993">
Rick Amasino
</A>
</TD>
<TD>1996 - 1999
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4587">
Daphne Preuss
</A>
</TD>
<TD>1996 - 1999
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4827">
Jeff Dangl
</A>
</TD>
<TD>1997 - 2000
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4551">
Detlef Weigel
</A>
</TD>
<TD>1997 - 2000
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4591">
Chuck Gasser
</A>
</TD>
<TD>1998 - 2001
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4579">
Steve Kay
</A>
</TD>
<TD>1998 - 2001
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4490">
Kathy Barton
</A>
</TD>
<TD>1999 - 2002
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4631">
Mary Lou Guerinot
</A>
</TD>
<TD>1999 - 2002
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=5368">
Peter McCourt
</A>
</TD>
<TD>2000 - 2003
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4540">
Mike Sussman
</A>
</TD>
<TD>2000 - 2003
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4549">
Bonnie Bartel
</A>
</TD>
<TD>2001 - 2005
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=5838">
Eric Richards
</A>
</TD>
<TD>2001 - 2005
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=6168">
Greg Copenhaver
</A>
</TD>
<TD>2002 - 2006
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4603">
Brenda Winkel
</A>
</TD>
<TD>2002 - 2006
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4729">
Philip Benfey
</A>
</TD>
<TD>2003 - 2007
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4574">
Rob McClung
</A>
</TD>
<TD>2003 - 2007
</TD>
</TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4727">
Judith Bender
</A>
</TD>
<TD>2004 - 2008
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/Community?type=person&action=view&communityID=4771">
Xing-Wang Deng
</A>
</TD>
<TD>2004 - 2008
</TD>
</TR>
<TR>
<TD>
<A HREF="/servlets/TairObject?type=person&id=5946">
Joe Kieber
</A>
</TD>
<TD>2005 - 2009
</TD>
</TR>
<TD>
<A HREF="/servlets/TairObject?type=person&id=5279">
Xuemei Chen</A></TD>
<TD>2005 - 2009
</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=4470">Caren Chang</A></TD>
<TD>2006 - 2010</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=5931">Julian Schroeder</A></TD>
<TD> 2006 - 2010</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=4787">Scott Poethig</A></TD>
<TD> 2007 - 2011</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=5004">George Haughn</A></TD>
<TD> 2007 - 2011</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=4617">Mark Estelle</A></TD>
<TD> 2008 - 2012</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=5439">Jane Glazebrook</A></TD>
<TD> 2008 - 2012</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=4779">Xinnian Dong</A></TD>
<TD> 2009 - 2013</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=4292">Blake Meyers</A></TD>
<TD> 2009 - 2013</TD>
</TR>

<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=10892">Dominique Bergmann</A></TD>
<TD> 2010 - 2014</TD>
</TR>
<TR>
<TD><A HREF="/servlets/TairObject?type=person&id=5416">Wolf Frommer</A></TD>
<TD> 2010 - 2014</TD>
</TR>

<TR>
<TD><A HREF="/entity/person_detail/1501417995">Nicholas Provart</A></TD>
<TD> 2011 - 2015</TD>
</TR>
<TR>
<TD><A HREF="/entity/person_detail/182">Jose Alonso</A></TD>
<TD> 2011 - 2015</TD>
</TR>
<TR>
<TD><A HREF="/entity/person_detail/1012839">Siobhan Brady</A></TD>
<TD> 2012 - 2016</TD>
</TR>
<TR>
<TD><A HREF="/entity/person_detail/6028">Keiko Torii</A></TD>
<TD> 2012 - 2016</TD>
</TR>
</TABLE>
</dd>
</dl>
<p>
<center>Last modified on March 11, 2013

</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
 