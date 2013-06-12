<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.utilities.*"
%>

<%!
String pageName = "ABRC Stock Catalog";
String highlight = "7";
%>

<%!

// get relative path to directory where
// all ABRC catalog static html pages are
// stored
String catalogDir = WebApp.getCatalogHTMLDir();

%>




<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
   <jsp:param name="pageName" value="<%= pageName %>" />
   <jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<%--
// leave this out for now, but keep instead Debbie wants it
<style>
 a:link	{ color: #000000; text-decoration: None; }  
 a:hover { color: #000000; text-decoration: Underline; }
 a:visited { color: #000000; text-decoration: None; } 
</style>

--%>




    <table align="center">
      <tr>
        <td><img src="/images/abrc_med.gif" width="150"></td>
        <td><font class="catalogheader">Stock Catalog</font></td>
      </tr>

     </table>


    <table align="center">
      <tr>
        <td>&nbsp;</td>
      </tr>

      <tr>
        <td>
           <table cellpadding="1" cellspacing="0" border="0">
              <tr>
                 <th align="left"><h4><a name="new">NEW RESOURCES</a></h4></th>
              </tr>
           </table>

         </th>
      </tr>

      <tr>
        <td>
          <ol type="I">
            <li><a href="<%= catalogDir %>cell_lines_1.html">CELL LINES</a></li><br/>
            <li><a href="<%= catalogDir %>protein_chips_1.html">PROTEIN CHIPS</a></li><br/>
            <li><a href="<%= catalogDir %>education_kits_1.html">EDUCATION KITS</a></li>
          </ol>
        </td>
      </tr>

      <tr>
        <td>&nbsp;</td>
      </tr>

      <tr>
        <td>
           <table cellpadding="1" cellspacing="0" border="0">
              <tr>
                 <th align="left"><h4><a name="seed">SEED STOCKS</a></h4></th>
              </tr>
           </table>

         </th>
      </tr>

      <tr>
        <td>
          <ol type="I">
             <li>MUTANTS
                 <br>
                 <ol type="A">
                     <li><a href="<%= catalogDir %>mutant_seed_1.html">Characterized Lines</a></li>
                     <li><a href="<%= catalogDir %>redei_mutant_1.html">G. P. R&eacute;dei Collection</a></li>
                     <li><a href="<%= catalogDir %>kranz_mutant_1.html">A. R. Kranz / AIS Collection</a></li>
                     <li><a href="<%= catalogDir %>other_mutant_1.html">Other Lines</a></li>
                 </ol>
                 <br>
             </li>

             <li>MAPPING LINES
                 <br>
                 <ol type="A">
                     <li><a href="<%= catalogDir %>recombinant_inbred_set_1.html">Recombinant Inbred Lines / Sets</a>
		<a href="ftp://ftp.arabidopsis.org/home/tair/Maps"> (RIL Mapping data)</a></li>
                     <li><a href="<%= catalogDir %>tetrad_set_1.html">Tetrad Lines / Set</a></li>
                     <li><a href="<%= catalogDir %>other_mapping_1.html">Other Lines</a></li>
                 </ol>
                 <br>
             </li>

             <li>TRANSGENIC LINES
                 <ol type="A">

                     <!-- A -->
                     <li>Confirmed T-DNA Insertion (homozygous and heterozygous from SALK, SAIL, WiscDsLox, GABI-Kat, etc.)
                         <ol type="1">
                             <li><a href="<%= catalogDir %>tdna_confirmed_1.html">Individual Lines</a></li>
                             <li><a href="<%= catalogDir %>set_of_lines_1.html">Sets of Lines</a></li>
                             <li><a href="<%= catalogDir %>set_of_pools_1.html">Sets of Pools</a></li>
                         </ol>
                         <br>
                      </li>

                     <!-- B -->
                     <li>Non-confirmed T-DNA Insertion
                         <ol type="1">
                             <li>Individual Lines
                                 <ol type="a">
                                     <li><a href="/abrc/ecker_flank.jsp">SALK Sequence-indexed</a></li>
                                     <li><a href="/abrc/sail.jsp">Syngenta Arabidopsis Insertion Library (SAIL)</a></li>
                                     <li>Wisconsin DsLox</li>
                                     <li>GABI-Kat</li>
				     <li><a href="/abrc/saskatoon_collection.jsp">Saskatoon (SK)</a></li>
                                     <li><a href="<%= catalogDir %>tdna_individ_1.html">Other</a></li>
                                 </ol>
                             </li> <br>

                             <li>Individual Pools - <a href="/abrc/akf.jsp">Arabidopsis Knockout Facility (AKF) Pools</a>
                             </li><br>

                             <li><a href="<%= catalogDir %>tdna_set_1.html">Sets of Lines for Forward Genetics</a>
                                 <ol type="a">
                                     <li>P. Gallois</li>
                                     <li>J. Haseloff</li>
                                     <li>C. Koncz</li>
                                     <li>K. Lindsey</li>
                                 </ol>
                             </li><br>

                             <li><a href="<%= catalogDir %>tdna_set_of_pools_1.html">Sets of Pools for Forward Genetics</a>
                                 <ol type="a">
                                     <li>J. Alonso, W. Crosby, J. Ecker</li>
                                     <li>K. Feldmann</li>
                                     <li>T. Jack</li>
                                     <li>S. LeClere, B. Bartel</li>
                                     <li>G. Pelletier, N. Bechtold</li>
                                     <li>W. Scheible, C. Somerville</li>
                                     <li>M. Sussman, R. Amasino</li>
                                     <li>D. Weigel</li>
                                     <li>S. Yokoi, H. Koiwa, R. Bressan</li>
                                 </ol>
                             </li><br>
                         </ol>
                     </li>
                         

                      <!-- C -->
                      <li>Transposon / Transposase
                          <ol type="1">
                             <li>Ds Insertion
                                 <ol type="a">
                                     <li><a href="<%= catalogDir %>transposon_individ_chromatin_1.html">Chromatin Charting</a></li>
                                     <li>John Innes Centre (includes activate, enhancer trap, gene trap, suppressor mutator)</li>
                                     <li><a href="<%= catalogDir %>transposon_individ_1.html">Other</a></li>
                                 </ol>
                             </li><br>

                             <li>Launch Pad
                                 <ol type="a">
                                     <li>Wisconsin DsLox</li>
                                     <li><a href="<%= catalogDir %>transposon_individ_other_1.html">Other</a></li>
                                 </ol>
                             </li><br>

                             <li><a href="<%= catalogDir %>unknown_individ_transposase_1.html">Transposase</a></li><br>

                             <li><a href="<%= catalogDir %>transposon_set_1.html">Sets of Lines</a>
                                 <ol type="a">
                                     <li>I. Bancroft, C. Dean</li>
                                     <li>K. Johnson, D. Soll</li>
                                 </ol>
                             </li><br>
                        </ol>
                      </li>

                      <!-- D -->
                      <li>RNAi<br>
                          <ol type="1">
                              <li><a href="<%= catalogDir %>dsrna_individ_chromatin_1.html">Chromatin Functional Genomics</a></li>
			      <li>AGRIKOLA</li>
                              <li><a href="<%= catalogDir %>dsrna_individ_1.html">Other</a></li><br>
                          </ol>
                      </li>

                      <!-- E -->
                      <li>Expressing Trangenes<br>
                          <ol type="1">
                              <li><a href="<%= catalogDir %>unknown_individ_1.html">Individual</a></li>
                              <li><a href="<%= catalogDir %>unknown_set_1.html">Sets</a> - D. Ehrhardt, S. Cutler, C. Somerville</li><br>
                          </ol>
                      </li>

                 </ol>
             </li> <!-- end TRANSGENIC LINES -->

             <li><a href="/abrc/henikoff.jsp">TILLING LINES</a><br><br></li>

             <li><a href="<%= catalogDir %>chromosomal_variant_1.html">CHROMOSOMAL VARIANTS</a>, including synthetic allotetraploids, polyploid lines, and trisomic lines<br><br></li>

			<li>MUTATION ACCUMULATION LINES
                  <ol type="A">
                      <li><a href="<%= catalogDir %>ma_set_of_lines_1.html">Set of Lines</a></li>
                      <li><a href="<%= catalogDir %>mutant_accumulation_1.html">Individual Lines</a></li>
                  </ol>
                  <br> 
			</li>
             <li>NATURAL ACCESSIONS (ECOTYPES)
                  <ol type="A">
                      <li><a href="<%= catalogDir %>natural_accession_set_1.html">Set of Lines</a></li>
                      <li><a href="<%= catalogDir %>natural_accession_1.html">Individual Lines</a></li>
                  </ol>
                  <br> 
             </li>

             <li>OTHER SPECIES
                 <ol type="A">
                     <li><a href="<%= catalogDir %>other_species_1.html">Close Relatives of Arabidopsis thaliana</a></li>
                     <li><a href="<%= catalogDir %>brassica_species_1.html">Brassica species</a></li>
                 </ol>
             </li>
           </ol>

        </td>

      </tr>

      <tr>
        <td>&nbsp;</td>
      </tr>

      <tr>
        <th align="left"><h4><a name="dna">DNA STOCKS</a></h4></th>
      </tr>

      <tr>
        <td>
          <ol type="I">
             <li>LIBRARIES
                 <br>
                 <ol type="A">
                     <li><a href="<%= catalogDir %>genomic_library_1.html">Genomic</a></li>
                     <li><a href="<%= catalogDir %>cdna_library_1.html">cDNA</a></li>

                 </ol>
                 <br>
             </li>

             <li>CLONES
                  <br>
                  <ol type="A">
                       <li><a href="<%= catalogDir %>cdna_clone_1.html">Full-length cDNAs</a></li>
                       <li><a href="<%= catalogDir %>cosmid_clone_1.html">Cosmids</a></li>
                       <li><a href="<%= catalogDir %>individ_cloned_gene_1.html">Individually Cloned Genes and Constructs</a></li>
                       <li><a href="<%= catalogDir %>mapping_clone_1.html">Mapping Clones</a></li>
                       <li><a href="<%= catalogDir %>clone_set_1.html">Clone Sets</a></li>
                       <li><a href="/abrc/YACs.jsp">YACs</a></li>
                       <li>BACs
                           <br>
                           <ol type="1">
                               <li><a href="/abrc/BACs_At.jsp">Arabidopsis thaliana</a></li>
                               <li><a href="/abrc/BACs_OtherSp.jsp">BACS from Close Relatives of Arabidopsis thaliana</a></li>
                           </ol>
                           <br>
                       </li>
                       <li>ESTs
                                                  <br>
                           <ol type="1">
                               <li><a href="/abrc/ests.jsp">Arabidopsis thaliana Expressed Sequence Tags</a></li>
                               <li><a href="/abrc/radish_ests.jsp">Radish Expressed Sequence Tags</a></li>
                           </ol>
                           <br>
                       </li>
                       <li><a href="/abrc/halo_tagged_orf_clones.jsp">HaloTag&#174; ORF Clones</a></li>
                  </ol>
                  <br>
             </li>

             <li><a href="<%= catalogDir %>vector_1.html">VECTORS</a><br><br></li>
             <li><a href="<%= catalogDir %>pooled_genomic_1.html">POOLED GENOMIC DNA FROM T-DNA INSERTIONAL MUTANT POPULATIONS</a><br><br></li>
             <li><a href="<%= catalogDir %>host_strain_1.html">HOST STRAINS</a><br><br></li>

           </td>
      </tr>

  
 

  </table>

<%@ include file="/jsp/includes/gen_footer.jsp" %>
