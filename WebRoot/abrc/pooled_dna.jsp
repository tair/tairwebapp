<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR -Clones/DNA Resources-pooled DNA";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1114" />
</jsp:include>

<jsp:include page="/jsp/includes/clonesSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Pooled genomic DNA" />
</jsp:include>

<div id="rightcolumn">


<!--CONTENT IN HERE-->
<a name="top"></a>
<span class="header">Genomic DNA Pools for PCR identification of insertion mutants</span>
<dl>
<dt>Pooled genomic DNA is available for the following lines:</dt>

<dd> <A HREF="#Feldmann_pooledDNA">Ken Feldmann T-DNA lines</A></dd>

<dd><A HREF="#Jack_pooledDNA">Thomas Jack T-DNA lines</A></dd>

<dd <A HREF="#Weigel_pooledDNA">Detlef Weigel T-DNA lines</A></dd>
</dl>

<dl>
<dt><A NAME="Feldmann_pooledDNA"></A>Isolated Pools of DNA
from T-DNA Lines donated by Dr. Kenneth Feldmann</dt>

<P><B>CD5-7</B> Pooled DNA from 6000 of the T-DNA lines of Dr.
Kenneth Feldmann suitable for PCR screening has been donated. Please
consult the section on the Feldmann seed pools for details of and
references for T-DNA line development.</P>

<P>The distribution of stocks and associated screening strategy of
these stocks is organized in steps. Initially, six primary DNA
samples, each containing DNA pooled from 1000 lines, are sent. These
DNAs can be assayed by PCR and followup hybridization to determine if
a particular clone corresponds to a T-DNA insertion.</P>

<P>ABRC possesses the T-DNA population as single lines, which can be
sent as a followup to screening of the secondary pools. Hence, the
investigator may order the appropriate 10 seed lines identified by
screening of the 100-pools, isolate DNA from these and identify a
mutant line.</P>

<P>The stock number for the set of six primary 1000-DNA pools is
CD5-7 (includes CD5-1 through CD5-6), and includes the primary pools
and followup DNA. The DNA quantity included in the primary samples
(200 ng in 20 microliters for all stocks) is appropriate for at least
20 PCR reactions. The stock numbers and associations among pool types
and Feldmann 10-pool line numbers are:</P>

<TABLE BORDER=1>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=69>
          <P><B>Stock#</B></P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=236>
          <P><B>Followup DNA pools of 100</B></P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P><B>Feldmann<BR>
          10-pools*</B></P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=69>
          <P>CD5-1</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=236>
          <P>CD5-1A (includes CD5-11 through CD5-30)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>10 - 1000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=69>
          <P>CD5-2</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=236>
          <P>CD5-2A (includes CD5-31 through CD5-50)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>1010 - 2000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=69>
          <P>CD5-3</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=236>
          <P>CD5-3A (includes CD5-51 through CD5-70)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>2010 - 3000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=69>
          <P>CD5-4</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=236>
          <P>CD5-4A (includes CD5-71 through CD5-90)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>3010 - 4000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=69>
          <P>CD5-5</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=236>
          <P>CD5-5A (includes CD5-91 through CD5-110)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>4010 - 5000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=69>
          <P>CD5-6</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=236>
          <P>CD5-6A (includes CD5-111 through CD5-130)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>5010 - 6000</P>
       </TD>
    </TR>
</TABLE>


<P>To order followup DNA, use stock numbers CD5-1A, CD5-2A, CD5-3A,
etc.<BR>
<BR>
*The pool numbers utilized correspond to original Feldmann line
numbers. However, in a few cases, substitutions have been made, so
please contact the Center if you want to know the exact original
Feldmann line with which a line of this group might correlate.</P>

<P>&nbsp;</P>

<P>&nbsp;</P>
</dl>
<p>Back to <a href="#top">[Top]</a></p>
<dl>
<dt><A NAME="Jack_pooledDNA"></A>Isolated Pools of DNA
from T-DNA Lines donated by Dr. Thomas Jack</dt>

<dd><B>CD6-7</B> Pooled DNA suitable for PCR screening has been
isolated from the initial 6000 T-DNA lines donated by Dr. Thomas
Jack. Please consult the section on the Jack seed pools for details
of and references for T-DNA line development.</dd>

<dd>The distribution of stocks and associated screening strategy of
these stocks is organized in steps. Initially, six primary DNA
samples, each containing DNA pooled from 1000 lines, are sent. These
DNAs can be assayed by PCR and followup hybridization to determine if
a particular clone corresponds to a T-DNA insertion.</dd>

<dd>ABRC possesses the T-DNA population as pools of 10 lines, which
can be sent as a followup to screening of the secondary pools. Hence,
the investigator may order the appropriate pool of 10 seed lines
identified by screening of the 100-pools, isolate DNA from these and
isolate a mutant line.</dd>

<dd>The stock number for the set of six primary 1000-DNA pools is
CD6-7, and includes the primary pools and followup DNA. The DNA
quantity included in these samples (200 ng in 20 microliters for all
stocks) is appropriate for at least 20 PCR reactions. The stock
numbers and associations among pool types and Jack 10-pools are:</dd>

<TABLE BORDER=1 WIDTH=468>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=68>
          <P><B>Stock#</B></P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=246>
          <P><B>Followup DNA pools of 100</B></P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P><B>Jack#, 10 pools of seeds</B></P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=68>
          <P>CD6-1</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=246>
          <P>CD6-1A (includes CD6-11 through CD6-30)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>10-1000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=68>
          <P>CD6-2</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=246>
          <P>CD6-2A (includes CD6-31 through CD6-50)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>1001-2000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=68>
          <P>CD6-3</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=246>
          <P>CD6-3A (includes CD6-51 through CD6-70)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>2010-3000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=68>
          <P>CD6-4</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=246>
          <P>CD6-4A (includes CD6-71 through CD6-90)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>3010-4000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=68>
          <P>CD6-5</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=246>
          <P>CD6-5A (includes CD6-91 through CD6-110)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>4010-5000</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=68>
          <P>CD6-6</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=246>
          <P>CD6-6A (includes CD6-111 through CD6-130)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>5010-6000</P>
       </TD>
    </TR>
</TABLE>


<P>To order followup DNA, use stock numbers CD6-1A, CD6-2A, CD6-3A,
etc.</P>

<P>&nbsp;</P>

<P><B>CD7-7</B> Pooled DNA suitable for PCR screening has been
isolated from a further 5000 T-DNA lines donated by Dr. Thomas Jack.
Please consult the section on the Jack seed pools for details of and
references for T-DNA line development.</P>

<P>The distribution of the stocks and associated screening strategy
for these stocks is organized in steps. Initially 5 primary DNA
samples each containing 100 lines are sent. These DNAs can be assayed
by PCR and follow-up hybridization to determine whether a particular
clone corresponds to a T-DNA insertion.</P>

<P>A set of secondary pools, corresponding to one of the 5 primary
pools in which an insertion was detected, can then be requested.
These follow-up sets contain 10 samples each containing DNA pooled
from 100 lines. The lines are pooled in a grid to allow
identification of a single pool of 10 lines containing the clone
carrying the T-DNA insertion.</P>

<P>ABRC possesses the T-DNA population as single seed lines, which
can be sent as a follow up to screening the secondary pools. Hence
the investigator may order the appropriate 10 seed lines identified
by screening of the follow-up pools, isolate DNA and identify a
mutant line.</P>

<P>The stock number for the set of 5 primary pools is CD7-7 (includes
CD7-1 through CD7-5) and includes the primary pools, primers and
follow-up DNA. For the primary pools, 40 microliters of aqueous DNA
sample at an approximate concentration of 50ng/microliter is
appropriate for at least 20 PCR reactions.</P>

<P>The stock numbers for the secondary pools and 10-line pools and
the associations among pool types are shown below. For the secondary
pools, 40 microliters of aqueous DNA sample at a concentration of
1.25 ng/microliter is appropriate for at least 20 PCR reactions.</P>

<TABLE BORDER=1 WIDTH=468>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P><B>Stock#</B></P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=261>
          <P><B>Followup DNA pools of 100</B></P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P><B>Jack#, 10 pools of seeds</B></P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P>CD7-1</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=261>
          <P>CD7-1A (includes CD7-11 through CD7-30)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>CS31031-CS31040</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P>CD7-2</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=261>
          <P>CD7-2A (includes CD7-31 through CD7-50)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>CS31041-CS31050</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P>CD7-3</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=261>
          <P>CD7-3A (includes CD7-51 through CD7-70)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>CS31051-CS31060</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P>CD7-4</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=261>
          <P>CD7-4A (includes CD7-71 through CD7-90)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>CS31061-CS31070</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P>CD7-5</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=261>
          <P>CD7-5A (includes CD7-91 through CD7-110)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>CS31071-CS31080</P>
       </TD>
    </TR>
</TABLE>

</dl>
<p>Back to <a href="#top">[Top]</a></p>
<dl>
<dt><A NAME="Weigel_pooledDNA"></A>Isolated Pools of DNA
from T-DNA Lines donated by Dr. Detlef Weigel</dt>

<P><B>CD10-A</B> Pooled DNA suitable for PCR screening has been
isolated from 17,000 T-DNA lines donated by Dr. Detlef Weigel.</P>

<P>The distribution of stocks and associated screening strategy of
these stocks is organized in steps. Initially, 17 primary DNA
samples, each containing DNA pooled from 1000 lines, are sent. These
DNAs can be assayed by PCR and followup hybridization to determine if
a particular clone corresponds to a T-DNA insertion.</P>

<P>ABRC possesses the T-DNA population as pools of 10 lines, which
can be sent as a followup to screening of the secondary pools. Hence,
the investigator may order the appropriate pool of 10 seed lines
identified by screening of the 100-pools, isolate DNA from these and
isolate a mutant line.</P>

<P>The stock number for the set of six primary 1000-DNA pools is
CD10-A, and includes the primary pools and followup DNA. Each
superpool sample contains an aqueous solution of DNA in TE; the total
concentration in each pool is 1.25ng/microliter, with each line
contributing equally to the final concentration</P>

<P>&nbsp;</P>

<TABLE BORDER=1 WIDTH=468>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P><B>Stock#</B></P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=272>
          <P><B>Followup DNA pools of 100</B></P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P><B>Weigel pools of seeds</B></P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P>CD10-1</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=272>
          <P>CD10-1A (includes CD10-31 through CD10-49)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>pools of 10</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P>CD10-2</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=272>
          <P>CD10-2A (includes CD10-50 through CD10-64)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>pools of 20</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61 HEIGHT=12>
          <P>CD10-3</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=272 HEIGHT=12>
          <P>CD10-3A (includes CD10-65 through CD10-79)</P>
       </TD>
       <TD ALIGN=center VALIGN=top HEIGHT=12>
          <P>pools of 20</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61>
          <P>CD10-4</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=272>
          <P>CD10-4A (includes CD10-80 through CD10-94)</P>
       </TD>
       <TD ALIGN=center VALIGN=top>
          <P>pools of 20</P>
       </TD>
    </TR>
    <TR>
       <TD ALIGN=center VALIGN=top WIDTH=61 HEIGHT=11>
          <P>CD10-5</P>
       </TD>
       <TD ALIGN=center VALIGN=top WIDTH=272 HEIGHT=11>
          <P>CD10-5A (includes CD10-95 through CD10-109)</P>
       </TD>
       <TD ALIGN=center VALIGN=top HEIGHT=11>
          <P>pools of 20</P>
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-6
       </TD>
       <TD WIDTH=272>
          CD10-6A (includes CD10-110 through
          CD10-124)
       </TD>
       <TD>
          pools of 20
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-7
       </TD>
       <TD WIDTH=272>
          CD10-7A (includes CD10-125 through
          CD10-139)
       </TD>
       <TD>
          pools of 20
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-8
       </TD>
       <TD WIDTH=272>
          CD10-8A (includes CD10-140 through
          CD10-154)
       </TD>
       <TD>
          pools of 20
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-9
       </TD>
       <TD WIDTH=272>
          CD10-9A (includes CD10-155 through
          CD10-166)
       </TD>
       <TD>
          pools of 20
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-10
       </TD>
       <TD WIDTH=272>
          CD10-10A (includes CD10-167 through
          CD10-184)
       </TD>
       <TD>
          pools of 12
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-11
       </TD>
       <TD WIDTH=272>
          CD10-11A (includes CD10-185 through
          CD10-202)
       </TD>
       <TD>
          pools of 12
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-12
       </TD>
       <TD WIDTH=272>
          CD10-12A (includes CD10-203 through
          CD10-220)
       </TD>
       <TD>
          pools of 12
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-13
       </TD>
       <TD WIDTH=272>
          CD10-13A (includes CD10-221 through
          CD10-238)
       </TD>
       <TD>
          pools of 12
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-14
       </TD>
       <TD WIDTH=272>
          CD10-14A (includes CD10-239 through
          CD10-256)
       </TD>
       <TD>
          pools of 12
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-15
       </TD>
       <TD WIDTH=272>
          CD10-15A (includes CD10-257 through
          CD10-274)
       </TD>
       <TD>
          pools of 12
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-16
       </TD>
       <TD WIDTH=272>
          CD10-16A (includes CD10-275 through
          CD10-292)
       </TD>
       <TD>
          pools of 12
       </TD>
    </TR>
    <TR>
       <TD WIDTH=61>
          CD10-17
       </TD>
       <TD WIDTH=272>
          CD10-17A (includes CD10-293 through
          CD10-310)
       </TD>
       <TD>
          pools of 12
       </TD>
    </TR>
</TABLE>
</dl>
<p>Back to <a href="#top">[Top]</a></p>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
