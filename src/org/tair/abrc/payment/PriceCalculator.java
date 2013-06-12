//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.39 $
// $Date: 2006/03/10 00:23:15 $
//------------------------------------------------------------------------------

package org.tair.abrc.payment;

import java.util.Iterator;

import org.tair.abrc.AbrcConstantCollection;
import org.tair.abrc.CompositeOrder;
import org.tair.abrc.stock.Stock;
import org.tair.bs.community.BsCountry;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;
import org.tair.tfc.TfcLineItem;
import org.tair.utilities.DataConstants;

/**
 * PriceCalculator serves as a central utility class for calculating different
 * charges for ABRC stock orders including order/shipping charges and express
 * shipping charges. Calculation routines are encapsulated here since the
 * charges are calculated using a variety of rules and to allow several
 * different parts of the ordering system code easy access to the same
 * functions.
 * 
 * <p>
 * The country a lab is from is an important part of these calculations. TO DO --
 * establish country specific multipliers ???
 * 
 * <p>
 * Additionally, the commercial or academic status of a lab is important in
 * determining charges since commercial labs will pay the regular fee multiplied
 * by a commercial multiplier constant (stored in AbrcConstants).
 * 
 * <p>
 * Essentially, PriceCalculator creates and edits the LineItem charges for each
 * stock order.
 */

public class PriceCalculator {

    /**
     * Determines the base order charge for a stock order. This value is
     * determined by retrieving the current value of the base charge from the
     * AbrcConstants collection. Base charge is then adjusted according to the
     * country the lab is in. Once calculated, a LineItem is created & for the
     * new charge and added to the order's collection of charges.
     * 
     * @param order
     *            Stock order to calculate order charge for
     */
    public static void setOrderCharge( CompositeOrder order ) {

        // get reference to constants collection singleton
        AbrcConstantCollection constants = AbrcConstantCollection.getInstance();

        // get current value of order charge
        float orderCharge = constants.getValue( "order charge" ).floatValue();

        // create or update order charge LineItem with newly calculated value
        String orderChargeType = DataConstants.getOrderChargeLineItem();
        TfcLineItem lineItem = getLineItem( order, orderChargeType );
        lineItem.set_amount( new Float( orderCharge ) );

    }

    /**
     * Calculates the express shipping charge to be applied to an order. The
     * base value for this charge is determined by the express_shipping_charge
     * field associated to an individual stock. If multiple stocks in the order
     * have express_shipping_charge values, the higher value is used for the
     * entire order.
     * 
     * <p>
     * Once the base charge has been established, a LineItem is created for the
     * new charge and added to the order's collection of charges.
     * 
     * @param order
     *            Stock order to calculate order charge for
     */
    public static void setExpressShippingCharge( CompositeOrder order, 
                                                 boolean isExpressShipping ) {
      CountryDelegate delegate = CommunityDelegateFactory.getCountryDelegate();
        // first, check to see if express shipping charge is mandatory or
        // user-selected
        // then, check all stocks in order and find highest express shipping
        // charge
        // 
        float expressCharge = 0;

        if ( order.hasStocks() ) {
            Stock stock = null;
            Float tmpCharge = null;
            boolean isExpressMandatory = false;

            for ( Iterator iter = order.getStocks(); iter.hasNext(); ) {
                stock = (Stock) iter.next();

                // stock with reship/curator etc. waiver should never
                // be used for express shipping 
                if ( stock.hasWaiver() ) {
                    continue;
                }
                
                // first check to see if the express shipping charge is
                // mandatory and if the user has
                // chosen express shipping
                isExpressMandatory = stock.express_shipping_required();

                if ( isExpressMandatory  || isExpressShipping ) {
                    tmpCharge = stock.get_express_shipping_charge();

                    // apply express shipping multiplier if lab's country
                    // requires it
                    String name = order.get_organization_country();
                    BsCountry country = delegate.getCountryByName(name);
                    if (country.getExpressShippingMultiplier() != null) {
                        tmpCharge = stock.get_express_shipping_charge();
                        Integer multiplier = country.getExpressShippingMultiplier();
                        tmpCharge = new Float( tmpCharge.floatValue() *
                                               multiplier.intValue() );
                    }

                    // skip charges for any stocks being forward to NASC
                    boolean isNASC = 
                        stock.get_status().equals( DataConstants.getNASCStock() );

                    // if tmpCharge is highest, save it
                    if ( !isNASC
                         && tmpCharge != null
                         && tmpCharge.floatValue() > expressCharge ) {
                        expressCharge = tmpCharge.floatValue();
                    }
                }
            }
        }
        
        // create or update LineItem for express shipping charge
        // with newly calculated value - only create if any stocks in order
        // require it
        if ( expressCharge > 0 ) {
            String expressShippingType = 
                DataConstants.getExpressShippingLineItem();
    
            TfcLineItem lineItem = getLineItem( order, expressShippingType );
            lineItem.set_amount( new Float( expressCharge ) );
            
            // else, if charge is 0 make sure to remove any pre-existing 
            // charge to ensure charge is removed if stock requiring it has
            // been deleted from order
        } else if ( order.hasInvoice() && order.hasExpressShippingCharge() ) {
            CompositeInvoice invoice = order.getInvoice();
            invoice.removeExpressShippingCharge();
        }
    }

    /**
     * Calculates the express shipping charge to be applied to an order. The
     * base value for this charge is determined by the express_shipping_charge
     * field associated to an individual stock. If multiple stocks in the order
     * have express_shipping_charge values, the higher value is used for the
     * entire order.
     * This does not add the express shipping charge to the Line Item Collect
     * It is only used on for the order summaries in the PO and Credit Card pages 
     * 
     * <p>
     * @param order
     *            Stock order to calculate order charge for
     */
    public static Float setCheckForExpressShipping( CompositeOrder order,
            boolean expressShipping ) {
      CountryDelegate delegate = CommunityDelegateFactory.getCountryDelegate();
		// first, check to see if express shipping charge is mandatory or
		// user-selected
		// then, check all stocks in order and find highest express shipping
		// charge
		// 
		float expressCharge = 0;
		
		if ( order.hasStocks() ) {
			Stock stock = null;
			Float tmpCharge = null;
		
			for ( Iterator iter = order.getStocks(); iter.hasNext(); ) {
    			stock = (Stock) iter.next();
    
                // stock with reship/curator etc. waiver should never
                // be used for express shipping 
                if ( stock.hasWaiver() ) {
                    continue;
                }
            	tmpCharge = stock.get_express_shipping_charge();
    
    
                // apply express shipping multiplier if lab's country
                // requires it
                String name = order.get_organization_country();
                BsCountry country = delegate.getCountryByName(name);
                if (country.getExpressShippingMultiplier() != null) {
                    tmpCharge = stock.get_express_shipping_charge();
                    Integer multiplier = country.getExpressShippingMultiplier();
                    tmpCharge = new Float( tmpCharge.floatValue() *
                                           multiplier.intValue() );
                }
                
                // skip charges for any stocks being forward to NASC
                boolean isNASC = 
                    stock.get_status().equals( DataConstants.getNASCStock() );
    
                // if tmpCharge is highest, save it
                if ( !isNASC
    					&& tmpCharge != null
    					&& tmpCharge.floatValue() > expressCharge ) {
    					expressCharge = tmpCharge.floatValue();
    			}
	        }
		}
		return new Float ( expressCharge );
	}


    /**
     * Iterates through all stocks in order and creates LineItem objects to
     * represent each stock_charge. LineItem stock charge is determined for each
     * stock order by multiplying the base price of the stock by the quantity
     * ordered. Base price of stock should have already been adjusted for
     * commercial lab status as stock was added to order, so no further
     * adjustment is performed here.
     * 
     * @param order
     *            Order to create stock charges for
     */
    public static void setStockCharges( CompositeOrder order ) {

        if ( order.hasStocks() ) {
            Stock stock = null;
            TfcLineItem lineItem = null;

            // create or update LineItem for each stock's charge
            for ( Iterator iter = order.getStocks(); iter.hasNext(); ) {
                stock = (Stock) iter.next();
                System.out.println(stock.get_status());
                if (stock.get_status().equals(DataConstants.getMTAStock())){
                    stock.set_stock_charge( new Float(0) );
                }
                lineItem = getStockLineItem( order, stock );
                lineItem.set_amount( getStockCharge( stock ) );
            }
        }
    }

    /**
     * Calculates line item charge for submitted stock by multiplying stock's
     * charge by the quantity ordered.
     * 
     * @param stock
     *            Stock to calculate charge for
     * @return Line item stock charge for stock
     */
    public static Float getStockCharge( Stock stock ) {
        float stockCharge = 0;

        // only set charges for stocks that don't have a waiver
        // applied to them
        if ( !stock.hasWaiver() ) {
            Float stockChargeObj = stock.get_stock_charge();
            int quantity = stock.get_quantity();

            if ( stockChargeObj != null ) {
                stockCharge = stockChargeObj.floatValue();
                stockCharge *= quantity;
            }
        }

        return new Float( stockCharge );
    }

  /**
     * Creates a phytosanitary charge line item and sets it for submitted order.
     * This charge is set for all seed stock orders going to labs outside of the
     * USA regardless of whether user has explicitly requested it or not.
     * 
     * @param order
     *            Order to create phytosanitary charge for
     */
    public static void setPhytosanitaryCharge( CompositeOrder order ) {
      CountryDelegate delegate = CommunityDelegateFactory.getCountryDelegate();
        // apply charge if seed stock in order and lab's country requires it
        String name = order.get_organization_country();
        BsCountry country = delegate.getCountryByName(name);

        if ( order.hasSeedStock() && country.getPhytosanitaryRequired()) {
            String phytoLineItem = 
                    DataConstants.getPhytosanitaryChargeLineItem();
            TfcLineItem item = getLineItem( order, phytoLineItem );
            AbrcConstantCollection constants = 
                AbrcConstantCollection.getInstance();
            Float phytoCharge = constants.getValue( "phytosanitary charge" );
            item.set_amount( phytoCharge );
        }
    }

    /**
     * Utility method to retrieve line item of submitted type from stock order's
     * invoice. If no line item for that type exists yet, one is created here to
     * have the submitted type value and status set as "unpaid". Calling code
     * should set the amount of the line item charge after object is retrieved
     * here. Any new items created here are automatically added to the invoice's
     * collection of line item charges.
     * 
     * NOTE: This method should not be used for get stock charge line items
     * since they cannot be identified by type alone. Stock charge line items
     * should be retrieved and initialized using the getStockLineItem method.
     * 
     * @param order
     *            Stock order containing invoice to create line item charge for
     * @param type
     *            Line item type to retrieve
     * @return Line item for submitted type
     */
    public static TfcLineItem getLineItem( CompositeOrder order, String type ) {
        CompositeInvoice invoice = order.getInvoice();
        TfcLineItem lineItem = invoice.getItemType( type );

        if ( lineItem == null ) {
            lineItem = new TfcLineItem();
            lineItem.set_type( type );
            lineItem.set_status( DataConstants.getUnpaidLineItem() );
            invoice.addLineItem( lineItem );
        }

        return lineItem;
    }

    /**
     * Utility method to retrieve stock charge line item for submitted stock in
     * order's invoice. If no line item for that stock exists yet, one is
     * created here to represent the charge for this specific stock. Calling
     * code should set the amount of the line item charge after object is
     * retrieved here. Any new items created here are automatically added to the
     * invoice's collection of line item charges.
     * 
     * NOTE: This method should only be used for get stock charge line items
     * since they cannot be identified by type alone. All other line item
     * charges should be retrieved and initialized using the getLineItem method.
     * 
     * @param order
     *            Stock order containing invoice to create line item charge for
     * @param stock
     *            Stock to find line item charge for
     * @return Stock charge line item for submitted stock
     */
    public static TfcLineItem getStockLineItem( CompositeOrder order,
                                               Stock stock ) {
        String stockType = DataConstants.getStockChargeLineItem();

        CompositeInvoice invoice = order.getInvoice();
        TfcLineItem lineItem = invoice.getStockItem( stock.get_stock_id() );

        if ( lineItem == null ) {
            lineItem = new TfcLineItem();
            lineItem.set_type( stockType );
            lineItem.set_status( DataConstants.getUnpaidLineItem() );
            lineItem.set_stock_id( stock.get_stock_id() );

            // orders-id will be NULL for new orders that haven't been
            // placed yet
            lineItem.set_orders_id( order.get_orders_id() );

            invoice.addLineItem( lineItem );
        }

        return lineItem;
    }

    /**
     * Gateway method to set all line item charges for order at once. Charges
     * calculated at this point include order charge, express shipping charge
     * and stock charges for any stocks in order
     * 
     * <p>
     * If lab has all ABRC fees waived (as recorded in community record), or if
     * order has been explicitly tagged to have no charges by curator, then all
     * charges calculated here will be waived.
     * 
     * <p>
     * If order contains only stocks with waivers (follow up, reship etc.), then
     * no other charges will be created for order since it's assumed that they
     * will be waived as well.
     * 
     * <p>
     * Line item charges are contained by order's invoice. If order's invoice
     * has not been created yet, it will be done now.
     * 
     * <p>
     * Invoice has a convenience field invoice_total to record the total charges
     * associated with an invoice (i.e. the total amounts of all LineItems for
     * the invoice). After calculating all LineItem charges here, this field
     * will be updated to hold the new total of all line items in invoice so
     * that client code can easily get an updated total for the invoice.
     * 
     * @param order
     *            Order to create line item charges for
     */
    public static void setAllCharges( CompositeOrder order, boolean expressShipping ) {

        Boolean waivedObj = order.get_organization_ABRC_fees_waived();
        boolean labFeesWaived = ( waivedObj != null && waivedObj.booleanValue() );

        waivedObj = order.get_no_charge();
        boolean orderFeesWaived = ( waivedObj != null && 
                                    waivedObj.booleanValue() );

        CompositeInvoice invoice = order.getInvoice();
        if ( invoice == null ) {
            invoice = new CompositeInvoice();
            order.setInvoice( invoice );
        }

        // if fees waived, go through all stocks in order to waive
        // charges for each
        if ( labFeesWaived || orderFeesWaived ) {

            Stock stock = null;
            String waiver = DataConstants.getCuratorNoCharge();
            if ( order.getStocks() != null ) {
                for ( Iterator iter = order.getStocks(); iter.hasNext(); ) {
                    stock = (Stock) iter.next();
                    stock.set_waive_charge( waiver );
                    stock.set_stock_charge( new Float( 0 ) );
                }
            }

            // remove any other charges previously set for order
            invoice.removeAllCharges();
            
            // else calculate line item charges for order
        } else {

            setStockCharges( order );

            if ( invoice.hasStockCharges() ) {
                setOrderCharge( order );

                //handles if the user has chosen express shipping 
                //if user has chosen express shipping, calculate the amount, 
                //put it in the lineitem collection, and add it to the total for the final result
                //if they haven't, check the shipping charge for mandatory express shipping
                if ( expressShipping ) {
                	setExpressShippingCharge( order, true );
                } else {
                	setExpressShippingCharge( order, false );
                }
                
                setPhytosanitaryCharge( order );

                // if invoice has no stock charges, remove any previously
                // calculated charges
            } else {
                invoice.removeAllCharges();

            }

        }
    }
}
