<% 
String downloadText = (String) request.getAttribute( "downloadText" ); 

// manually set content type to plain text for download to browser
response.setContentType( "text/plain" );
out.write( downloadText);

// manually close output stream to avoid extra new line chars
// jsp compiler will automatically put in
//out.close();
%>
