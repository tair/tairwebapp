//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2006/01/18 00:13:34 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.xml.parsers.DocumentBuilderFactory;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.querytools.Donor;
import org.tair.querytools.Germplasm;
import org.tair.querytools.GermplasmPolymorphism;
import org.tair.querytools.Locus;
import org.tair.search.GeneModelLite;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcImage;
import org.tair.tfc.TfcSymbol;
import org.tair.utilities.DataConstants;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * MutantSeedCategory is a concrete sub-class of CatalogCategory that defines
 * methods and properties specific to the mutant seed stock category
 */

public class MutantSeedCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to return "mutant_seed"
     * as the name of this category
     * 
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "mutant_seed";
    }

    /**
     * Implements abstract method defined in superclass to return SQL query to
     * retrieve stock ids that make up mutant seed stock category. SQL query
     * will retrieve all stock ids that are associated to germplasms that have
     * associated polymorphisms with the "has_observable_phenotype" flag set to
     * true and have the Germplasm.is_mapping_strain flag set to false. Stocks
     * are sorted alphabetically by associated allele name
     * 
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {

        // Cardinality of stock to polymorphism will cause
        // multiple rows to be returned for each stock id
        // w/more than 1 allele , but duplicate filtering
        // should handle that when ids are saved from initial query
        String available = DataConstants.getAvailableStock();
        
        String query = "SELECT s.stock_id, p.name "
                       + "FROM Stock s, "
                       + "StockAvailabilityType sa, "
                       + "TairObject_Stock ts, "
                       + "Germplasm g, "
                       + "Germplasm_MapElement gm, "
                       + "Polymorphism p "
                       + "WHERE s.stock_availability_type_id = "
                       + "sa.stock_availability_type_id "
                       + "AND sa.stock_availability_type = "
                       + TextConverter.dbQuote( available ) 
                       + " "
                       + "AND s.stock_id = ts.stock_id "
                       + "AND ts.tair_object_id = g.tair_object_id "
                       + "AND g.germplasm_id = gm.germplasm_id "
                       + "AND gm.map_element_id = p.map_element_id "
                       + "AND p.is_obsolete = 'F' "
                       + "AND s.is_seed = 'T' "
                       + "AND s.is_obsolete = 'F' "
                       + "AND g.is_obsolete = 'F' "
                       + "AND ( g.is_mapping_strain = 'F' OR g.is_mapping_strain IS NULL) "
                       + "AND p.has_observable_phenotype = 'T' "
                       + "ORDER BY p.name ";

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on mutant seed
     * catalog page. Associated data for mutant seeds includes germplasm,
     * species variants, polymorphisms, genes, gene aliases, loci, stock donors
     * and germplasm images
     * 
     * @param conn
     *            An active connection to the database
     * @param stock
     *            Stock to populate
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock )
        throws SQLException {

        stock.populateGermplasm( conn );

        // get species variant through pedigree table if necessary
        stock.populatePedigreeSpeciesVariants( conn );

        // get polymorphisms for germplasm along w/genes and
        // gene full_name/alt_fullname aliases for each gene -
        // genes are retrieved through germplasm's polymorphisms
        // & are contained by GermplasmPolymorphism (subclass of
        // PolymorphismObject
        stock.populateGermplasmPolymorphisms( conn );

        stock.populateDonors( conn );
        stock.populateImages( conn );
    }

    /**
     * Creates display values for hyperlinks that allow user to scroll through
     * catalog pages. This method overrides the superclass implementation to
     * return the first allele/polymorphism names associated to the first and
     * last stocks shown on a given page. These values are displayed instead of
     * simple page numbers, as in superclass implementation.
     * 
     * <p>
     * Allele names are truncated to only show the alphabetic prefix of each
     * allele name. The display value should be the first n non-numeric
     * characters of the allele name. This is done to quickly isolate a "base
     * name" for the alleles. Logic supplied by Debbie at ABRC
     * 
     * @param stocks
     *            All stocks for category
     * @totalPages Total number of catalog pages needed to display stocks
     * @return Map containing each page number as an <code>Integer</code> key
     *         referencing a <code>String</code> value to use when displaying
     *         scrolling hyperlinks
     */
    protected Map<Integer, String> getPageLabels( CatalogStock[] stocks, int totalPages ) {
        HashMap<Integer, String> labels = new HashMap<Integer, String>();

        // get subset of stocks shown on each page and get first and last
        // values - this retrieval of page subset results in a duplication of
        // work, since subsets are retrieved again as part of
        // createPageCollection method in superclass, however the operations
        // can't be combined effectively (since labels need to have already been
        // created by the time this subset is created in createPageCollection) -
        // performance impact should be neglible and unimportant, since this
        // happens only during catalog population and not during runtime
        // retrieval
        for ( int i = 1; i <= totalPages; i++ ) {
            ScrollParams scrollParams = 
                ScrollCalculator.getScrollParams( i, getPageSize() );

            CatalogStock[] pageStocks = getArraySlice( stocks, scrollParams );
            String startEnd = getStartEndNames( pageStocks );
            Integer pageNumber = new Integer( i );

            labels.put( pageNumber, startEnd );
        }
        return labels;
    }

    /**
     * Utility method to retrieve the first allele name associated to first and
     * last stocks on a given catalog page.
     * 
     * @param stocks
     *            Stocks to show on a single catalog page
     * @return String containing allele names for the first and last stocks in
     *         stocks array; two names are separated by a "-"
     */
    @SuppressWarnings("unchecked")
    private String getStartEndNames( CatalogStock[] stocks ) {
        StringBuffer names = new StringBuffer();

        Germplasm germplasm = stocks[0].getGermplasm();
        Iterator<GermplasmPolymorphism> polyIter = germplasm.getPolymorphisms();
        GermplasmPolymorphism poly = (GermplasmPolymorphism) polyIter.next();
        names.append( getCharacterPrefix( poly.get_original_name() ) + "-" );

        int lastIndex = stocks.length - 1;
        germplasm = stocks[lastIndex].getGermplasm();
        polyIter = germplasm.getPolymorphisms();
        if (polyIter != null && polyIter.hasNext()) {
            poly = (GermplasmPolymorphism) polyIter.next();
            if (poly != null) {
                names.append( getCharacterPrefix( poly.get_original_name() ) );
            }
        }

        return names.toString();
    }

    /**
     * Creates label out of submitted allele name by keeping only the
     * non-numeric characters. This is done as a quick way to isolate a "base"
     * name for the submitted allele. The effect is to isolate "ap" from the
     * allele name "ap1-1".
     * 
     * @return String containing the first n characters from alleleName that are
     *         alphabetic (i.e. not punctuation or numeric) characters
     */
    private String getCharacterPrefix( String alleleName ) {
        char[] chars = alleleName.toCharArray();
        StringBuffer prefix = new StringBuffer();

        int i = 0;
        while ( i < chars.length && Character.isLetter( chars[i] ) ) {
            prefix.append( chars[i] );
            i++;
        }

        return prefix.toString();
    }

	public Document getPage(SearchResultsCollection pageObj) throws Exception
	{
		Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();

		Element title = doc.createElement("title");
		title.setTextContent("Characterized Mutant Lines");

		Element page = doc.createElement("MutantSeedCatalogPage");
		page.setAttribute("resultSize", Integer.toString(pageObj.getResultSize()));
		page.setAttribute("ceiling", Integer.toString(pageObj.getCeiling()));
		page.setAttribute("floor", Integer.toString(pageObj.getFloor()));
		page.appendChild(title);
		page.appendChild(getPagesElement(doc, pageObj.getPageLinks()));
		page.appendChild(getStocksElement(doc, (CatalogStock[]) pageObj.getResults()));

		doc.appendChild(page);
		return doc;
	}

	private Element getPagesElement(Document doc, Map<String,String> pageLinks) throws Exception
	{
		Element page, pages = doc.createElement("pages");
		for(String name: pageLinks.keySet()){
			page = doc.createElement("page");
			page.setAttribute("name", name);
			if(pageLinks.get(name) != null)
				page.setAttribute("href", pageLinks.get(name));
			pages.appendChild(page);
		}
		return pages;
	}

	private Element getStocksElement(Document doc, CatalogStock[] stocks) throws Exception
	{
		Element xstock, xgerm, xpoly, xpolys, xdonor, elem, xstocks = doc.createElement("stocks");

		for(CatalogStock stock: stocks)
		{
			xstock = doc.createElement("stock");
			xstocks.appendChild(xstock);
			xstock.setAttribute("name", stock.get_name());
			Germplasm germplasm = stock.getGermplasm();
			xgerm = doc.createElement("germplasm");
			xgerm.setAttribute("tair_object_id", Long.toString(germplasm.get_tair_object_id()));
			xstock.appendChild(xgerm);

			xpolys = doc.createElement("polymorphisms");
			xgerm.appendChild(xpolys);
			GermplasmPolymorphism poly = null;
			Iterator polyIter = germplasm.getPolymorphisms();
			while( polyIter != null && polyIter.hasNext()){
				poly = (GermplasmPolymorphism) polyIter.next();
				xpoly = doc.createElement("polymorphism");
				xpoly.setAttribute("ref_polymorphism_id", Long.toString(poly.get_ref_polymorphism_id()));
				xpoly.setAttribute("original_name", poly.get_original_name());
				xpolys.appendChild(xpoly);

				if(poly.hasGenes()){
					TreeSet<String> names = new TreeSet();
					GeneModelLite gene = null;
					for(Iterator geneIter = poly.getGenes(); geneIter.hasNext(); ){
						gene = (GeneModelLite) geneIter.next();
						if(gene.hasSymbols())
							for(TfcSymbol symbol : gene.getSymbols())
								names.add(symbol.get_full_name() != null ? symbol.get_full_name() : symbol.get_symbol());
					}
					xpoly.setAttribute("geneID", Long.toString(gene.getGeneID()));
					if(names.size() > 0){
						for(String sym: names){
							elem = doc.createElement("symbol");
							elem.setAttribute("name", sym);
							xpoly.appendChild(elem);
						}
					} else {
						elem = doc.createElement("gene");
						elem.setAttribute("name", gene.getName());
						xpoly.appendChild(elem);
					}
				}

				if(poly.hasLocus()){
					Locus locus = null;
					for(Iterator locusIter = poly.getLocus(); locusIter.hasNext();){
						locus = (Locus) locusIter.next();
						elem = doc.createElement("locus");
						elem.setAttribute("id", Long.toString(locus.get_locus_id()));
						elem.setAttribute("name", locus.get_name());
						xpoly.appendChild(elem);
					}
				}
			}

			if(germplasm.hasPedigreeSpeciesVariants()){
				String abbrevName = null;
				Long speciesVariantID = null;
				for(Iterator speciesVariantIter = germplasm.getPedigreeSpeciesVariants(); speciesVariantIter.hasNext();){
					elem = doc.createElement("PedigreeSpeciesVariant");
					abbrevName = (String) speciesVariantIter.next();
					elem.setAttribute("abbrevName", abbrevName);
					elem.setAttribute("id", Long.toString(germplasm.getPedigreeSpeciesVariantID(abbrevName)));
					xgerm.appendChild(elem);
				}
			}

			if(stock.hasDonors()){
				List distinct = new ArrayList();
				elem = doc.createElement("donors");
				xstock.appendChild(elem);
				Donor donor;
				String num;
				for(Iterator<Donor> it = stock.getDonors(); it.hasNext();)
				{
					donor = it.next();
					xdonor = doc.createElement("donor");
					xdonor.setAttribute("communityType", donor.getCommunityType());
					xdonor.setAttribute("communityId", donor.getCommunityID().toString());
					xdonor.setAttribute("displayName", donor.getDisplayName());
					num = donor.getDonorStockNumber();
					if(num != null && !distinct.contains(num))
						xdonor.setAttribute("stockNumber", num);
					distinct.add(num);
					elem.appendChild(xdonor);
				}
			}

			if(stock.hasImages()){
				TfcImage image = null;
				for(Iterator imageIter = stock.getImages(); imageIter.hasNext(); ){
					image = (TfcImage) imageIter.next();
					elem = doc.createElement("image");
					elem.setAttribute("id", Long.toString(image.get_image_id()));
					elem.setAttribute("linkSuffix", image.getLinkSuffix());
					xstock.appendChild(elem);
				}
			}

			String desc = germplasm.get_description();
			if(desc != null){
				elem = doc.createElement("description");
				elem.setTextContent(desc);
				xstock.appendChild(elem);
			}

			String cond = germplasm.get_special_growth_conditions();
			if(cond != null && !"none".equals(cond)){
				elem = doc.createElement("special_growth_conditions");
				elem.setTextContent(cond);
				xstock.appendChild(elem);
			}
		}

		return xstocks;
	}
}
