<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR";
String highlight = "4";
String helpfile="";
String cssfile="/css/page/ais.css";
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
<div id="right_column">

  <TABLE width="90%">

        <tr>
          <td colspan=3 align=center><H1>Weeds World Volume 4(ii)</h1></td>
        </tr>
        <tr>
          <td colspan=3 align=center><h1>ISSN 1358-6912</h1></td>
        </tr>
        <tr>
          <td colspan=3>Editor: <A HREF="mailto:arabidopsis@nottingham.ac.uk">Mary Anderson</A>, NASC, University of Nottingham, UK<
br></td>
        </tr>
        <tr>
          <td colspan=3>WWW mirror site curator: <a href="mailto:flanders@genome.stanford.edu">David Flanders</a>, Stanford AtDB Pro
ject<br></td>
        </tr>
        <tr>
          <td colspan=3 >WWW mirror site curator: <a href="mailto:dbigwood@locus.nalusda.gov">Doug Bigwood</a>, Genome Informatics G
roup, NAL<br></td>
        </tr>
        <tr>
          <td colspan=3>Markup: <a href="mailto:mike@thale.nott.ac.uk">Mike Arnold</a>, NASC, University of Nottingham, UK <P></td>
        </tr>
        <tr>
          <td><A HREF="../Vol2ii/editorq.html" target="_top">Comments to the editor</A></td>
        </tr>
        <tr>
          <td colspan=3 align=center><img src="images/blu_bar.gif" width=300 align=center></td>
        </tr>

      </table>
    </center>

      <blockquote>
        <bodytext>
          <table>

            <tr>
              <td bgcolor="#cccccc" align=left nowrap width="30%"><font color="#790000"><b>Mapping</b><br></font></td>
            </tr>
          </table>

          <menu>


            <table width="80%">
              <tr>
                <td align=left colspan=2>
                  <A HREF="mapping/mapping.html">The latest RI map using Lister and Dean RI lines</A><br>

                </td>
                <td align=right>(pg 1-10)<br></td>
              </tr>

            </table>
          </menu>

          <table>
            <tr>
              <td bgcolor="#cccccc" width="30%"><font color="#790000"><b>Conference Summaries</b></font></td>
            </tr>
          </table>

          <menu>
            <table width="80%">
              <tr>
                <td align=left>
                  <A HREF="genome_V.html">Plant and Animal Genome V - Arabidopsis Workshop</A> <i></i>
                </td>
                <td align=right>(pg 11-15)<br></td>
              </tr>
            </table>
          </menu>

          <table>
            <tr>
              <td bgcolor="#cccccc" wdith="30%"><font color="#790000"><b>Short Articles</b></font></td>
            </tr>
          </table>

          <menu>
            <table width="80%">
              <tr>
                <td colspan=3 align=left>
                  <A HREF="town.html">Mapping of icr genes reveals that tt6 should be placed on Chromosome 5</A>
                </td>
              </tr>

              <tr>
                <td colspan=2 align=right>
                  <i>James J. Campanella, Weigin Dong and Christopher D. Town</i>
                </td>
                <td align=right>
                  (pg 16-17)<br>
                </td>
              </tr>

              <tr>
                <td align=left>
                  <A HREF="prakash.html">Towards the development of cold tolerant plants</A>
                </td>
              </tr>
              <tr>
                <td colspan=2 align=right> <i>C. S. Prakash</i></td>
                <td align=right>(pg 18-19)<br></td>
              </tr>


            </table>
          </menu>

          <table>
            <tr>
              <td bgcolor="#cccccc" colspan=1><font color="#790000"><b>Informatics</b></font></td>
            </tr>
          </table>

          <menu>
            <table width="80%">
              <tr>
                <td><A HREF="morris.html">AREST: Arabidopsis Related ESTs</a></td>
              </tr>
              <tr>
              <td rowspan=2 align=right> <i>John Morris</i></td>
                <td align=right>(pg 20-11)<br></td>
              </tr>

            </table>
          </menu>


          <table>
            <tr>
              <td bgcolor="#cccccc" colspan=1><font color="#790000"><b>Stock Centre News</b></font></td>
            </tr>
          </table>

          <menu>
            <table width="80%">
              <tr>
                <td><A HREF="charging.html">Stock Centers obtain further funding and introduce user fees</a></td>
              <tr>
              <td rowspan=2 align=right><i>Randy Scholl, Keith Davis and Mary Anderson</i></td>
                <td align=right>(pg 22-26)<br></td>
              </tr>
            </table>
          </menu>

          <table>
            <tr>
              <td bgcolor="#cccccc" colspan=1><font color="#790000"><b>Community News</b></font></td>
            </tr>
          </table>

          <menu>
            <table width="80%">
              <tr>
                <td><A HREF="naasc.html">NAASC Committee Update</a> </td>
                <td align=right>(pg 27)<br></td>
              </tr>
            </table>
          </menu>

          <table>
            <tr>
              <td bgcolor="#cccccc" colspan=1><font color="#790000"><b>Dates for your Diary</b></font></td>
            </tr>

          </table>

          <menu>
            <table width="80%">

              <tr>
                <td colspan="3"><A HREF="grc.html">1997 Gordon Research Conference on Plant Cell Genetics and Development</a></td>
                <td align=right>(pg 28-39)<br></td>
              </tr>
<tr>
                <td colspan="3"><A HREF="grc.epigenetic.html">1997 Gordon Research Conference on Epegenetic Effects on Gene Expressi
on</a></td>
                <td align=right>(pg 28-39)<br></td>
              </tr>
<tr>
                <td colspan="3"><A HREF="ficpmb.html">Fifth International Congress of Plant Molecular Biology</a></td>
                <td align=right>(pg 28-39)<br></td>
              </tr>
              <tr>
                <td colspan="3"><A HREF="gsam.html">Genetic Society Annual Meeting</a></td>
                <td align=right>(pg 28-39)<br></td>
              </tr>
              <tr>
                <td colspan="3"><A HREF="madison.html">8th Arabidopsis Conference at Madison</a></td>
                <td align=right>(pg 28-39)<br></td>
              </tr>
                      <tr>
                <td colspan="3"><A HREF="amspp.html">American Society of Plant Physiologists meeting</a></td>
                <td align=right>(pg 28-39)<br></td>
              </tr>

              <tr>
                <td colspan="3"><A HREF="leicester/Second_Circular.html">European Symposium on Photomorphogenesis</a></td>
                <td align=right>(pg 28-39)<br></td>
              </tr>
              <tr>
                <td></td><td colspan="2"><A HREF="leicester/Accommodation_Booking_Form.html">Accommodation booking form</a></td>
              </tr>
              <tr>
                <td></td><td colspan="2"><A HREF="leicester/Registration_Form.html">Registration form</a></td>
              </tr>
            </table>
          </menu>

          <table>
            <tr>
            <td bgcolor="#cccccc" colspan=1><font color="#790000"><b>Next deadline for submission is 31st July 1997</b></font></td>
            </tr>


          </table>

        </bodytext>
      <menu>
        <table width="80%">
          <tr>
            <td>
              <A HREF="submit.html">How to submit information for publication</A> <i>Mary Anderson</i>

            </td>
            <td align=right>(pg 40)<br>
            </td>
          </tr>
        </table>
        </menu>
      <hr>
      <a href="help.html" target="frame_main"><img src="images/btn-010.jpg" width=35 height=35 align=left wrap=right> A help page</a
> is available to describe new features of the newsletter, and to provide for feedback if problems with the layout are encountered.
      <hr>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

