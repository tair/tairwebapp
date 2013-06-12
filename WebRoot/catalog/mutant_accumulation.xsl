<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="standard_page.xsl" />

	<xsl:template name="preamble">
		<h2>
			<xsl:value-of select="*/title" />
		</h2>
		<p>Sorted by stock number</p>
		<p>
			Displaying
			<xsl:value-of select="/MutantAccumulationCatalogPage/@floor" />
			-
			<xsl:value-of select="/MutantAccumulationCatalogPage/@ceiling" />
			of
			<xsl:value-of select="/MutantAccumulationCatalogPage/@resultSize" />
			in category
		</p>
	</xsl:template>

	<xsl:template name="table_header">
		<tr valign="bottom">
			<th class="sm">Order</th>
			<th class="sm">Stock #</th>
			<th class="sm">Donor/Donor&nbsp;Stock&nbsp;#</th>
			<th class="sm">Description</th>
		</tr>
	</xsl:template>

	<xsl:template name="main">
		<xsl:for-each select="MutantAccumulationCatalogPage/stocks/stock">
			<tr valign="top">
				<td class="sm" align="center">
					<input type="checkbox" name="stock_number" value="{@name}" />
				</td>
				<td class="sm" align="center" style="white-space: nowrap">
					<a
						href="/servlets/TairObject?type=germplasm&amp;id={germplasm/@tair_object_id}"
						target="_blank">
						<xsl:value-of select="@name" />
					</a>
				</td>
				<td class="sm" style="white-space: nowrap">
					<xsl:for-each select="donors/donor">
						<a
							href="/servlets/TairObject?type={@communityType}&amp;id={@communityId}"
							target="_blank">
							<xsl:value-of select="@displayName" />
						</a><xsl:if test="@donorStockNumber and @donorStockNumber != ''">/<xsl:value-of select="@donorStockNumber" /></xsl:if>
						<xsl:if test="not(position()=last())">
							<br />
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="sm">
					<xsl:value-of select="germplasm/@description" />
				</td>
			</tr>
			<tr>
				<td class="sm" colspan="7">
					<hr />
				</td>
			</tr>
		</xsl:for-each>
		<xsl:if test="/MutantAccumulationCatalogPage/@scrollLinks" >
			<tr>
				<td class="sm" colspan="7" align="center">
					<xsl:value-of select="/MutantAccumulationCatalogPage/@scrollLinks" disable-output-escaping="yes"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
