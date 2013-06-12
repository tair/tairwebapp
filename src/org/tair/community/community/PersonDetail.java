/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.community.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.StringTokenizer;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import org.jboss.logging.Logger;
import org.tair.bs.community.BsAddress;
import org.tair.bs.community.BsAffiliation;
import org.tair.bs.community.BsCommunityAlias;
import org.tair.bs.community.BsCommunityKeyword;
import org.tair.bs.community.BsCommunityOrganism;
import org.tair.bs.community.BsCommunityPublication;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.BsPhone;
import org.tair.bs.community.BsUrl;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.faces.AbstractDetailBean;
import org.tair.faces.utilities.MessageFactory;
import org.tair.utilities.TextConverter;


/**
 * A Faces request managed bean class backing the Person Detail page. The
 * managed bean provides the load() method that PrettyFaces uses. The
 * isQueried() method is false until a valid Person is successfully queried. The
 * distributed cache maintains the object separately, so the bean does not cache
 * the object directly, it always queries the object.
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="f_person")
@RequestScoped
public class PersonDetail extends AbstractDetailBean {
  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;
  private static final Logger logger = Logger.getLogger(PersonDetail.class);
  /** TAIR person_id */
  private BigInteger id;
  /** Flag indicating successful person query */
  private boolean queried = false;

  /**
   * Load the person object using the person's community id. This is a Faces
   * action method called by the PrettyFaces mapping to initialize the person.
   * The PrettyFaces filter injects the id then calls load(). If the method
   * successfully queries the requested object, it sets the queried flag to
   * true. The getPerson() method enqueues Faces error messages if any exception
   * occurs.
   * 
   * @return null (display the page)
   * @see #getPerson()
   */
  public String load() {
    // Checks whether the person is valid and caches in the distributed cache
    getPerson();
    return null; // display person on page (redisplay current page)
  }

  /**
   * Get the person object.
   * 
   * @return a person object
   */
  private BsPerson getPerson() {
    BsPerson person = null;
    PersonDelegate delegate = null;
    try {
      delegate = CommunityDelegateFactory.getPersonDelegate();
      if (delegate != null) {
        // Use custom query with community id, not primary key query.
        person = delegate.getPersonByCommunityId(id);
        if (person != null) {
          setQueried(true);
        } else {
          MessageFactory.createWarning(logger,
                                       "Could not find community member with id "
                                           + id,
                                       "Loading community detail");
        }
      }
    } catch (Throwable t) {
      // Some other exception, report problem
      MessageFactory.createErrorFromException(logger,
                                              t,
                                              "Could not query person with id "
                                                  + id);
    }

    return person;
  }

  /**
   * Get the TAIR person id for the person.
   * 
   * @return a unique id for the person
   */
  public String getId() {
    if (id != null) {
      return id.toString();
    } else {
      return null;
    }
  }

  /**
   * Set the integer TAIR person id for the person. This fires the query of the
   * internal GuiPerson object that supports the other getters.
   * 
   * @param id a unique id for the person
   */
  public void setId(String id) {
    if (!TextConverter.isEmpty(id)) {
      this.id = new BigInteger(id);
    } else {
      this.id = null;
    }
  }

  /**
   * Get the person's name.
   * 
   * @return the name
   */
  public String getName() {
    String name = "";
    BsPerson person = getPerson();
    if (person != null) {
      name = person.getCommunity().getName();
    }
    return name;
  }

  /**
   * Return the person's author-name aliases as a list of aliases separated by
   * "; ".
   * 
   * @return the constructed list of aliases as a string
   */
  public String getAuthorNames() {
    String namesString = null;
    BsPerson person = getPerson();
    if (person != null) {
      // Extract author names from alias collection.
      List<String> names = new ArrayList<String>();
      for (BsCommunityAlias alias : person.getCommunity().getAliases()) {
        if (alias.getAuthorName()) {
          names.add(alias.getAlias());
        }
      }
      namesString = getStringList(names, ";");
    }

    return namesString;
  }

  /**
   * Return the person's aliases as a list of aliases separated by "; ".
   * 
   * @return the constructed list of aliases as a string
   */
  public String getOtherNames() {
    String others = null;
    BsPerson person = getPerson();
    if (person != null) {
      // Extract non-author-name aliases from alias collection.
      List<String> aliases = new ArrayList<String>();
      for (BsCommunityAlias alias : person.getCommunity().getAliases()) {
        if (!alias.getAuthorName()) {
          aliases.add(alias.getAlias());
        }
      }
      others = getStringList(aliases, ";");
    }

    return others;
  }

  /**
   * Get the TAIR accession number (TAIR community id) for the person.
   * 
   * @return the TAIR community id
   */
  public String getTairAccession() {
    BsPerson person = getPerson();
    if (person != null) {
      return person.getCommunity().getAccession();
    } else {
      return null;
    }
  }

  /**
   * Get the TAIR community id for curatorial purposes.
   * 
   * @return the TAIR community id
   */
  public String getCommunityId() {
    BsPerson person = getPerson();
    if (person != null) {
      return person.getCommunity().getCommunityId().toString();
    } else {
      return null;
    }
  }

  /**
   * Get the TAIR person id for curatorial purposes.
   * 
   * @return the TAIR person id
   */
  public String getPersonId() {
    BsPerson person = getPerson();
    if (person != null) {
      return person.getPersonId().toString();
    } else {
      return null;
    }
  }

  /**
   * Get the primary job title for the person.
   * 
   * @return the job title
   */
  public String getPrimaryJobTitle() {
    BsPerson person = getPerson();
    if (person != null) {
      return person.getPrimaryJobTitle();
    } else {
      return null;
    }
  }

  /**
   * Get the research interest for the person.
   * 
   * @return the statement of research interest
   */
  public String getResearchInterest() {
    BsPerson person = getPerson();
    if (person != null) {
      return person.getResearchInterest();
    } else {
      return null;
    }
  }

  /**
   * Get the full address of the person as an array of strings. This address
   * contains all the address elements.
   * 
   * @return the address
   */
  public List<String> getFullAddress() {
    List<String> list = null;
    BsPerson person = getPerson();
    if (person != null) {
      list = new ArrayList<String>();
      // Extract the first address from the collection of addresses.
      BsAddress address = null;
      for (BsAddress addressObject : person.getCommunity().getAddresses()) {
        address = addressObject;
        break;
      }
      if (address != null) {
        String addressString = address.getAddress();
        if (addressString != null) {
          StringTokenizer tokenizer = new StringTokenizer(addressString, "\\");
          while (tokenizer.hasMoreTokens()) {
            list.add(tokenizer.nextToken());
          }
        }
        // Add city, state/region, and postal code, testing for nulls
        list.add(address.getCity()
                 + (address.getRegion() == null ? "" : ", "
                                                       + address.getRegion())
                 + (address.getPostalCode() == null ? ""
                     : " " + address.getPostalCode()));
        if (address.getCountryObject() != null && address.getCountryObject().getName() != null) {
          list.add(address.getCountryObject().getName());
        }
      }
    }
    return list;
  }

  /**
   * Get the person's email address.
   * 
   * @return an email address
   */
  public String getEmail() {
    BsPerson person = getPerson();
    if (person != null) {
      return person.getCommunity().getEmail();
    } else {
      return null;
    }
  }

  /**
   * Get a list of web site URLs for the user's web sites.
   * 
   * @return a list of web site URLs
   */
  public List<String> getWebSites() {
    List<String> urlStrings = null;
    BsPerson person = getPerson();
    if (person != null) {
      urlStrings = new ArrayList<String>();
      try {
        for (BsUrl url : person.getCommunity().getUrl()) {
          urlStrings.add(url.getUrl());
        }
      } catch (SQLException e) {
        MessageFactory.createErrorFromException(logger,
                                                e,
                                                "Could not query community member URLs for person "
                                                    + id);
      }
    }
    return urlStrings;
  }

  /**
   * Get the number of web sites in the list of URLs.
   * 
   * @return the count of web sites
   */
  public int getWebSiteCount() {
    int count = 0;
    BsPerson person = getPerson();
    if (person != null) {
      try {
        count = person.getCommunity().getUrl().size();
      } catch (SQLException e) {
        MessageFactory.createErrorFromException(logger,
                                                e,
                                                "Could not query community member URL count for person "
                                                    + id);
      }
    }
    return count;
  }

  /**
   * Get a phone number of a specified type.
   * 
   * @param type the type of phone: work, lab, home, fax, mobile, unknown
   * @return
   */
  private String getPhone(String type) {
    String phoneNumber = null;
    BsPerson person = getPerson();
    // Get the collection of phones for the community member, extract first
    // phone of the specified type.
    if (person != null) {
      for (BsPhone phone : person.getCommunity().getPhones()) {
        if (phone.getPhoneType().equalsIgnoreCase(type)) {
          phoneNumber = phone.getPhoneNumber();
          break; // first one found
        }
      }
    }
    return phoneNumber;
  }

  /**
   * Get the person's office phone.
   * 
   * @return a phone number
   */
  public String getOfficePhone() {
    return getPhone("work");
  }

  /**
   * Get the person's laboratory phone.
   * 
   * @return a phone number
   */
  public String getLabPhone() {
    return getPhone("lab");
  }

  /**
   * Get the person's mobile phone.
   * 
   * @return a phone number
   */
  public String getMobilePhone() {
    return getPhone("mobile");
  }

  /**
   * Get the person's fax phone number.
   * 
   * @return a fax number
   */
  public String getFax() {
    return getPhone("fax");
  }

  /**
   * Get a list of the person's affiliations to organizations.
   * 
   * @return a list of affiliations
   */
  public Collection<BsAffiliation> getAffiliations() {
    Collection<BsAffiliation> affiliations = null;
    BsPerson person = getPerson();
    if (person != null) {
      try {
        affiliations = person.getCommunity().getAffiliation();
      } catch (SQLException e) {
        MessageFactory.createErrorFromException(logger,
                                                e,
                                                "Could not query community member affiliations for person "
                                                    + id);
      }
    }
    return affiliations;
  }

  /**
   * Get a string list with the organisms of interest.
   * 
   * @return a string list of organisms
   */
  public String getOrganisms() {
    String organisms = null;
    BsPerson person = getPerson();
    if (person != null) {
      // Extract organism names into a list.
      ArrayList<String> organismStrings = new ArrayList<String>();
      for (BsCommunityOrganism organism : person.getCommunity().getOrganisms()) {
        organismStrings.add(organism.getOrganism());
      }
      organisms = getStringList(organismStrings, ",");
    }
    return organisms;
  }

  /**
   * Get a string list with the community keywords, including the organisms of
   * interest.
   * 
   * @return a string list of keywords
   */
  public String getKeywords() {
    String keywords = null;
    BsPerson person = getPerson();
    if (person != null) {
      // Extract the keywords into a list of strings.
      ArrayList<String> keywordStrings = new ArrayList<String>();
      for (BsCommunityKeyword keyword : person.getCommunity().getKeywords()) {
        keywordStrings.add(keyword.getKeyword());
      }
      // Convert the list into a comma-separated string.
      keywords = getStringList(keywordStrings, ",");
    }
    return keywords;
  }

  /**
   * Get a collection of the person's publications.
   * 
   * @return a collection of publications
   */
  public List<BsCommunityPublication> getPublications() {
    List<BsCommunityPublication> list = null;
    BsPerson person = getPerson();
    if (person != null) {
      try {
        list = person.getCommunity().getPublications();
      } catch (SQLException e) {
        MessageFactory.createErrorFromException(logger,
                                                e,
                                                "Could not query community member publications for person "
                                                    + id);
      }
    }
    return list;
  }

  /**
   * Get the number of publications in the publication list for the person.
   * 
   * @return the publication count
   */
  public int getPublicationCount() {
    int count = 0;
    BsPerson person = getPerson();
    if (person != null) {
      try {
        count = person.getCommunity().getPublications().size();
      } catch (SQLException e) {
        MessageFactory.createErrorFromException(logger,
                                                e,
                                                "Could not query community member publication count for person "
                                                    + id);
      }
    }
    return count;
  }

  /**
   * Get the date the person's record was last updated.
   * 
   * @return a date
   */
  public Timestamp getLastUpdated() {
    Timestamp lastUpdated = null;
    BsPerson person = getPerson();
    if (person != null) {
      lastUpdated = person.getCommunity().getLastUpdated();
    }
    return lastUpdated;
  }

  /**
   * Set the queried flag.
   * 
   * @param queried the queried to set
   */
  public void setQueried(boolean queried) {
    this.queried = queried;
  }

  /**
   * Was the person actually queried? This flag is set by the load() method as a
   * helper for Faces pages trying to display the person.
   * 
   * @return true if the person was queried, false if not
   */
  public boolean isQueried() {
    return queried;
  }
}
