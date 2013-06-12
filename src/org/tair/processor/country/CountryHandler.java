// ------------------------------------------------------------------------------
// Copyright: (c) 2006 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.1 $
// $Date: 2006/02/15 22:42:34 $
// ------------------------------------------------------------------------------

package org.tair.processor.country;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsCountry;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;
import org.tair.community.LoginChecker;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.BigIntegerWebFormField;
import org.tair.utilities.BooleanWebFormField;
import org.tair.utilities.DateWebFormField;
import org.tair.utilities.IntegerWebFormField;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.WebFormField;

import com.poesys.db.InvalidParametersException;
import com.poesys.db.dto.DtoStatusException;
import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * UpdateStockHandler handles all requests to update a single stock record using
 * a web interface. Only updates of existing stocks can be done; new stock
 * additions must be done through manual database loading.
 */

public class CountryHandler implements RequestHandler {

  /**
   * Processes requests for various tasks involved in updating a single stock
   * record. Update actions are determined by the submitted value of the
   * "update_action" request parameter. Valid values of update_action are:
   * 
   * <ul>
   * <li>new_update or <code>null</code> - redirects user to page where they can
   * identify stock to update by entering its stock number</li>
   * <li>search - creates TfcStock object for stock with submitted stock number
   * and redirects user to form where they can edit field values for stock</li>
   * <li>update - updates stock with submitted form field values and saves
   * changes to the database</li>
   * </ul>
   * 
   * <p>
   * All actions in UpdateStockHandler are restricted to TAIR curators only.
   * 
   * @param request HttpServletRequest from OrderServlet
   * @return RequestHandlerResponse containing URL of JSP to redirect user to
   *         along with any objects needed for display.
   * @throws InvalidLoginException if user is not logged in
   * @throws UnauthorizedRequestException if user is not a TAIR curator
   * @throws SQLException if a database error occurs
   * @throws InvalidFormException if a validation error occurs when processing
   *           input from update form
   * @throws InvalidParameterException if an invalid update_action or stock id
   *           is received
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidLoginException, UnauthorizedRequestException, SQLException,
      InvalidFormException, InvalidParameterException {

    // make sure user is a logged in TAIR curator before proceeding
    checkLogin(request);

    RequestHandlerResponse response = null;

    String updateAction = request.getParameter("update_action");

    // if country to update hasn't been defined yet, redirect to
    // simple search page
    if (updateAction == null || updateAction.equals("new_update")) {
      response = new RequestHandlerResponse();
      response.setPage("/jsp/processor/country/find_update_country.jsp");

      // find existing country in collection or create
      // new one and display on maintenance page
    } else if (updateAction.equals("search")) {
      response = getCountry(request);

      // take input from maintenance form and update country
      // record with new values
    } else if (updateAction.equals("update")) {
      try {
        response = updateCountry(request);
      } catch (InvalidParametersException e) {
        throw new InvalidParameterException(e.getMessage(), e);
      } catch (DtoStatusException e) {
        throw new SQLException("Cannot set status to CHANGED");
      }
    } else {
      throw new InvalidParameterException("Invalid update action: "
                                          + updateAction);
    }

    return response;
  }

  /**
   * Ensure that requesting user is logged in as curator
   * 
   * @throws InvalidLoginException if user not logged in
   * @throws UnauthorizedRequestException if user not TAIR curator
   */
  private void checkLogin(HttpServletRequest request)
      throws InvalidLoginException, UnauthorizedRequestException {

    if (!LoginChecker.isLoggedIn(request)) {
      throw new InvalidLoginException("User not logged in");

    } else if (!LoginChecker.isTairCurator(request)) {
      throw new UnauthorizedRequestException("Not authorized for "
                                             + "this resource");
    }

  }

  /**
   * Finds existing country record for submitted country name and redirects to
   * maintenance page that displays country field values and allows updates. If
   * no country name is found in request, a new, blank country record is created
   * for inserting a new country
   * 
   * @param request HttpServletRequest from ProcessorServlet
   * @return RequestHandlerResponse containing stock object for submitted stock
   *         number and URL of JSP to redirect user to
   * @throws InvalidParameterException Ff no country record found for submitted
   *           country name This shouldn't happen as country names should be
   *           submitted from standard menu driven by database values.
   */
  private RequestHandlerResponse getCountry(HttpServletRequest request)
      throws InvalidParameterException {
    CountryDelegate delegate =
      CommunityDelegateFactory.getCountryDelegate();
    BsCountry country = null;

    String countryName = request.getParameter("country");

    // find existing record if country name submitted
    if (!TextConverter.isEmpty(countryName)) {
      country = delegate.getCountryByName(countryName);

      if (country == null) {
        throw new InvalidParameterException("No record found for "
                                            + "country: " + countryName);
      }

      // if no country in request, create a new object to be populated
      // by form and inserted
    } else {
      country = createNewCountry(delegate);
    }

    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setAttribute("country", country);
    response.setPage("/jsp/processor/country/update_country.jsp");

    return response;
  }

  /**
   * @param delegate
   * @return
   */
  private BsCountry createNewCountry(CountryDelegate delegate) {
    BsCountry country;
    // Create country, generating id with null.
    country =
      delegate.createCountry(null,
                             "",
                             BsCountry.StockCenter.ABRC.toString(),
                             false,
                             null,
                             new java.sql.Timestamp(System.currentTimeMillis()));
    return country;
  }

  /**
   * Update country with values from form submission and save record to the
   * database. This will update existing country or insert new record.
   * 
   * @param request HttpServletRequest from ProcessorServlet
   * @throws SQLException if a database error occurs
   * @throws InvalidActionException if country record is in an invalid state
   *           when trying to store to the database
   * @throws InvalidFormException if form submission is incorrect
   * @return RequestHandlerResponse with URL of JSP to redirect user to
   * @throws DtoStatusException when can't set status to CHANGED
   * @throws InvalidParametersException when an object is null
   */
  @SuppressWarnings("unchecked")
  private RequestHandlerResponse updateCountry(HttpServletRequest request)
      throws InvalidActionException, InvalidFormException, SQLException,
      InvalidParametersException, DtoStatusException {

    // retrieve form data from request and validate
    Map updateFields = validateFields(request);

    CountryDelegate delegate =
      CommunityDelegateFactory.getCountryDelegate();
    BsCountry country = null;

    // get country id from request for updating existing record -

    BigInteger countryId = (BigInteger)updateFields.get("country_id");
    if (countryId != null) {
      IPrimaryKey key = CommunityFactory.getCountryPrimaryKey(countryId);
      country = delegate.getObject((SequencePrimaryKey)key);
    }

    // create new record if no country found
    if (country == null) {
      country = createNewCountry(delegate);
    }

    // update with form contents
    updateCountryFields(country, updateFields);

    // insert or update country
    List<BsCountry> list = new ArrayList<BsCountry>(1);
    list.add(country);
    delegate.process(list);

    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setAttribute("country", country);
    response.setPage("/jsp/processor/country/country_updated.jsp");

    return response;

  }

  /**
   * Retrieves and validate form fields by creating an array of WebFormFields
   * where each field represents a form field submission, then retrieving and
   * validating each form field according to rules set in createWebFormFields.
   * 
   * @param request HttpServletRequest request from OrderServlet
   * @return Map containing validated form field values with field name as
   *         <code>String</code> key referencing type specific Object for each
   *         field
   * @throws InvalidFormException if any there are any validation errors with
   *           form submission
   */
  @SuppressWarnings("unchecked")
  private Map validateFields(HttpServletRequest request)
      throws InvalidFormException {

    List<WebFormField> fields = createWebFormFields();
    Map errors = new HashMap();
    Map values = new HashMap();

    //
    // Iterate through fields and validate each - save
    // validated web form value in values map with field
    // name as key.
    //
    // Save all validation errors to throw single exception
    // with all messages
    //
    WebFormField field = null;
    Iterator<WebFormField> iter = fields.iterator();
    while (iter.hasNext()) {
      field = iter.next();

      try {
        values.put(field.getFieldName(), field.validate(request));
      } catch (InvalidParameterException ipe) {
        errors.put(field.getFieldName(), ipe.getMessage());
      }
    }

    if (!errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }

    return values;
  }

  /**
   * Create List of web form field objects to retrieve and validate all input
   * values from web form
   */
  private List<WebFormField> createWebFormFields() {

    ArrayList<WebFormField> fields = new ArrayList<WebFormField>();

    // create numeric fields - params are field name and whether
    // field is required
    fields.add(new BigIntegerWebFormField("country_id", false));
    fields.add(new IntegerWebFormField("express_shipping_multiplier", false));

    // create boolean fields - params are field name and String value to
    // consider a Boolean true
    fields.add(new BooleanWebFormField("phytosanitary_required", "true"));

    // create text fields - params are field name, whether field is
    // required, and maximum number of characters allowed
    fields.add(new WebFormField("name", true, 30));
    fields.add(new WebFormField("stock_center", true, 12));
    fields.add(new DateWebFormField("date_last_modified", true));

    return fields;
  }

  /**
   * Retrieve all country properties from validated collection of web form field
   * values and update stock object with new values
   * 
   * @param conn An active connection to the database
   * @param country Country to update
   * @param values Map of validated country properties with field name as
   *          <code>String</code> key referencing typed value for that field
   * @throws DtoStatusException when can't set status to CHANGED
   * @throws InvalidParametersException when input country is null
   */
  @SuppressWarnings("unchecked")
  private void updateCountryFields(BsCountry country, Map values)
      throws SQLException, InvalidParametersException, DtoStatusException {

    country.setName((String)values.get("name"));
    country.setStockCenter((String)values.get("stock_center"));

    Boolean required = (Boolean)values.get("phytosanitary_required");
    country.setPhytosanitaryRequired(required);

    Integer multiplier = (Integer)values.get("express_shipping_multiplier");
    country.setExpressShippingMultiplier(multiplier);

    java.sql.Timestamp dateLastModified =
      new java.sql.Timestamp(((java.util.Date)values.get("date_last_modified")).getTime());

    country.setDateLastModified(dateLastModified);
  }

}
