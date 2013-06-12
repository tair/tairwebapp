/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.util.ArrayList;
import javax.management.ObjectName;
import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DetailCacheContextListener implements ServletContextListener
{
  public void contextDestroyed(ServletContextEvent sce) {
    try {
      for(MBeanServer mbs: (ArrayList<MBeanServer>) MBeanServerFactory.findMBeanServer(null))
        mbs.unregisterMBean(new ObjectName("TAIR:type=DetailCache,id="+DetailFactory.getCache().hashCode()));
    } catch(Exception e) {
      e.printStackTrace();
    }
  }

  public void contextInitialized(ServletContextEvent sce) {
    try {
      DetailCache cache = DetailFactory.getCache();
      for(MBeanServer mbs: (ArrayList<MBeanServer>) MBeanServerFactory.findMBeanServer(null))
        mbs.registerMBean(cache, new ObjectName("TAIR:type=DetailCache,id="+cache.hashCode()));
    } catch(Exception e) {
      e.printStackTrace();
    }
  }
}
