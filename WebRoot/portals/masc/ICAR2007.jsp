<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String highlight = "3";
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
<jsp:param name="sidebarName" value="About MASC" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">18th International Conference on Arabidopsis Research:</span><p>
<span class="mainheader">June 20-23, 2007 in Beijing, China</span>
<p>
    
<IMG SRC="/images/redball.gif"><b> Breaking Updates: Deadline Extended! <br>For reduced fee registration and
abstract submission (for oral presentation consideration) the deadline has been extended to March 30, 2007 to
accommodate technical difficulties caused by recent heavy registration traffic. Regular fee registration and
abstract registration for posters
may be submitted until May 10. Abstracts may be edited online until May 10. </b>
<UL TYPE=DISC>
<LI><b>Apply for Visas early!</b> All conference attendees <b>MUST</b> have a valid passport <b>and</b> visa to enter China. You must
first register for the conference and you will then receive an official invitation letter that you may use to apply for your visa. There is more
information at the bottom of this page.
        
<p><LI>To have your research abstract considered for oral presentation in a concurrent session OR in a conference workshop,
you must submit your abstract by the March 30 (changed from March 20), 2007 deadline. <B>Please Note:</B> After you submit your abstract you will
be able to make changes to it online up until the May 10 final deadline. Therefore, <b>*please*</b> submit early if you wish to be considered for an oral presentation-
you can go back later to make changes and updates if you wish.
<p>
<LI>The special room rates at the Jiuhua Spa Resort are available both before and after the conference for attendees who wish
to arrive early or stay longer for siteseeing or other purposes. These rates are available to all conference attendees.
</UL>
<p>
    
<IMG SRC="/images/redball.gif"><b> Important Information</b>
<dd><b>To register for the annual Arabidopsis meeting, you should first try the main conference website <A HREF="http://www.arabidopsis2007.com">www.arabidopsis2007.com</A></b>. However, some users attempting to access the main site
 have encountered long-loading times, or a complete inability to load the pages.
This may be due to a recent earthquake in Taiwan that has disrupted some cable transmission.  In order to provide conference registration capabilities
to those unable to easily access the main site, we have posted downloadable documents on this site, including the preliminary Schedule and Program as well as forms for
conference registration, hotel reservations and tour reservations.  
<p>
Online registration is only available through the official conference website <A
HREF="http://www.arabidopsis2007.com">www.arabidopsis2007.com</A> but you may download one of these forms and either (1) enter your information via
computer using Acrobat (for the fillable pdf file), a word processing program (for the .doc file), or a text editor (for the .rtf file), or (2) print the forms out and fill them in with a typewriter (or print by hand) and fax or send in by regular post 
(complete directions are on the forms; we recommend sending forms in by fax rather than regular post to help expedite registration and reservations.)
<p> 
Some forms have places where signatures are required. If you have a digital signature (this can be acquired by scanning your handwritten signature), you
may insert the signature, and email the completed form to the designated recipient. If you do not have a digital signature, you must print out the forms, hand-write your signature, 
and fax or send the form in by regular post (again, we recommend faxing printed forms to expedite registration and reservations.)
</dd>
<p>
<dt>Preliminary Program and Schedule</dt>
<dd>Available in .pdf or .rtf formats</dd>
<UL TYPE=DISC>
<LI>PDF format <dt><A href="/portals/masc/Arabidopsis2007.pdf">(click to download .pdf file)</a></dt>
<LI>Rich text format <dt><A href="/portals/masc/Arabidopsis2007.rtf">(click to download .rtf file)</a></dt>
</UL>
<p>

<dt>Registration Form</dt> <b>Reduced fee deadline: March 30 (changed from March 20), 2007</b>
 <dd>Available in .pdf, .doc, and .rtf formats</dd>
<UL TYPE=DISC>
<LI>Fillable PDF format <dt><A href="/portals/masc/Registration_form.pdf">(click here to download PDF file)</a></dt>
<LI>Word format <dt><A href="/portals/masc/Registration_form.doc">(click to download .doc file)</a></dt>
<LI>Rich text format <dt><A href="/portals/masc/Registration_form.rtf">(click to download .rtf file)</a></dt>
</UL>
<p>
<p>
<dt>Hotel Reservation Form</dt> <b>Final hotel reservation deadline: May 10, 2007</b>
<dd>Available in .doc or .rtf formats</dd>
<UL TYPE=DISC>
<LI>Word format <dt><A href="/portals/masc/Hotel_Registration_form.doc">(click to download .doc file)</a></dt>
<LI>Rich text format <dt><A href="/portals/masc/Hotel_Registration_form.rtf">(click to download .rtf file)</a></dt>
</UL>
<p>

<dt>Tour Reservation Form</dt> <b>Final tour reservation deadline: May 20, 2007</b>
<dd>Available in .doc or .rtf formats</dd>
<UL TYPE=DISC>
<LI>Word format <dt><A href="/portals/masc/Tour_reservation.doc">(click to download .doc file)</a></dt>
<LI>Rich text format <dt><A href="/portals/masc/Tour_reservation.rtf">(click to download .rtf file)</a></dt>
</UL>
<p>

<IMG SRC="/images/redball.gif"> <b>Abstract Information</b><br> <b>Deadline for oral presentation consideration: March 30 (changed from March 20), 2007. <br>Final deadline
for publication in abstract book: May 10, 2007</b>
<br><b>Abstracts can be edited online until the May 10, 2007 final deadline.</b>
<p>
<dd>After you submit your registration you will receive an email confirmation containing your 
registration number and the website for submitting your abstract.<br>Upon accessing the abstract
website you will enter your registration number and proceed to enter the designated information (authors,
abstract title, presenter name, etc.) <br>You will be given the option of <b>(1) abstract for poster presentation only,
or (2) abstract for poster presentation AND considered for oral presentation.</b> You will also need
to designate the session to which your abstract should be included.
 <p><b>Abstracts are limited to 2400 characters total </b>(including title, author(s), and spaces; the site includes
 a character counter), and you may type your abstract directly online. However, we recommended that you first 
 compose your abstract in a word processing program where you can easily check for spelling and grammatical errors 
 and then copy and paste the text into the space provided. <br>Please note that only plain text and some special character 
 symbols will appear once you've pasted in your abstract. You can designate particular text to appear as italics or underlined
 after you've pasted the abstract in (details are included in the abstract submission site), and <b>we highly encourage you 
 to view your abstract after submitting to ensure your satisfaction with its appearance.</b>
 <p>Abstracts submitted after the March 20, 2007 deadline will not be considered for oral presentation but will be included in the 
 abstract book for a poster presentation. Abstracts must be submitted before the May 10, 2007 deadline or they will not be included 
 in the abstract book. <p> </dd>

<p>
<IMG SRC="/images/redball.gif"> <b>The deadline has passed for these funding opportunities provided by the NAASC</b>
<dd>Full funding to attend the conference is available for up to eight scientists from <b>U.S. institutions: (1) members of historically under-represented
minority groups and (2) scientists from Historically Black Colleges and Universities, Minority-Serving Institutions, and 1890 Institutions.</b> See application form
for further information on eligibility and selection criteria.  Application deadline: <b>February 28th, 2007.</b> </dd>

<p>
<dd>Partial travel supplement funding is available for up to 20 graduate students, postdoctoral fellows and early-career faculty (within 2 years of initial appointment)
who are <b>full-time researchers in North American institutions including (1) the United States, (2) Canada, (3) Mexico, and (4) Central America. 
</b> See application form
for further information on eligibility and selection criteria.  Application deadline: <b>February 28th, 2007.</b>  </dd>


<p>
<IMG SRC="/images/redball.gif"> <b>Information for Invited Speakers</b>
<dd>Invited speakers should first try to register online at the official conference website <A HREF="http://www.arabidopsis2007.com/RegistrationLink.html">www.arabidopsis2007.com/RegistrationLink.html</A>. 
 If you are unable to access the site, you may download the invited speaker registration forms here, in .pdf or .rtf formats.  The pdf file is fillable using
 Adobe Acrobat, or you can fill in the rtf file with a word processing program.  <br>If your signature is needed (for extra charges), you may insert
 a digital signature (obtain by scanning your handwritten signature), and email the completed form to the designated recipient.
 <br>If a signature is needed and you do not have a digital signature, you should fill out the form via computer and then print the form, sign manually,
 and fax to the designated recipient. You may also print out a blank form and fill it in by printing clearly in block letters (except for signature, if needed),
 or via typewriter, and then fax it to the designated recipient. <br>
 If you have questions or problems, please contact either the Conference Organizer or the MASC Coordinator (contact information
 below).</dd>
<UL TYPE=DISC>
<LI>PDF format <dt><A href="/portals/masc/Speaker_Registration_form.pdf"> Invited Speaker Registration Form (click to download .pdf file)</a></dt>
<LI>Rich text format <dt><A href="/portals/masc/Speaker_Registration_form.rtf"> Invited Speaker Registration Form (click to download .rtf file)</a></dt>
</UL>
<p>

<IMG SRC="/images/redball.gif"> <b>Important Visa Information</b> 
<dd><b>You need to have both a valid passport and visa for visiting China.</b> Applicants are required to submit their applications 
to the Chinese Embassy or Chinese Consulate in the country where they normally and legally reside.  Passports must be valid for at least 6 
months prior to entry and you must have spare blank pages in your passport. Visas are issued by the Chinese embassy or consulate general 
serving your area.  <br>To apply, you will need to complete an appropriate visa form, provide your current passport and a passport photo. 
Applicants should submit their applications in person or authorize a third party to submit their applications to the visa office of Chinese Embassy
 or to a Chinese Consulate-General. <b>In most countries, applications by mail are not accepted- do NOT mail your application in- it will be rejected 
 and you may lose your materials (including your passport.)</b> <br>You may be able to arrange for your travel agent to manage the process for you, or 
 use a special visa agent (for visa agents, google search "get china visa") but these services will cost extra on top of the charge for the visa itself.
<p>
<b>Visa types for the meeting:</b><br>
<b>Business &#239;&#191;&#189;F&#239;&#191;&#189; visa:</b> Requires that you provide an invitation letter from the Chinese Meeting Organizers. This letter will be provided once you register for the conference.<br>
<b>Tourist 'L' Visa:</b> You may also apply for a tourist visa by filling out the appropriate form.
<p>
<b>Fees</b> <br>Check with the consulate in your country for exact information but in general, the fee for a single-entry visa is $50 for 
American citizens and $30 for citizens of other countries. &#239;&#191;&#189;Express&#239;&#191;&#189; service is usually available for additional fees.
<p>
<b>Notes</b> <br>
Obtaining a visa takes some time- from a few days if you go to the embassy in person, to a few weeks or a month or more if you have someone else (agent, family member, etc)
submit your application. 
Please apply <b>early</b> and check the visa requirements for your individual country (each country has a Chinese embassy which should have a website). 
<p>For those simply entering Beijing for the meeting, and departing afterwards (staying in China for no more than 30 total days), a &#239;&#191;&#189;single-entry F visa&#239;&#191;&#189; should be sufficient.
<p>

<IMG SRC="/images/redball.gif"> <b>Contact Information</b>
<p>
<UL TYPE=DISC>

<LI>Conference Organizer (China): <A href="mailto:angelaqin96@yahoo.com"> Angela Qin</A>
<LI>MASC Coordinator (US): <A href="mailto:jdfriesner@stanford.edu">Joanna Friesner</A>
 </UL>
<p>

<center>Last modified on March 21, 2007</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>




