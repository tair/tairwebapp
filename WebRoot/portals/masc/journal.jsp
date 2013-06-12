<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1157" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Submcomittees" />
</jsp:include>
<div id="rightcolumn">


<!--CONTENT HERE//-->
<span class="mainheader">Welcome to the MASC Coordinator page!</span>
<p>
<h3>This page contains information on the outreach efforts and activities of the MASC Coordinator including
notes on conferences attended and other notes of interest to the Arabidopsis community. </h3><p>
<div>
<IMG SRC="/images/redball.gif"> Please send comments, questions, and feedback about the MASC to:
<br>
Dr. Luise Brand, MASC Coordinator
<br>
Email: <a href='mailto:luise.brand@uni-tuebingen.de'>luise.brand@uni-tuebingen.de</a>
<img src="/i/MASClogo.jpg" width="125 px" height="69 px"  alt="MASC logo" align=center hspace=10>
<dl>
    <hr>
<p><b> Entries:</b>
<UL TYPE=DISC>


<LI><A HREF="#Irelandrep">Charles Spillane has agreed to stand as the  representative for Ireland (January, 2011)</A> 
<LI><A HREF="#Czechrep">Viktor Zarsky has agreed to stand as the Czech Repulic representative (September, 2010)</A> 
<LI><A HREF="#phenome_chairs">Robert Furbank and Ulrich Schurr are the new chairs of the Phenomics Subcommittee (September, 2010)</A> 

<LI><A HREF="#PlantCellCommentary"> PLANT CELL Commentary on Bioinformatics available (August, 2010)</A> 

<LI><A HREF="#NatVarchair">Brian Dilkes is the new chair of the Natural Variation/Comparative Genomics Subcommittee (June, 2010)</A> 
<LI><A HREF="#Francerep">Heriber Hirt is the new France representative (June, 2010)</A> 
<LI><A HREF="#masc2010">2010 MASC Report Released (May, 2010)</A> 
<LI><A HREF="#Bioinformatics_Survey_18Mar2010">Bioinformatics Survey summary available (April, 2010)</A>  
<LI><A HREF="#mutant_hunt">ABRC opens its doors and launches a Mutant Hunt (February, 2010)</A>  
<LI><A HREF="#iPlant5">New iPlant Collaborative newsletter released (February, 2010)</A>   
<LI><A HREF="#BBSRC_Plan"> BBSRC launches new strategic plan (February, 2010)</A>
<LI><A HREF="#newchair_meta_SC"> Kazuki Saito is the new chair of the MASC Metabolomics subcommittee (February, 2010)</A>
<LI><A HREF="#1001_genomes"> 80 genomes of diverse accessions of <em>Arabidopsis thaliana</em> have been released (February, 2010)</A>
<LI><A HREF="#bioarray">BioArray Resource announces several improvements (February, 2010)</A>
<LI><A HREF="#newchair_info_sc">Nicholas Provart is the new chair of the MASC Bioinformatics subcommittee (February, 2010)</A>
<LI><A HREF="#informatics_wk">MASC plans two Workshops about the Informatics Needs of Arabidopsis Community (January, 2010)</A> 
<LI><A HREF="#new_coord">New MASC Coordinator appointed (December, 2009)</A> 
<LI><A HREF="#coord_2">New Interim MASC Coordinator starts (October, 2009)</A>       
<LI><A HREF="#icar2010_3">Important Dates for ICAR 2010- Japan (October, 2009)</A>       

    <LI><A HREF="#AT2010_3">Final Call for AT2010 Project Proposals (September, 2009)</A>       
<LI><A HREF="#nyt">New York Times: Where Did All the Flowers Come From? (September, 2009)</A>       
    <LI><A HREF="#abrc_3">New ABRC Director and Associate Directors (September, 2009)</A>    
<LI><A HREF="#AT2010_2"> 2008 Awards added to the AT2010 Projects and Resource Spreadsheet (September, 2009)</A>                
    <LI><A HREF="#eplant"> New 'ePlant' Resource from the Bio-Array Resource (August, 2009)</A>            
<LI><A HREF="#AT2010"> New 'One-stop' Information on AT2010 Projects and Resource Availability (August, 2009)</A>            
<LI><A HREF="#tube2"> Too Cool For School: Winners of ChloroFilms 'plant videos on YouTube' (August, 2009)</A>            
<LI><A HREF="#aspb"> Podcasts from recent ASPB meeting avaiable (August, 2009)</A>        
    <LI><A HREF="#coord"> New MASC Coordinator to begin this October (August, 2009)</A>    
    <LI><A HREF="#exc2009"> More funding to send young US researchers to Germany (August, 2009)</A>    
    <LI><A HREF="#abs2009"> All abstracts and final program from 2009 ICAR posted (August, 2009)</A>    
<LI><A HREF="#icar2011">2011 Arabidopsis Conference returns to Madison, Wisconsin (USA) (July, 2009)</A>    
<LI><A HREF="#stock">ABRC Stock Donation Drive (July, 2009)</A>
<LI><A HREF="#tair2">TAIR: Genome 9 release; Synteny Viewer (July, 2009)</A>            
    <LI><A HREF="#MASCUK">GARNet funded for 5 more years, will assume MASC Coordination (June, 2009)</A>
    <LI><A HREF="#mis">Mothers in Science: Free online book from Ottoline Leyser (June, 2009)</A>        
    <LI><A HREF="#garnish2">New Issue of GARNet's newsletter- GARNish- is posted (June, 2008)</A>
    <LI><A HREF="#TAIRICAR">Visit the TAIR booth and join the TAIR workshop at the Scotland ICAR(June, 2008)</A>    
<LI><A HREF="#masc2009">2009 MASC Report Released (June, 2009)</A>        
<LI><A HREF="#abrc_2">Randy Scholl, ABRC Director, to retire (June, 2009)</A>    
    <LI><A HREF="#icar2010_2">Invited Speakers for Arabidopsis-Japan Announced (June, 2009)</A>   
    <LI><A HREF="#naasc">Newly elected members to NAASC (May, 2009)</A>
<LI><A HREF="#iPlant4">Second iPlant Collaborative newsletter released (May, 2009)</A>    
    <LI><A HREF="#news">Career cross-training for PhDs is more important than ever (April, 2009)</A>
<LI><A HREF="#rapa">New Brassica rapa TILLING service (April, 2009)</A>
<LI><A HREF="#tair">New clones/constructs available via TAIR and ABRC (April, 2009)</A>
<LI><A HREF="#BAR">Bio-Array Resources for Arabidopsis- updates (April, 2009)</A> 
 <LI><A HREF="#text">New Arabidopsis text-mining website (March, 2009)</A>       
 <LI><A HREF="#icar2010">New website for 2010 Arabidopsis meeting in Japan (March, 2009)</A>    
    <LI><A HREF="#tansley">Nominations accepted for Tansley Award for young plant scientists (March, 2009)</A>
<LI><A HREF="#iPlant3">Summary of recent iPC Grand Challenge Workshops (February, 2009)</A>
<LI><A HREF="#GSUK">UK Genetics Society Annual One Day Arabidopsis Meeting (February, 2009)</A>    
    <LI><A HREF="#ques">The Most Important Questions in Plant Science! (February, 2009)</A>
<LI><A HREF="#ipc1">First Newsletter from the iPlant Collaborative (February, 2009)</A>    
<LI><A HREF="#tube">YouTube Plant Biology video contest (January, 2009)</A>
    <LI><A HREF="#NPGI">The National Plant Genome Initiative at Ten Years: A Community Workshop (January, 2009)</A>
    <LI><A HREF="#amiRNA">8,000 Arabidopsis artificial microRNA clones are now available (January, 2009)</A>    
<LI><A HREF="#policy"><b>Comment on</b> the Arabidopsis genome sequence draft policy statement (January, 2009)</A>    
    <LI><A HREF="#garnish">New Issue of GARNet's newsletter- GARNish- is posted (December, 2008)</A>
    <LI><A HREF="#david">David Baulcombe receives Lasker Award for Basic Medical Research (December, 2008)</A>  
    <LI><A HREF="#plantgenome">Upcoming Plant Genomes Meeting at CSHL (December, 2008)</A>
<LI><A HREF="#tab">New Chapters in The Arabidopsis Book (December, 2008)</A>    
    <LI><A HREF="#redei">George P. Rédei: June 14, 1921- November 10, 2008 (November, 2008)</A>
    <LI><A HREF="#tair">View TAIR community survey results (November, 2008)</A>
    <LI><A HREF="#salk">Salk homozygous mutant collection continues to grow (November, 2008)</A>
<LI><A HREF="#synbio">UK Synthetic Biology (October, 2008)</A>    
<LI><A HREF="#2010">2007 Fiscal Year Awards for the NSF 2010 project (October, 2008)</A>
<LI><A HREF="#iPlant2">First iPlant workshops held, Letter from Board (October, 2008)</A>
<LI><A HREF="#mascp">MASC Proteomics Publication (October, 2008)</A>
<LI><A HREF="#ABRC">ABRC Updates (September, 2008)</A>
<LI><A HREF="#EU2020">2020 European Vision For Plant Science Workshop Report (September, 2008)</A>
<LI><A HREF="#survey08">Arabidopsis Conference Survey Results (September, 2008)</A>
<LI><A HREF="#icars">Next Two Arabidopsis Conferences Announced (September, 2008)</A>
<LI><A HREF="#crs">Chris Somerville podcast from the 2008 Arabidopsis Conference available (August, 2008)</A>
<LI><A HREF="#US2020">US 2020 Vision For Biology Workshop Report and Journal Article (August, 2008)</A>
<LI><A HREF="#postICAR">Results of the 2008 International Arabidopsis Conference (August, 2008)</A>
<LI><A HREF="#2008RPT">2008 MASC Report Posted (July, 2008)</A>
<LI><A HREF="#icar4">Arabidopsis Meeting Abstract Book Posted (July, 2008)</A>
<LI><A HREF="#text">Arabidopsis Textpresso: New text-mining tool for Arabidopsis (May, 2008)</A>
<LI><A HREF="#ipc">CSHL, New York: The 'kickoff' meeting for the iPlant Collaborative (April, 2008)</A>
<LI><A HREF="#rick">UC Davis, California: The 2nd Biennial Charley Rick Symposium (March, 2008)</A>
<LI><A HREF="#iPlant">iPC meeting announcement-a plant sciences cyberinfrastructure collaborative (Feb. 2008)</A>
<LI><A HREF="#PAG08">San Diego, CA: Plant and Animal Genome XVI (Jan. 2008)</A>
<LI><A HREF="#2020">Arlington, Virginia: 2020 Vision for Biology Workshop (Jan. 2008)</A>
<LI><A HREF="#plantgems">Tenerife, Canary Islands (Spain): 6th PlantGEMs meeting (Oct. 2007)</A>
<LI><A HREF="#seeds">UC Davis, California: Translational Seed Biology Symposium (Sept. 2007)</A>
<LI><A HREF="#nasc">Nottingham Arabidopsis Stock Centre/Centre for Plant Integrative Biology (Sept. 2007)</A>
<LI><A HREF="#garnet">Norwich, UK: GARNet Advisory and Annual Meeting (Sept. 2007)</A>
</dl>
</UL>
</p>
<hr>



<A NAME="Irelandrep"><b> Ireland joins MASC  </b></a>
<p> <a href="mailto:charles.spillane@nuigalway.ie">Charles Spillane</a>, from the National University of Ireland, Galway, joined MASC bringing a new contirbution to the Committee.</a>
<p>

<A NAME="Czechrep"><b> Czech Republic joins MASC  </b></a>
<p> <a href="mailto:viktor@natur.cuni.cz">Viktor Zarsky</a>, from Charles University and the Academy of Sciences of the Czech Republic (Prague) joined MASC bringing a new contirbution to the Committee.</a>
<p>
<A NAME="phenome_chairs"><b> New Phenomics Subcommittee Chairs and members</b></a>
<p> <a href="mailto:robert.furbank@csiro.au">Robert Furbank</a> (CSIRO, Canberra, Australia) and <a href="mailto:u.schurr@fz-juelich.de">Ulrich Schurr</a> (Forschungszentrum Jülich, Jülich, Germany)
have accepted to serve as chairs of the Phenomics Subcommittee. New members of the Phenomics subcommittee include <a href="mailto:koornnee@mpiz-koeln.mpg.de">Maarten Korneef</a> and <a href="mailto:lastr@msu.edu">Rob Last</a></a>
<p>



<A NAME="PlantCellCommentary"><b>Plant Cell Commentary on Bioinformatics </b>
 </a>
<p>Following two international workshops on the current and future needs of Arabidopsis bioinformatics, a <a href="http://www.plantcell.org/cgi/reprint/tpc.110.078519v2">Plant Cell Commentary</a> has been published. An international federated approach has been proposed. 
<p>


<A NAME="NatVarchair"><b> New chair of the Natural Variation/Comparative Genomics Subcommittee</b></a>
<p> <a href="mailto:bdilkes@purdue.edu">Brian Dilkes</a> from Purdue University (USA) has agreed to join Chris Pires to chair the Natural Variation/Comparative Genomics Subcommittee.</a>
<p>



<A NAME="Francerep"><b> New France representative  </b></a>
<p><a href="mailto:hirt@evry.inra.fr"> Heribert Hirt</a> from INRA / CNRS - URGV, France, is the new France representative.
<p>

<A NAME="masc2010"><a href="/portals/masc/masc_docs/masc_reports.jsp"><b>Annual Report of the Multinational Arabidopisis Steering Committee</b></a>
<p>The 2010 MASC report summarizing research efforts around the world from the Arabidopisis community is <a href="/portals/masc/masc_docs/masc_reports.jsp"><u>now available</u></a>.
<p> The report includes:
<li> Highlights of groundbreaking Arabidopsis research published in the last year.
<li> Graphical comparison of the number of publications and patents produced for the model organisms Arabidopsis, corn, and rice including <img src="/images/redball.gif"> <strong>New!</strong> European Published Applications and Published PCT Applications.
<li> Descriptions of how basic research in Arabidopisis has led to 'broader impacts' in the world, such as through translational efforts by biotech companies.
<li> Tracking of community resources, such as how many genes now have sequenced insertion elements, full-length cDNA clones, RNAi constructs, and expression data.
<li><img src="/images/redball.gif"> <strong>New!</strong> Reflecting on the past 10 years in Arabidopsis Research with funding officials and researchers. 
<li> Updates from countries around the world that study Arabidopsis.
<li> Analysis and recommendations from MASC regarding scientific approaches for the next year.
<p>
<A NAME="Bioinformatics_Survey_18Mar2010"><b> 2010 Bioinformatics Survey summary</b></a>
<p> A summary of the Bioinformatics survey recently conducted by Nick Provart (Chair of the Bioinformatics Subcommittee) <a href="/portals/masc/Bioinformatics_Survey_18Mar2010.pdf">is available here</a>
<p>
<A NAME="mutant_hunt"><b> First ABRC Mutant Hunt</b></a>
<p> ABRC invites to visit their greenhouses and look for favourite mutants during the Sping growing cycle. The Mutant Hunt initiative offers a unique opportunity for both forward screens, looking for a favourite phenotype, and reverse screens of several mutants in a favourite gene. For details visit the <a href="https://abrc.osu.edu/">ABRC Home page</a>
<p>
<A NAME="iPlant5"><b> New iPlant Newsletter</b></a>
<p> Check out the latest issue of the <a href="http://www.iplantcollaborative.org/leaflet/2010/02/19/the-iplant-leaflet-10-01-0">iPlant Leaflet</a>, iPlant Collaborative's Newsletter
<p>
<A NAME="BBSRC_Plan"><b> BBSRC launches new strategic plan</b></a>
<p> The BBSRC has outlined the strategic framework that will shape its direction and funding decisions for the next 5 years. <a href="http://www.bbsrc.ac.uk/strategy/">The new Strategic Plan can be downloaded here</a>.   
Prof Kell’s video announcement of the 2010-2015 Stategic Plan is available to watch with a new <a href="http://www.bbsrc.ac.uk/strategy/">BBSRC film, ‘The Age of Bioscience’</a>. 
<p>
<A NAME="newchair_meta_SC"><b> Kazuki Saito is the new chair of the MASC Metabolomics subcommittee</b></a>
<p> <A HREF="mailto:ksaito@faculty.chiba-u.jp">Kazuki Saito</a> (Ciba University/RIKEN Plant Science Center, Japan) has accepted to serve as chair of the Metabolomics subcommittee with <A HREF="mailto:wolfram.weckwerth@univie.ac.at">Wolfram Weckwerth</a> as co-chair. <p>
<A NAME="1001_genomes"><b> 80 genomes of diverse accessions of <em>Arabidopsis thaliana</em> have been released</b></a>
<p> To kick off the 1001 Genomes project for <em>Arabidopsis thaliana</em>, the Weigel laboratory has just released 80 genomes of diverse accessions sequenced with paired end Illumina short reads. SNPs and structure variants (SVs) are <a href="http://1001genomes.org/data/MPI/MPICao2010/releases/current/">available here</a>. Seeds for the 80 accessions have been submitted to the stock center.<br>
<p><A NAME="bioaaray"><b> The BioArray Resource anncounces several improvements</b></a>
<p>
<a href="http://bar.utoronto.ca">The BioArray Resource </a>announced imporvements for working with Arabidopsis functional genomics data. Improvements include more linking between tools, classification SuperViewer now with p-values and MapMan categories, DataMetaFormatter now with automatic calculation of enrichment for GO categories for electronic Northern queries.
<p> 
<A NAME="newchair_info_sc"><b> Nicholas Provart is the new chair of the MASC Bioinformatics subcommittee</b></a>
<p>
<A HREF="mailto:nicholas.provart@utoronto.ca">Nicholas Provart</a> (University of Toronto, Canada) has accepted to serve as chair of the Bioinformatics subcommittee. 
<p>
<A NAME="informatics_wk"><b> MASC plans two Workshops about the Informatics Needs of Arabidopsis Community</b></a>
<p>
Since the release of the Arabidopsis genome sequence, significant coordinated investments in the functional genomics of Arabidopsis have resulted in a plethora of productive research activities. The last ten years of Arabidopsis research has generated a variety of large-scale datasets. Arabidopsis data is not only increasing in quantity but also in complexity. Consequently, the database needs of the Arabidopsis community are evolving. These changing informatics needs will require solutions as well as plans for their sustainability. A sustainable Arabidopsis database for the future will need to be agile, cost-effective, responsive to the community, and multinational. To crystallize this vision, MASC, in collaboration with North American Arabidopsis Steering Committee, is planning to organize two workshops that will be held in spring 2010. These workshops will provide forums to discuss the informatics needs of the Arabidopsis community and potential solutions to meet those needs. The first workshop will be aimed at understanding the current and future needs with respect to databases and informatics tools. The discussions in the second workshop will focus on potential solutions for meeting the needs of the Arabidopsis community.
<p> Approximately 70 researchers from across the globe have been invited to attend the workshops. The first workshop will be held April 15-16, 2010 in Nottingham, UK. This workshop will bring together Arabidopsis researchers that generate large sets of genomics data and various types of functional genomics data as well as the researchers that mainly use Arabidopsis data on a small scale. These researchers will discuss the current and future informatics needs of the Arabidopsis community. In the second workshop, the brief resulting from the first workshop will be used by informatics experts to suggest potential solutions for the needs. This workshop is planned on May 10-11, 2010 in Washington, DC, USA.  In addition to some of the participants of from the first workshop, the second workshop will include researchers that manage other model organism databases as well as scientists that manage other plant databases or informatics collaboratives. Some informatics experts from industry will also be invited to the second workshop. Potential informatics models to meet the needs of Arabidopsis community and plausible international funding models for future databases and informatics services will be discussed in the workshops. 
  <p>The outcomes of two workshops will be presented at the major plant-focused conferences, including International Conference on Arabidopsis Research, which will be held on June 6-10, 2010 in Yokohama, Japan. This information from the workshops will be useful to the funding agencies in developing strategies for international collaboration to meet the database needs of the Arabidopsis community in the coming years.
  <p>
    <A NAME="new_coord"><b> New MASC Coordinator appointed</b></a>
<p>
Dr Irene Lavagi has been recently appointed as the new MASC Coordinator. For the next three years the coordinator's
position will be UK-based as a result of the successful funding of a BBSRC grant.

Contact <A HREF="mailto:i.lavagi@warwick.ac.uk">Dr. Irene Lavagi, MASC Coordinator </a>
<br>
Email: i.lavagi@warwick.ac.uk<p>
<A NAME="coord_2"><b> New Interim MASC Coordinator in the UK Takes Over For US Coordinator</b></a>
<p>
Ruth Bastow, current Coordinator of GARNet (UK), will take over as interim Coordinator of the Multinational Arabidopisis Steering Committee until a permanent
replacement is employed.
<p> The UK's 3 year GARNet grant provides funding for continuing support of MASC and the Arabidopisis community following 6 years of US-based funding by NSF and 1 year
German-based funding by DFG. <p>
Contact <A HREF="mailto:ruth@arabidopsis.info">Dr. Ruth Bastow, Interim MASC Coordinator </a>
<br>
Email: ruth@arabidopsis.info<p>
<A NAME="icar2010_3"><a href="http://arabidopsis2010.psc.riken.jp/"><b>Important Dates for Arabidopsis 2010-Japan </b></a>
<p>
The 21st ICAR will take place in Yokohoma, Japan from June 6-10, 2010.
<p><a href="http://arabidopsis2010.psc.riken.jp/i_dates.html"><u>Important dates include:</u></a>
<li>Registration<p>
Early-bird/Reduced Fee Registration Starts: <b>December 1, 2009</b> <p>
Early-bird/Reduced Fee Registration Deadline: <b>March 3, 2010</b> <p>
Late Registration: after <b>March 4, 2010 </b>
<li>Abstract<p>
Submission Starts: <b>December 1, 2009 </b><p>
Abstract Submission (for oral presentation consideration) Deadline: <b>March 3, 2010</b><p>
Abstract Submission (for poster only) Deadline: <b>March 31, 2010</b>
<li>Accommodation<p>
Hotel Reservation System Opens: <b>December 1, 2009</b> <p>
<li>Workshop<p>
Application Submission Starts: <b>December 1, 2009 </b><p>
Application Deadline: <b>March 3, 2010</b>
<p>    
 <A NAME="AT2010_3"><a href="http://www.nsf.gov/funding/pgm_summ.jsp?pims_id=5337&org=NSF&sel_org=NSF&from=fund"><b>Final Call for AT2010 Project Proposals</b></a>
<p>
The U.S. National Science Foundation (NSF) will have its final proposal deadline for the AT2010 Project in January, 2010. In the final year the Program will continue to support
genome-wide analyses and research on biological networks using high throughput methods and integrating modeling with experimental data.
<p>
In Fiscal Year 2010, proposals are especially encouraged, but not limited to, the following thematic areas:
<ol>
<li> Metabolic biology, particularly relevant to energy capture and use
<li> Adaptation to the environment
<li> Multi-scale analysis of genome evolution and genetic systems
<p>
<a href="/portals/masc/FG_projects.jsp"><u>For more information</u></a>
</ol>
<p>   
<A NAME="nyt"><a href="http://www.nytimes.com/2009/09/08/science/08flower.html"><b>New York Times Article on Flowers- Published Sep. 7, 2009</b></a>
<p>
A recent <a href="http://www.nytimes.com/2009/09/08/science/08flower.html"><u>NY Times newspaper article by Carl Zimmer</u></a> talks about the success of flowering plants, describing flowering plant evolution and the dramatic
impact that studying flowering mechanisms in Arabidopsis has had on evolutionary biology. <p>
Work by Vivian Irish and colleagues on AP3 in poppies and Arabidopsis is described as an example of how different plant lines have
independently evolved flowers but use similar genes to control their growth.
<p>
<A NAME="abrc_3"><a href="http://www.biosci.ohio-state.edu/pcmb/Facilities/abrc/abrchome.htm"><b>New Staff at ABRC Stock Center</b></a><p>
Erich Grotewold is assuming the position of Director of ABRC and PI of the NSF grant supporting ABRC. Dr. Jelena Brkljacic has been hired effective August 1, 2009 as an
Associate Director. Dr. Emma Knee, who has been involved in the DNA operation aspects of the ABRC for the past 12 years, will serve as an Associate Director. <br>
Dr. Randy Scholl, who has served as Director of ABRC and PI of the grant, has officially retired from OSU. He will however remain with ABRC in a somewhat reduced capacity for the near future.
<p>
<A NAME="AT2010_2"><a href="/portals/masc/2010_resources.jsp"><b>2008 Awards Added to AT2010 Projects Resources Spreadsheet</b></a><p>
The NSF recently announced recipients of the 2008 AT2010 Project Awards. Information available on the awards has been added to the
<a href="/portals/masc/2010_resources.jsp"><u>AT2010 resources spreadsheet.</u></a>
<p>
<A NAME="eplant"><a href="http://bar.utoronto.ca/eplant/"><b>ePlant allows 3D viewing of large plant datasets</b></a><p>
The new resource includes information from a number of community projects and currently includes:
<li> sequence variation
<li> gene expression
<li> subcellular localisation
<li> protein interactors
<li> protein structure
<p> A new, much faster version based on Google's O3D 3D rendering engine will be available shortly. The ePlant system uses 3D models of the type used in the video games
and the computer generated imagery industry. BAR has also set up the 3D Data Display Initiative at <a href="http://3ddi.org/"><u>3ddi.org</u></a> to further these kind of developments. 
<p>    
<A NAME="AT2010"><a href="/portals/masc/2010_resources.jsp"><b>New Online Resource Tracks NSF-funded AT2010 Projects</b></a><p>
<li> New spreadsheet listing 2010 projects including active websites and links to NSF abstracts
<li> Lists whether the projects have donated materials to ABRC and TAIR
<li> Provides links to data in project websites (if available)
<li> Provides PI and Co-PI information and email addresses for PIs
<li> Includes a list of relevant community databases derived from 2010 projects and other funding sources
<p> Click <a href="/portals/masc/2010_resources.jsp"><u>here</u></a> to access the new resource, a disclaimer on how it was developed, and <b>instructions on how to provide updates</b>.
<p>
<A NAME="tube2"><a href="http://chlorofilms.org/index.php?module=Pages&func=display&pageid=13"><b>ChloroFilms plant videos on YouTube Winners</b></a><p>
Some winning titles:
<li> <a href="http://www.youtube.com/watch?v=7sRZy9PgPvg"><u>fantastic vesicle traffic</u></a>- 1st prize technical - vesicle movement through Arabidopsis root hairs in germinating seeds
<li> <a href="http://www.youtube.com/watch?v=m1ag6BSzvQQ"><u>La Bloomba- 1st prize artistic</u></a>- Nice time-lapse photography of flowers opening
<li> <a href="http://www.youtube.com/watch?v=pTOch6CbSlQ"><u>Photosynthesis 101: presented by Dr. Undergrad</u></a>- Basic intro to photosynthesis starting with a cartoon about the 'Model' Arabidopsis
<li> <a href="http://www.youtube.com/watch?v=E3O-V6WLw0g"><u>Measuring Leaf Area with Adobe Photoshop CS3</u></a>- technical teaching video to analyze growth of Arabidopsis leaves
<li> <a href="http://www.youtube.com/watch?v=cnK7RT1q0bA"><u>"Sweet Home Apparatus" - the ultimate Golgi music video</u></a>- a music video for Golgi lovers- or for those who just like saying the word 'golgi!'
<li> And many more including lots of other kinds of plants (switchgrass, corn, artichokes, oats, pines, christmas trees, and the elusive <a href="http://www.youtube.com/watch?v=Srg2xSitC9Q"><u>Foil Flower</u></a>)
<p> Contest 2 <a href="http://chlorofilms.org/index.php"><u>opens soon</u></a>
<p>
<A NAME="aspb"><a href="http://www.aspb.org/meetings/pb-2009/podcasts.cfm"><b>Podcasts of ASPB meeting talks available</b></a><p>
<li> Symposium I- Sheng Luan 
<li> Symposium II- Richard Vierstra and Winslow Briggs
<li> Symposium VI- Brandon Gaut
<li> Symposium VII- Rick Amasino and John Ryals
<li> Symposium IX- Nick Provart and Sarah Assmann, Reka Albert
<p> Click <a href="http://www.aspb.org/meetings/pb-2009/podcasts.cfm"><u>here</u></a> to access podcasts.

<p>      
<A NAME="coord"><b>New MASC Coordinator begins this October</b></a><p>
<li> Joanna Friesner will complete nearly 4 years as the NSF-funded MASC Coordinator this October, 2009.
<li> The position will rotate to the United Kingdom and will be funded by the BBSRC for 3 years as part of the GARNet grant renewal.
<li> The new Coordinator has not yet been hired. More details to follow in the coming months.

<p>    
<A NAME="exc2009"><a href="/portals/masc/funding.jsp"><b>Further Funding for NSF International Research Experience for Graduate Students and Postdoctoral Fellows</b></a><p>
There are still funds available to send a few more young U.S. researchers from NSF funded labs to Arabidopsis labs in Germany for short-term research visits. <br>
The visits allow postdocs and grad students to establish or strengthen collaborations and learn new techniques.
<li> Final Application Deadlines: Sept. 15, 2009 and January 15, 2010.
<li> All travel must be completed by May 31, 2010.
<li> For complete details <a href="/portals/masc/funding.jsp"><u>click here</u>.</a>
<p>
<A NAME="abs2009"><b>2009 ICAR Information Posted at TAIR</b></a><p>
Look at the conference program and speaker and poster abstracts from the 2009 ICAR in Scotland. <a href="/news/abstracts.jsp"><u>Posted at TAIR</u>.</a>
<p>
<A NAME="icar2011"><b>ICAR returns to the US in 2011</b></a><p>
The Arabidopsis Conference will return to Madison, Wisconsin in the U.S. in 2011. The tentative dates are June 22 (Wednesday) to June 25 (Saturday).
<p> This will mark the return to the traditional conference location after rotating around the world since 2006. The 2012 meeting is expected to be in Europe, although a site has not yet been selected.
<p>
<A NAME="stock"><a href="http://www.arabidopsis.orghttps://abrc.osu.edu/donate-stocks"><u>ABRC Stock Donation Drive</u></a>
<li> The Arabidopsis Stock Center (ABRC) and the European Stock Centre (NASC) are conducting a donation drive for published mutants and other stocks.
<li> They're making it easy for you and they can help distribute your stocks so you don't have to continually respond to individual requests.
<li> Click here to <a href="/portals/masc/ABRC_Stock_Donation_Form.doc"><u>Download short ABRC stock donation form [WORD Doc]</u></a>
<p>       
<A NAME="tair2"><b>TAIR9 Genome release and new Synteny Viewer</b></a><p>
<li> The TAIR9 genome release is now available at TAIR and NCBI, with 282 new loci, updates to 1254 gene structures and 739 new splice variants. (See June 19 announcement <a href="http://arabidopsis.org/doc/news/breaking_news/140"><u>here</u></a>.)
<li> A synteny viewer, comparing syntenic regions between A. thaliana and A. lyrata, is now available at TAIR. More genomes will be added soon. (See July 7 announcement <a href="http://arabidopsis.org/doc/news/breaking_news/140"><u>here</u></a>.)
<p>        
<A NAME="MASCUK"><b>UK's GARNet receives 3 year funding support</b></a><p>
The BBSRC has awarded GARNet a 3 year grant renewal. GARNet supports the UK Arabidopsis community and collaborates with international researchers and policy-makers.
<p> The new grant includes much needed funding to assume administrative leadership of the <b>Multinational Arabidopsis Steering Committee (MASC),</b> as NSF funding in the U.S.
has not been renewed to support the program. The NSF funded MASC Coordination for 6 of the last 7 years, and the DFG (Germany) provided funding for one year.
<p>    
<A NAME="mis"><a href="http://bioltfws1.york.ac.uk/biostaff/staffdetail.php?id=hmol"><b>'Mothers in Science' Book- Free Online</b></a><p>    
As part of her Royal Society Rosalind Franklin award, Professor Ottoline Leyser (University of York) has produced a book entitled
<a href="http://bioltfws1.york.ac.uk/biostaff/staffdetail.php?id=hmol"><u>Mothers in Science.</u></a> 
<p>
The book aims to illustrate that it is perfectly possible to combine a successful and fulfilling career in research science with motherhood. 
Each of the 64 contributors has provided a brief description about their research and about how they have combined their career and family commitments.
<p>The entries also include a timeline showing on one side, the career path of a research group leader in academic science, and on the other side, important events in her family life.
<p>

<A NAME="garnish2"><a href="http://garnet.arabidopsis.info/garnish.html"><b>The newest issue of GARNISH newsletter is posted</b></a>
<p>
GARNISH is the official newsletter of GARNet, which serves the Arabidopsis community in the UK.<br> Newsletter topics include:    
<li> Overview of 'Next Generation' or 'Second Generation' sequencing.
<li> Update on the challenges and potential rewards facing plant cell wall researchers.
<li> Report on the Mathematics in Plant Sciences Study Group series.
<li> 'Making Sense of GM', a feature which discusses genetic modification of plants.
<li> Spotlight on the many Arabidopisis (and related) resarchers at the John Innes Centre and The Sainsbury Laboratory.
<p>

<A NAME="TAIRICAR"><a href="http://www.arabidopsis2009.com/"><b>Visit the TAIR booth and workshops at the upcoming Arabidopsis conference in Scotland</b></a>
<p>
<li> Putting TAIR to work for you: hands-on workshop for beginning and advanced users.
<li> Thursday, July 2. Time: 4:30-6:30 pm. Location: Kilsyth Room
<p>

<p>
<A NAME="masc2009"><a href="/portals/masc/masc_docs/masc_reports.jsp"><b>Annual Report of the Multinational Arabidopisis Steering Committee</b></a>
<p>The 2009 MASC report summarizing research efforts around the world from the Arabidopisis community is <a href="/portals/masc/masc_docs/masc_reports.jsp"><u>now available</u></a>.
<p> The report includes some interesting sections such as:
<li> Highlights of groundbreaking Arabidopsis research published in the last year.
<li> Graphical comparison of the number of publications and patents produced for the model organisms Arabidopsis, corn, and rice.
<li> Descriptions of how basic research in Arabidopisis has led to 'broader impacts' in the world, such as through translational efforts by biotech companies.
<li> Tracking of community resources, such as how many genes now have sequenced insertion elements, full-length cDNA clones, RNAi constructs, and expression data.
<li> Updates from countries around the world that study Arabidopsis.
<li> Analysis and recommendations from the MASC regarding scientific approaches for the next year.
    
<p>    
<A NAME="abrc_2"><b>Long-time Director of ABRC to retire this summer</b></a>
<p>
    Randy Scholl, Director of the U.S. Arabidopsis Biological Resource Center is retiring this summer. He has led the heavily-used stock center since its inception
    in 1991. Dr. Erich Grotewold of OSU's Department of Plant Cellular and Molecular Biology will become the new Director.  The ABRC recently hired
    Dr. Jelena Brkljacic to serve as the Assistant Director, who together with existing personnel, including Dr. Emma Knee in a similar capacity in charge of DNA
    resources, will ensure a swift transition in leadership. Of course, nearly 20 years of leadership by Randy will be hard to replace!
<p>    
<A NAME="icar2010_2"><a href="http://arabidopsis2010.psc.riken.jp/"><b>Arabidopsis 2010-Japan Invited Speakers</b></a>
<p>
The 21st ICAR will take place in Yokohoma, Japan from June 6-10, 2010. The invited speakers list can be found <a href="http://arabidopsis2010.psc.riken.jp/"><u>here</u></a>   

<p>
<A NAME="naasc"><a href="http://arabidopsis.org/portals/masc/countries/NAASC_Info.jsp"><b>Newly elected NAASC members</b></a><p>
Elections are held each year to the 8-member <a href="http://arabidopsis.org/portals/masc/countries/NAASC_Info.jsp"><u>North American Arabidopsis
Steering Committee</u></a> to replace two members that retire at the summer Arabidopsis meeting. The North American
community registered at TAIR contributes nominations and votes for the members. <p>
This year, over 300 community members voted for 24 researchers that agreed to stand for nomination. The two elected to serve a 4 year term (2009-2013) were:
<li> Xinnian Dong, Duke University
<li> Blake Meyers, Delaware Biotechnology Institute
<p>
<A NAME="iPlant4"><a href="http://iplantcollaborative.org/"><b>Second iPlant Newsletter</b></a><p>
Check out the second installment of<a href="http://iplantcollaborative.org/news-media/67-newsletter/200-the-iplant-leaflet-09-02"><u> the iPlant Leaflet</u></a>, iPC's newsletter.
<p><b>Highlights:</b>
<li> After focusing in the first year to stimulate community participation and bring together groups to propose Grand Challenges, the iPC will transition to designing and creating specific cyberinfrastructure components.
<li> In 2008, 5 of 9 submitted Grand Challenge workshops were held which included over 300 participants from 12 countries.
<li> In January, 2009, iPC held a brainstorming workshop on what cyberinfrastructure is required for addressing challenges in plant sciences.
<li> In March, 2009, 6 Grand Challenge Collaborations were submitted for review. The Board has made recommendations which are being considered.
<li> iPC plans to support the Plant Phylogenetics project which aims to create cyberinfrastructure to identify and display evolutionary relationships between 1/2 million green plant species by creating phylogenetic trees which eventually will include linkages to species data. 
<li> iPC will also support the Phenology of Flowering group which aims to increase understanding of the influence of genotype on phenotype. 
<li> Also under development are iPlant Action Teams, or iPATs, which are 2-person teams consisting of one computational and one plant biology faculty member to solve a mini-project in plant computational biology.
<li> In summer and fall, 2009, iPC expects to consider additional Grand Challenge workshop proposals and collaborations. 
    
<p>
<A NAME="news"><a href="http://www.aspb.org/newsletter/marapr09/08wipb23.cfm"><b>The Doctor Is Out (of Academia): Why Career Cross-training Is Critical for PhDs</b></a>
<p> 
Read the <a href="http://www.aspb.org/newsletter/marapr09/08wipb23.cfm"><u>ASPB Women in Plant Biology newsletter article</u></a> written by the MASC Coordinator describing
how rapid increases in life sciences PhDs are competing for limited U.S. faculty jobs and why 'career cross-training' is more vital than ever. 
<p>    
<A NAME="rapa"><a href="http://revgenuk.jic.ac.uk"><b>Brassica rapa TILLING from RevGenUK</b></a>
Starting in April 2009, the BBSRC-funded RevGenUK service will be offering TILLING in Brassica rapa to detects mutations in genes.
RevGenUK has access to a large population of mutated Brassica rapa plants with thousands of defective genes, originally developed by
Lars Ostergaard at the John Innes Centre, an institute of the BBSRC. Specialised technology is used to find variation in a gene of interest
and seeds from the plant carrying that variant gene can be ordered by researchers for their own studies. 
<p>
<A NAME="tair">New clones/constructs at ABRC: Expression, Associomics, and Auxin-related</a>
<p><b>Associomics clones</b> - Donors: W. Frommer, J. Schroeder and S. Assman<br />
ORF clones of integral membrane proteins and proteins predicted to be involved
in signaling or protein modification from the Arabidopsis membrane Interactome 
Project <a href="http://www.associomics.org/">http://www.associomics.org/</a>. 
These clones lack a stop codon and can be used to create N and 
C-terminal fusions.</p>
<p><b>Auxin related constructs</b>- Donor: A. Theologis<br />
Promoter regions and 3' UTRs for the Arabidopsis ARF and Aux/IAA gene families.</p>
<p><b>Expression clones</b> - Donor: S. P. Dinesh-Kumar<br />
Full length TAP tagged ORF expression clones in the ligation independent 
Gateway<sup>TM</sup> compatible LIC6 vector utilized in development of an Arabidopsis 
protein chip. More information at <a href="http://plants.gersteinlab.org/">http://plants.gersteinlab.org/</a>.</p>
<p>These clones and constructs can be found using the <a href="/servlets/Search?action=new_search&type=dna">TAIR DNA search</a> and 
searching by AGI locus and/or donor last name. Associomics clones have 
names/stock numbers beginning CIW and expression clones from S. P. Dinesh Kumar 
have clone names/stock numbers beginning DKL.</p>

<A NAME="BAR"><a href="http://BAR.utoronto.ca"><b>News from Nick Provart at the Bio-Array Resources- Toronto</b></a>
<p>
<li> <a href="http://BAR.utoronto.ca"><u>BAR</u></a> has updated theri Arabidopsis Interactions Viewer (AIV) to include Matt Geisler's updated Interactome 2.0, which more than triples the number of predicted interactions in Arabidopsis to 70,944 by incorporating interaction data sets from many more organisms to compute Arabidopsis interologs. <br>
BAR also added 1,276 MAP Kinase/target interactions determined using protein microarrays by Sorina Popescu and colleagues in Dinesh-Kumar's lab for a total of 2,779 literature-supported interactions. The AIV images now link to SVG graphic format files for high quality visualizations.
<li> Two new tools, Cistome and Cistome Map, are available. <a href="http://www.bar.utoronto.ca/cistome/cgi-bin/BAR_Cistome.cgi"><u>Cistome</u></a> permits cis-element prediction using a variety of 3rd party packages, as well as with a new version of Promomer, Promomer2, which is an enumerative program that allows for degeneracy in potential cis-elements.
Additionally, known cis-elements from PLACE may be mapped onto promoter sets. <a href="http://www.bar.utoronto.ca/cistome/cgi-bin/BAR_Cistome_map.cgi"><u>Cistome Map</u></a> allows consensus sequences or PSSMs to be mapped onto diagrammatic representations of TAIR8 promoter sequences with defined transcriptional starts.
    
<p>
<A NAME="text"><a href="http://zope.bioinfo.cnio.es/plan2l/plan2l.html/"><b>PlAn2L- Plant Annotation to Literature</b></a>
<p>
 This is a web tool for integrated automatic text mining and literature-based bioentity relation extraction specially adapted to the needs of the model organism Arabidopsis thaliana.<br>
 You can search by gene name or keywords, to pull up literature references, which include relevancy scores in a number of topic areas including:
<li> Cell cycle
<li> Gene regulation
<li> Protein interaction
<li> Cellular location
<li> Flowering
<li> Leaf development
<li> Root development
<li> BioCreative Metaserver- a meta-server that integrates text annotations from various systems 
<p> The scores reflect the relevance for the given biological topic. Positive scores mean that the sentence is relevant for the topic, negative scores mean that it is not relevant.
These scores have been generated using a machine learning approach based on Support Vector Machines (see FAQ for more details).
<p>
<A NAME="icar2010"><a href="http://arabidopsis2010.psc.riken.jp/"><b>21st International Conference on Arabidopsis Research</b></a>
<p><a href="http://arabidopsis2010.psc.riken.jp/"><u>Bookmark the new conference URL</u></a> for the 21st ICAR in Yokohama, Japan (June 6-10, 2010).
<br>The conference organizing committee list has been posted.
<p>
<A NAME="tansley"><a href="http://www.newphytologist.org/tansleymedal.htm"><b>New Phytologists Tansley Medal for Young Scientists</b></a>
<p>  
<li> The <i>New Phytologist</i> Medal is awarded annually in recognition of an outstanding contribution to research in plant science by an individual in the early stages of their career.
<li> The winner will receive a prize of £2000 and the successful article will be published in New Phytologist.
<li> This is a global competition open to all plant scientists in the early stages of their career and includes both student and post-doctoral researchers with up to five years experience since gaining their PhD.
<p><IMG SRC="/images/redball.gif"> <b>Applications should be received by 15 June 2009.</b>
<p><IMG SRC="/images/redball.gif"> <b>Winners should be announced by December 2009.</b>
<li> <a href="http://www.newphytologist.org/tansleymedal.htm"><u>Click here for all details</u></a>
<p>        
<A NAME="iPlant3"><a href="http://iplantcollaborative.org/"><b>Summary of recent iPlant Grand Challenge Workshops- excerpted from Ruth Bastow's (GARNet/UK) compiled document</b></a><p>
<a href="/portals/masc/iPlant.pdf"><b><u>Download Summary PDF</u></a> including recent 'Grand Challenge' workshops, description of current proposals, workshop organizer information, and feedback by UK participants</b> <p>

<li> 2 Workshops held Sep. 30- Oct. 4: (1) Impacts of Climate Change (Ruth Grene) and (2) Mechanistic Basis of Plant Adaptation (David Salt)
<li> Nov. 7-10: Developing Common Models for Molecular Mechanisms (Katherine Denby)
<li> Nov. 19-23: Tree of Life (Michael Donoghue)
<li> Dec. 15-19: Computational Morphodynamics (Eric Mjolsness)
<p>
<b>Current Grand Challenge Proposals:</b>
<li> Cyberinfrastructure for an integrated botanical information network to investigate the ecological impacts of global climate change on plant biodiversity
<li> Computational Morphodynamics
<li> Assembling the Tree of Life for the Plant Sciences (iPTOL)
<li> Cyberinfrastructural Support for the Genetic and Ecophysiological Decipherment of Plant Phenological Control in Complex and Changing Environments
<li> Fundamental Understanding of Photosynthesis through Integration of Complex Molecular Data and Modeling Tools
<li> Cyberinfrastructural Support for Model-Building In Plant Stress Biology: Effects of Climate Change Factors on Crops Across and Within Species

<p>    
<A NAME="GSUK"><a href="http://www.sebiology.org/management/meetings/genetics.html"><b>UK Genetics Society Arabidopsis One-day Meeting</b></a><p> 
<li> May 23, 2009 at the University of Oxford
<li> Confirmed speakers: David Baulcombe (Cambridge), Kathryn Barton (Carnegie, Stanford), Ottoline Leyser (York), Heather Knight (Durham), Michael Lenhard (JIC, Norwich), Ueli Grossniklaus (Zurich)
Gwyneth Ingram (Edinburgh), Sabrina Sabatini (Rome), Jan Traas (RDP, Lyon)
<li> Abstracts accepted for short talks. See <a href="http://www.sebiology.org/management/meetings/genetics.html"><u>conference site for details.</u></a><p> 

<A NAME="ques"><a href="http://www.100plantsciencequestions.org.uk/index.php"><b>Submit your entries for the 'Most Important Questions in Plant Science'</b></a><p>
UK scientists are collecting entries for a list of the 100 most important questions facing plant science. They are interested in questions that can be addressed by the current generation of researchers,
and in all types of plant science, including model organisms, horticulture, agriculture, forestry, industry and beyond. Questions are credited, or you can choose to remain anonymous.
<br> Examples of submitted questions include:
<li> "How can global yields of stable food crops be substantially increased at the same time as non-renewable inputs and greenhouse gas emissions are substantially reduced?" 
<li> "What are the best ways to convince school and university students that plant science is exciting?"
<li> "Is bio-ethanol from plants actually a sustainable agricultural practice?"
<li> "How can we use our knowledge of plants to design efficient solar energy converters?" 
<p> <b> Questions can be <a href="http://www.100plantsciencequestions.org.uk/submitquestion.php"><u>submitted</u></a> until the end of March. Finalists will be selected in April and the list will be published.</b>

<p>
<A NAME="ipc1"><a href="http://www.iplantcollaborative.org/news-media/67-newsletter/143-iplant-collaborative-newsletter-09-01"><b>New iPlant Leaflet newsletter</b></a><p>
<li> Five of nine submitted Grand Challenge Workshops were held in Fall, 2008.
<li> Workshop topics included: the evolution and development of plants, resolving the tree of life, modeling the growth of plants, mechanisms for adaptation of plants to their environment, and associating plant genotypes with phenotypes.
<li> iPlant also sponsored a brainstorming workshop in January 2009 on the cyberinfrastructure required to address Grand Challenges in the plant sciences.
<li> Grand Challenge Team Proposals are due in early February
<li> The iPC is seeking nominations from the plant science and computational science communities for new members of its Board of Directors.
<p> <b> For complete details, <a href="http://www.iplantcollaborative.org/news-media/67-newsletter/143-iplant-collaborative-newsletter-09-01"><u>see the newsletter</u></a>
<p>
<A NAME="icar2"><b>Newly posted details for Arabidopsis Conference, 2009 in Edinburgh Scotland</b><p>
<li> <b>Keynote Speaker Announced:</b> David Baulcombe, Lasker Awardee for Basic Medical Research </b>
<li> <a href="http://arabidopsis2009.com/speakers.html"><u>Updated Speaker List</u></a>
<li> <a href="http://arabidopsis2009.com/attendees.html"><u>Current Registered Attendees</u></a>
<li> <a href="http://arabidopsis2009.com/information.html"><u>Funding and Other Useful Information</u></a>
<li> <a href="http://arabidopsis2009.com/sponsorship.html"><u>Conference Sponsors</u></a>
<li> <a href="http://arabidopsis2009.com/workshops.html"><u>Community workshop proposals solicited</u></a>
<li> <a href="http://arabidopsis2009.com/conferencetours.html"><u>Tour Information</u></a>
<p>
<li> <b>Early Registration Deadline: March 27, 2009</b>
<p>    
<A NAME="tube"><a href="http://chlorofilms.org/"><b>Plant Biology YouTube Video Contest by ChloroFilms.org</b></a>
<li>Make a video about plant biology and become famous and win prizes and money.
<li> <a href="http://www.youtube.com/watch?v=2b2goM0-i8A"><u>See the video</u></a>
<li> <a href="http://chlorofilms.org/"><u>Get more information</u></a>
<li> <b>Entries due: April 15.</b> Winners announced: May 15, 2009
<p>

<A NAME="NPGI"><a href="http://npgi-workshop.wetpaint.com/?mail=1128"><b>Summary of Recent US National Plant Genome Initiative Community Workshop</b></a>
<p>The purpose of the August, 2008 meeting was to bring a broad group of stakeholders together to discuss the outcomes of the first ten years of the US  
National Plant Genome Initiative (NPGI) as well as the challenges and opportunities ahead for the next five to ten years. The NPGI is managed by the Interagency Working Group on Plant  
Genomes (IWG-PG) which is currently in the process of developing a new five-year plan. <br> <a href="http://npgi-workshop.wetpaint.com/?mail=1128"><u>A wiki page was established</u></a> to provide a summary, meeting notes,
and permit feedback and discussion on the topics. Arabidopsis research was an important part of the discussion. <p>
Some excerpts from the workshop notes:
<li> Biological complexity far exceeds what can be learned from analyzing more DNA sequences. There needs to be a balance between genomics data and studies on fundamental biological processes.
<li> Translation from basic to applied biology is important and requires a new type of training (with funding to implement) for the next generation of scientists. The gap between basic and applied research needs to be bridged. One way this gap is reinforced through separation of graduate majors and possibly through narrowly-focused scientific meetings.
<li> It is critical to have testable models of complex processes to develop phenotype prediction based on genotypes in and across species.
<li> There needs to be more collaboration between genomicists and breeders to link basic and applied science.
<li> It is important to understand dynamic processes at the cellular and subcellular levels.

<p>    
<A NAME="amiRNA"><a href="http://2010.cshl.edu/"><b>TAIR/ABRC announce that 8,000 amiRNA clones are now available</b></a>
<p>
The amiRNA clones were developed by Greg Hannon and colleagues as part of a <a href="http://2010.cshl.edu/"> 2010 project.</a> Until now, the clones were distributed by
the company Open Systems. <p> These amiRNAs can specifically silence individual or duplicated genes or gene familiies in a dominant manner. Expression of the constructs can be inducible and limited to specific tissues. <b>ABRC has transformation-ready constructs
available that can be ordered via the TAIR website.</b>

<p>    
<A NAME="policy"><b>Draft policy statement for updating the Arabidopsis genome sequence- input requested </b></a> <p>
In consultation with members of the Arabidopsis community, Eva Huala (TAIR Director) has written a draft policy statement outlining proposed evidence
standards for updating the Arabidopsis genome sequence.  These evidence standards are intended to reflect a community consensus on the strength of evidence 
that should be required to correct sequencing errors and ensure the best possible quality and consistency for the Arabidopsis genome sequence.
<p>
Please have a look at the policy statement and add your comments and suggestions for revision at the bottom of the document. <a href="http://arabidopsis.org/doc/portals/genAnnotation/gene_structural_annotation/ref_genome_sequence/11413
"><u>You can access the document and add your comments here</u>.</a><p>
<b>Comments and suggestions will be incorporated into a final version of the policy document by the end of March 2009.</b>

<p>    
<A NAME="garnish"><b>New Issue of the GARNet Newsletter 'GARNish' posted </b></a> <br>
<a href="http://garnet.arabidopsis.org.uk/garnish_dec08.pdf"><u>Download Newsletter PDF</u></a><p>
Some highlights: <p>
<li> <a href="http://www.arabidopsisreactome.org"><u>The Arabidopsis Reactome</u></a> is a curated knowledgebase of biological pathways allowing computational analysis of published information and provides a platform to collate and analyze large datasets.<br> Pathways can be merged
with protein-protein interaction datasets and projected onto other plants with genome sequences via putative ortholog sequences. Expert scientists work with Reactome curators to outline, identify, and order reactions or pathways.
<li> <a href="http://www.thebiogrid.org"><u>BioGRID</u></a> documents protein-protein and genetic interactions for major eukaryotic
model organisms including Arabidopsis.<br> BioGRID can be searched using gene names, and most gene, protein and sequence identifiers. Results pages represent
each gene, detailing names, links to other gene resources (including TAIR), and Gene Ontology terms.
<p>
Genomic Arabidopsis Resource Network <a href="http://garnet.arabidopsis.org.uk/"><b>(GARNet)</b></a> was created to establish UK-based facilities for resources for genomics research on
Arabidopsis thaliana. GARNet also interacts with the international plant biology communities and acts as representatives of UK researchers.<p>

<p>
<A NAME="david"><b>Baulcombe receives Lasker Award for Basic Medical Research</b></a> <p>  
As highlighted in the recent issue of the <a href="http://garnet.arabidopsis.org.uk/garnish_dec08.pdf"><u>GARNish newsletter,</u></a> well-known
plant biologist Dr. David Baulcombe was honored this year for his ground-breaking work on small RNAs and their involvement in gene regulation. Dr. Baulcombe shared the
award with <i>C. elegans</i> researchers Victor Ambros and Gary Ruvkun. <p>
This award highlights decades of efforts by Baulcombe and his research team. Importantly, it also underscores the powerful impact that basic research on model organisms, including Arabidopsis, can have on fields such as medicine.
<p>You can read Dr. Baulcombe's Lasker Award Commentary entitled <a href="http://www.laskerfoundation.org/awards/pdf/2008_b_baulcombe.pdf"><u> Of maize and men, or peas and people: case histories to justify plants and other model systems.</u></a>

<p>    

<A NAME="plantgenome"><a href="http://meetings.cshl.edu/meetings/plants09.shtml"><b>Plant Genomes: Genes, Networks & Applications (March 4-7, 2009)</b></a> <p>  
The upcoming conference at Cold Spring Harbor Laboratory in Long Island, NY aims to review progress in genome analysis of the major plant groups, explore the implications in
current sequencing technologies for plant genomics, and discuss efforts in large-scale phenotyping.
<p>
Topics Include:
<li> Plant Genome and Arabidopsis 2010 Goals- Where are We? (workshop)
<li> Integrating 'omics/iPlant Models
<li> Genomes- Plants and Microbes
<li> Celebrating the Maize Genome
<li> Hybrids and Heterosis
<li> Innovative Phenotyping
<li> Evolution Inside/Outside the Lab <p>
<i> Abstracts are due January 5, 2009</i>

    <p>
    <A NAME="tab"><a href="http://www.aspb.org/publications/arabidopsis/"><b>The Arabidopsis Book- Free, Online</b></a>
    <p><a href="http://www.aspb.org/publications/arabidopsis/"><u>The Arabidopsis Book</u></a> (TAB) is a free, online resource founded by Elliot Meyerowitz and Chris Somerville in 2002. TAB is generously supported by the
<a href="http://www.aspb.org"><u>American Society of Plant Biologists</u></a>.
    <p>TAB is a collection of invited chapters (currently 60+) each 'reviewing in detail an important and interesting aspect of the plant <i>Arabidopsis thaliana</i>, with reference to what is known in other plants and in other kingdoms.'
    <p> 
    Some of the new chapters posted recently include:
    <li><a href="http://www.bioone.org/perlserv/?request=get-document&doi=10.1199/tab.0118">Web-Based Arabidopsis Functional and Structural Genomics Resources</a>
    <li><a href="http://www.bioone.org/perlserv/?request=get-document&doi=10.1199/tab.0117">Sugar Sensing and Signaling</a>
    <li><a href="http://www.bioone.org/perlserv/?request=get-document&doi=10.1199/tab.0115">The Powdery Mildew Disease of Arabidopsis: A Paradigm for the Interaction Between Plants and Biotrophic Fungi</a>
    <li><a href="http://www.bioone.org/perlserv/?request=get-document&doi=10.1199/tab.0116">The Secretory System of Arabidopsis (an update)</a>
    <li><a href="http://www.bioone.org/perlserv/?request=get-document&doi=10.1199/tab.0103">Gibberellin Metabolism, Perception, and Signaling Pathways in Arabidopsis</a>
    <li> Plus 6 other chapters posted since May, 2008!
    <br>Authors agree that their chapter can be kept up-to-date, either by themselves or by other others, allowing the resource to be dynamic and represent current knowledge. The current editorial board includes: Rob Last (chair),
    Caren Chang, Ian Graham, Ottoline Leyser, Rob McClung, and Cynthia Weinig.  
        
    <p>
    <A NAME="redei"><a href="http://en.wikipedia.org/wiki/George_R%C3%A9dei"><b>Arabidopsis Pioneer Passes</b></a>
    <p> George Rédei, professor emeritus at the University of Missouri and a pioneer of Arabidopsis research, died November 10, 2008 at the age of 87.
    <p>According to <a href="http://en.wikipedia.org/wiki/George_R%C3%A9dei"><u>wikipedia</u></a>, Dr. Rédei was born in Austria, lived in Hungary, and moved to the US in 1957.
    Notably, he brought Arabidopsis seeds with him to Missouri, becoming the first person in the US to conduct Arabidopsis research, a distinction that lasted about 20 years until the plant began to catch on as a research model.
    <p> Rédei recalled that in 1969, "the NSF [National Science Foundation] program director informed me I had to
    quit Arabidopsis if I wanted to continue to get support." Clearly he was a researcher far ahead of his time- currently there are about 18,000 Arabidopsis researchers spread across 6,800 labs.
    <p>
    <A NAME="tair"><a href="/about/survey.jsp"><b>TAIR Community Survey</b></a>
    <p>The TAIR Community survey polled TAIR users to find out how well the TAIR website is serving the needs of the community and also asked for preferences for future tools and data.
    <br>
        From a total of 387 responses, some results are:<br>
        <li> TAIR was listed as 'essential' for 83% or 'very useful' for 13% of respondents.
        <li> Respondents listed work on 138 diverse organisms in addition to Arabidopsis.
        <li> Correct gene structures are the most important data type at TAIR. Closely following are seed and DNA stock information, experimentally-verfied gene function data, mutant phenotypes and insertion/polymorphism data.
        <li> Respondents would most like to see these future data types: promoters/cis elements, orthologous genes from other species, complete ecotype sequences, regulatory and genetic interactions, protein modification data, and small RNAs.
        <li> Respondents had a clear preference for developing protein-related tools: protein interaction viewer, protein domain and modification viewer, protein alignment viewer.
        <li> The method chosen to most strongly encourage users to submit data to TAIR to share with the community was to integrate the submission into the publication process. Second was improved data submission forms.
        <li> Differences between US and non-US users: US respondents were generally more satisfied with TAIR performance and data correctness.
    <br><a href="/about/survey.jsp"><u>Complete survey results, including comments.</u></a>
        
    <p>
    <A NAME="salk"><b>Increasing number of available homozygous Arabidopsis mutants</b></a>
    <p>
        <a href="http://methylome.salk.edu/cgi-bin/homozygotes.cgi"><u>The SALK homozygote T-DNA project</u></a> (PI- Joe Ecker) is isolating and making available two T-DNA homozygous mutants for every gene in the
Arabidopsis genome. <br>

As of early November, 24,773 total homozygous lines representing 15,719 individual genes have been sent to ABRC for distribution (lines are shared with NASC as well.)
<br> Information available on the website includes: the complete list of targeted genes, groups of genes into gene family sets, and raw PCR genotyping data.
<p>The <a href="http://signal.salk.edu/cgi-bin/tdnaexpress"><u>T-DNA Express Browser</u></a> can be used to find locations of T-DNAs in your gene or sequence of interest.
<p>
    <A NAME="synbio"><b>Synthetic Biology Networks Initiated in the UK</b></a>
<p> <dt>
Two academic networks were recently initiated in the UK to advance synthetic biology:
<ol>
    <li><a href="http://www.sppi-net.org/index.php"><u>SPPI-NET</u></a>- 3 year funding for the Synthetic Plant Products for Industry Network began in July, 2008.
    Using synthetic biology approaches SPPI-NET has the goal of radically re-engineering the metabolism and physiology of plants for non-food industrial applications in the chemical and materials industries.
    Collaborations between plant scientists, chemists, process engineers and modelers will seek to develop methods for producing novel synthetic products from plant metabolism.
    <p>
        <a href="http://www.sppi-net.org/wkshop1.php"><u>SPPI-NETs first workshop</u></a> will be held January 13-14, 2009 at Durham University, UK.
    <li><a href="http://www.synbiostandards.co.uk/index.php"><u>SynBioStandards</u></a>- 3 year funding for the Synthetic Biology Standards Network began in June, 2008.
    This network is also an interdisciplinary effort to bring academic researchers together, in this case focusing on developing a common language and set of tools for synthetic biology research.
    The network is not focused specifically on plants although several network members come from the plant sciences. The website lists a number of <a href="http://www.synbiostandards.co.uk/events.php"><u>relevant
    workshops and conferences.</u></a>
</ol>

<p>
 <A NAME="2010"><a href="/portals/masc/projects.jsp"><b>2007 Fiscal Year 2010 Project Awards Listed</b></a>
<p> <dt>
The 12 projects, encompassing 16 awards, for Fiscal Year 2007 of the NSF-funded Arabidopsis 2010 project have <a href="/portals/masc/projects.jsp"><u>descriptions available.</u></a>
<p>
<A NAME="iPlant2"><b>(1) iPlant Collaborative Grand Challenge Workshops and (2) Message from iPC Board</b></a>
<p>
The first two Grand Challenge Workshops for the recently-funded <a href="http://iplantcollaborative.org/home">iPlant Collaborative (iPC)</a> were held recently and three more are scheduled in the next few months:
<ol>
<li><a href="http://iplantcollaborative.org/component/content/article/49-public/113-grand-challenge-workshops-in-2008"><u>Mechanistic Basis of Plant Adaptation</u></a>- David Salt, lead organizer
<li><a href="http://iplantcollaborative.org/component/content/article/49-public/113-grand-challenge-workshops-in-2008"><u>Impacts of Climate Change on Plant Productivity World-Wide: Prediction of Phenotype
from Genotype, Data Integration for Analysis, and Prediction Across Process Scales </u></a>- Ruth Grene, lead organizer
</ol>
<a href="http://iplantcollaborative.org/home/130-coming-of-age-of-the-iplant-collaborative-a-perspective"><u>Message to the community from the iPlant Board of Directors</u>:</a>
The iPlant Board of Directors (BoD) consists of volunteers with expertise relevant to iPlant projects. The BoD serves as a liaison between the community and the iPlant project. A major role is to advise the
project team on major resource allocation issues, including review of proposals for Grand Challenge Workshops and Grand Challenge Projects.
<br>
In this <a href="http://iplantcollaborative.org/home/130-coming-of-age-of-the-iplant-collaborative-a-perspective"><u>message to the community,</u></a> the BoD offers its perspective on the iPlant effort
including defining what iPlant cyberinfrastructure is and how the the project is driving the shift to community-driven collaborative science.
<p>
The BoD has also recommended that the iPC's core project team begin working on two 'pre-projects':
<ol>
    <li><a href="http://iplantcollaborative.org/component/content/article/49-public/113-grand-challenge-workshops-in-2008"><u>Assembling the tree of life to enable the plant sciences (iPTOL): A proposal for
an iPlant Grand Challenge Workshop</u></a>- Michael Donoghue, lead organizer
<li> <a href="http://iplantcollaborative.org/component/content/article/49-public/113-grand-challenge-workshops-in-2008"><u>Computational Morphodynamics of Plants</u></a>- Eric Mjolsness, lead organizer
</ol>
</li>
<p>
<A NAME="mascp"><a href="http://dx.doi.org/10.1021%2Fpr800480u"><b>Plant Proteomics Editorial</b></a>
<dt>
<a href="/portals/masc/Subcommittees.jsp"><u>MASC proteomics subcommittee</u></A> members recently published an <a href="http://dx.doi.org/10.1021%2Fpr800480u"><u>editorial</U></a> in the Journal of Proteome Research describing new advances in proteomics for
Arabidopsis and other plants <a href="/portals/masc/masc_docs/MASCP_editorial.pdf">[PDF}</a>.
<p> The report describes major plant proteomics resources including:

<li> <a href="http://fgcz-atproteome.unizh.ch/index.php"><u>AtProteome</u></a> Arabidopsis total proteome database
<li> <a href="http://promex.mpimp-golm.mpg.de/home.shtml"><u>ProMEX</u></a> MS/MS searchable spectral library
<li> <a href="http://www.plantenergy.uwa.edu.au/suba2/"><u>SUBA</u></a> Subcellular proteomic and GFP localization
<li> <a href="http://ppdb.tc.cornell.edu/"><u>PPDB</u></a> General plant and plastid proteomic database <IMG SRC="/images/redball.gif"><a href="/portals/masc/PPDB2008.pdf"><u> Recent PPDB publication</u></a>
<li> <a href="http://www.araperox.uni-goettingen.de/"><u>ARAPEROX</u></a> Peroxisome protein database
<li> <a href="http://www.gartenbau.uni-hannover.de/genetik/AMPP"><u>AMPP</u></a> Mitochondrial proteome database
<li> <a href="http://www.ampdb.bcs.uwa.edu.au/"><u>AMPDB</u></a> Arabidopsis mitochondrial protein database
<li> <a href="http://www.seed-proteome.com/"><u>Seed-Proteome</u></a> Total proteome studies from seed
<li> <a href="http://phosphat.mpimp-golm.mpg.de/"><u>PhosPhAt</u></a> Arabidopsis protein phosphorylation database

<p>    
<A NAME="ABRC"><a href="http://www.biosci.ohio-state.edu/pcmb/Facilities/abrc/abrchome.htm"><b>The 2008 Arabidopsis Biological Resource Advisory Committee Meeting (Sep. 11-12, Ohio)</b></A>
<dt>
The <a href="https://abrc.osu.edu/advisory-committee"><u>ABRC Advisory Committee</u></a> consists of current and former members of the North American
Arabidopsis Steering Committee, <a href="/portals/masc/countries/NAASC_Info.jsp"><u>NAASC</u></a> and Sean May, Director of the <a href="http://arabidopsis.info/"><u>European Stock Centre</u></a>,
the sister stock center located in the UK. 
<p>
A few key updates from the meeting:
<p>
<IMG SRC="/images/redball.gif"> Randy Scholl, Director of ABRC since its inception in Sept. 1991, announced plans to retire. There will be a phased
transfer of Directorship to Professor Erich Grotewold, the recently appointed Associate Director of ABRC. The transition will occur over the next 2-3 years to ensure uninterrupted
leadership and operations. Prof. Grotewold will be assisted by several experienced ABRC staff members (Luz Rivero, Emma Knee, and Debbie Crist.) Randy's leadership of the ABRC for nearly
two decades has been vital to the success of the entire Arabidopsis community. Best wishes Randy!
<li>ABRC has recently received the first set of about 8,000 artificial-microRNA (amiRNA) entry/expression clones from an <a href="http://2010.cshl.edu/"><u>NSF-funded AT2010 project</u></a> which intends to target 22,000 Arabidopsis
genes. These amiRNAs can specifically silence individual or duplicated genes or gene familiies in a dominant manner. Expression of the constructs can be inducible and limited to specific tissues. ABRC will make transformation-ready constructs
available at their usual prices as soon as they are made available and processed. The first set is currently being processed and will be available from ABRC shortly. <A HREF="mailto:abrc@osu.edu">Questions? Contact ABRC</a>
<li>Since 2007 ABRC has been distributing the natural accession Arabidopsis lyrata, which was sequenced and donated by Detlef Weigel. The <a href="/servlets/TairObject?type=germplasm&id=3510598695"><u>ABRC stock number is CS22696.</u></a>
<li>Capsella rubella is another natural accesssion that has recently been distributed by ABRC. The <a href="/servlets/TairObject?id=3510598696&type=germplasm"><u>ABRC stock number is CS22697</u></a> and was also sequenced by D. Weigel.
</li>
<p>
<A NAME="EU2020"><a href="/portals/masc/masc_docs/masc_wk_rep.jsp"><b>EU 2020 Vision for Plant Science</b></A>
<dt>
The <a href="/portals/masc/2020_European_Vision.pdf"><u>report from a DFG and BBSRC-sponsored workshop</u></a> held this past June is now available. 
The workshop aimed to map a way forward for plant science in the next decade, by looking at the current major challenges facing biology and investigating how plants, particularly Arabidopsis, could provide solutions to these challenges.
<p>
<A name="survey08"> Summary of Survey Responses from the 2008 Arabidopsis Conference</a><p>
<IMG SRC="/images/redball.gif"> 332 of the roughly 800 attendees of the 2008 Arabidopsis conference in Montreal filled out a survey on the meeting. <a href="/portals/masc/ICAR_2008_SurveySummary.pdf"><u>Results Here (pdf file)</u></a>
</dt>
<p>
<A name="icars">The 2009 and 2010 Arabidopsis Conferences have their dates and locations set:<p>
<li> <a href="http://arabidopsis2009.com/"><u>2009: Edinburgh, Scotland, June 30 - July 4</u></a>
<li> <a href="http://www.pacifico.co.jp/english/"><u>2010: Yokohama, Japan, (expected) June 6 - 10</u></a>
<li> 2011: Expected to return to Madison, Wisconsin (USA)
<p>
<A NAME="crs"><a href="http://www.ciw.edu/somerville_keynote"><b>Podcast and Slides from Chris Somerville's Keynote Lecture from the Arabidopsis Conference</b></A>
</dt>
<dt>
The opening lecture from the 19th International Conference on Arabidopsis Research on 'Developing Cellulosic Biofeuels' is now available as an
<a href="http://www.ciw.edu/somerville_keynote"><u>audio file and is accompanied by a powerpoint file of slides.</u></a>
The conference organizers (NAASC) thank the <a href="https://www.ciw.edu/">Carnegie Institution For Science</a> at Stanford University for streaming the lecture.
<p>
<A NAME="US2020"><a href="/portals/masc/masc_docs/masc_wk_rep.jsp"><b>US 2020 Vision for Biology: The Role of Plants in Addressing Grand Challenges in Biology</b></A>
</dt>
<dt>
The <a href="/portals/masc/workshop2020.pdf"><u>report from an NSF-sponsored workshop</u></a> held this past January is now available. The workshop focused on the future directions for plant research, with special emphasis on the role of the
reference species Arabidopsis in uncovering fundamental biological principles that will enable us to face future challenges to our well-being and that of the global environment.
<p>
<IMG SRC="/images/redball.gif"> A workshop summary was published by Natasha Raikhel in the journal Molecular Plant: <a href="http://mplant.oxfordjournals.org/cgi/content/full/1/4/561">[Link to Free Full-text of Mol. Plant article]</a>
<i> Reference: Mol Plant 2008 1: 561-563; doi:10.1093/mp/ssn040</i>
<br> <IMG SRC="/images/redball.gif"> A second workshop sponsored by BBSRC (UK) and DFG (Germany) was held in early June and included primarily European plant biologists. The EU 2020 workshop report <a href="/portals/masc/2020_European_Vision.pdf"><u>is now available.</u><a> 
<p>
<A NAME="postICAR"><b>Results of the 19th International Conference on Arabidopsis Research</b></A>
</dt><img src="/i/19thICARlogo.jpg" width="150 px" height="80 px" alt="19thICAR" align=right vspace=3>
<dt>
The 19th ICAR concluded on July 27th in Montreal, Canada. This first meeting in Canada was a success; attendees remarked on the high caliber of scientific presentations by speakers at the conference, and the location
within the vibrant city of Montreal pleased many attendees. The 6 community-organized workshops were well-attended and included topics such as Plant Systems Biology, Phytohormone Signaling/Biosynthesis, Laser Microdissection,
Proteomics, Bioinformatic Resources for Arabidopsis, and Annotation at TAIR/AraCyc. Over 600 posters were presented in 3 poster sessions that included food and drinks and lots of scientific conversation.
<p>
815 people attended from 33 countries with the percentage breakdown as follows:
<LI> USA: approximately 40%
<LI> European Union: approximately 22%
<LI> Canada: approximately 18%
<LI> Asia: approximately 17%
<LI> Other (Australia/New Zealand, South America, Middle East, etc) : approximately 3%
<p>
<IMG SRC="/images/redball.gif"> <b> Conference Survey:</b> A survey to provide feedback on the conference is under development. Attendees will be notified of the online survey in the near future and will have the chance to
provide feedback on the location, session topics, workshops, and other aspects of the conference. Comments and suggestions received will help in planning future Arabidopsis conferences. 
    <p>        
<IMG SRC="/images/redball.gif"> <b>A Conference Highlight: Doing The Wave:</b> Session chair Jeff Dangl led the conference audience in performing <a href="http://en.wikipedia.org/wiki/Audience_wave"><u>The Wave</u></a> at the beginning of the 'Interactions with the Environment' plenary session. For those not familiar with this activity, it commonly occurs at baseball games in the US, as
well as other sporting events, and consists of people standing up and raising their arms over their heads, in a pattern that travels from one side of an area to the other, thus making a wave of bodies. Very fun...
<p>
<IMG SRC="/images/redball.gif"> <b>Arabidopsis on Television!</b> The French film production company, Le Miroir, is currently producing a documentary series on plants that will be aired in 2009 on the Franco-German Arte TV Channel.
One of the four plants they will highlight is Arabidopsis, for its use as a genetic model for biology of plants and other organisms. The company requested and was granted the privilege of filiming small portions
of the Arabidopsis conference (primarily the French scientist Olivier Voinnet who spoke in the Interactions with the Environment plenary session) for inclusion in the film.
The goal of including film footage of the Arabidopsis conference was to demonstrate the unique high-level of international collaboration and cutting-edge research in the Arabidopsis community.
<p> <img src="/i/19ICAR_t_shirt.jpg" width="175 px" height="175 px" alt="tshirt" align=left hspace=3>
<IMG SRC="/images/redball.gif"> <b>Conference programs, t-shirts, and bags</b> There are extra conference books, t-shirts, and tote bags (with conference logo) for sale for the cost of production plus shipping (quantities limited!). For more information, email the conference organizer (Joanna: jdfriesner@ucdavis.edu).
<br> A <a href="/news/abstracts.jsp"> digital version </a>of the conference program is available freely online.

</dt>
<dt>
<table border=0 cellpadding=10>
<tr>
<td>
<IMG SRC="/images/redball.gif"><A NAME="2008RPT"><a href="/portals/masc/masc_docs/masc_reports.jsp"><b> The 2008 MASC report is now available online</b></A>
<dt><a href="/portals/masc/masc_docs/masc_reports.jsp"><img src="/i/MASC_2008_report.jpg" width="175 px" height="227 px" alt="2008Report" align=left vspace=5></a>
</td>
</tr>
</table>
<p>
<A NAME="icar4"><a href="http://www.plantconferences.org/Arabidopsis2008/"><b>Update on the 19th Arabidopsis Conference</b></A> 
</dt>
<dt>
<IMG SRC="/images/redball.gif"><b> The Conference Abstract Book</b> is now available <a href="/news/abstracts.jsp"> online at TAIR</a> and abstracts are also available <a href="http://www.plantconferences.org/Arabidopsis2008/abstracts/">on the conference website.</a>
<p>The conference will open with a <a href="http://www.ciw.edu/somerville_keynote"><u>keynote lecture
by Chris Somerville on Developing Cellulosic Biofuels.</u></a> Dr. Somerville notes that the efficient production of biofuels by biologically-based routes will require innovation in three
main areas: production of feedstocks, conversion of feedstocks to sugars, and conversion of sugars to fuels. At present, the main feedstocks being used for fuel production are corn starch
and sugar from sugarcane. However, the demand for fuel vastly exceeds the amount that can be produced from these feedstocks so it is expected that gasoline and diesel replacements will
ultimately be derived from cellulosic biomass. <b>He sees that there are many opportunities to direct basic research on model organisms such as Arabidopsis directly toward outstanding problems
related to bioenergy production.</b> He feels that most importantly, because agricultural productivity is the key to making arable land available for any other purpose, research that is directed toward
improving our understanding of basic biological processes in higher plants should be viewed as fundamental to the development of biofuels and all other uses of higher plants. <b>He concludes that current
trends in federal funding for research that lead away from basic research on Arabidopsis are ill-conceived.</b>
<p>
Following the conference, all abstracts will be entered into the searchable TAIR database.
</p>
<dt>
<A NAME="text"><a href="http://www.textpresso.org/arabidopsis"><b>Textpresso scientific literature text mining tool for Arabidopsis</b></A> 
</dt>
<dt>
Textpresso is a text-mining system for scientific literature. Its two major elements are (1) access to full text, so that
entire articles can be searched, and (2) introduction of categories of biological concepts and classes that relate two objects (e.g., association, regulation, etc.) or describe one (e.g., biological process, etc). 
A search engine enables the user to search for one or a combination of these categories and/or keywords within an entire literature. The system was initially developed as part of Wormbase for <i>C. elegans</i> but
<b>more recently has been extended to additional organisms including Arabidopsis, which now has its own site</b> <a href="http://www.textpresso.org/arabidopsis">(www.textpresso.org/arabidopsis).</a> 
<br>
TAIR was heavily involved in developing the Arabidopsis Textpresso system; most of the Arabidopsis scientific literature comes from TAIR which sent around 15,000 in-house articles. In addition, TAIR provided the
Arabidopsis vocabularies and categories. <b>Currently, Textpresso for Arabidopsis contains information on these data types (data counts in parentheses): abstract (25,877), body (15,276), title (26,834), totaling  67,987 entries.</b>
<p>
The system allows users to perform targeted searches of Arabidopsis literature, for example, using gene names, GO terms, or  a combination of search terms. Up to 4 categories can be specified using pull-down menus and advanced search
options are available, such as limiting and sorting by year, author, search type (Boolean or integer), and context of search scope (by sentence or document). The results page lists literature citations containing the search query specified
and the entire set can be downloaded into Endnote, or displayed for printing or in xml format. Although the system does not provide the full text of articles it does provide abstracts, and perhaps most useful, displays several sentences
from each article that contain the search term(s). This quickly reveals the context of search terms which can help users determine the usefulness of the reference. The user can designate whether search terms are highlighted, and other
links on the results page include: reference in Endnote, reference in xml, online text (links to article or to reference), related articles (searches Pubmed), and Pubmed citation. Gene names or other entities mentioned only in the
supplementary materials will not be retrieved because these documents are not currently included in the set of documents indexed and searched by Textpresso. <i>Reference:</i><a href="http://biology.plosjournals.org/perlserv/?request=get-document&doi=10.1371/journal.pbio.0020309">
Textpresso: An Ontology-Based Information Retrieval and Extraction System for Biological Literature; Müller HM, Kenny EE, Sternberg PW (2004) PLoS Biol 2(11): e309</a>    
</p>    

<dt>
<A NAME="ipc"><a href="http://iplantcollaborative.org/home"><b>Kickoff meeting for the iPlant Collaborative (iPC)</b></A> Cold Spring Harbor Laboratory (New York), April 7-9, 2008
</dt>
<dt>
The new <a href="http://iplantcollaborative.org/home">iPlant Collaborative </a> held its ‘kickoff’ conference at CSHL, a member institution of the iPC.
Over 200 participants attended with about 100 additional participants joining via direct, live participation webcast.
<br><b>Recordings from the meeting will be available to the public at the iPC website starting April 25. </b>
<p>The purpose of the conference, entitled ‘Bringing Plant and Computing Scientists Together to Solve Plant Biology’s Grand Challenges,’ was to both explain the project and actively engage plant biologists and computational
experts in discussions to begin identifying compelling and tractable Grand Challenge (GC) questions, and how the iPC, partnered with the community, might address them. The goal is to develop a cyberinfrastructure collaborative
for the plant sciences that will enable new conceptual advances through integrative, computational thinking.  This will be accomplished by bringing together plant biologists, computer and information scientists and engineers,
among other experts, to address GCs in the plant sciences that are proposed <b>by</b> the plant science community.
<p>
The conference started with an overview on cyberinfrastructure (CI) projects by Francine Berman (UCSD Supercomputer Center Director). According to Dr. Berman, good CI is ‘invisible’ to users, science-driven, integrates well,
has ‘planned evolution’, and focuses on the user from the beginning to maximize effectiveness and usefulness. Rich Jorgensen (iPC Director, University of Arizona) next described some basic aspects of the project, including that
rather than supporting the collection of new data, existing data will be used to develop and pursue GC questions developed by the community. To identify GCs the iPC will facilitate small focused workshops for self-assembled groups
whose workshop proposal submissions are approved, and also for specific topics in plant biology, with invited participants selected to address those areas. In parallel, self-forming GC teams with sufficiently clear vision, defined
data sets, and diverse team member roles, can directly submit a GC proposal, bypassing the GC workshop stage. <i><a href="http://iplantcollaborative.org/grand-challenge-process">Read more about the GC process and workshops proposals by clicking here.</a></i>
<p>Three breakout sessions were held to begin the discussion around GC questions in plant biology. Like the rest of the conference, external participants joined via webcast. <a href="http://wiki.iplantcollaborative.org/farm/mtg042008/images/c/c1/Summary.pdf">A summary of discussions on the three sessions topics can be found here.</a>
The breakout session topics were:
<ol>
<li> Primary metabolism, physiology, and organismic biology, from molecules to whole organisms <a href="http://wiki.iplantcollaborative.org/farm/mtg042008/images/b/b6/Report_1.doc">(link to summary word document)</a>
<li> Evolution and development of form and function, from molecular, cellular and developmental biology to biodiversity, comparative biology, systematics and phylogenetics <a href="http://wiki.iplantcollaborative.org/farm/mtg042008/images/a/af/Report_2.ppt">(link to summary powerpoint file)</a>
<li> Biotic and abiotic interactions, from biochemistry and cell biology to ecosystems <a href="http://wiki.iplantcollaborative.org/farm/mtg042008/images/9/9e/Report_3.ppt"> (link to summary powerpoint file)</a>
</ol>
<img src="/i/star.jpg" width="22 px" height="19 px" alt="star" align=left> <b>Outreach:</b> I joined breakout session #2 (Biotic and abiotic interactions), and assisted the session leaders with the webcast. I also participated in the optional Education, Outreach, Training session held on the last day.
<p>Rob Last, Chair of the <a href="http://iplantcollaborative.org/about-ipc/board-of-directors"> iPC Board of Directors (BoD) </a> that oversees the project, descrubed the roles of the BoD which include acting as a ‘go-between’ for the scientific community
and the iPC, conducting reviews of submitted GC proposals, and ensuring that the broad community is engaged. Dr. Last announced that the BoD hopes to begin reviewing workshop proposals as early as June 1st of this year and anticipates two rounds of reviews annually.
The iPC expects to hold up to six workshops a year to facilitate proposal development. 
<p><a href="http://iplantcollaborative.org/about-ipc/education-outreach-and-training">Education, Outreach, and Training (EOT)</a> is an important component of all aspects of the iPC. A primary mission is to enable people of all levels from K-12, small colleges and universities, all the way up to large research institutions, to access the same datasets
and use the same tools, thereby increasing broad collaboration and advancing science worldwide. All projects supported by iPC are required to have EOT components and discussion at the conference included the possibility that EOT itself could make up the core of a proposed GC.
<p>A question that came up several times was whether the iPC could directly fund researchers in the US and/or abroad to participate in the project, for data collection or in some other capacity. It was reiterated that the grant does <b>not</b> allow funds to be used for data collection,
and that in general, funds will not be used for non-iPC personnel. The iPC team is funded to develop the cyberinfrastructure that successfully approved GC proposals require. International collaboration is encouraged but compensation is limited to expenses such as travel, food, and lodging.
Dr. Last did state that there was a mechanism for personnel in approved GC groups, particularly graduate students and postdocs, to be funded for short time periods on project components directly related to the GC, including interning at the iPC. In addition to GC proposal development, the presenters
described that in the project’s first year the BoD will consider proposals to develop ‘foundational tools’ which have obvious benefit to the plant biology community and potentially to one or more future GCs.
<b>For more information on the iPC, its goals, the Grand Challenge process, iPC personnel, etc., see the iPC website: <a href="http://iplantcollaborative.org/home">http://iplantcollaborative.org/home</a></b>

<dt>
<A NAME="rick"><a href="http://conferences.ucdavis.edu/charleyrick"><b>The 2nd biennial Charley Rick Symposium</b></A> UC Davis, March 13-14, 2008
</dt>
<dt> 
The Symposium, named in honor of the <a href="http://www.universityofcalifornia.edu/senate/inmemoriam/CharlesM.Rick.htm">late Charles Rick,</a> a UC Davis emeritus professor considered
to be the foremost authority on tomato genetics, focused this year on plant responses to biotic and abiotic stress. Here is a summary of a few of the ten invited
speakers who presented talks, many of whom work with Arabidopsis. 
<p>Paul Schulze-Lefert (Max Planck Institute in Cologne, Germany), the opening keynote speaker, described studies on receptor functions and defense responses of the plant
immune system to powdery mildew fungus. His dual experimental system employs single leaf nuclei of barley in conjunction with Arabidopsis mutants
to determine receptor/transcription factor interactions and their involvement in mounting an immune response. Interestingly, he described that mutations in human homologs of some of
these genes result in immune-related disorders such as Crohn’s disease. 
<p>
Mike Thomashow (Michigan State University, USA) spoke about studies on freezing tolerance in Arabidopsis which he hopes to translate into tomato, a freezing-intolerant species.  The CBF cold
response pathway includes genes that are rapidly cold-induced to enhance freezing tolerance, acting as ‘master switches.’ He described using the <a href="http://genomica.weizmann.ac.il/">Genomica computational analysis resource</a>
(free for academic use) to develop a module network by arranging expression patterns in an iterative way. He described comparative studies that identified CBF genes in other brassicas and even tomato has 3
CBF genes that respond to cold, although attempts to overexpress Arabidopsis CBF3 in tomato did not produce cold-tolerant plants suggesting the tomato CBF regulon works differently.
<p>
Two speakers discussed calcium, an important signaling molecule involved in numerous stress responses. Janet Braam (Rice University, USA) presented work on Arabidopsis Calmodulin Like (CML) genes which may be involved in
binding calcium in plant cells. Interestingly, the CML24 mutant has increased nitric oxide levels that give increased levels of FLC, explaining the mutant’s defect in the switch to flowering. However, the mutant still
appears to bind calcium normally. She is currently trying to determine how CML24 regulates nitric oxide levels and has a hypothetical model that CML24 might normally inhibit nitric oxide production in mitochondria. <br>
Julian Schroeder (UC San Diego, USA) discussed recent work on mutants defective in stomatal response to carbon dioxide in leaves. The gca2 mutant responds weakly to elevated CO2 and new data demonstrate that calcium-activation and abscisic
acid (ABA) regulation of certain anion channels are disrupted as well. He described their new ‘priming hypothesis’ whereby stomatal closing signals such as ABA prime stomatal-closing calcium responses. This is based on experiments where
a calcium spike didn’t close stomata unless cells were pre-exposed to ABA.

<dt>
<A NAME="iPlant"><a href="http://iplantcollaborative.org/home"><b>The iPlant Collaborative (iPC)</b></A>
</dt>
<dt> 
A new Plant Science Cyberinfrastructure Collaborative (PSCIC) program is being established due to a recently awarded $50 million/5 year grant from the NSF.  The goal is to develop a cyberinfrastructure collaborative for the plant sciences that
would enable new conceptual advances through integrative, computational thinking.  This will be accomplished via the “iPlant Collaborative” (iPC) which will bring together plant biologists, computer and information scientists and engineers, as
well as other experts, to address 'Grand Challenges' in the plant sciences. The iPC is centered at the University of Arizona (Director: Rich Jorgensen) with Cold Spring Harbor Laboratory, Arizona State University, Purdue University, and the University of North Carolina, Wilmington, as partners.
<p>
Importantly, the iPC intends to be fluid and dynamic and community-driven. The Grand Challenge questions in plant biology will be selected by the community through a series of workshops.
<p>
<IMG SRC="/images/redball.gif"><b> The ‘kickoff’ meeting</b> for the iPC will be <a href="http://meetings.cshl.edu/meetings/iplant08.shtml">April 7-9, 2008 at CSHL, New York.</a> This meeting is intended not only to bring together members of those teams already involved in iPC but to attract others interested in similar themes and goals.

<dt> <b> Key principles listed as guiding the development of the iPC: </b></dt> <UL TYPE=DISC>
<LI> To develop a cyberinfrastructure collaborative rather than purely a cyberinfrastructure
<LI> To enable multi-disciplinary teams to address grand challenges in plant science
<LI> To be an entity that is by, for and of the community
<LI> To train the next generation in computational thinking
<LI> To be able to reinvent itself as needs and technologies change
</UL> </dd>

Broader impacts of the iPC project are expected to extend beyond simply addressing grand challenge questions on a scientific level as the iPC will involve extensive community building and educational outreach. 
<p>
<p>
<dt>
<A NAME="PAG08"><a href="http://www.intl-pag.org/"><b>PAG XVI: The International Conference on the Status of Plant and Animal Genome Research</b></A> January 12-16, 2008 at the Town and Country Hotel in San Diego, CA</dt> 
 <br>
 The 16th PAG meeting was held again in San Diego, California. Included this year was a presentation of a new report that assessed the achievements and potential future directions of the National Plant Genome Initiative (NPGI), established in 1998 in the US as a coordinated national
plant genome project. A Committee of experts, chaired by Jeff Dangl (UNC- Chapel Hill) was convened to make the assessment and provide recommendations. The report concluded that overall the NPGI has been successful, and partnered with the NSF AT2010 program focusing on basic research in Arabidopsis,
has led to technologies and data production that form the basis of fundamental plant research. <p>
The Committee recommended that both the NPGI and AT2010 projects continue as a cooperative partnership and leverage the gains already realized. They further recommend broadening NPGI’s mission to include economically relevant traits in model and crop species, deeper research into plant diversity and adaptation,
and continued translation of knowledge to breeders and farmers.
<br><b>Some specific recommendations include:</b>
<ol>
<li> Expand genome sequencing 
<li> Develop tools and resources at a high resolution for a few, carefully chosen species, and at a ‘broader’ depth for additional species 
<li> Use systems-level approaches for plant modeling 
<li> Develop interoperable and evolvable computational tools
<li> Invest in comparative genomics and metagenomics to better understand plant environments
<li> Enable translation of basic plant genomics to the field, i.e. from model to crop species
<li> Improve training and recruitment of the best broadly-trained young scientists, including from outside of plant biology-related fields
<li> Promote outreach on plant genomics to educate the public on the value of such research
</ol>
<p>
The ‘Achievements of the National Plant Genome Initiative and New Horizons in Plant Biology’ Report in Brief is freely available <A HREF= http://dels.nas.edu/dels/rpt_briefs/plant_genome.pdf>”(click here to access)</a>
<br>
You can also read the entire report or purchase the pdf online.
<!-- Start NAP Book Display -->
<table style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: black 1px solid; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; BORDER-LEFT: black 1px solid; WIDTH: 158px; PADDING-TOP: 0px; BORDER-BOTTOM: black 1px solid; HEIGHT: 200px; line-height: 10px; background-color: #ffffff;" cellspacing="0" cellpadding="0" width="158" border="0" height="200">
<tbody>

<tr>
<td style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 129px; PADDING-TOP: 0px; HEIGHT: 38px;" valign="top" align="right" width="129" colspan="2" height="38">
<img style="VERTICAL-ALIGN: top; WIDTH: 129px; HEIGHT: 38px; border: none; margin: 0; padding: 0;" height="38" alt="" src="http://images.nap.edu/images/widgetdisplay_nap1.gif" width="129" height="38" alt="" border="0" align="top">
</td>
<td style="VERTICAL-ALIGN: top; WIDTH: 29px; BACKGROUND-COLOR: #990000; padding: 0; margin: 0;" valign="top" align="left" width="29" bgcolor="#990000" rowspan="4"><img height="200" alt="" src="http://images.nap.edu/images/widgetdisplay_nap2.gif" width="29" valign="top" style="VERTICAL-ALIGN: top; WIDTH: 29px; border: none; margin: 0; padding: 0;" />
</td>
</tr>

<tr>
<td valign="top" width="130" style="width: 130px; padding: 0; margin: 0; vertical-align: top; text-align: center; height: 50px;">
<div style="PADDING-RIGHT: 5px; PADDING-LEFT: 0px; PADDING-BOTTOM: 10px; WIDTH: 115px; PADDING-TOP: 2px; HEIGHT: 50px; VERTICAL-ALIGN: top; margin: 0; ">
<!-- insert book title -->
<a style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; FONT: 11/13px arial; COLOR: #990000; PADDING-TOP: 0px; text-decoration: underline;" href="http://www.nap.edu/catalog.php?record_id=12054&utm_source=Network&utm_medium=Widgetv2&utm_content=v2&utm_campaign=Widget" target="_blank">Achievements of the National Plant Genome Initiative and Ne ...</a></div></td>
</tr>

<tr>
<td align="middle" width="130"><!-- insert tinycov image --><img style="BORDER-RIGHT: #000 1px solid; BORDER-TOP: #000 1px solid; BORDER-LEFT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; padding: 0; margin: 0" alt="" src="http://images.nap.edu/images/cover.php?id=12054&type=tinycov" width="70" />
</td>
</tr>

<tr>
<td style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px" valign="top" align="middle"><span style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; FONT: 11px arial; PADDING-TOP: 0pxcolor:#000000;" >Read this FREE online!<br>
	<a style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; FONT: 9px arial; COLOR: #990000; PADDING-TOP: 0px; text-decoration: underline;" href="http://www.nap.edu/openbook.php?record_id=12054&utm_source=Network&utm_medium=Widgetv2&utm_content=v2&utm_campaign=Widget">Full Book</a> | <a style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; FONT: 9px arial; COLOR: #990000; PADDING-TOP: 0px; text-decoration: underline;" href="http://www.nap.edu/nap-cgi/execsumm.cgi?record_id=12054&utm_source=Network&utm_medium=Widgetv2&utm_content=v2&utm_campaign=Widget">PDF Summary</a> | <a style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; FONT: 9px arial; COLOR: #990000; PADDING-TOP: 0px; text-decoration: underline;" href="http://dels.nas.edu/dels/rpt_briefs/plant_genome.pdf?utm_source=Network&utm_medium=Widgetv2&utm_content=v2&utm_campaign=Widget">PDF Report Brief</a></span></td></tr>

</tbody></table>
	<!-- End NAP Book Display -->
<p>
<img src="/i/star.jpg" width="22 px" height="19 px" alt="star" align=left> <b>Outreach:</b> Through a poster presentation I shared information about the
MASC, efforts in Arabidopsis research, and the 19th ICAR taking place this July in Montreal, Canada. I also spoke with exhibitors to try and get additional support for the Arabidopsis conference.
<p>
<dt><A NAME="2020"><b>2020 Vision for Biology Workshop: The role of plants in addressing grand challenges: Arlington, Virginia (Jan. 3-4, 2008)</b></A></dt><br>
I joined 14 other US and 2 international members of the Arabidopsis community for an NSF-sponsored workshop to identify ‘Grand Challenges in Biology’ and the role of plants in general,
and Arabidopsis in particular, in addressing them. The goal of the workshop was to be forward-looking about the direction of Biology research in the next decade and to discuss where plant biology,
Arabidopsis, and model organisms fit into this larger vision.
<p>
Members of the UK and German Arabidopsis communities are planning to hold a joint discussion in June, 2008. In addition, MASC members are tentatively planning to hold further discussion on the
topic at the 19th International Conference on Arabidopsis Research in Montreal this July. At the July meeting recommendations from the planning workshops are expected to be presented as part
of the larger discussion by the international Arabidopsis community. The goal of these workshops and discussions is to develop ideas for the direction of future Arabidopsis research as well as
exchange information between international groups. Recommendations will be relayed to appropriate members of each country's funding agencies for consideration. 
<p>

<dt><A NAME="plantgems"><b>6th Annual PlantGEMs meeting: Tenerife, Canary Islands (Oct. 3-6, 2007)</b></A> <img src="/i/tenerife.jpg" width="175 px" height="110 px" alt="Tenerife" align=right hspace=5></dt><br>
The <a href="http://www.plant-gems.org/pages/home.php"> Plant Genomics European Meetings (PlantGEM)</a> bring together primarily European plant researchers focused on crops and model plants. Arabidopsis thaliana was well-represented with over half the invited talks involving Arabidopsis studies. In addition to basic research presentations there were sessions on Agricultural Sustainability, Health-related Plant Genomics, and Industries in Plant Genomics. There were also parallel events including workshops on Triticeae genomics and European Plant Genomics initiatives, and the 2nd Workshop of the International Steering Committee on Plant Genomics (ISCPG).  
<br>
The ISCPG workshop included presentations by international plant genomics consortia members (e.g. barley, soybean, sugarcane, brassica, solanaceae) followed by discussion on funding and collaboration opportunities. Arabidopsis thaliana, the plant species at the most advanced stage of research and resources, was presented by Philip Benfey (Duke University) and past MASC chair.
<p>
<img src="/i/star.jpg" width="22 px" height="19 px" alt="star" align=left><b>Outreach:</b> I prepared a presentation about the history, structure, and past, present and future goals of the MASC for Philip to present at the ISCPG workshop. <A HREF="/portals/masc//MASC_PlantGEMs2007.pdf">Click to download the MASC presentation in PDF format (82 KB).</a>
<br>A major part of current planning by the MASC involves holding workshops to discuss post-2010 Arabidopsis research. U.S. researchers expect to hold a workshop in January, 2008, followed by similar workshops in the UK and Germany. At the request of Philip Benfey I helped develop the funding proposal for the U.S. workshop and will help organize the event including participating as an observer. I plan to facilitate a larger discussion by the international community during the <a href="http://www.plantconferences.org/Arabidopsis2008/">Annual Arabidopsis Conference in Montreal, Canada (July 23-27, 2008.)</a> 
<p>
<dt> Notes from selected talks at PlantGEMs</dt> <UL TYPE=DISC>
<LI>Timothy Hall (European Commission) spoke of the <a href="http://cordis.europa.eu/fp7/home_en.html">Seventh Framework Programme (FP7)</a>, a new 7 year initiative whose 1.9 billion+ Euro budget will have about 40% for life sciences. The budget for FP7 is 40% greater than FP6 and includes significant funding for plant biology (30-50% of Life Sciences funding) and places new emphasis on International collaboration. The FP7 theme involving food, agriculture, and biotechnology is especially relevant to plant biologists and includes funding for new uses of plants such as for alternative energy sources, bioremediation, biopolymers, etc. A theme involving biotechnology will support genome sequencing, complex processes, systems biology, and other related topics.
<LI>Justin Borevitz (University of Chicago) described efforts by his lab and colleagues in developing a high resolution haplotype map for 384 wild A. thaliana genomes using oligo arrays for genome sequencing. The <a href="http://naturalvariation.org/hapmap">HapMap Project</a> will determine 250,000 SNPs, provide insight on natural variation, and examine flowering time across two seasonal and two geographic environments which span the native range of <i>A. thaliana.</i>  
<LI>Willi Gruissem (ETH Zurich) and colleagues want to use proteome data to improve genome annotation. The <a href=http://www.mop.uzh.ch/databases.html>Arabidopsis Peptide Atlas</a> database, expected to be available by the end of 2007, involves analysis of the entire Arabidopsis proteome and will include mass spectrometry data and other protein information. So far they have identified close to 16,000 Arabidopsis proteins. Willi says that the data can confirm new ORFs and that over 60 new genomic loci were identified this way.
<LI>Mark Stitt (MPIMP-Golm) discussed genomics analysis of Arabidopsis nutrient responses and stated that it is critical for experiments to be described adequately so that computers can extract important parts for comparison. He mentioned a web-based tool that will be available in several months for tracking experimental conditions. A currently available tool, <a href=http://mapman.mpimp-golm.mpg.de/pageman/>PageMan</a>, allows analysis of a series of gene expression datasets such as timecourses or treatments, including statistical analysis and visualization graphics. <LI>Ute Kramer (University of Heidelberg) gave an update on her work examining metal homeostasis in the metal hyperaccumulator Arabidopsis halleri, a relative of A. thaliana, and close relative of A. lyrata. An understanding of why A. halleri can tolerate 30 fold more zinc and 10 fold more cadmium than A. thaliana may be useful in bioremediation of contaminated soil. Ute discussed HMA4, which encodes a metal ATPase involved in metal efflux, found to be very highly expressed in A. halleri compared to A. thaliana.  She showed that HMA4 is needed by A. halleri for zinc and cadmium hypertolerance and zinc hyperaccumulation, and that its high expression appears to cause partitioning of zinc predominantly in the shoots in A. halleri (vs. roots of A. thaliana) <a href=http://www.plantphysiol.org/cgi/content/full/142/1/148> Reference: Plant Phys article, 2006.</a>
</UL> </dd>
</p>
<dt><A NAME="seeds"><b>Translational Seed Biology: From Model Systems To Crop Improvement: UC Davis, California (Sept. 17-20, 2007)</b></A></dt><br>
<img src="/i/SeedSymp.jpg" alt="Seeds" width="82 px" height="137 px" align=left hspace=5>This first annual international <a href="http://www.plantsciences.ucdavis.edu/seedsymposium2007">Plant Sciences Symposium</a> was held September 17-20, 2007 at the University of California Davis.
The symposium was designed to advance the growing knowledge of seed biology and its application in agriculture. The meeting organizers opened by stating that ‘seeds provide 75% of foods consumed by man’
and therefore research into basic and applied seed biology is critical to meet the growing global demand for food. Furthermore, it is imperative that discoveries can be adapted and translated to the marketplace.
<br><i>Photo: John Harada, UC Davis</i>

<p>The opening speaker, Rob Horsch from the Bill and Melinda Gates Foundation, spoke of that group’s participation in the recently initiated Alliance for a Green Revolution in Africa (AGRA) chaired by former UN Secretary General Kofi Annan. 
<a href="http://www.gatesfoundation.org/GlobalDevelopment/Agriculture/RelatedInfo/AfricanFarmers.htm">AGRA</a> is focused on developing seeds to attain the best yields in the diverse environments of
Africa and working to make sure they are delivered to farmers who need them most. <br>A number of talks described exciting advances in increasing seed yield and tolerance to stress, experiments started in Arabidopsis
and then moved into crops such as canola, soybean and corn. Other speakers addressed using seeds for ‘molecular farming’ and health: SemBioSys initiated Arabidopsis experiments to produce human growth hormone and insulin
and then moved to safflower for production. The company expects to begin human trials for plant-produced insulin in 2008. DuPont and Calgene have both engineered soybeans to produce omega 3-fatty acids alternatives
to fish oils and are engaged in bringing their products to market.
<p>
In one of the many ‘basic’ research talks, Roger Beachy (Danforth Center) described a ‘gene switching’ technology that will be of interest to many scientists, which is an alternative to hormone, heat-shock, or ethanol-based inducible systems.
The system uses the ecdysone receptor, a DNA binding domain, and a transcription factor activator driven by a seed-specific promoter. Upon addition of the ligand (methoxyfenozide) the receptor binds the target gene and induces expression.
He sees a big advantage to the system because the ligand is safe and can be bought ‘off-the-shelf’. This technology is available to the public for research use (see Koo et al (2004) <a href="http://www.blackwell-synergy.com/doi/abs/10.1046/j.1365-313X.2003.01869.x">
The Plant Journal 37:3, 439–448</a> and Padidam et al (2003) <a href="http://www.springerlink.com/content/q0k158jum64557j2/">Transgenic Research 12, 101-109)</a>.
<p>
The Symposium's banquet speaker was Jorge Mayer from Freiburg, Germany who spoke about <a href="http://www.goldenrice.org/"><i>Golden Rice</i></a>, developed to produce high levels of beta-carotene in a primary
food source to alleviate vitamin A deficiency-related diseases prevalent in developing countries. Golden Rice has met with resistance from those suspicious of genetically modified crops resulting in its inability to be distributed widely. The creators of the technology
have donated it for humanitarian use in developing countries, free of charge.
<br><i>Note:</i> The topic of the 2008 Symposium (Sept. 14-17) is "Biodiversity in Agriculture:
Domestication, Evolution and Sustainability."
</p>
<dt><A NAME="nasc"><b>Visit to NASC/CPIB: University of Nottingham, UK (Sept. 5-7, 2007)</b></A></dt><br>
I went to the Sutton Bonington campus of the University of Nottingham in England where I visited Sean May and colleagues
at the <a href="http://arabidopsis.info/">Nottingham Arabidopsis Stock Centre (NASC)</a>.
<br>
<img src="/i/suttonfields.jpg" width="136 px" height="102 px" alt="Sutton Fields House" align=left hspace=5>Sean booked me a room at a
beautiful old estate house (circa 1850) converted to a bed and breakfast, and the next morning I walked to NASC, the primary distribution site for Arabidopsis-related stocks to
European scientists. NASC and the Arabidopsis Biological Stock Center (ABRC) based in Ohio, USA, work in close collaboration to share resources so that researchers
worldwide have easy access to plant (and also DNA) stocks.
<img src="/i/nasc.jpg" width="132 px" height="98 px" alt="NASC" align=right hspace=5> NASC also provides quite a variety of computational resources
including the ever-expanding NASCArrays microarray datasets and the AtEnsembl genome browser which is chock-full of useful features such as
multiple annotations, EST and cDNA alignments, insertion lines (which you just click to order), protein alignments, BLAST searching, and the
newly added SNP data from 20 natural Arabidopsis accessions. NASC provides microarray services, and data are
eventually deposited into the publicly-accessible <a href="http://affymetrix.arabidopsis.info/narrays/experimentbrowse.pl">NASCArrays.</a> Sean gave me a tour of new NASC facilities and described how the microarray team has become so
efficient that they have passed on significant cost reductions to the community (current ATH1 arrays have been reduced to 350 GBP). 
<p>
<img src="/i/star.jpg" width="22 px" height="19 px" alt="star" align=left> <b>Outreach:</b> The next morning I spoke with Charlie Hodgman, director of the newly established <a href="http://www.cpib.info/">Centre for Plant Integrative Biology (CPIB)</a>.
The Centre employs a multi-faceted systems biology approach to model and study the Arabidopsis root, with future plans to develop the research into crop species.
I described the relevant efforts of the <a href="/portals/masc/Subcommittees.jsp#sysbio">MASC Systems Biology Subcommittee</a>,
and in fact, the Subcommittee Chair, Philip Benfey (Duke University), has been involved as an external advisor to CPIB during its development. 

<p>
CPIB plans to integrate their efforts with other international projects
such as <a href="http://www.agron-omics.eu/">AGRON-OMICS</a>, which investigates Arabidopsis leaf growth (Coordinated by Pierre Hlson, MASC member from Ghent University),and <a href="http://www.computableplant.org/">The Computable Plant Project</a>,
which studies Arabidopsis meristem development. The combined efforts of many partners is expected to lead to development of a generic computer model of a plant which will be used to advance crop and plant science.
In a truly interdisciplinary effort the Centre strives to bring together biologists,
computer scientists, engineers, mathematicians and others to both develop and test models of root elongation, cell division, and lateral root
formation. The first phase of the project has already begun: elucidating root elongation. Information on <a href="http://cpib.info/jobs.shtml">Jobs and Fellowships</a>
at CPIB is available at their website.
</p>

<dt><A NAME="garnet"><b>GARNet Annual Meeting: John Innes Centre, UK (Sept. 10-11, 2007)</b></A></dt><br>
<a href="http://garnet.arabidopsis.org.uk/">GARNet (Genomics Arabidopsis Research Network)</a>, founded in 2000, represents the UK Arabidopsis community on the MASC and the advisory board is
elected by the UK community. The annual GARNet meeting is fairly short (less than 2 days) and features presentations by researchers from the
UK and abroad as well as a poster session.<p>
<img src="/i/star.jpg" width="22 px" height="19 px" alt="star" align=left> <b>Outreach:</b> The GARNet Advisory Committee meeting involved initial planning of the 2009 International Conference
on Arabidopsis Research which will be organized primarily by GARNet, with my input and help also. I attended the Advisory Committee meeting to provide input based on my efforts with the last two meetings and
my current planning efforts for Montreal in 2008. We discussed various meeting formats and logistical issues and I passed along data I've accumulated about
conferences held in the past 5 years to aid GARNet in their planning.
<p>During the meeting, <b>Edinburgh, Scotland</b> was officially chosen as the conference location and the date is <b>June 30-July 4, 2009.</b>
In preparation for the 2009 conference I've set aside an exhibitor booth at the Montreal Arabidopsis conference (in 2008) and invited GARNet members to come advertise
and drum up excitement for the meeting in Scotland.
<p>
<img src="/i/garnet.jpg" width="75 px" height="71 px" alt="garnet" align=left hspace=5> <a href="http://garnet.arabidopsis.org.uk/garnet_meeting.htm">On to the GARNet meeting-</a>
there were a number of interesting talks many of which involve integrating modeling with
experimentation, including efforts to model auxin and the shoot apical meristem (Jan Traas, France), a ‘virtual root’, part of a new systems
biology thrust in the UK (Malcolm Bennett, UK), elucidating leaf growth (Pierre Hilson, Belgium), cell walls for bioenergy (Simon Turner and
Kerrie Farrar, UK), all the way to the entire ‘Virtual Plant’ (Rodrigo Gutierrez, Chile.) Another major session was dedicated to recent advances
in Arabidopsis-pathogen interactions, and there were talks about efforts to develop Brachypodium distachyon into the model for grasses and
bioenergy (Mike Bevan, UK), and to elucidate functions for the roughly 4,500 remaining Arabidopsis genes still labeled as being of ‘unknown function’
(Chris Town, US).
<p>
<img src="/i/star.jpg" width="22 px" height="19 px" alt="star" align=left> <b>Outreach:</b> Through a poster presentation I shared information about the
MASC, efforts in Arabidopsis research, the recent Arabidopsis meeting held in Beijing and plans for next year's meeting in Montreal.
I also described the emphasis on translational research in the <a href="/portals/masc/2007_MASC_Report.pdf">most recent MASC report.</a>
My take-home messages from the trip were: integration isn’t only for calculus (systems biology is here and,
with bioinformatics, is crucial to the future of biology), developing alternative energy sources is still in the early phases but must be pursued,
and the British love crisps and chips (or, chips and fries, as we know them in the US).
</p>

<center>
  Last modified on February 12, 2010
</center>
</div><!--end rightcolumn-->



<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

