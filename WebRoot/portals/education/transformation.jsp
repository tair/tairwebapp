<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR: Enhancer and Gene Trap Transposon Mutagenesis in Arabidopsis") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("3") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
		
		<!-- Content goes here //--> 


<P>
<P>&nbsp;
<B><FONT FACE="TIMES" SIZE=6><P>Simplified Arabidopsis Transformation Protocol</P>
</B></FONT><FONT FACE="TIMES">
<P>
</I><P>(Brief version for those who are familiar with the method)</P>

<P><FONT FACE="TIMES">
Steve Clough and Andrew Bent, University of Illinois at Urbana-Champaign. 	  
<P>   Our present protocol (Clough and Bent, 1998; modified from Bechtold et al. 1993) is extremely simple. We
              have found that the MS salts, hormone, etc. make no difference, that OD of bacteria doesn't make much of a
              difference, that vacuum doesn't even make much of a difference as long as you have a decent amount of
              surfactant present. Plant health is still a major factor - healthy fecund plants make a big difference! With this
              method you should be able to achieve transformation rates above 1% (one transformant for every 100 seed
              harvested from Agrobacterium-treated plants).  
</P>


<UL>
<LI>1.Grow healthy Arabidopsis plants until they are flowering. Grow under long days in pots in soil covered
                   with bridal veil, window screen or cheesecloth.  </LI>
<P><LI>2.(optional) Clip first bolts to encourage proliferation of many secondary bolts. Plants will be ready roughly
                   4-6 days after clipping. Clipping can be repeated to delay plants. Optimal plants have many immature
                   flower clusters and not many fertilized siliques, although a range of plant stages can be successfully
                   transformed. </LI>
<P><LI>3.Prepare Agrobacterium tumefaciens strain carrying gene of interest on a binary vector. Grow a large liquid
                   culture @ 28oC in LB with antibiotics to select for the binary plasmid, or grow in other media. You can
                   use mid-log cells or a recently stationary culture.</LI>
 
<P><LI>4.Spin down Agrobacterium, resuspend to OD600 = 0.8 (can be higher or lower) in 5% Sucrose solution (if
                   made fresh, no need to autoclave). You will need 100-200 ml for each two or three small pots to be
                   dipped, or 400-500 ml for each two or three 3.5" (9cm) pots.</LI>
<P><LI>5.Before dipping, add Silwet L-77 to a concentration of 0.05% (500 ul/L) and mix well. If there are
                   problems with L-77 toxicity, use 0.02% or as low as 0.005%.</LI>
 
<P><LI>6.Dip above-ground parts of plant in Agrobacterium solution for 2 to 3 seconds, with gentle agitation. You
                   should then see a film of liquid coating plant. Some investigators dip inflorescence only, while others also
                   dip rosette to hit the shorter axillary inflorescences. </LI>
<P><LI>7.Place dipped plants under a dome or cover for 16 to 24 hours to maintain high humidity (plants can be laid
                   on their side if necessary). Do not expose to excessive sunlight (air under dome can get hot).</LI>
<P><LI>8.Water and grow plants normally, tying up loose bolts with wax paper, tape, stakes, twist-ties, or other
                   means. Stop watering as seeds become mature.</LI>
<P><LI>9.Harvest dry seed. Transformants are usually all independent, but are guaranteed to be independent if they
                   come off of separate plants.</LI>
<P><LI>10.Select for transformants using antibiotic or herbicide selectable marker. For example, <a href="/portals/education/vapor.jsp">vapor-phase
                   sterilize</a> and plate 40 mg = 2000 seed (resuspended in 4 ml 0.1% agarose) on 0.5X MS/0.8% tissue culture
                   Agar plates with 50 ug/ml Kanamycin, cold treat for 2 days, and grow under continuous light (50-100
                   microEinsteins) for 7-10 days.</LI>
		   
		   
<P><LI>11.Transplant putative transformants to soil. Grow, test, and use! </LI></UL>
		   

<P>For higher rates of transformation, plants may be dipped two or three times at seven day intervals. We suggest
              one dip two days after clipping, and a second dip one week later. Do not dip less than 6 days apart.   </P>

<P>&nbsp;</P>
</FONT><B><FONT FACE="TIMES" SIZE=2><P>References</P>
</B></FONT><FONT FACE="TIMES"><DIR>
<DIR>

<P>Bechtold, N., Ellis, J., and Pelletier, G. (1993). In <I>planta Agrobacterium</I>-mediated gene transfer by infiltration
              of adult <I>Arabidopsis thaliana</I> plants. C. R. Acad. Sci. Paris, Life Sciences 316:1194-1199.  </P>
<P>Clough SJ and Bent AF, 1998. Floral dip: a simplified method for <I>Agrobacterium</I>-mediated transformation of
              <I>Arabidopsis thaliana</I>. Plant J 16:735-43.</P>
<P>NOTE: Obtain proper approval for transformation work from institutional authorities. Autoclave and properly
              dispose of all materials. </P>
</DIR>
</DIR>


		</td>
	</tr>
</TABLE>

<!-- FOOTER -->

<TABLE width="602" align="center">
	<tr>
		<td><br><hr size=1 width="90%"></td>
	</tr>
	<tr>
		<td><a href="http://www.ncgr.org"><img src="/images/ncgrlogoredsmall.gif" alt="" border="0" align="left"></a>
		<a href="http://carnegiedpb.stanford.edu"><img src="/images/ciw-logosmall.gif" alt="" border="0" align="right"></a></td>
	</tr>
<TR><TD ALIGN = "CENTER">
<center><i>Last modified on January 29, 2001</i><br>
comments or questions to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');"><B>curator@arabidopsis.org</B></a>
</table>
</body>
</html>
