<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml"  version="1.0" omit-xml-declaration="yes" />
    <xsl:param name="id" select="'0'"/>
    <xsl:strip-space elements="page"/>

    <xsl:template match="/">
        <div id="breadcrumbs">
        <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="page[@id = $id]">
        <xsl:for-each select="ancestor::page">
            <a>
                <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
                <xsl:value-of select="@name"/>
            </a> &gt;
        </xsl:for-each> 
        
        <xsl:value-of select="@name"/>
        
    </xsl:template>

</xsl:stylesheet>

