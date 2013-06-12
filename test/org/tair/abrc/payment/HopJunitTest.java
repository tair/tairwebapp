/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.payment;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * 
 * @author Robert J. Muller
 */
public class HopJunitTest {

  /**
   * @throws java.lang.Exception
   */
  @Before
  public void setUp() throws Exception {
  }

  /**
   * @throws java.lang.Exception
   */
  @After
  public void tearDown() throws Exception {
  }

  /**
   * Test method for {@link org.tair.abrc.payment.HOP#getGenericPublicDigest(java.lang.String)}.
   * @throws Exception 
   */
  @Test
  public void testGetPublicDigest() throws Exception {
    Float amountf = 10.25f;
    String currency = "usd";
    String amount = amountf != null ? amountf.toString() : "0.00";
    String time = String.valueOf(System.currentTimeMillis());
    String merchantID = HOP.getMerchantID();
    String customValues = currency + amount + time + merchantID;
    String digest = HOP.getPublicDigest(customValues);
    assertTrue("Invalid digest", digest != null);
  }

}
