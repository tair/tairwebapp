<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR AGI PI Photo") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("3") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>

		<!--
		
			Content goes here
			
		//-->
	  
<h1 align=center>Aug. 1996 Photo of AGI Principal Investigators</h1>

<p>

<center>

<img src=/images/agi-investigators.gif border=0>

</center>
<p>
Standing from left to right:
<p>
Kiyotaka Okada (Kyoto Univ.), Satoshi Tabata (Kazusa DNA Res. Inst.),
Sakis Theologis (USDA/UC Berkeley), Rick Wilson (Wash Univ.), Joe
Ecker (Univ. Penn.), Steve Rounsley (TIGR), Dick McCombie (CSHL), Ian
Bancroft (John Innes Centre), Mike Bevan (John Innes Centre), Mike
Cherry (Stanford Univ.)
<p>
Seated from left to right:
<p>
Francis Quetier (Genethon), David Meinke (Oklahoma State Univ.), Chris
Somerville (Carnegie Inst.), Nancy Federspiel (Stanford Univ.), Rob
Martienssen (CSHL)
<p>

August 1996

<p>

<hr>

<center>

<a href=/AGI/AGI_links.html>
AGI Labs & Sequences</a> |
<a href=/AGI/AGI_sum_table.html>
AGI: Who, Where, How</a> |
<a href=/AGI/AGI_data_release.html>
AGI: Data Release Policies</a> |
<a href=/AGI/AGI_memo.html>
AGI MoU</a> | 
<a href=/AGI/seq_announce.html>
AGI Press Announcement<a> 
</center>   
		
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
