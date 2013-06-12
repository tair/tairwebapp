<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.regex.*" %>

<%!

   /**
      Method to get the source code of a website
      @param httpUrl the url of the website to retrieve
      @return the source code of the requested website as a string
   */
   public String getWebSource(String httpUrl)
   {
       try
       {
           URL url = new URL(httpUrl);
	   URLConnection connection = url.openConnection();
	   InputStream stream = 
	       new BufferedInputStream(connection.getInputStream());
	   StringBuffer buffer = new StringBuffer();
	   int ch;
	   while ((ch = stream.read()) != -1)
	   {
	       buffer.append((char)ch);
	   }
	   return buffer.toString();
	}
	catch (IOException e)
	{
	   return null;
	}
    }

    /** 
       Method to replace everything in a string with something else
       @param originalString the string that this method will operate on
       @param replaceWhat what pattern in originalString to replace
       @param replaceWith the pattern to replace with
       @return a string with the replacements done
    */
    public String replaceAll(String originalString, String replaceWhat,
        String replaceWith)
    {
        Pattern pattern = Pattern.compile(replaceWhat);
	Matcher matcher = pattern.matcher(originalString);
	return matcher.replaceAll(replaceWith);
    }

    /**
       Method to replace the first occurance of a pattern with something else
       @param originalString the string that this method will operate on
       @param replaceWhat what pattern in originalString to replace
       @param replaceWith the pattern to replace with
       @return a string with the replacement done
    */    
    public String replaceFirst(String originalString, String replaceWhat,
        String replaceWith)
    {
        Pattern pattern = Pattern.compile(replaceWhat);
	Matcher matcher = pattern.matcher(originalString);
	return matcher.replaceFirst(replaceWith);
    }
   
%>

<%

   // Get the sequences to send to EBI ClustalW
   String sequences = "";
   if (request.getParameter("sequences") != null)
   {
       sequences = request.getParameter("sequences");
   }

   String pageSrc = getWebSource("http://www.ebi.ac.uk/clustalw/");
   pageSrc = replaceAll(pageSrc, "openWindow\\('",
                        "openWindow('http://www.ebi.ac.uk/clustalw/");
   pageSrc = replaceAll(pageSrc, "http://www.ebi.ac.uk/clustalw/\\.\\./",
                        "http://www.ebi.ac.uk/");
   pageSrc = replaceAll(pageSrc, "\\.\\./", "http://www.ebi.ac.uk/");
   if (!(sequences.equals("")))
   {
       String replaceWhat = "</textarea>";
       String replaceWith = sequences + "</textarea>";
       pageSrc = replaceFirst(pageSrc, replaceWhat, replaceWith);
   }

   out.println(pageSrc);
%>
