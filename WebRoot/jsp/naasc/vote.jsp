
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="NAASC Vote" />
</jsp:include>

<%
 List candidates = (List)request.getSession().getAttribute("candidates");
 String err = (String)request.getAttribute("error");
 err = err != null ? err.trim() : "";
 if(candidates == null) candidates = Arrays.asList(new Object[]{});
%>

<%@include file="title.jsp"%>

<% if(!err.equals("")) { %>
<div style="text-align: center; color: red"><%=err%></div>
<% } %>

<form name="vote_form" method="POST" action="/servlets/vote">
<input type="hidden" name="cmd" value="confirm"/>

<table border="0" width="500" align="center">
<tr><th>
<p>You may vote for one or two candidates. Click on a name to select a
candidate (click a second time to de-select), click a second name (if you
wish), and click the submit button when you are satisfied with your
choice(s). You will then be prompted to confirm your choice(s). If
incorrect, you may press 'cancel' and vote again.</p>
</th></tr>
</table>

<table border="0" align="center"><tr><th>
<tr><td>
<table border="0" style="margin: 10px 20px 0px 20px; border: 1px solid black;" id="cand_table">
<tr>
    <td id="row_0" style="cursor: pointer" onmouseover="doHover(this)" onmouseout="makeSelections()" onclick="doSelect(this)">
      <img id="check_0" style="visibility: hidden" src="/images/checkmark.gif"/>
      None
      <input id="vote1_0" type="radio" name="candidate1" value="" style="visibility: hidden" />
      <input id="vote2_0" type="radio" name="candidate2" value="" style="visibility: hidden" />
    </td>
</tr>
<% int row = 1;
   Long pid;
   String person;
   Iterator it = candidates.iterator();
   while(it.hasNext()){
     person = (String)it.next(); %>
     <tr>
       <td id="<%="row_"+row%>" style="cursor: pointer" onmouseover="doHover(this)" onmouseout="makeSelections()" onclick="doSelect(this)">
         <img id="<%="check_"+row%>" style="visibility: hidden" src="/images/checkmark.gif"/>
         <%= person %>
         <input id="<%="vote1_"+row%>" type="radio" name="candidate1" value="<%=person%>" style="visibility: hidden" />
         <input id="<%="vote2_"+row%>" type="radio" name="candidate2" value="<%=person%>" style="visibility: hidden" />
       </td>
     </tr>
<%  row++; } %>
</table>

<div style="margin: 20px; text-align: right">
<input type="submit" value="Submit"/>
</div>

</td></tr></table>
</form>

<script type="text/javascript">
function doHover(elem){
	makeSelections();
	elem.style.backgroundColor = "#bbc9cf";
}
function doSelect(elem){
	var no_vote = document.getElementById("row_0");

	if(vote1 == elem)
		vote1 = no_vote;
	else if(vote2 == elem)
		vote2 = no_vote;
	else if(vote1 == no_vote)
		vote1 = elem;
	else if(vote2 == no_vote)
		vote2 = elem;
	else {
		vote2 = vote1;
		vote1 = elem;
	}

	makeSelections();
}
function makeSelections(){
	document.getElementById("vote1_0").checked = true;
	document.getElementById("vote2_0").checked = true;
	for(var i = 0; i < <%=candidates.size()%>+1; ++i){
		var row = document.getElementById("row_"+i);
		var check = document.getElementById("check_"+i);
		var v1 = document.getElementById("vote1_"+i);
		var v2 = document.getElementById("vote2_"+i);

		row.style.backgroundColor = "";
		check.style.visibility = "hidden";
		if(row == vote1) {
			row.style.backgroundColor = "#bbc9cf";
			check.style.visibility = "visible";
			v1.checked = true;
		}
		if(row == vote2) {
			row.style.backgroundColor = "#bbc9cf";
			check.style.visibility = "visible";
			v2.checked = true;
		}
	}
}
var vote1 = document.getElementById("row_0");
var vote2 = document.getElementById("row_0");
makeSelections();
</script>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
