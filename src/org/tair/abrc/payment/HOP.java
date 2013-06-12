// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// ------------------------------------------------------------------------------
package org.tair.abrc.payment;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.MessagingException;
import javax.mail.internet.MimeUtility;


/**
 * This class implements the CyberSource Hosted Order Page Java logic. You get
 * much of the code by logging onto the CyberSource business center
 * (https://ebc.cybersource.com/) and generating the security script (go to the
 * sidebar Tools and Settings on the left, then to the Security item, then
 * choose the JSP option and generate the script). This produces a JSP page;
 * copy the Java code and paste it in place of the part of this class from the
 * top down to the comment about TAIR additions. You'll need to modify the
 * access for all methods to "static" and change the access class to protected
 * or public on certain members, compare with previous revisions.
 * 
 * @author Robert J. Muller
 */
public class HOP {
  /**
   * Get the internal merchant ID.
   * 
   * @return the merchant ID
   */
  protected static String getMerchantID() {
    return "abrc_osu";
  }

  /**
   * Get the internal shared secret.
   * 
   * @return the shared secret
   */
  protected static String getSharedSecret() {
    return "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDaj5IS+wVWHY5Z5TGWsYEhSpTv5RrrZnmfMWXIIpwoyrBJ5DnOiSs91W6tGdNdkZiZstLeyUlNeKiR26XFpFD5CjmZH00qXfkKsihWV8xj9geycEBA6eTAg83PpoqT0SZOkFxPcAJ/4EW9BPS0fA3uD/wmmGTeg1jho+MPIlhNUwIDAQAB";
  }

  /**
   * Get the internal serial number.
   * 
   * @return the serial number
   */
  protected static String getSerialNumber() {
    return "3100625456750176056177";
  }

  /**
   * Get a public digest using the shared secret.
   * 
   * @param customValues
   * @return
   * @throws Exception
   */
  public static String getPublicDigest(String customValues) throws Exception {
    String pub = getSharedSecret();
    Mac sha1Mac = Mac.getInstance("HmacSHA1");
    SecretKeySpec publicKeySpec = new SecretKeySpec(pub.getBytes(), "HmacSHA1");
    sha1Mac.init(publicKeySpec);
    byte[] publicBytes = sha1Mac.doFinal(customValues.getBytes());
    String publicDigest = encodeBase64(publicBytes);
    return publicDigest.replaceAll("\n", "");
  }

  /**
   * Insert a signature from a map of signatures.
   * 
   * @param map - Map containing fields that are to be signed. Can only contain
   *          fields and values that should not be changed. At the very minimum,
   *          map should contain 'amount', 'currency', and
   *          'orderPage_transactionType' if 'orderPage_transactionType' is
   *          'subscription' or 'subscription_modify', the following are also
   *          required: 'recurringSubscriptionInfo_amount',
   *          'recurringSubscriptionInfo_numberOfPayments',
   *          'recurringSubscriptionInfo_frequency',
   *          'recurringSubscriptionInfo_startDate',
   *          'recurringSubscriptionInfo_automaticRenew' if
   *          'orderPage_transactionType' is 'subscription_modify' then
   *          'paySubscriptionCreateReply_subscriptionID' is also required
   * @return html of hidden fields
   */
  public static String insertSignature(Map<String, String> map) {
    if (map == null) {
      return "";
    }
    try {
      map.put("merchantID", getMerchantID());
      map.put("orderPage_timestamp", String.valueOf(System.currentTimeMillis()));
      map.put("orderPage_version", "7");
      map.put("orderPage_serialNumber", getSerialNumber());
      Set<String> keys = map.keySet();
      StringBuffer customFields = new StringBuffer();
      StringBuffer dataToSign = new StringBuffer();
      StringBuffer output = new StringBuffer();
      for (Iterator<String> i = keys.iterator(); i.hasNext();) {
        String key = (String)i.next();
        customFields.append(key);
        dataToSign.append(key + "=" + String.valueOf(map.get(key)));
        if (i.hasNext()) {
          customFields.append(',');
          dataToSign.append(',');
        }

        output.append("<input type=\"hidden\" name=\"");
        output.append(key);
        output.append("\" value=\"");
        output.append(String.valueOf(map.get(key)));
        output.append("\">\n");
      }
      if (customFields.length() > 0) {
        dataToSign.append(',');
      }
      dataToSign.append("signedFieldsPublicSignature=");
      dataToSign.append(getPublicDigest(customFields.toString()).trim());
      output.append("<input type=\"hidden\" name=\"orderPage_signaturePublic\" value=\""
                    + getPublicDigest(dataToSign.toString()) + "\">\n");
      output.append("<input type=\"hidden\" name=\"orderPage_signedFields\" value=\""
                    + customFields.toString() + "\">\n");
      return output.toString();
    } catch (Exception e) {
      e.printStackTrace();
      return "";
    }
  }

  /**
   * Insert a signature in a series of HTML tags.
   * 
   * @param amount
   * @param currency
   * @return
   */
  public static String insertSignature(String amount, String currency) {
    try {
      if (amount == null) {
        amount = "0.00";
      }
      if (currency == null) {
        currency = "usd";
      }
      String time = String.valueOf(System.currentTimeMillis());
      String merchantID = getMerchantID();
      String data = merchantID + amount + currency + time;
      String serialNumber = getSerialNumber();
      StringBuffer sb = new StringBuffer();
      sb.append("<input type=\"hidden\" name=\"amount\" value=\"");
      sb.append(amount);
      sb.append("\">\n<input type=\"hidden\" name=\"currency\" value=\"");
      sb.append(currency);
      sb.append("\">\n<input type=\"hidden\" name=\"orderPage_timestamp\" value=\"");
      sb.append(time);
      sb.append("\">\n<input type=\"hidden\" name=\"merchantID\" value=\"");
      sb.append(merchantID);
      sb.append("\">\n<input type=\"hidden\" name=\"orderPage_signaturePublic\" value=\"");
      sb.append(getPublicDigest(data));
      sb.append("\">\n<input type=\"hidden\" name=\"orderPage_version\" value=\"7\">\n");
      sb.append("<input type=\"hidden\" name=\"orderPage_serialNumber\" value=\"");
      sb.append(serialNumber);
      sb.append("\">\n");
      return sb.toString();
    } catch (Exception e) {
      e.printStackTrace();
      return "";
    }
  }

  /**
   * Insert a signature in a series of HTML tags.
   * 
   * @param amount
   * @param currency
   * @param orderPage_transactionType
   * @return
   */
  public static String insertSignature(String amount, String currency,
                                       String orderPage_transactionType) {
    try {
      if (amount == null) {
        amount = "0.00";
      }
      if (currency == null) {
        currency = "usd";
      }
      String time = String.valueOf(System.currentTimeMillis());
      String merchantID = getMerchantID();
      String data =
        merchantID + amount + currency + time + orderPage_transactionType;
      String serialNumber = getSerialNumber();
      StringBuffer sb = new StringBuffer();
      sb.append("<input type=\"hidden\" name=\"amount\" value=\"");
      sb.append(amount);
      sb.append("\">\n<input type=\"hidden\" name=\"orderPage_transactionType\" value=\"");
      sb.append(orderPage_transactionType);
      sb.append("\">\n<input type=\"hidden\" name=\"currency\" value=\"");
      sb.append(currency);
      sb.append("\">\n<input type=\"hidden\" name=\"orderPage_timestamp\" value=\"");
      sb.append(time);
      sb.append("\">\n<input type=\"hidden\" name=\"merchantID\" value=\"");
      sb.append(merchantID);
      sb.append("\">\n<input type=\"hidden\" name=\"orderPage_signaturePublic\" value=\"");
      sb.append(getPublicDigest(data));
      sb.append("\">\n<input type=\"hidden\" name=\"orderPage_version\" value=\"7\">\n");
      sb.append("<input type=\"hidden\" name=\"orderPage_serialNumber\" value=\"");
      sb.append(serialNumber);
      sb.append("\">\n");
      return sb.toString();
    } catch (Exception e) {
      e.printStackTrace();
      return "";
    }
  }

  /**
   * Insert a subscription signature in an HTML tag.
   * 
   * @param subscriptionAmount
   * @param subscriptionStartDate
   * @param subscriptionFrequency
   * @param subscriptionNumberOfPayments
   * @param subscriptionAutomaticRenew
   * @return
   */
  public static String insertSubscriptionSignature(
                                                   String subscriptionAmount,
                                                   String subscriptionStartDate,
                                                   String subscriptionFrequency,
                                                   String subscriptionNumberOfPayments,
                                                   String subscriptionAutomaticRenew) {
    if (subscriptionFrequency == null) {
      return "";
    }
    if (subscriptionAmount == null) {
      subscriptionAmount = "0.00";
    }
    if (subscriptionStartDate == null) {
      subscriptionStartDate = "00000000";
    }
    if (subscriptionNumberOfPayments == null) {
      subscriptionNumberOfPayments = "0";
    }
    if (subscriptionAutomaticRenew == null) {
      subscriptionAutomaticRenew = "true";
    }
    try {
      String data =
        subscriptionAmount + subscriptionStartDate + subscriptionFrequency
            + subscriptionNumberOfPayments + subscriptionAutomaticRenew;
      StringBuffer sb = new StringBuffer();
      sb.append("<input type=\"hidden\" name=\"recurringSubscriptionInfo_amount\" value=\"");
      sb.append(subscriptionAmount);
      sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_numberOfPayments\" value=\"");
      sb.append(subscriptionNumberOfPayments);
      sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_frequency\" value=\"");
      sb.append(subscriptionFrequency);
      sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_automaticRenew\" value=\"");
      sb.append(subscriptionAutomaticRenew);
      sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_startDate\" value=\"");
      sb.append(subscriptionStartDate);
      sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_signaturePublic\" value=\"");
      sb.append(getPublicDigest(data));
      sb.append("\">\n");
      return sb.toString();
    } catch (Exception e) {
      e.printStackTrace();
      return "";
    }
  }

  /**
   * Insert a subscription ID into an HTML output string.
   * 
   * @param subscriptionID the ID to insert
   * @return the HTML input tag string
   */
  public static String insertSubscriptionIDSignature(String subscriptionID) {
    if (subscriptionID == null) {
      return "";
    }
    try {
      StringBuffer sb = new StringBuffer();
      sb.append("<input type=\"hidden\" name=\"paySubscriptionCreateReply_subscriptionID\" value=\"");
      sb.append(subscriptionID);
      sb.append("\">\n<input type=\"hidden\" name=\"paySubscriptionCreateReply_subscriptionIDPublicSignature\" value=\"");
      sb.append(getPublicDigest(subscriptionID));
      sb.append("\">\n");
      return sb.toString();
    } catch (Exception e) {
      e.printStackTrace();
      return "";
    }
  }

  /**
   * Verify a signature.
   * 
   * @param data the data
   * @param signature the signature to verify against the data
   * @return
   */
  public static boolean verifySignature(String data, String signature) {
    if (data == null || signature == null) {
      return false;
    }
    try {
      String pub = getSharedSecret();
      Mac sha1Mac = Mac.getInstance("HmacSHA1");
      SecretKeySpec publicKeySpec =
        new SecretKeySpec(pub.getBytes(), "HmacSHA1");
      sha1Mac.init(publicKeySpec);
      byte[] publicBytes = sha1Mac.doFinal(data.getBytes());
      String publicDigest = encodeBase64(publicBytes);
      publicDigest = publicDigest.replaceAll("[\r\n\t]", "");
      return signature.equals(publicDigest);
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  /**
   * Verify the transaction signature.
   * 
   * @param map a map of transaction signatures keyed on signature name String
   * @return true if verified
   */
  public static boolean verifyTransactionSignature(Map<String, String> map) {
    if (map == null) {
      return false;
    }
    String transactionSignature = map.get("signedDataPublicSignature");
    if (transactionSignature == null) {
      return false;
    }
    String transactionSignatureFields = map.get("signedFields");
    if (transactionSignatureFields == null) {
      return false;
    }
    StringTokenizer tokenizer =
      new StringTokenizer(transactionSignatureFields, ",", false);
    StringBuffer data = new StringBuffer();
    while (tokenizer.hasMoreTokens()) {
      String key = tokenizer.nextToken();
      data.append(key + "=" + map.get(key));
      data.append(',');
    }
    data.append("signedFieldsPublicSignature=");
    try {
      data.append(getPublicDigest(transactionSignatureFields).trim());
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
    return verifySignature(data.toString(), transactionSignature);
  }

  /**
   * Translate TAIR country code to CyberSource country code
   * 
   * @param country the TAIR country code
   * @return the CyberSource country code
   */
  public static String translateCountryCode(String country) {
    String countryCode = null;
    if (country != null) {
      countryCode =
        countryCodes.containsKey(country) ? (String)countryCodes.get(country)
            : country;
    }
    return countryCode;
  }

  // Helpful python code to generate this list:
  // codes = """ paste tab delimited file """
  // codes = [c.split('\t') for c in codes.split('\n') if c]
  // for c in codes:
  // print ' put("%s","%s");' % (c[0],c[1])
  static Map<String, String> countryCodes = new HashMap<String, String>() {
    private static final long serialVersionUID = 1L;

    {
      put("Albania", "al");
      put("Algeria", "dz");
      put("American Samoa", "as");
      put("Andorra", "ad");
      put("Angola", "ao");
      put("Anguilla", "ai");
      put("Antigua", "ag");
      put("Argentina", "ar");
      put("Armenia", "am");
      put("Aruba", "aw");
      put("Australia", "au");
      put("Austria", "at");
      put("Azerbaijan", "az");
      put("Bahamas", "bs");
      put("Bahrain", "bh");
      put("Bangladesh", "bd");
      put("Barbados", "bb");
      put("Barbuda", "ag");
      put("Belarus", "by");
      put("Belgium", "be");
      put("Belize", "bz");
      put("Benin", "bj");
      put("Bermuda", "bm");
      put("Bhutan", "bt");
      put("Bolivia", "bo");
      put("Bonaire", "an");
      put("Botswana", "bw");
      put("Brazil", "br");
      put("British Virgin Islands", "vg");
      put("Brunei", "bn");
      put("Bulgaria", "bg");
      put("Burkina Faso", "bf");
      put("Burundi", "bi");
      put("Cambodia", "kh");
      put("Cameroon", "cm");
      put("Canada", "ca");
      put("Cape Verde", "cv");
      put("Cayman Islands", "ky");
      put("Central African Republic", "cf");
      put("Chad", "td");
      put("Channel Islands", "gb");
      put("Chile", "cl");
      put("Colombia", "co");
      put("Congo-Brazzaville", "cg");
      put("Congo-Kinshasa", "cg");
      put("Cook Islands", "ck");
      put("Costa Rica", "cr");
      put("Croatia", "hr");
      put("Cuba", "cu");
      put("Curacao", "an");
      put("Cyprus", "cy");
      put("Czech Republic", "cz");
      put("Denmark", "dk");
      put("Djibouti", "dj");
      put("Dominica", "dm");
      put("Dominican Republic", "do");
      put("Ecuador", "ec");
      put("Egypt", "eg");
      put("El Salvador", "sv");
      put("Equatorial Guinea", "gq");
      put("Eritrea", "er");
      put("Estonia", "ee");
      put("Ethiopia", "et");
      put("Faroe Islands", "fo");
      put("Fiji", "fj");
      put("Finland", "fi");
      put("France", "fr");
      put("French Guiana", "gf");
      put("French Polynesia", "pf");
      put("Gabon", "ga");
      put("Gambia", "gm");
      put("Georgia", "ge");
      put("Germany", "de");
      put("Ghana", "gh");
      put("Gibraltar", "gi");
      put("Greece", "gr");
      put("Greenland", "gl");
      put("Grenada", "gd");
      put("Guadeloupe", "gp");
      put("Guam", "gu");
      put("Guatemala", "gt");
      put("Guinea", "gn");
      put("Guinea Bissau", "gw");
      put("Guyana", "gy");
      put("Haiti", "ht");
      put("Honduras", "hn");
      put("Hong Kong", "hk");
      put("Hungary", "hu");
      put("Iceland", "is");
      put("India", "in");
      put("Indonesia", "id");
      put("Iran", "ir");
      put("Iraq", "iq");
      put("Ireland", "ie");
      put("Israel", "il");
      put("Italy", "it");
      put("Ivory Coast", "ci");
      put("Jamaica", "jm");
      put("Japan", "jp");
      put("Jordan", "jo");
      put("Kazakhstan", "kz");
      put("Kenya", "ke");
      put("Korea", "kr");
      put("Kuwait", "kw");
      put("Kyrgyzstan", "kg");
      put("Latvia", "lv");
      put("Lebanon", "lb");
      put("Lesotho", "ls");
      put("Liberia", "lr");
      put("Libya", "ly");
      put("Liechtenstein", "li");
      put("Lithuania", "lt");
      put("Luxembourg", "lu");
      put("Macau", "mo");
      put("Macedonia", "mk");
      put("Madagascar", "mg");
      put("Malawi", "mw");
      put("Malaysia", "my");
      put("Mali", "ml");
      put("Malta", "mt");
      put("Marshall Islands", "mh");
      put("Martinique", "mq");
      put("Mauritania", "mr");
      put("Mauritius", "mu");
      put("Mexico", "mx");
      put("Micronesia", "fm");
      put("Moldova", "md");
      put("Monaco", "mc");
      put("Mongolia", "mn");
      put("Montserrat", "ms");
      put("Morocco", "ma");
      put("Mozambique", "mz");
      put("Myanmar/Burma", "mm");
      put("Namibia", "na");
      put("Nepal", "np");
      put("Netherlands", "nl");
      put("Netherlands Antilles", "an");
      put("New Caledonia", "nc");
      put("New Zealand", "nz");
      put("Nicaragua", "ni");
      put("Niger", "ne");
      put("Nigeria", "ng");
      put("Norway", "no");
      put("Oman", "om");
      put("Pakistan", "pk");
      put("Palau", "pw");
      put("Panama", "pa");
      put("Papua New Guinea", "pg");
      put("Paraguay", "py");
      put("People's Republic of China", "cn");
      put("Peru", "pe");
      put("Philippines", "ph");
      put("Poland", "pl");
      put("Portugal", "pt");
      put("Puerto Rico", "pr");
      put("Qatar", "qa");
      put("Reunion", "re");
      put("Romania", "ro");
      put("Russia", "ru");
      put("Rwanda", "rw");
      put("Saba", "an");
      put("Saipan", "mp");
      put("San Marino", "sm");
      put("Saudi Arabia", "sa");
      put("Senegal", "sn");
      put("Seychelles", "sc");
      put("Sierra Leone", "sl");
      put("Singapore", "sg");
      put("Slovak Republic", "sk");
      put("Slovenia", "si");
      put("Somalia", "so");
      put("South Africa", "za");
      put("Spain", "es");
      put("Sri Lanka", "lk");
      put("St. Barthelemy", "vc");
      put("St. Croix", "vi");
      put("St. Eustatius", "an");
      put("St. Kitts and Nevis", "kn");
      put("St. Lucia", "lc");
      put("St. Maarten/St. Martin", "vc");
      put("St. Thomas", "vc");
      put("St. Vincent", "vc");
      put("Sudan", "sd");
      put("Suriname", "sr");
      put("Swaziland", "sz");
      put("Sweden", "se");
      put("Switzerland", "ch");
      put("Syria", "sy");
      put("Tadjikistan", "tj");
      put("Taiwan", "tw");
      put("Tanzania", "tz");
      put("Thailand", "th");
      put("Togo", "tg");
      put("Tortola", "vg");
      put("Trinidad and Tobago", "tt");
      put("Tunisia", "tn");
      put("Turkey", "tr");
      put("Turkmenistan", "tm");
      put("Turks and Caicos Islands", "tc");
      put("U.S. Virgin Islands", "vi");
      put("Uganda", "ug");
      put("Ukraine", "ua");
      put("United Arab Emirates", "ae");
      put("United Kingdom", "gb");
      put("Uruguay", "uy");
      put("USA", "us");
      put("Uzbekistan", "uz");
      put("Vanuatu", "vu");
      put("Vatican City", "va");
      put("Venezuela", "ve");
      put("Vietnam", "vn");
      put("Wallis and Futuna", "wf");
      put("Yemen", "ye");
      put("Yugoslavia", "rs");
      put("Zambia", "zm");
      put("Zimbabwe", "zw");
    }
  };

  /**
   * Encode an input byte array using Base-64 encoding and return as a String.
   * 
   * @param publicBytes the byte array to encode
   * @return the encoded byte array as a String
   * @throws MessagingException when there is an encoding problem
   * @throws IOException when there is a problem reading the byte array
   */
  private static String encodeBase64(byte[] publicBytes)
      throws MessagingException, IOException {
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    OutputStream b64os = MimeUtility.encode(baos, "base64");
    b64os.write(publicBytes);
    b64os.close();
    String publicDigest = new String(baos.toByteArray());
    return publicDigest;
  }
}
