<%@page import="org.tair.utilities.*"%>
<html>
<title>TAIR help:Update your publications</title>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("commreg.jsp");
setNext("");
writeHeader();
</script>

<!-- End of header -->

</head>
<h2>Adding and updating your publications</h2>
<p><font class="cont">You can now update the list of publications shown on your personal profile page. Only publications stored in TAIR database can be added to your personal profile. </p>
<p><font class="cont" color="red">If there is a publication you would like to add that is not in TAIR, please contact the <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">TAIR curators</a>. Give the citation or PubMed id for the paper(s) you wish to have included. A curator will then contact you when the paper has been added to the database.<br />
NOTE: TAIR's policy is to add ONLY papers about Arabidopsis or more general papers that include information about Arabidopsis. When requesting paper additions, please bear this in mind.</font></p>
<p>
This page will guide you through the process of adding Publications to your profile.If you registering for the first time you can add publications when you add your personal profile. After you are registered, you can access the form to add publications from your home page after you login by clicking on the "Add Publications to my profile" link in the Personal Data section.</font>

<h4><a name="addpub1"></a>Search for Publications to add.</h4>
<p><font class="cont">The search uses your last name as stored in TAIR database and looks for papers with that name included among the authors. The default limits the search to papers from 1988 to the present. The results are displayed in a summary page showing all papers that match the search criteria. To find older papers, click on the "New Search" button and change the date. If you have published under another name, you can input the name into the authors name field and search again. If a paper is not yet in TAIR database, contact the <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">TAIR curators</a>. </font>

<h4><a name="addpub2"></a>Select publications to add</h4>
<p><font class="cont"> To select publications to associate to your click on the check box to the right of the citation on the summary page. Publications that are already associated to your record will already be checked off. Checking the once will select the citation. To remove a citation, check the box again so that the check mark does not show.</font>

<h4><a name="addpub3"></a>Select Author or Editor status</h4>
<p><font class="cont">You can choose to define if you are an author or an editor, by choosing one of the options from the "Role" drop down menu. For example, if you are the editor of a textbook you can select editor, if you are the author of a chapter in an edited book, select author.</font>

<h4><a name="addpub4"></a>Associate the publications</h4>
<p><font class="cont"> Once you have selected the publications you wish to add, return to the top of the page and click on the "Associate" button in the upper right corner.</font>

<h4><a name="addpub5"></a>Commit your changes to the database</h4>
<p><font class="cont">After you click the "associate" button you will be returned to your profile update page, displaying the papers you have associated to yourself. If the associated papers are correct, click on the "commit changes" button on the bottom of the page. <font color="red">Your changes will not be saved to the database unless you complete this step </font>.</font>

<h4><a name="addpub6"></a>Updating/Deleting records from your publication list</h4>
<p><font class="cont">To remove publications from your list or update your editorial status (author/editor) click on the "update/delete" button in the Associated Publications section of your personal profile form. To delete a publication from your record, UNCHECK the box to the left of the displayed citation.</font>

<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("commreg.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->

</body>
</html>

