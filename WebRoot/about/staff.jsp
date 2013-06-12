<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR - About TAIR - Staff";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="400" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR Staff"/>  
</jsp:include>
<div id="rightcolumn">


		<!--		
			Content goes here
			
		//-->
<span class="mainheader">TAIR Staff</span>

	<div class="event">	
		<img src="/images/eva.jpg" height="75" width="50" alt="pic of eva" />
		<div>
		Eva Huala, Ph.D.<br />
		Principal Investigator &amp; Director<br />
		Phone: (650) 739-4310<br />
		huala<img class="noborder" src="/images/at.gif" alt="at symbol">acoma.stanford.edu<br />
		</div>
	</div>	
    	<div class="event">
	
		<img src="/images/sue.gif" height="75" width="50" alt="pic of sue" />
		<div>
		Seung Yon (Sue) Rhee, Ph.D.<br />
		Co-Principal Investigator<br />
		Phone: (650) 739-4251<br />
		rhee<img class="noborder" src="/images/at.gif" alt="at symbol">acoma.stanford.edu<br />
		</div>
	</div>

	<div class="event">	
		<img src="/images/tanya.jpg" height="75" width="50" alt="pic of tanya" />
		<div>
		Tanya Berardini, Ph.D.<br />
		Lead Scientific Curator, Functional Genomics<br />
		Phone: (650) 739-4325<br />
		tberardi<img class="noborder" src="/images/at.gif" alt="at symbol">acoma.stanford.edu<br />
		</div>
	</div>

    <div class="event">
       <img src="/images/DHL.jpg" height="75" width="50" alt="pic of donghui" /> 
       <div>
           Donghui Li, Ph. D.<br />
           Scientific Curator, Functional Genomics<br />
		Phone: (650) 739-4356<br />
           donghui<img class="noborder" src="/images/at.gif" alt="at symbol">stanford.edu<br />
      </div>
   </div>
  
   <div class="event">
       <img src="/images/karthik.jpg" height="75" width="50" alt="pic of karthik" /> 
       <div>
           A.S Karthikeyan, Ph. D.<br />
           Scientific Curator (Offsite)<br />
           akarthik<img class="noborder" src="/images/at.gif" alt="at symbol">stanford.edu<br />
      </div>
   </div>
    <div class="event">
       <img src="/images/debbie.jpg" height="75" width="50" alt="pic of debbie" /> 
       <div>
           Debbie Alexander, Ph. D.<br />
           Scientific Curator (Offsite)<br />
           debbie.alexander<img class="noborder" src="/images/at.gif" alt="at symbol">stanford.edu<br />
      </div>
   </div>
   
	<div class="event">	
		<img src="/images/bobm.jpg" height="75" width="50" alt="pic of bob" />
		<div>
		Robert Muller, Ph. D.<br /> 
		Techteam Manager<br />
		Phone: (650) 739-4396<br />
		bmuller<img class="noborder" src="/images/at.gif" alt="at symbol">stanford.edu<br />
		</div>
	</div>

	<div class="event">	
		<img src="/images/larry.jpg" height="75" width="50" alt="pic of larry" />
		<div>
		Larry Ploetz<br />
		System Administrator<br />
		Phone: (650) 739-4296<br />
		larry<img class="noborder" src="/images/at.gif" alt="at symbol">tairgroup.org<br />
		</div>
	</div>

	<div class="event">
		<img src="/images/bill.jpg" height="75" width="50" alt="pic of bill" />
		<div>
		Bill Nelson<br />
		Bioinformatics Developer<br />
		Phone: (650) 739-4343<br />
		bnelson<img class="noborder" src="/images/at.gif" alt="at symbol">arabidopsis.org<br />
		</div>
	</div>
<p>
<a href="/about/exstaff.jsp">People</a> previously associated with TAIR.</p>
<center>Last modified on July 16, 2008</center>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
