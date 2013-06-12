/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;


import java.util.ArrayList;
import java.util.Iterator;
import java.lang.Character;

import org.tair.querytools.GeneDetail;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLocus;


public class AnnotationSummary {
  /**
   * Parse the evidence string (format <evi>[|<evi>...]) into its individual
   * evidence strings and substitute <a> anchor/hyperlink elements with an
   * appropriate URL to the TAIR detail page for genes (tair:gene:) or loci
   * (AGI_LocusCode:). Concatenate everything back together for display.
   * 
   * @param evid the evidence string
   * @return the display string properly translated
   */
  public static String buildEvidenceWithInfo(String evid) {
    if (evid == null || evid.equals("") || evid.equals("none"))
      return "none";

    ArrayList<String> chunks = new ArrayList<String>();
    int s = 0, e;
    while ((e = evid.indexOf("|", s)) != -1) {
      chunks.add(evid.substring(s, e));
      s = e + 1;
    }
    chunks.add(evid.substring(s, evid.length()));

    String html = "";
    DBReadManager pool = null;
    DBconnection conn = null;
    try {
      pool = DBReadManager.getInstance();
      conn = pool.get_connection();

      String acc;
      Iterator<String> i = chunks.iterator();
      while (i.hasNext()) {
        acc = i.next().trim();
        if (acc.toLowerCase().startsWith("tair:gene:")) {
          // TAIR gene tair object id
          try {
            Long accDigits = new Long(acc.substring(10));
            //System.out.println("acc: " + accDigits);
            // TODO: Major waste here, just need the id and name!
            //GeneDetail gene =
            //    new GeneDetail(conn, AccessionManager
            //        .translateID(conn, "gene", accDigits));
            Long specificId = AccessionManager.translateID(conn, "gene", accDigits);
            //System.out.println("specific id " + specificId);
            //System.out.println(gene.getAccession());
            //System.out.println(gene.get_original_name());
            if(specificId != accDigits && specificId != null) {
                html +=
                    "<a href=\"TairObject?accession=gene:" + accDigits + "\">" + acc + "</a>"; //gene.getAccession() + "\">"
                //        + gene.get_original_name() + "</a>";
            } else {
                html += "";
            }
          } catch (Exception ex) {
            ex.printStackTrace();
            html += acc;//"<a href=\"http://arabidopsis.org/servlets/TairObject?accession=" + acc.substring(5) + "\">" + acc + "</a>";
          }
        } else if (acc.toLowerCase().startsWith("agi_locuscode:")) {
          try {
            Long id = TfcLocus.retrieveLocusID(conn, acc.substring(14));
            html +=
                "<a href=\"TairObject?id=" + id + "&type=locus\">"
                    + acc.substring(14) + "</a>";
          } catch (Exception ex) {
            html += acc;
          }
        } else if (acc.toLowerCase().startsWith("panther:")) {
            html += "<a href=\"http://pantree.org/node/annotationNode.jsp?id=" + acc.substring(8) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("uniprotkb:")) {
            html += "<a href=\"http://www.uniprot.org/uniprot/" + acc.substring(10) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("interpro:")) {
            html += "<a href=\"http://www.ebi.ac.uk/interpro/DisplayIproEntry?ac=" + acc.substring(9) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("ncbi_gi:")) {
            html += "<a href=\"http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=" + acc.substring(8) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("go:")) {
            html += "<a href=\"http://amigo.geneontology.org/cgi-bin/amigo/term-details.cgi?term=GO:" + acc.substring(3) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("pfam:")) {
            html += "<a href=\"http://pfam.sanger.ac.uk/family/" + acc.substring(5) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("swiss-prot:")) {
            html += "<a href=\"http://www.uniprot.org/uniprot/" + acc.substring(11) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("tigr_tigrfams:")) {
            html += "<a href=\"http://cmr.jcvi.org/cgi-bin/CMR/HmmReport.cgi?hmm_acc=" + acc.substring(14) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("genbank:")) {
            html += "<a href=\"http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=" + acc.substring(8) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("gb:")) {
            html += "<a href=\"http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=" + acc.substring(3) + "\">" + acc + "</a>";
        } else if (acc.toLowerCase().startsWith("tair:locus:")) {
            if(Character.isDigit(acc.charAt(11))) {
                html += "<a href=\"http://arabidopsis.org/servlets/TairObject?accession=" + acc.substring(5) + "\">" + acc + "</a>"; 
            }
        } else if (acc.toLowerCase().startsWith("prosite:")) {
            html += "<a href=\"http://www.expasy.ch/cgi-bin/prosite-search-ac?" + acc.substring(8) + "\">" + acc + "</a>";
        } else
          html += acc;
        if (i.hasNext())
          html += "|";
      }
        if (html.equals("")) {
            html = "none";
        }
    } catch (Exception ex) {
      html = evid;
    } finally {
      pool.return_connection(conn);
    }

    return html;
  }
}
