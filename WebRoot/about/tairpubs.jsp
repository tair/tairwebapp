<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!String pageName = "TAIR - About TAIR - TAIR publications";
  String cssfile = "/css/page/pagelevels.css";%>

<%@ page errorPage="/jsp/common/gen_error.jsp"
	import="org.tair.tfc.*,org.tair.querytools.*,org.tair.utilities.*,java.util.*,java.net.*"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
	<jsp:param name="id" value="405" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
	<jsp:param name="sidebarName" value="Publications" />
</jsp:include>
<div id="rightcolumn">

	<span class="mainheader">TAIR Publications</span>

	<dl>
		<dd>
			Philippe Lamesch; Tanya Z. Berardini; Donghui Li; David Swarbreck;
			Christopher Wilks; Rajkumar Sasidharan; Robert Muller; Kate Dreher;
			Debbie L. Alexander; Margarita Garcia-Hernandez; Athikkattuvalasu S.
			Karthikeyan; Cynthia H. Lee; William D. Nelson; Larry Ploetz; Shanker
			Singh; April Wensel; Eva Huala (2011) The Arabidopsis Information
			Resource (TAIR): improved gene annotation and new tools. Nucleic
			Acids Research; doi: 10.1093/nar/gkr1090.
			<br />
			Download
			<a
				href="http://nar.oxfordjournals.org/content/early/2011/12/02/nar.gkr1090.full.pdf">[PDF]</a>
		</dd>

		<dd>
			Lamesch P, Dreher K, Swarbreck D, Sasidharan R, Reiser L, Huala E
			(2010) Using the Arabidopsis in-formation resource (TAIR) to find
			information about Arabidopsis genes. Curr Protoc Bioinformatics
			Chapter 1:Unit1.11.
			<br />
			View
			<a
				href="http://onlinelibrary.wiley.com/doi/10.1002/0471250953.bi0111s30/abstract">[Abstract]</a>
		</dd>
		<dd>
			David Swarbreck*, Christopher Wilks, Philippe Lamesch, Tanya Z.
			Berardini, Margarita Garcia-Hernandez, Hartmut Foerster, Donghui Li,
			Tom Meyer, Robert Muller, Larry Ploetz, Amie Radenbaugh, Shanker
			Singh, Vanessa Swing, Christophe Tissier, Peifen Zhang and Eva Huala
			(2008) The Arabidopsis Information Resource (TAIR): gene structure
			and function annotation. Nucleic Acids Research. 36:D1009-D1014.
			<br />
			Download
			<a href="/about/TAIR.pdf">[PDF]</a>
		</dd>

		<dd>
			Ilic K, Kellogg E, Jaiswal P, Zapata F, Stevens P, Vincent L, Pujar
			A, Avraham S, Reiser L, McCouch SR, Sachs S, Schaeffer M, Rhee SY,
			Ware D and Stein L. (2006) Plant Structure Ontology: A Unified
			Vocabulary for Flowering Plants. Plant Physiology. 143(2):587-99.
			<br />
			Download
			<a href="/about/plant_structure.pdf">[PDF]</a>
		</dd>

		<dd>
			Pujar A, Jaiswal P, Kellogg EA, Ilic K, Vincent L, Avraham S, Stevens
			P, Zapata F, Reiser R, Rhee SY, Sachs MM, Schaeffer M, Stein L, Ware
			D, and McCouch S. (2006) Whole Plant Growth Stage Ontology: History,
			Development and Application. Plant Physiology. 142(2):414-28.
			<br />
			Download
			<a href="/about/whole_plant.pdf">[PDF]</a>
		</dd>

		<dd>
			Rhee SY, Dickerson, J, and Xu, D (2006) Bioinformatics and its
			Applications in Plant Biology. Annual Review of Plant Biology. 57:
			335-360
			<br />
			Download
			<a href="/about/bioinformatics.pdf">[PDF]</a>
		</dd>

		<dd>
			Gene Ontology Consortium (2006) The Gene Ontology Project in 2006.
			Nucleic Acids Research. 34(Database issue):D322-6
			<br />
			Download
			<a href="/about/gene_ont.pdf">[PDF]</a>
		</dd>

		<dd>
			Yoo, D, Xu, I, Berardini, T, Rhee, S, Narayanasamy, V, Twigger, S
			(2006)
			<br>
			PubSearch and PubFetch: A Simple Management System for Semiautomated
			Retrieval and Annotation of Biological Information from the
			Literature in Current Protocols in Bioinformatics, &#169; John Wiley
			& Sons, Inc.
			<br />
			Download
			<a href="/about/dannyPub.pdf">[PDF]</a>
		</dd>

		<dd>
			Margarita Garcia-Hernandez and Leonore Reiser (2006)
			<br>
			Using Information From Public Arabidopsis Databases to Aid Research.
			in Methods in Molecular Biology, vol. 323: Arabidopsis Protocols,
			Second Edition, J. Salinas and J. J. Sanchez-Serrano &#169; Humana
			Press Inc., Totowa, NJ
			<br />
			Download
			<a href="/about/16_Hern_187_212.pdf">[PDF]</a>

		</dd>

		<dd>
			Jaiswal P, Avraham S, Ilic K, Kellogg EA, McCouch S, Pujar A, Reiser
			L, Rhee SY, Sachs MM, Schaeffer M, Stein L, Stevens P, Vincent L,
			Ware D, Zapata F. (2005) Plant Ontology (PO): A controlled vocabulary
			of plant structures and growth stages. Functional and Integrated
			Genomics. 6:388-397.
			<br />
			Download
			<a href="/about/plant_ont.pdf">[PDF]</a>
		</dd>

		<dd>
			Rhee SY and Crosby W. (2005) Biological Databases for Plant Research.
			Plant Physiology. 138(1):1-3.
			<br />
			Download
			<a href="/about/bio_databases.pdf">[PDF]</a>
		</dd>

		<dd>
			Rhee SY. (2005) Bioinformatics: Current Limitations and Insights for
			the Future. Plant Physiology. 138(2):569-70
			<br />
			Download
			<a href="/about/bioinfo.pdf">[PDF]</a>
		</dd>

		<dd>
			Rhee SY, Zhang P, and Foerster H, and Tissier C (2005) AraCyc:
			Overview of an Arabidopsis Metabolism Database and Its Applications
			for Plant Research. In Biotechnology in Agriculture and Forestry:
			Plant Metabolomics. K. Saito, R. Dixon and L. Willmitzer ed.,
			Springer. volume 57. pp. 141-153.
			<br />
			Download
			<a href="/about/AraCyc.pdf">[PDF]</a>
		</dd>

		<DD>
			Yan, T, Yoo, D, Berardini, T, Mueller, L, Weems, D, Weng, S, Cherry,
			JM, Rhee, SY(2005)
			<br>
			PatMatch: a program for finding patterns in peptide and nucleotide
			sequences
			<br>
			Download
			<a
				href="http://nar.oxfordjournals.org/cgi/reprint/33/suppl_2/W262?ijkey=ZEc5zYlbTzvtJH1&keytype=ref">[PDF]</a>
		</DD>


		<dd>
			Reiser, Leonore and Rhee, Seung Yon (2005)
			<br />
			Using The
			<i>Arabidopsis </i>Information Resource (TAIR) to Find Information
			About
			<i>Arabidopsis</i>Genes.
			<br />
			in Current Protocols in Bioinformatics, Andreas D. Baxevanis
			et.al.eds., John Wiley and Sons, NY.NY.
			<br />
			Available in hard copy, PDF, HTML
			<a
				href="http://www.mrw.interscience.wiley.com/cp/cpbi/cpbi_contents_fs.html">Requires
				subscription.</a>
		</dd>


		<DD>
			Schlueter, SD, Wilkerson, MD, Huala, E, Rhee, SY, and Brendel, V
			(2005)
			<br>
			Community-based gene structure annotation. TRENDS in Plant Science
			10(1):9-14
			<br>
			Download
			<a href="/about/Schlueteretal.pdf">[PDF]</a>
		</DD>


		<DD>
			Zhang, P, Foerster, H, Tissier, C, Mueller, L, Paley, S., Karp, P,
			Rhee, SY(2005)
			<br>
			MetaCyc and AraCyc. Metabolic Pathway Databases for Plant Research.
			Plant Physiology 2005 138: 27-37
			<br>
			Download
			<a
				href="http://www.plantphysiol.org/cgi/content/full/138/1/27?ijkey=xIp5CP9cxGApU&keytype=ref&siteid=plant">[PDF]</a>
		</DD>


		<DD>
			Bard, JL and Rhee, SY (2004)
			<br>
			Ontologies in biology: design, applicatioins and future challenges.
			Nature Review Genetics 5(3):213-22.
			<br>
			Download
			<a href="/about/nrg1295.pdf">[PDF]</a>
		</DD>


		<DD>
			Berardini, TZ, Mundodi, S, Reiser, R, Huala, E, Garcia-Hernandez, M,
			Zhang, P, Mueller, LM, Yoon, J, Doyle, A, Lander, G, Moseyko, N, Yoo,
			D, Xu, I, Zoeckler, B, Montoya, M, Miller, N, Weems, D, and Rhee, SY
			(2004)
			<br>
			Functional annotation of the Arabidopsis genome using controlled
			vocabularies. Plant Physiol. 135(2):1-11.
			<br>
			Download
			<a href="/about/functional.pdf">[PDF]</a>
		</DD>


		<DD>
			Dolan, EL, Soots, BE, Lemaux, PG, Rhee, SY, and Reiser, L (2004)
			<br>
			Strategies to Avoid Reinventing the Pre-college Education and
			Outreach Wheel. Genetics. 166:1601-1609.
			<br>
			Download
			<a href="/about/1601.pdf">[PDF]</a>
		</DD>


		<DD>
			Harris MA, Clark J, Ireland A, Lomax J, Ashburner M, Foulger R,
			Eilbeck K, Lewis S, Marshall B, Mungall C, Richter J, Rubin GM, Blake
			JA, Bult C, Dolan M, Drabkin H, Eppig JT, Hill DP, Ni L, Ringwald M,
			Balakrishnan R, Cherry JM, Christie KR, Costanzo MC, Dwight SS, Engel
			S, Fisk DG, Hirschman JE, Hong EL, Nash RS, Sethuraman A, Theesfeld
			CL, Botstein D, Dolinski K, Feierbach B, Berardini T, Mundodi S, Rhee
			SY, Apweiler R, Barrell D, Camon E, Dimmer E, Lee V, Chisholm R,
			Gaudet P, Kibbe W, Kishore R, Schwarz EM, Sternberg P, Gwinn M,
			Hannick L, Wortman J, Berriman M, Wood V, de la Cruz N, Tonellato P,
			Jaiswal P, Seigfried T, White R; Gene Ontology Consortium. (2004)
			<br>
			The Gene Ontology (GO) database and informatics resource. Nucleic
			Acids Res. 32 Database issue:D258-61.
			<br>
			Download
			<a href="/about/D258.pdf">[PDF]</a>
		</DD>


		<DD>
			Krieger, CJ, Zhang, P, Mueller, L, Wang, A, Paley, S, Arnaud, M,
			Pick, J, Rhee, SY, and Karp, P. (2004)
			<br>
			MetaCyc: Recent enhancements to a database of metabolic pathways and
			enzymes in microorganisms and plants. Nucleic Acids Research. 32
			Database issue:D438-42.
			<br>
			Download
			<a href="/about/D438.pdf">[PDF]</a>
		</DD>


		<DD>
			Rhee, SY (2004)
			<br>
			Carpe Diem. Retooling the Publish or Perish Model into the Share and
			Survive Model. Plant Physiol. 134(2):543-7
			<br>
			Download
			<a href="/about/543.pdf">[PDF]</a>
		</DD>



		<DD>
			Thimm, O, Bl&#228;sing, YG, Nagel, A, Meyer, S, Kruger, P, Selbig, J,
			M&#252;ller, L, Rhee, SY, and Stitt, M (2004)
			<br>
			MapMan: A User-Driven Tool to Display Genomics Data Sets onto
			Diagrams of Metabolic Pathways and other Biological Processes. The
			Plant Journal. 37(6):914-39.
			<br>
			Download
			<a href="/about/mapman.pdf">[PDF]</a>
		</DD>




		<DD>
			<a
				href="/servlets/TairObject?type=publication&id=501712213">Tian,
				GW, Mohanty, A, Chary, SN, Li, S, Paap, B, Drakakis, G, Kopec, C,
				Li, J, Ehrhardt, E, Jackson, D, Rhee, SY, Raikhel, N, and Citovsky,
				V. (2004)</a>
			<br>
			High-Throughput Fluorescent Tagging of Full-Length Arabidopsis Gene
			Products in Planta Plant Physiol. 135(1):25-38.
			<br>
			Download
			<a href="/about/highThroughput.pdf">[PDF]</a>
		</DD>


		<DD>
			Weems, D, Miller, N, Garcia-Hernandez, M, Huala, E, and Rhee, SY
			(2004)
			<br>
			Design, implementation, and maintenance of a model organism database
			for Arabidopsis thaliana. Comparative and Functional Genomics.
			5(4):362-369.
			<br>
		</DD>



		<DD>

			<a
				href="http://link.springer.de/link/service/journals/10142/contents/02/00075/paper/s10142-002-0075-1ch000.html">Clark
				B, Lambrecht M, Rhee SY. (2003)</a>
			<br>
			Arabidopsis genomic information for interpreting wheat EST sequences.
			<br>
			Functional and Integrative Genomics 2003 3(1):33
			<br>
			Download
			<a href="/about/23969.pdf">[PDF]</a>
		</DD>


		<DD>
			Meinke DW, Meinke LK, Showalter TC, Schissel AM, Mueller LA, Tzafrir
			I. (2003)
			<br>
			A sequence-based may of Arabidopsis genes with mutant phenotypes.
			Plant Physiol. 2003 Feb;131(2):409-18
			<br>
			Download
			<a href="/about/pp409.pdf">[PDF]</a>
		</DD>


		<DD>
			Mueller, LA., Zhang, P., Rhee SY (2003)
			<br>
			AraCyc. A Biochemical Pathway Database for Arabidopsis. Plant
			Physiology. 2003 132(2):453-60
			<br>
			Download
			<a href="/about/pp453.pdf">[PDF]</a>
		</DD>





		<P>
		<DD>

			<a
				href="http://link.springer.de/link/service/journals/10142/contents/02/00077/">Garcia-Hernandez,
				M.; Berardini, T. Z.; Chen, G.; Crist, D.; Doyle, A.; Huala, E.;
				Knee, E.; Lambrecht, M.; Miller, N.; Mueller, L. A.; Mundodi, S.;
				Reiser, L.; Rhee, S. Y.; Scholl, R.; Tacklind, J.; Weems, D. C.; Wu,
				Y.; Xu, I.; Yoo, D.; Yoon, J.; Zhang, P. (2002)</a>
			<br>
			TAIR: a resource for integrated Arabidopsis data.
			<br>
			Functional and Integrative Genomics 2002 2(6):239
			<br>
			Download
			<a href="/about/23226.pdf">[PDF]</a>
		</DD>


		<P>
		<DD>

			<a
				href="http://www3.interscience.wiley.com/cgi-bin/fulltext/91015164/FILE?TPL=ftx_start">Mitra
				M.; Shah N.; Mueller, L.; Pin S.; and Fedoroff N. (2002)</a>
			<br>
			StressDB: A locally installable web-based relational microarray
			database designed for small user communities.
			<br>
			Comparative and Functional Genomics 2002 3(2):91-96.
			<br>
			Download
			<a href="/about/LM1.pdf">[PDF]</a>


			<P>
		<DD>
			<a
				href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=11860214&dopt=Abstract">
				Reiser, L; Mueller, LA; and Rhee, SY (2002)</a>
			<br>
			Surviving in a sea of data: a survey of plant genome data resources
			and issues in building data management systems.
			<br>
			Plant Molecular Biology 2002 Jan;48(1):59-74.
			<br>
			Download
			<a href="/about/23967.pdf">[PDF]</a>
		</DD>



		<DD>

			<a href="http://nar.oupjournals.org/cgi/content/full/31/1/224">Rhee
				SY, Beavis W, Berardini TZ, Chen G, Dixon D, Doyle A,
				Garcia-Hernandez M, Huala E, Lander G, Montoya M, Miller N, Mueller
				LA, Mundodi S, Reiser L, Tacklind J, Weems DC, Wu Y, Xu I, Yoo D,
				Yoon J, Zhang P. </a>
			<br>
			The Arabidopsis Information Resource (TAIR): a model organism
			database providing a centralized, curated gateway to Arabidopsis
			biology, research materials and community.
			<br>
			Nucleic Acids Research 2003 31(1):224
			<br>
			Download
			<a href="/about/23690.pdf">[PDF]</a>
		</DD>


		<P>
		<DD>

			<a href="http://www.genome.org/cgi/content/full/11/8/1425">The
				Gene Ontology Consortium</a>
			<br>
			Creating the Gene Ontology Resource: Design and Implementation.
			(2001)
			<br>
			Genome Research 2001 Aug;11(8):1425-1433.
			<br>
			Download
			<a href="/about/genome.pdf">[PDF]</a>
		</DD>

		<P>
		<DD>

			<a
				href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=11125061&dopt=Abstract">Huala,
				E; Dickerman, A; Garcia-Hernandez, M; Weems, D; Reiser, L; LaFond,
				F; Hanley, D; Kiphart, D; Zhuang, J; Huang, W; Mueller, L;
				Bhattacharyya, D; Bhaya, D; Sobral, B; Beavis, B, Somerville, C; and
				Rhee, SY (2001) </a>
			<br>
			The Arabidopsis Information Resource (TAIR): A comprehensive database
			and web-based information retrieval, analysis, and visualization
			system for a model plant.
			<br>
			Nucleic Acids Res. 2001 Jan 1;29(1):102-5.
			<br>
			Download
			<a href="/about/nar.pdf">[PDF]</a>
		</DD>
		<P>
		<DD>
			Rhee, SY (2001)
			<br>
			Extending the Frontiers of Plant Biology: Large scale biology,
			bioinformatics, and information management. Plant Biotechnology
			Institute Bulletin May:10-12
			<br>
		</DD>

		<P>
		<DD>

			<a
				href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=11115859&dopt=Abstract">Rhee,
				SY</a>
			<br>
			Bioinformatic resources, challenges, and opportunities using
			Arabidopsis thaliana as a model organism in post-genomic era. (2000)
			<br>
			Plant Physiol. 2000 Dec;124(4):1460-4.
			<br>
			Download
			<a href="/about/Rhee_PP.pdf">[PDF]</a>
		</DD>

		<p>
		<DD>

			Rhee SY and Flanders, DJ
			<br>
			Web-based bioinformatic tools for Arabidopsis researchers. In
			Arabidopsis: A Practical Approach. 2000 pp. 225-265
			<br>
			Zoe Wilson ed., Oxford University Press, UK.
		</DD>


	</dl>
	<center>
		Last modified on September 19, 2006
	</center>
</div>
<!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
