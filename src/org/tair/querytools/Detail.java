//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2004/04/05 22:43:43 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import org.tair.tfc.*;

/**
 * Detail defines an interface to be implemented by all objects used to present
 * information on detail pages through TairServlet, which generically creates 
 * Detail objects through DetailFactory.  Since Detail objects must retrieve a 
 * great deal of data from the database, and since creating objects through an
 * abstract factory necessitates using the default, no parameter constructor, 
 * Detail interface defines two get_information methods (one using a numeric id, 
 * and one using object name) to be used by DetailFactory to populate objects 
 * after they are created.
 */

public interface Detail {

  public void get_information( DBconnection conn, String name ) throws SQLException;
  public void get_information( DBconnection conn, Long id ) throws SQLException;

}

