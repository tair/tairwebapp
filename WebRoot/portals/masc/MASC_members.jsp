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
<jsp:param name="id" value="1151" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Members" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">MASC Members</span>
<dl>

<p>
<TABLE>

  <TR>
    <TH>MASC Leadership</TH>
    <TH>Home Institution </TH>
	<TH>Representing </TH> <TH>&nbsp;</TH>

  <TR>
    <TD><A href="mailto:sinozaki@rtc.riken.go.jp">Kazuo Shinozaki</A><BR>Chair </TD>
    <TD>RIKEN Plant Science Center</TD><TD>Japan</TD></TR>
  
<TR>
    <TD><A href="mailto:mestelle@mail.ucsd.edu">Mark Estelle</A><BR>Co-chair </TD>
    <TD>University of California, San Diego </TD>
    <TD>US/NAASC</TD></TR>

<TR>
    <TD><A href="mailto:i.lavagi@warwick.ac.uk">Irene Lavagi</A><BR> MASC Coordinator
	<TD>University of Warwick, UK</TD><TD>MASC/GARNet</TD></TR>
<TR>
<TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD></TR>

  <TR>
    <TH>MASC Country Representative</TH>
    <TH>Home Institution </TH>
    <TH>Representing </TH></TR>

  <TR>
    <TD><A href="mailto:altmann@ipk-gatersleben.de">Thomas Altmann </A></TD>
    <TD>IPK-Gatersleben </TD>
    <TD>Germany </TD></TR>
    
 <TR>
    <TD><A href="mailto:ruth@arabidopsis.info">Ruth Bastow </A></TD>
    <TD>University of Warwick</TD>
    <TD>UK/GARNet </TD></TR>

<TR>
    <TD><A href="mailto:Jim.Beynon@warwick.ac.uk">Jim Beynon</A></TD>
    <TD>Univeristy of Warwick</TD>
	<TD>UK</TD></TR>

<TR>
    <TD><A href="mailto:malcolm.campbell@utoronto.ca">Malcolm Campbell</A></TD>
    <TD>University of Toronto </TD>
    <TD>Canada </TD></TR>

<TR>
    <TD><A href="mailto:casal@ifeva.edu.ar">Jorge Casal</A></TD>
    <TD>IFEVA University of Buenos Aires</TD>
	<TD>Argentina</TD></TR>
<TR>
    <TD><A href="mailto:dannyc@ex.tau.ac.il">Danny Chamovitz</A></TD>
    <TD>Tel Aviv University</TD>
	<TD>Israel</TD></TR>
    
    <TR>
    <TD><A href="mailto:bcrosby@uwindsor.ca">Bill Crosby </A></TD>
    <TD>University of Windsor</TD>
    <TD>Canada </TD></TR>
   
    <TR>
    
    <TD><A href="mailto:Sacco.deVries@wur.nl">Sacco de Vries </A></TD>
    <TD>Wageningen University</TD>
    <TD>The Netherlands </TD></TR>
  
  
  <TR>
    <TD><A href="mailto:maria.eriksson@plantphys.umu.se">Maria Eriksson 
    </A></TD>
    <TD>Umea Plant Science Centre, Umea </TD>
    <TD>Sweden </TD></TR>  
<TR>
    <TD><A href="mailto:jdfriesner@ucdavis.edu">Joanna Friesner 
    </A></TD>
    <TD>University of California, Davis </TD>
    <TD>US/NAASC </TD></TR>  
    
    
    
  <TR>
    <TD><A href="mailto:wgruissem@ethz.ch">Wilhelm Gruissem 
    </A></TD>
    <TD>ETH Zurich </TD>
    <TD>Switzerland </TD></TR>
    
    
  <TR>
    <TD><A href="mailto:klaus.harter@zmbp.uni-tuebingen.de">Klaus Harter 
    </A></TD>
    <TD>University of Tuebingen </TD>
    <TD>Germany </TD></TR>
  
  <TD><A href="mailto:marie-theres.hauser@boku.ac.at">Marie-Theres Hauser </A></TD>
    <TD>University of Natural Resources & Applied Life Sciences, Vienna</TD>
    <TD>Austria</TD></TR>
    
    
    <TD><A href="mailto:yrjo.helariutta@helsinki.fi">Ykä Helariutta </A></TD>
    <TD>University of Helsinki</TD>
    <TD>Finland</TD></TR>

<TR>  
  <TD><A href="mailto:pierre.hilson@psb.UGent.be">Pierre Hilson </A></TD>
    <TD>Ghent University </TD>
    <TD>Belgium </TD></TR>
    
     <TR>
    <TD><A href="mailto:hirt@evry.inra.fr">Heribert Hirt </A></D>
    <TD>INRA / CNRS - URGV, France</TD>
    <TD>France </TD></TR>
  
 
 <TR>
    <TD><A href="mailto:sean@arabidopsis.info">Sean May</a></TD>
    <TD>University of Nottingham</TD>
    <TD>UK/NASC</TD></TR> <TR>

<TR>
    <TD><A href="mailto:ortrun.mittelsten_scheid@gmi.oeaw.ac.at">Ortrun Mittelsten- Scheid </A></TD>
    <TD>GMI- Molecular Plant Biology, Austrian Academy of Sciences, Vienna</TD>
    <TD>Austria </TD></TR>        

<TR>
    <TD><A href="mailto:jpazares@cnb.csic.es">Javier Paz-Ares </A></TD>
    <TD>Centro National de Biotecnologia, Madrid </TD>
    <TD>Spain </TD></TR>


<TR>
    <TD><A href="mailto:spoethig@sas.upenn.edu">Scott Poethig</A></TD>
    <TD>University of Pennsylvania, Philadelphia</TD>
    <TD>US/NAASC</TD></TR>


<TR>
    <TD><A href="mailto:barry.pogson@anu.edu.au">Barry Pogson</A></TD>
    <TD>Australian National University, Canberra</TD>
    <TD>Australia</TD></TR>
    
    
<TR>
    <TD><A href="mailto:b.scheres@bio.uu.nl">Ben Scheres</A></TD>
    <TD>University of Utrecht</TD>
    <TD>The Netherlands</TD></TR>
    


 <TR>
    <TD><A href="mailto:giovanna.serino@uniroma1.it">Giovanna Serino</A></TD>
    <TD>University of Rome </TD>
    <TD>Italy </TD></TR>
 
<TR>
    <TD><A href="mailto:charles.spillane@nuigalway.ie">Charles Spillane</A></T>
    <TD>National University of Ireland, Galway</TD>
    <TD>Ireland</TD></TR>
 
  <TR>
    <TD><A href="mailto:wcyang@genetics.ac.cn">Weicai Yang</A></T>
    <TD>Chinese Academy of Sciences, Beijing</TD>
    <TD>China</TD></TR>
    
 <TR>
    <TD><A href="mailto:viktor@natur.cuni.cz">Viktor Zarsky</A></T>
    <TD>Charles University and Academy of Sciences of the Czech Republic, Prague</TD>
    <TD>Czech Republic</TD></TR>
    
    
<TR>
<TD height="20">&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD></TR>

<TR>
    <TH>MASC Subcommittee Chairs</TH>
    <TH>Home Institution </TH>
    <TH>Subcommittee</TH></TR>

  <TR>
    <TD><A href="mailto:nicholas.provart@utoronto.ca">Nick Provart</A><BR>Chair</TD>
    <TD>University of Toronto, Canada</TD>
    <TD>Bioinformatics</TD></TR>
 
<TR>
    <TD><A href="mailto:ecker@salk.edu">Joe Ecker </A><BR>Chair</TD>
    <TD>The Salk Institute; San Diego, CA, USA</TD>
    <TD>cDNAs/Clone-based functional protomics (ORFeomics)</TD></TR>

<TR>
    <TD><A href="mailto:ksaito@faculty.chiba-u.jp">Kazuki Saito</A><BR>Chair</TD>
    <TD>Ciba University/RIKEN Plant Science Center, Japan</TD>
    <TD>Metabolomics</TD></TR>

<TR>
    <TD><A href="mailto:bdilkes@purdue.edu">Brian Dilkes</A><BR>
      Co-Chair</TD>
    <TD>Purdue University; IN, USA</TD>
    <TD>Natural Variation/Comparative Genomics</TD></TR>

<TR>
    <TD><A href="mailto:piresjc@missouri.edu">Chris Pires</A><BR>Co-Chair</TD>
    <TD>University of Missouri-Columbia; MO, USA</TD>
    <TD>Natural Variation/Comparative Genomics</TD></TR>
    
<TR>
    <TD height="46"><A href="mailto:robert.furbank@csiro.au">Robert Furbank</A><BR>
      Co-chair</TD>
    <TD>CSIRO; Canberra, Australia</TD>
    <TD>Phenomics</TD></TR>

<TR>
    <TD><A href="mailto:u.schurr@fz-juelich.de">Ulrich Schurr</a><BR>Co-chair</TD>
    <TD>Forschungszentrum J&uuml;lich, J&uuml;lich, Germany</TD>
    <TD>Phenomics</TD></TR>

<TR>
    <TD><A href="mailto:wolfram.weckwerth@univie.ac.at">Wolfram Weckwerth</A><BR>Co-chair</TD>
    <TD>University of Vienna, Austria</TD>
    <TD>Proteomics</TD></TR>

<TR>
    <TD><A href="mailto:hmillar@cyllene.uwa.edu.au">Harvey Millar</A><BR>Co-chair</TD>
    <TD>University of Western Australia, Perth</TD>
    <TD>Proteomics</TD></TR>


<TR>
    <TD><A href="mailto:sacha.baginsky@ipw.biol.ethz.ch">Sacha Baginsky</A><BR>Co-chair</TD>
    <TD>Institute of Plant Sciences, Swiss Federal Institute of Technology; Zurich, Switzerland</TD>
    <TD>Proteomics</TD></TR>

<TR>
   <TD><A href="mailto:Kv35@cornell.edu">Klaas van Wijk</A><BR>Co-chair</TD>
    <TD>Cornell University; Ithaca, NY, USA</TD>
    <TD>Proteomics</TD></TR>
<TR>
    <TD><A href="mailto:rodrigo.gutierrez@gmail.com">Rodrigo Gutierrez</A><BR>Co-chair</TD>
    <TD>P. Universidad Catolica de Chile; Santiago, Chile</TD>
    <TD>Systems Biology</TD></TR>

<TR>
    <TD><A href="mailto:andrew.millar@ed.ac.uk">Andrew Millar</A><BR>Co-chair</TD>
    <TD>University of Edinburgh, UK</TD>
    <TD>Systems Biology</TD></TR>
 <TR>   
    <TH>Arabidopsis Resources</TH>
    <TH>Home Institution </TH>
    <TH>Representing</TH></TR>

<TR>
    <TD><A href="mailto:huala@acoma.stanford.edu">Eva Huala</A></TD>
    <TD>Carnegie Institution of Washington; Stanford, CA</TD>
    <TD>TAIR/US</TD></TR>

<TR>
    <TD><A href="mailto:sean@arabidopsis.info">Sean May</a></TD>
    <TD>University of Nottingham, Sutton Bonington Campus</TD>
    <TD>NASC/UK</TD></TR>

  <TR>
    <TD><A href="mailto:grotewold.1@osu.edu">Erich Grotewold</A></TD>
    <TD>Ohio State University; Columbus, OH</TD>
    <TD>ABRC/US</TD></TR>
  <TR>
    <TD>&nbsp;</TD>
    <TD>&nbsp;</TD>
    <TD>&nbsp;</TD>
  </TR>
  </TABLE>
</dl>
<p>

<center>
  Last modified on January 11, 2011
</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>





