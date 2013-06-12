<% 
String downloadText = (String) request.getAttribute( "downloadText" ); 

// manually set content type to unknown prompt to download as file
response.setContentType( "text/plain" );
out.write( downloadText);

// manually close output stream to avoid extra new line chars
// jsp compiler will automatically put in
//out.close();
%>
