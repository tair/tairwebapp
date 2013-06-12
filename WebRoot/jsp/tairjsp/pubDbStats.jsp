<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*, java.util.*, java.net.*,java.sql.* "%>
<%@ page import="org.apache.oro.text.perl.Perl5Util, java.io.*"%>

<%!
String pageName = "public table statistics";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="407" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />
<%  DBconnection db = new DBconnection(); 
    ArrayList objectTable = initTableNames();
%>
<center>
<TABLE width="602" align="center" border="0" cellspacing="0" cellpadding="2">
	<TR>
	<TD width="602" align="center"> 
<TR>
    <TD class="lg" valign="top" align="center">
        <H2>TAIR Database Statistics</H2></TD>
</TR>
<TR>
    <TD class="lg" valign="top" align="center">
        Date Run : <%= getDateLastRun(db) %>
    </TD>
</TR>
<TR>
    <TD>
   <center>
   <TABLE border="1" cellspacing="0" cellpadding="4" width="80%">
   
 <% for(int i = 0; i< objectTable.size();i++){
    String table  = (String)( objectTable.get(i)); 
    TreeMap displayNameAndValue = getDisplayNameValuePair(table, db); 
    String bgColor =  myBgColor.toggleBgColor();
 %>

  <TR <%= bgColor  %>>    
     <TD valign=top rowspan=<%= getNoZeroEntryCount(displayNameAndValue) %> width="50%" class="lg">
        <%= table %>
     </TD>
     <TD  width="25%"><B>TOTAL</B></TD>
     <TD  width="25%"><B><%= (String)displayNameAndValue.get(table) %></B> </TD>
  </TR>
     
<%   Set count =  displayNameAndValue.entrySet();
     Iterator iter = count.iterator();
     while (iter.hasNext()) {
         java.util.Map.Entry  count_entry = (java.util.Map.Entry) iter.next(); 
         String table_name  = (String)(count_entry.getKey()); 
         String value = (String)( count_entry.getValue());
         if( (!(table_name.equals(table))) && (Integer.parseInt(value) != 0) ){
%>
     <TR <%= bgColor %>>
         <TD class="sm"><%= count_entry.getKey() %></TD>
         <TD><%= value %> </TD>
     </TR>
      <% } }  %>
     
<%  } %>
</TR>

</table>
</center>
</TD>
</TR>
 </TABLE>
    </TD>
   </TR>
</TABLE>
</center>

<%! 
 private ArrayList initTableNames(){
    
    ArrayList objectTable= new ArrayList();
   
    objectTable.add("AASequence");
    objectTable.add("Affiliation");
    objectTable.add("Alias");
    objectTable.add("AssemblyUnit");
    objectTable.add("Assignment"); 
    objectTable.add("Attribution");
    objectTable.add("Clone");
    objectTable.add("CloneEnd");
    objectTable.add("Communication");
    objectTable.add("Contig");
    objectTable.add("DatabaseReference");
    objectTable.add("FeatureAssignment"); 
    objectTable.add("FlankingSequence");
    objectTable.add("Gene");
    objectTable.add("GeneAlias"); 
    objectTable.add("GeneticMarker"); 
    objectTable.add("Hybridization");   
    objectTable.add("Image");
    objectTable.add("Keyword");
    objectTable.add("Library");
    objectTable.add("Locus");
    objectTable.add("Map");
    objectTable.add("NucleotideSequence");
    objectTable.add("Orders");
    objectTable.add("Organization");
    objectTable.add("PcrProduct");
    objectTable.add("Person");
    objectTable.add("Polymorphism");
    objectTable.add("ProteinDomain");
    objectTable.add("PubSource");
    objectTable.add("Publication");
    objectTable.add("Repeat");
    objectTable.add("RestrictionEnzyme");
    objectTable.add("SpeciesVariant");
    objectTable.add("Stock");
    objectTable.add("Taxon");
    objectTable.add("Vector");

    return objectTable;
 }

 private int getNoZeroEntryCount(TreeMap displayNameAndValue){
     Set count =  displayNameAndValue.entrySet();
     int non_zero_entry=0;
     Iterator iter = count.iterator();
     while (iter.hasNext()) {
         java.util.Map.Entry  count_entry = (java.util.Map.Entry) iter.next(); 
         String value = (String)( count_entry.getValue());
         if( ( Integer.parseInt(value) != 0) ){
            non_zero_entry++;
         }
     }
     return  non_zero_entry;
 }

private String getDateLastRun(org.tair.tfc.DBconnection db) throws SQLException{
    String date = "";
    db.setQuery("select EXTRACT( YEAR FROM tableStats_date), EXTRACT( MONTH FROM tableStats_date),"+
                " EXTRACT( DAY FROM tableStats_date) from TableStats order by tableStats_date desc") ;
    ResultSet dates =db.getResultSet( );

    while (dates.next()){  
       if (!date.equals("")){ continue; }
       date = dates.getString(1)+"-"+dates.getString(2)+"-"+dates.getString(3);
    }
    return date;
 }
 
private TreeMap getDisplayNameValuePair(String table, org.tair.tfc.DBconnection db) throws SQLException{
    TreeMap  displayNameAndValue =  new TreeMap();
    db.setQuery("select field_name,display_value, row_count from Definitions, TableStats"+
               " where Definitions.definitions_id =TableStats.definitions_id " + 
               " and table_name= '"+table+"' order by tableStats_date desc" );
    ResultSet rows=db.getResultSet( ); 
       
    while (rows.next()){ 
	if (displayNameAndValue.containsKey(rows.getString("display_value"))) {
             continue;
        }
        displayNameAndValue.put( rows.getString("display_value"), rows.getString("row_count"));
    }
    return displayNameAndValue;
 }
%>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
