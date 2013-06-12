/*
 * $Id: NotifiedByCompletion.java,v 1.7 2003/09/10 17:16:39 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/
package org.tair.servlet;

/**
  * This is a generic interface which entities which
  * need to be notified of the completion of an action
  * can call.  
  **/

public interface NotifiedByCompletion
{

  /**
    * Let the target know the action is complete
    **/
  public void completionNotification();

}
