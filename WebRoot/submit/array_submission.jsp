<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Array Design Submission") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("3") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>

<span class="header">Microarray Data Submission</span>

<BR>
<jsp:include page="/jsp/includes/infominiheader.jsp" flush ="true">
<jsp:param name="link" value="Marker" />
</jsp:include>

  <h1>Instructions for the Submission of Array Design Data</h1>
  <p>This section provides information about the composition and specifications of 
    a nucleotide array. These data will be required when the Array Design is new 
    to TAIR (see list of available arrays in the Hybridization section).</p>
  <p>The data will be formatted in <b>one</b> workbook, which will contain <b>two 
    worksheets</b>. One of the worksheets will contain descriptive information on 
    the Array <b>(name.meta-ArrayDesign)</b> and the other one will contain information 
    on the features on the array and layout <b>(name.ArraySpots)</b>.</p>
  <p><b>Workbook Name</b>: &#145;name-ArrayDesign.xls&#146;, where &#145;name&#146; is the name of the array 
    design</p>
  <h2>Array Design Description</h2>
  <p><b>Worksheet Name</b>:&#160; &quot;name.meta-ArrayDesign&quot; where 
    'name' corresponds to the name of the array design. </p>
  <table border=1 cellspacing=0 cellpadding=0>
    <tr> 
      <td width=200 valign=top> <p><b>column 
          name</b></p></td>
      <td width=167 valign=top> <p><b>column 
          description</b></p></td>
      <td width=148 valign=top> <p><b>accepted 
          values</b></p></td>
      <td width=72 valign=top> <p><b>example</b></p></td>
    </tr>
    <tr> 
      <td width=200 valign=top> <p><a name="name"></a>*ArrayDesign.name</p></td>
      <td width=167 valign=top> <p>Name 
          that identifies the array design.</p></td>
      <td width=148 valign=top> <p>Max 
          50 characters</p></td>
      <td width=72 valign=top> <p>SmithG</p></td>
    </tr>
    <tr> 
      <td width=200 valign=top> <p><a name="description"></a> ArrayDesign.description</p></td>
      <td width=167 valign=top> <p>General 
          description of the array design.</p></td>
      <td width=148 valign=top> <p>Max 
          1000 characters</p></td>
      <td width=72 valign=top>&nbsp; </td>
    </tr>
	<tr> 
      <td width=200 valign=top> <p><a name="protocol"></a> ArrayDesign.protocol</p></td>
      <td width=167 valign=top> <p>Protocol used for the creation of the physical array</p></td>
      <td width=148 valign=top> <p>Max 
          2000 characters</p></td>
      <td width=72 valign=top>&nbsp; </td>
    </tr>
    <tr> 
      <td width=200 valign=top> <p><a name="platform_type"></a> *ArrayDesign.platform_type</p></td>
      <td width=167 valign=top> <p>The 
          type of printing method used to produce the array</p></td>
      <td width=148 valign=top> <p>spotted, 
          in-situ synthesized</p></td>
      <td width=72 valign=top> <p>spotted</p></td>
    </tr>
    <tr> 
      <td width=200 valign=top> <p><a name="number_spots"></a> *ArrayDesign.number_spots</p></td>
      <td width=167 valign=top> <p>The 
          number of array elements on the array</p></td>
      <td width=148 valign=top> <p>integer</p></td>
      <td width=72 valign=top> <p>24,000</p></td>
    </tr>
    <tr> 
      <td width=200 valign=top> <p><a name="manufacturer"></a> ArrayDesign.manufacturer</p></td>
      <td width=167 valign=top> <p>The 
          name of the company, group or project that manufactures the array</p></td>
      <td width=148 valign=top> <p>Max 
          50 characters</p></td>
      <td width=72 valign=top> <p>SmithG 
          Lab</p></td>
    </tr>
    <tr> 
      <td width=200 valign=top> <p><a name="surface_type"></a> *ArrayDesign.surface_type</p></td>
      <td width=167 valign=top> <p>The 
          type of surface to which the array elements are attached.</p></td>
      <td width=148 valign=top> <p>glass,nylon,cellulose</p></td>
      <td width=72 valign=top> <p>glass</p></td>
    </tr>


<tr> 
      <td width=200 valign=top> <p><a name="Xorigin"></a> ArrayDesign.Xorigin</td>
      <td width=167 valign=top> <p> Usually specified relative to the fidutial. The x position of the first feature on a slide, chip, etc. Usually specified relative to the fidutial.</p></td>
      <td width=148 valign=top> <p>float</p></td>
      <td width=72 valign=top> <p>6</p></td>
    </tr>	

<tr>	
 <td width=200 valign=top> <p><a name="Yorigin"></a> ArrayDesign.Yorigin</td>
      <td width=167 valign=top> <p>The y position of the first feature on a slide, chip, etc. Usually specified relative to the fidutial.</p></td>
      <td width=148 valign=top> <p>float</p></td>
      <td width=72 valign=top> <p>435</p></td>
    </tr>
	

<tr>	
 <td width=200 valign=top> <p><a name="OrigenRelativeTo"></a> ArrayDesign.OrigenRelativeTo</td>
      <td width=167 valign=top> <p>What the array origin is relative to.</p></td>
      <td width=148 valign=top> <p>upper left corner, fidutial, etc.</p></td>
      <td width=72 valign=top> <p>lower right bottom</p></td>
	
</tr>	

    <tr>
 <td width=200 valign=top> <p><a name="OrientationMark"></a> ArrayDesign.OrientationMark</td>
      <td width=167 valign=top> <p>The physical mark on the array to determine where the top left side is, usually frosted side of the glass, bar code.
          type of surface to which the array elements are attached.</p></td>
      <td width=148 valign=top> <p>frosted side of the glass, bar code, etc.</p></td>
      <td width=72 valign=top> <p>bar code</p></td>
  </tr>
	
<tr> <td width=200 valign=top> <p>ArrayDesign.OrientationMarkPosition</td>
      <td width=167 valign=top> <p><a name=""></a> The orientation of the mark on the array.</p></td>
      <td width=148 valign=top> <p>top, bottom, right, left</p></td>
      <td width=72 valign=top> <p>glass</p></td>
    </tr>

<tr>	
 <td width=200 valign=top> <p><a name="FidutialType"></a> ArrayDesign.FidutialType</td>
      <td width=167 valign=top> <p>A fidutial is the marking on the surface of the array that can be used to identify the array's origin, the coordinates of which are the fidutial's centroid. Types of fidutial are: chrome border, laser ablation mark, etc.</p></td>
      <td width=148 valign=top> <p>chrome border, laser ablation mark, etc.</p></td>
      <td width=72 valign=top> <p>chrome border</p></td>
</tr>

<tr>	
 <td width=200 valign=top> <p><a name="FidutialPosition"></a> ArrayDesign.FidutialPosition</td>
      <td width=167 valign=top> <p>The position of the fidutial, relative to to the upper left corner.</p></td>
      <td width=148 valign=top> <p>bottom right, bottom left, etc.left</p></td>
      <td width=72 valign=top> <p>bottom right</p></td>
    </tr>



  </table>
  <h2>Array Design Features</h2>
  <p>This file lists the array elements that are on the array and additional related 
    information. It should contain the following fields:</p>
  <p><b>Worksheet Name</b>: &quot;name.ArraySpots&quot;&#160; where 'name' corresponds to 
    the name of the array design. </p>
  <table border=1 cellspacing=0 cellpadding=0 width=604>
    <tr> 
      <td width=199 valign=top> <p><b>column 
          name</b></p></td>
      <td width=212 valign=top> <p><b>column 
          description</b></p></td>
      <td width=121 valign=top> <p><b>accepted 
          values</b></p></td>
      <td width=71 valign=top> <p><b>example</b></p></td>
    </tr>
    <tr> 
      <td width=199 valign=top> <p><a name="array_element_name"></a> *ArraySpot.array_element_name</p></td>
      <td width=212 valign=top> <p>name 
          of the element spotted or synthesized onto the array. It should be a 
          unique name, case insensitive. </p></td>
      <td width=121 valign=top> <p>Max 
          20 characters</p></td>
      <td width=71 valign=top> <p>at2elem_23</p></td>
    </tr>
    <tr> 
      <td width=199 valign=top> <p><a name="GenBank_accession"></a> *ArraySpot.GenBank_accession</p></td>
      <td width=212 valign=top> <p>GenBank 
          accession of the array element's sequence</p></td>
      <td width=121 valign=top>&nbsp; </td>
      <td width=71 valign=top> <p>X12345</p></td>
    </tr>
    <tr> 
      <td width=199 valign=top> <p><a name="sequence"></a> *ArraySpot.sequence</p></td>
      <td width=212 valign=top> <p>Nucleotide 
          sequence of the array element. It is required if no Genbank accession 
          is available</p></td>
      <td width=121 valign=top>&nbsp; </td>
      <td width=71 valign=top>&nbsp; </td>
    </tr>
    <tr> 
      <td width=199 valign=top> <p><a name="array_element_type"></a> *ArraySpot.array_element_type</p></td>
      <td width=212 valign=top> <p>Type 
          of array element</p></td>
      <td width=121 valign=top> <p>EST,amplicon,gene 
          fragment,oligonucleotide,unknown</p></td>
      <td width=71 valign=top> <p>amplicon</p></td>
    </tr>
    <tr> 
      <td width=199 valign=top> <p><a name="is_control"></a> *ArraySpot.is_control</p></td>
      <td width=212 valign=top> <p>True 
          if the array element is considered a control.</p></td>
      <td width=121 valign=top> <p>T,F</p></td>
      <td width=71 valign=top> <p>F</p></td>
    </tr>
    <tr> 
      <td width=199 valign=top> <p><a name="organism"></a> *ArraySpot.organism</p></td>
      <td width=212 valign=top> <p>Genus 
          and species of the organism that contains that sequence</p></td>
      <td width=121 valign=top>&nbsp; </td>
      <td width=71 valign=top> <p>Arabidopsis 
          thaliana</p></td>
    </tr>
    <tr> 
      <td width=199 valign=top> <p><a name="column_number"></a> ArraySpot.column_number</p></td>
      <td width=212 valign=top> <p>y-coordinate 
          position of the array element on the array. The orientation is specified in the ArrayDesign file.</p></td>
      <td width=121 valign=top>&nbsp; </td>
      <td width=71 valign=top> <p>23</p></td>
    </tr>
    <tr> 
      <td width=199 valign=top> <p><a name="row_number"></a> ArraySpot.row_number</p></td>
      <td width=212 valign=top> <p>x-coordinate 
          position of the array element on the array. The orientation is specified in the ArrayDesign file.</p></td>
      <td width=121 valign=top>&nbsp; </td>
      <td width=71 valign=top> <p>4588</p></td>
    </tr>
<tr> 
      <td width=199 valign=top> <p><a name="sector"></a> ArraySpot.sector</p></td>
      <td width=212 valign=top> <p>Specifies a zone on an array, usually a print group number.</p></td>
      <td width=121 valign=top>integer</td>
      <td width=71 valign=top> <p>1</p></td>
    </tr>
<tr> 
      <td width=199 valign=top> <p><a name="sector_row"></a> ArraySpot.sector_row</p></td>
      <td width=212 valign=top> <p>Sector row number.</p></td>
      <td width=121 valign=top>integer</td>
      <td width=71 valign=top> <p>45</p></td>
    </tr>
<tr> 
      <td width=199 valign=top> <p><a name="sector_column"></a> ArraySpot.sector_column</p></td>
      <td width=212 valign=top> <p>Sector column number.</p></td>
      <td width=121 valign=top>integer</td>
      <td width=71 valign=top> <p>5</p></td>
    </tr>
<tr> 
      <td width=199 valign=top> <p><a name="plate"></a> ArraySpot.plate</p></td>
      <td width=212 valign=top> <p>Specifies the plate where the feature is originally located.</p></td>
      <td width=121 valign=top>integer</td>
      <td width=71 valign=top> <p>1</p></td>
    </tr>
<tr> 
      <td width=199 valign=top> <p><a name="plate_row"></a> ArraySpot.plate_row</p></td>
      <td width=212 valign=top> <p>Plate row number.</p></td>
      <td width=121 valign=top>integer</td>
      <td width=71 valign=top> <p>45</p></td>
    </tr>
<tr> 
      <td width=199 valign=top> <p><a name="plate_column"></a> ArraySpot.plate_column</p></td>
      <td width=212 valign=top> <p>Plate column number.</p></td>
      <td width=121 valign=top>integer</td>
      <td width=71 valign=top> <p>5</p></td>
    </tr>
  </table>
<P><p>
<center>Last modified on October 20, 2003</center>

<a href="http://tair.stanford.edu/submit/microarray.submission.jsp">Back to Microarray Submission Page</a>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

