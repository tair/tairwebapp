<%!

private void appendSidebar( StringBuffer htmlBuf,
                            java.util.Vector titlesAndUrls,
                            String activeTitle,
                            java.util.Map subMenus )
{
    appendSidebar_core( htmlBuf, titlesAndUrls, activeTitle, subMenus, true );
}

private void appendSidebar_core( StringBuffer htmlBuf,
                                 java.util.Vector titlesAndUrls,
                                 String activeTitle,
                                 java.util.Map subMenus,
                                 boolean isTopLevel )
{
    // ---------- 1) valiate parameters. ----------

    if( htmlBuf == null )
    {
        throw new IllegalArgumentException( "htmlBuf must not be null" );
    }

    if( titlesAndUrls == null )
    {
        throw new IllegalArgumentException( "titlesAndUrls must not be null" );
    }

    if( titlesAndUrls.size() % 2 != 0 )
    {
        throw new IllegalArgumentException( "titlesAndUrls must have an even number of entries since each entry has (title,url), but the length was " + titlesAndUrls.size() );
    }

    // ---------- 3) write the html. ----------

    htmlBuf.append( "<!-- menu start -->\n" );
    htmlBuf.append( "<!-- active = " + activeTitle + " -->\n" );

    // TODO: move this out to a proper servlet?
    if( titlesAndUrls != null )
    {
        htmlBuf.append( "<ul" );
        // this is kind of a hack to make sure that id=leftnav
        // only appears once, at the top-level of the menu.
        if( isTopLevel )
        {
            htmlBuf.append( " id=\"leftnav\">\n" );
        }
        else
        {
            htmlBuf.append( ">\n" );
        }

        for( int iDex = 0; iDex < titlesAndUrls.size(); iDex += 2 )
        {
            String title = (String)titlesAndUrls.elementAt(iDex);
            String url = (String)titlesAndUrls.elementAt(iDex+1);

            htmlBuf.append( "\t" );

            if( title.equals(activeTitle) )
            {
                htmlBuf.append( "<li class=\"selected\">" );
            }
            else
            {
                htmlBuf.append( "<li>" );
            }

            if( url != null && false == url.equals("") )
            {
                htmlBuf.append( "<a href=\"" );
                htmlBuf.append( url );
                htmlBuf.append( "\">" );
                htmlBuf.append( title );
                htmlBuf.append( "</a>" );
            }
            else
            {
                htmlBuf.append( title );
            }

            // TODO: support more than one level deep?
            if( subMenus != null &&
                subMenus.get( title ) != null )
            {
                htmlBuf.append( "<!-- start submenu for " );
                htmlBuf.append( title );
                htmlBuf.append( " -->\n" );

                appendSidebar_core( htmlBuf,
                                    (java.util.Vector)subMenus.get(title),
                                    activeTitle,
                                    null,
                                    false );

                htmlBuf.append( "<!-- end submenu for " );
                htmlBuf.append( title );
                htmlBuf.append( " -->\n" );
            }

            htmlBuf.append( "</li>\n" );
        }

        htmlBuf.append( "</ul>\n" );
    }

    htmlBuf.append( "<!-- menu end -->\n" );
}

String generateSidebar( java.util.Vector titlesAndUrls,
                        String activeTitle,
                        java.util.Map subMenus )
{
    StringBuffer htmlBuf = new StringBuffer();

    htmlBuf.append( "<div id=\"leftcolumn\">\n" );
    appendSidebar( htmlBuf, titlesAndUrls, activeTitle, subMenus );
    htmlBuf.append( "</div>\n" );

    return( htmlBuf.toString() );
}

String generateSidebar( java.util.Vector titlesAndUrls,
                        String activeTitle )
{
    return(
           generateSidebar( titlesAndUrls, activeTitle, null )
           );
}

%>
