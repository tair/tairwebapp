<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("T-DNA lines from Csaba Koncz") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("7") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<H3><CENTER><B><IMG SRC="/images/abrc.gif" WIDTH=86 HEIGHT=30 X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT ALIGN=left>T-DNA
transformed lines from Dr. Csaba Koncz</B></CENTER></H3>

<P>&nbsp;</P>

<P>These lines were donated and produced by Dr. Csaba Koncz of the
Max Delbreuck Laboratories, Koeln, Germany. These lines were bulked
and characterized at NASC by Dr. Igor Vizir. In the few cases where
phenotypes seemed clearly different from the NASC description, the
ABRC characterization was employed.</P>

<P>These T-DNA lines were produced by transformation of explants of
the ecotype Columbia. The transformation procedure is outlined in the
scheme below. T2 seed were received and bulked. Characterization
involved looking for visible mutations in populations harvested from
individual T2 plants which were also hygromycin resistant.
Cosegregation of antibiotic resistance and mutant phenotype has not
been closely analyzed.</P>

<P>The references for this work are: Koncz, C., Chua, N.-H. and
Schell, J. (1992) Methods in Arabidopsis Research. World Scientific,
River Edge, NJ and Koncz, C. et al (1992) Plant Molecular Biology 20,
963-976.</P>

<P>&nbsp;</P>

<P><B>Transformation and characterization scheme</B></P>

<P>Explants were wounded and cells induced to actively divide while
co-cultivated with Agrobacterium containing the T-DNA.</P>

<P>Plants were regenerated in the presence of Hygromycin to select
for transformants</P>

<P>T1 selfed = T2</P>

<P>T2 bulked in greenhouse</P>

<P>T3 tested for Hygromycin resistance and checked for visible
mutations</P>

<P>T3 selfed = T4</P>

<P>&nbsp;</P>

<P>&nbsp;</P>

<P>Please use our <A 
HREF="/servlets/Search?action=new_search&type=germplasm">germplasm
search</A> for details on individual lines.</P>
<P>
<center>Last modified on June 16, 2004</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />