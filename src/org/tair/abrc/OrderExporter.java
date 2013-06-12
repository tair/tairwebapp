// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.10 $
// $Date: 2006/03/20 18:03:14 $
// ------------------------------------------------------------------------------

package org.tair.abrc;


import java.sql.SQLException;
import java.util.Collection;

import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.stock.Stock;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.BsUrl;
import org.tair.utilities.DataConstants;
import org.tair.utilities.TextConverter;

import com.poesys.bs.delegate.DelegateException;


/**
 * OrderExporter is a class to encapsulate the creation of various exports of
 * order and stock data. Originally these methods were all in CompositeOrder,
 * but have been moved here to try to cut down on the size of that class. This
 * creates a strong binding between this class and CompositeOrder, however
 * CompositeOrder retains the public interface createABRCExport in order to keep
 * control and responsibility publicly for creating these exports.
 * 
 * <p>
 * OrderExporter offers a single package level interface to get all export data
 * for a single order. Exports may either be in "order" format, or "item"
 * format.
 * 
 * <p>
 * Order exports are formatted as follows:
 * 
 * <ol>
 * <li>order number</li>
 * <li>date order placed</li>
 * <li>date order complete</li>
 * <li>order status</li>
 * <li>purchase order number</li>
 * <li>orderer comments</li>
 * <li>ABRC comments</li>
 * <li>ABRC public comments</li>
 * <li>person community id</li>
 * <li>person id</li>
 * <li>person name (first & last)</li>
 * <li>person last name</li>
 * <li>person first name</li>
 * <li>person middle name</li>
 * <li>person street address</li>
 * <li>person city</li>
 * <li>person region</li>
 * <li>person zip code</li>
 * <li>person country</li>
 * <li>person work phone number</li>
 * <li>person lab phone number</li>
 * <li>person mobile number</li>
 * <li>person fax number</li>
 * <li>person email address</li>
 * <li>person url 1</li>
 * <li>person url 1 text</li>
 * <li>person url 2</li>
 * <li>person url 2 text</li>
 * <li>is user focus</li>
 * <li>is external curator</li>
 * <li>is obsolete</li>
 * <li>person status</li>
 * <li>is pi for this lab</li>
 * <li>primary job title</li>
 * <li>organization community id</li>
 * <li>organization id</li>
 * <li>organization name</li>
 * <li>organization street address</li>
 * <li>organization city</li>
 * <li>organization region</li>
 * <li>organization zip code</li>
 * <li>organization country</li>
 * <li>organization phone number</li>
 * <li>organization fax number</li>
 * <li>organization email</li>
 * <li>organization url 1</li>
 * <li>organization url 1 title</li>
 * <li>organization url 2</li>
 * <li>organization url 2 title</li>
 * <li>organization type</li>
 * <li>organization is commercial</li>
 * <li>organization is obsolete</li>
 * <li>organization status</li>
 * <li>organization seed stock center</li>
 * <li>order has express shipping charge (T/F)</li>
 * <li>order has phytosanitary charge (T/F)</li>
 * <li>order invoice id</li>
 * <li>DNA stock numbers</li>
 * <li>number of DNA stocks in order</li>
 * <li>seed stock numbers</li>
 * <li>number of seed stocks in order</li>
 * </ol>
 * 
 * <p>
 * If "item" export is selected, each line in export file will represent data
 * for a single selected stock. Each line will contain the following columns:
 * 
 * 
 * <ul>
 * <li>order number</li>
 * <li>stock number</li>
 * <li>quantity</li>
 * <li>waive charge</li>
 * <li>stock charge</li>
 * <li>item status</li>
 * <li>date last modified</li>
 * </ul>
 * 
 * (as defined in org.tair.abrc.stock.Stock class)
 * 
 */

public class OrderExporter {

  /**
   * Creates tab-delimited <code>String</code> of order shipping and billing
   * info for export to ABRC. This version allows creation of either "order"
   * export, formatted as other version of createABRCExport(), or "item" export,
   * in which case export consists of output from each selected
   * <code>Stock</code> object's createABRCExport() method.
   * 
   * @param order Order to create export for
   * @param stockNumbers Stock numbers from order to include in export
   * @param itemExport If <code>true</code> items will be exported in "item"
   *          format (as defined in org.tair.abrc.Stock object); if
   *          <code>false</code> data will be formatted in "order" format
   *          (defined within OrderExporter)
   * @return Tab delimited <code>String</code> containing all order or item
   *         export information
   */
  protected static String createABRCExport(CompositeOrder order,
                                           String[] stockNumbers,
                                           boolean itemExport) {
    StringBuffer msg = new StringBuffer();
    Stock stock = null;
    String dnaExport = null;
    String seedExport = null;

    if (itemExport) {
      for (int i = 0; i < stockNumbers.length; i++) {
        stock = order.getStock(stockNumbers[i]);
        appendStockInfo(order.get_order_number(), stock, msg);
      }

    } else {

      appendOrderInfo(order, msg);
      appendPersonInfo(order, msg);
      appendOrganizationInfo(order, msg);
      appendLineItemInfo(order, msg);

      dnaExport = getSelectedDNAExport(order, stockNumbers);
      msg.append(dnaExport);
      msg.append("\t");
      msg.append(order.getDNAStockCount() + "\t");

      seedExport = getSelectedSeedExport(order, stockNumbers);
      msg.append(seedExport + "\t");
      msg.append(order.getSeedStockCount() + "\t");
      msg.append(order.getStockCount());
      msg.append("\n");
    }

    return msg.toString();
  }

  /**
   * Creates a tab-delimited export of submitted stock's info for an "item"
   * download (as opposed to a full order download). Data is in following column
   * order:
   * 
   * <ul>
   * <li>order number</li>
   * <li>stock number</li>
   * <li>quantity</li>
   * <li>waive charge</li>
   * <li>stock charge</li>
   * <li>item status</li>
   * <li>date last modified</li>
   * </ul>
   * 
   * @param orderNumber Order number of order to append to export buffer
   * @param stock Stock containing data to append to export buffer
   * @param msg Export buffer to append data to
   */
  private static void appendStockInfo(Long orderNumber, Stock stock,
                                      StringBuffer msg) {
    msg.append(orderNumber + "\t");
    msg.append(stock.get_stock_number() + "\t");
    msg.append(stock.get_quantity() + "\t");
    msg.append(stock.get_waive_charge() + "\t");
    msg.append(stock.get_format_stock_charge() + "\t");
    msg.append(stock.get_status() + "\t");

    java.util.Date dateModified = stock.get_order_date_last_modified();
    String dateModifiedStr = TextConverter.dateToString(dateModified);
    msg.append(dateModifiedStr + "\n");
  }

  /**
   * Append order info. to export buffer
   * 
   * @param order Order to create export for
   * @param msg Export buffer to append data to
   */
  private static void appendOrderInfo(CompositeOrder order, StringBuffer msg) {
    msg.append(order.get_order_number() + "\t");
    msg.append(TextConverter.dateToString(order.get_order_date()) + "\t");
    msg.append(TextConverter.dateToString(order.get_date_complete()) + "\t");
    msg.append(order.get_status() + "\t");

    // if invoice type is PO, append payment ref id for PO #
    if (order.hasInvoice()) {
      CompositeInvoice invoice = order.getInvoice();
      String invoiceMethod = invoice.get_payment_method();
      String constantsMethod = DataConstants.getPurchaseOrderPaymentMethod();
      if (constantsMethod.equals(invoiceMethod)) {
        msg.append(invoice.get_payment_ref_id() + "\t");
      } else {
        msg.append("NULL\t");
      }
    } else {
      msg.append("NULL\t");
    }

    msg.append(TextConverter.dbToExportEmail(order.get_orderer_comments()
                                             + "\t"));

    msg.append(TextConverter.dbToExportEmail(order.get_ABRC_comments() + "\t"));
    msg.append(TextConverter.dbToExportEmail(order.get_ABRC_public_comments()
                                             + "\t"));

  }

  /**
   * Append data for person who placed order to export buffer
   * 
   * @param order Order to create export for
   * @param msg Export buffer to append data to
   */
  private static void appendPersonInfo(CompositeOrder order, StringBuffer msg) {
    // get reference to person object for data not
    // directly contained by order object
    BsPerson person = order.get_person();

    msg.append(order.get_person_community_id() + "\t");
    msg.append(order.get_person_id() + "\t");

    msg.append(order.get_person_first_name() + " "
               + order.get_person_last_name() + "\t");

    msg.append(order.get_person_last_name() + "\t");
    msg.append(order.get_person_first_name() + "\t");
    msg.append(person.getMiddleName() + "\t");

    msg.append(TextConverter.dbToExportEmail(order.get_person_address()) + "\t");

    msg.append(order.get_person_city() + "\t");
    msg.append(order.get_person_state() + "\t");
    msg.append(order.get_person_postal_code() + "\t");
    msg.append(order.get_person_country() + "\t");
    msg.append(order.get_person_phone() + "\t");

    msg.append(person.getCommunity().getPhone("lab") + "\t");
    msg.append(person.getCommunity().getPhone("mobile") + "\t");

    msg.append(order.get_person_fax() + "\t");
    msg.append(order.get_person_email() + "\t");

    try {
      appendURLs(msg, person.getCommunity().getUrl());
    } catch (SQLException e1) {
      throw new DelegateException("Could not lazily load URLs", e1);
    }

    msg.append(TextConverter.booleanToString(person.getUserFocus()) + "\t");

    msg.append(TextConverter.booleanToString(person.getExternalCurator())
               + "\t");

    msg.append(TextConverter.booleanToString(person.getCommunity().getObsolete())
               + "\t");

    msg.append(person.getCommunity().getMemberStatus() + "\t");

    // Get the organization submitting the order.
    BsOrganization organization = order.get_organization();

    try {
      msg.append(TextConverter.booleanToString(organization.hasAffiliate(person))
                 + "\t");
    } catch (SQLException e) {
      throw new DelegateException("Could not lazily load affiliates", e);

    }

    msg.append(person.getPrimaryJobTitle() + "\t");

  }

  /**
   * Append data for order's organization to export buffer
   * 
   * @param order Order to create export for
   * @param msg Export buffer to append data to
   */
  private static void appendOrganizationInfo(CompositeOrder order,
                                             StringBuffer msg) {
    // get reference to organization object for data not
    // directly contained by order object
    BsOrganization organization = order.get_organization();

    msg.append(order.get_organization_community_id() + "\t");
    msg.append(order.get_organization_id() + "\t");
    msg.append(order.get_organization_name() + "\t");

    msg.append(TextConverter.dbToExportEmail(order.get_organization_address())
               + "\t");

    msg.append(order.get_organization_city() + "\t");
    msg.append(order.get_organization_state() + "\t");
    msg.append(order.get_organization_postal_code() + "\t");
    msg.append(order.get_organization_country() + "\t");
    msg.append(order.get_organization_phone() + "\t");
    msg.append(order.get_organization_fax() + "\t");
    msg.append(order.get_organization_email() + "\t");

    try {
      appendURLs(msg, organization.getCommunity().getUrl());
    } catch (SQLException e) {
      throw new DelegateException("Could not lazily load URLs", e);
    }
    msg.append(organization.getCommunity().getCommunityType() + "\t");

    msg.append(TextConverter.booleanToString(order.get_organization_commercial())
               + "\t");

    msg.append(TextConverter.booleanToString(organization.getCommunity().getObsolete())
               + "\t");

    msg.append(organization.getCommunity().getMemberStatus() + "\t");
    msg.append(organization.getSeedStockCenter() + "\t");
  }

  /**
   * Utility method to append LineItem info to export buffer. LineItem info.
   * appended includes whether order has an express shipping charge, whether it
   * has a phytosanitary charge and order invoice id.
   * 
   *@param order Order to append data from
   *@param msg Buffer to append data to
   */
  private static void appendLineItemInfo(CompositeOrder order, StringBuffer msg) {

    Boolean hasCharge = new Boolean(order.hasExpressShippingCharge());
    msg.append(TextConverter.booleanToString(hasCharge) + "\t");

    Boolean hasPhyto = new Boolean(order.hasPhytosanitaryCharge());
    msg.append(TextConverter.booleanToString(hasPhyto) + "\t");

    if (order.hasInvoice()) {
      CompositeInvoice invoice = order.getInvoice();
      msg.append(invoice.get_invoice_id());
    } else {
      msg.append("NULL");
    }
    msg.append("\t");

  }

  /**
   * Utility method to append URL data to export buffer
   * 
   * @param msg Buffer to append data to
   * @param urls collection of BsUrl objects containing URLs and site names
   */

  private static void appendURLs(StringBuffer msg, Collection<BsUrl> urls) {
    int i = 0;
    if (urls != null && !urls.isEmpty()) {
      for (BsUrl url : urls) {
        msg.append(url.getUrl() + "\t");
        msg.append(url.getWebSiteName() + "\t");
        i++;
      }
    }

    // should never be more than 2 URLs - fill in blank spots w/literal
    // null entries
    while (i < 2) {
      String nullStr = null;
      msg.append(nullStr + "\t" + nullStr + "\t");
      i++;
    }
  }

  /**
   * Creates <code>String</code> of selected seed stock numbers in order for
   * export to ABRC. Stock numbers are separated by a single whitespace
   * character; if a stock has a quantity greater than 1, the stock number will
   * be repeated to match the quantity. Any stock with a stock charge waiver
   * will have a (NC) following the number. Only stock numbers contained in
   * supplied array will be included in export. This helpful for exporting full
   * order information along with information on selected stocks. If a requested
   * stock number is not in order, it will be skipped silently.
   * 
   * @param order Order to create export from
   * @return List of seed stock numbers, separated by a single whitespace
   *         character, or <code>null</code> if no requested stock numbers are
   *         are in order as seeds.
   */
  private static String getSelectedSeedExport(CompositeOrder order,
                                              String[] stockNumbers) {
    String export = null;
    StringBuffer seeds = null;
    Stock stock = null;
    int quantity = 0;

    if (stockNumbers != null && stockNumbers.length > 0) {
      for (int i = 0; i < stockNumbers.length; i++) {
        stock = order.getStock(stockNumbers[i]);
        if (stock != null && stock.is_seed()) {
          if (seeds == null) {
            seeds = new StringBuffer();
          } else {
            seeds.append(" ");
          }

          quantity = stock.get_quantity();
          while (quantity-- > 0) {
            seeds.append(stock.get_stock_number());
            if (stock.get_waive_charge() != null) {
              seeds.append(" (NC)");
            }
            if (quantity > 0) {
              seeds.append(" ");
            }
          }
        }
      }
      if (seeds != null) {
        export = seeds.toString();
      }
    }
    return export;
  }

  /**
   * Creates <code>String</code> of selected dna stock numbers in order for
   * export to ABRC. Stock numbers are separated by a single whitespace
   * character; if a stock has a quantity greater than 1, the stock number will
   * be repeated to match the quantity. Any stock with a stock charge waiver
   * will have a (NC) following the number. Only stock numbers contained in
   * supplied array will be included in export. This helpful for exporting full
   * order information along with information on selected stocks. If a requested
   * stock number is not in order, it will be skipped silently.
   * 
   * @param order Order to create export for
   * @return List of seed stock numbers, separated by a single whitespace
   *         character, or <code>null</code> if no requested stock numbers are
   *         are in order as dna stocks.
   */
  private static String getSelectedDNAExport(CompositeOrder order,
                                             String[] stockNumbers) {
    String export = null;
    StringBuffer dna = null;
    Stock stock = null;
    int quantity = 0;

    if (stockNumbers != null && stockNumbers.length > 0) {
      for (int i = 0; i < stockNumbers.length; i++) {
        stock = order.getStock(stockNumbers[i]);
        if (stock != null && !stock.is_seed()) {
          if (dna == null) {
            dna = new StringBuffer();
          } else {
            dna.append(" ");
          }
          quantity = stock.get_quantity();
          while (quantity-- > 0) {
            dna.append(stock.get_stock_number());
            if (stock.get_waive_charge() != null) {
              dna.append(" (NC)");
            }
            if (quantity > 0) {
              dna.append(" ");
            }
          }
        }
      }
      if (dna != null) {
        export = dna.toString();
      }
    }
    return export;
  }
}
