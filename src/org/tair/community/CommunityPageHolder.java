//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2005/09/14 16:22:19 $
//------------------------------------------------------------------------------
package org.tair.community;


/**
  * CommunityPageHolder centralizes the <code>String</code> values of all JSPs 
  * used in community functions.  Keeping all page names and locations in this 
  * class makes it easy to keep track of which pages are used for different 
  * functions, and localizes all literal information here.  Other community 
  * classes refer to page values through public accessors.
  */

public class CommunityPageHolder {

    // public methods to get page values -- allows us to change values of pages 
    // w/out recompiling classes that use pages


    public static final String getCuratorOrgPage() { 
        return "/jsp/community/curator_org.jsp"; 
    }

    public static final String getCuratorPersonPage() { 
        return "/jsp/community/curator_person.jsp"; 
    }


    public static final String getEditLabPage() { 
        return "/jsp/community/new_lab.jsp"; 
    }

    public static final String getEditOrgPage() {
        return "/jsp/community/new_organization.jsp"; 
    }

    public static final String getEditPersonPage() { 
        return "/jsp/community/new_person.jsp"; 
    } 

    public static final String getEmailSentPage() {
        return "/jsp/community/email_sent.jsp"; 
    }

    public static final String getLabSearchResultsPage() {
        return "/jsp/community/lab_search_results.jsp"; 
    }

    public static final String getLoggedOutPage() { 
        return "/jsp/common/logged_out.jsp"; 
    }

    public static final String getLoginPage() {
        return "/jsp/community/login.jsp"; 
    } 

    public static final String getOrgDetailPage() {
        return "/jsp/community/organization_detail.jsp"; 
    }

    public static final String getOrgProfilePage() { 
        return "/jsp/community/org_profile.jsp"; 
    } 

    public static final String getPersonDetailPage() {
        return "/jsp/community/person_detail.jsp"; 
    }

    public static final String getPersonProfilePage() {
        return "/jsp/community/person_profile.jsp"; 
    }

    public static final String getWelcomePage() { 
        return "/jsp/community/welcome.jsp"; 
    }

}
 
