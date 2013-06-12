<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" />

    <!--Set up the html page-->
    <xsl:template match="/">
        <html>
            <head><title>TAIR-Sitemap</title></head>
        <body>
        <!--Content-->
        <h3 class="mainheader">TAIR Sitemap</h3>
        <p> Click below to get to a particular section of the site map.</p>
        <xsl:for-each select="self::page[@name]">
                
                <!--Prints out the children of the first node for header-->
                <xsl:for-each select="page[@name]">
                        <xsl:sort select="@name"/>
                        <p><a href="{@url}"><xsl:value-of select="@name"/></a></p>
                </xsl:for-each>
               <xsl:apply-templates/>
        </xsl:for-each>
        <xsl:apply-templates/>
        </body>
       </html>
    </xsl:template>

   
                       
    <!--Finds all of the nodes and prints them out-->
    <xsl:template match="page[@name]">
        
        <!--Prints out the very first node-->
        <xsl:for-each select="self::page[@name]">
                
                <!--Sorts the node so that it is alphabetical-->
                <xsl:sort select="@name"/>
                <p><hr /><br />&#124;
                
                <xsl:for-each select="page[@name]">
                        <xsl:sort select="@name"/>
                       <a href="#{@name}"><xsl:value-of select="@name"/></a> &#124;
                </xsl:for-each>
                </p>
                
                <!--Prints out the children of the first node and so on-->
                <xsl:for-each select="page[@name]">
                        <xsl:sort select="@name"/>
                        <p><hr /><br /><a name="{@name}"></a> <a href="{@url}"><xsl:value-of select="@name"/></a></p>
                        <ul>
                        <xsl:for-each select="page[@name]">
                                <xsl:sort select="@name"/>
                                <li><a href="{@url}"><xsl:value-of select="@name"/></a></li>
                                <ul>
                                <xsl:for-each select="page[@name]">
                                        <xsl:sort select="@name"/>
                                        <li><a href="{@url}"><xsl:value-of select="@name"/></a></li>
                                        <ul>
                                        <xsl:for-each select="page[@name]">
                                            <xsl:sort select="@name"/>
                                            <li><a href="{@url}"><xsl:value-of select="@name"/></a></li>
                                        </xsl:for-each>
                                        </ul>
                                </xsl:for-each>
                                </ul>
                        </xsl:for-each>
                        </ul>
                </xsl:for-each>
               
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>

<!--End Content-->

  
