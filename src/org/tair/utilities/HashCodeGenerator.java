/*
 * Copyright (c) 2002-2009, Hirondelle Systems All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer. Redistributions in binary
 * form must reproduce the above copyright notice, this list of conditions and
 * the following disclaimer in the documentation and/or other materials provided
 * with the distribution. Neither the name of Hirondelle Systems nor the names
 * of its contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY HIRONDELLE SYSTEMS ''AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 * EVENT SHALL HIRONDELLE SYSTEMS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package org.tair.utilities;


import java.lang.reflect.Array;


/**
 * A utility class with methods to assist in generating hash codes from
 * combinations of data members.
 * 
 * <pre>
 * public int hashCode() {
 *   int result = HashCodeUtil.SEED;
 *   //collect the contributions of various fields
 *   result = HashCodeUtil.hash(result, fPrimitive);
 *   result = HashCodeUtil.hash(result, fObject);
 *   result = HashCodeUtil.hash(result, fArray);
 *   return result;
 * }
 * </pre>
 * 
 * @author Hirondelle Systems
 */
public class HashCodeGenerator {
  /**
   * An initial value for a <code>hashCode</code>, to which is added
   * contributions from fields. Using a non-zero value decreases collisions of
   * <code>hashCode</code> values.
   */
  public static final int SEED = 23;

  /**
   * Hash a boolean value.
   * 
   * @param aSeed the seed (usually a prior hash)
   * @param aBoolean the boolean value to hash
   * @return a hash code
   */
  public static int hash(int aSeed, boolean aBoolean) {
    return firstTerm(aSeed) + (aBoolean ? 1 : 0);
  }

  /**
   * Hash a character value.
   * 
   * @param aSeed the seed (usually a prior hash)
   * @param aChar the character value to hash
   * @return a hash code
   */
  public static int hash(int aSeed, char aChar) {
    return firstTerm(aSeed) + (int)aChar;
  }

  /**
   * Hash an integer value. Implicit conversion handles byte and short here.
   * 
   * @param aSeed the seed (usually a prior hash)
   * @param aInt the integer, byte, or short to hash
   * @return a hash code
   */
  public static int hash(int aSeed, int aInt) {
    return firstTerm(aSeed) + aInt;
  }

  /**
   * Hash a long value.
   * 
   * @param aSeed the seed (usually a prior hash)
   * @param aLong the long value to hash
   * @return a hash code
   */
  public static int hash(int aSeed, long aLong) {
    System.out.println("long...");
    return firstTerm(aSeed) + (int)(aLong ^ (aLong >>> 32));
  }

  /**
   * Hash a float value.
   * 
   * @param aSeed the seed (usually a prior hash)
   * @param aFloat the float value to hash
   * @return a hash code
   */
  public static int hash(int aSeed, float aFloat) {
    return hash(aSeed, Float.floatToIntBits(aFloat));
  }

  /**
   * Hash a double value.
   * 
   * @param aSeed the seed (usually a prior hash)
   * @param aDouble the double value to hash
   * @return a hash code
   */
  public static int hash(int aSeed, double aDouble) {
    return hash(aSeed, Double.doubleToLongBits(aDouble));
  }

  /**
   * <p>
   * <code>aObject</code> is a possibly-null object field, and possibly an
   * array.
   * </p>
   * <p>
   * If <code>aObject</code> is an array, then each element may be a primitive
   * or a possibly-null object.
   * </p>
   * 
   * @param aSeed the seed (usually a prior hash)
   * @param aObject the object to hash
   * @return a hash code
   */
  public static int hash(int aSeed, Object aObject) {
    int result = aSeed;
    if (aObject == null) {
      result = hash(result, 0);
    } else if (!isArray(aObject)) {
      result = hash(result, aObject.hashCode());
    } else {
      int length = Array.getLength(aObject);
      for (int idx = 0; idx < length; ++idx) {
        Object item = Array.get(aObject, idx);
        // recursive call!
        result = hash(result, item);
      }
    }
    return result;
  }

  /** a prime number to use in the algorithm */
  private static final int fODD_PRIME_NUMBER = 37;

  /**
   * Compute the first term of the algorithm (prime number times seed value).
   * 
   * @param aSeed the seed to use
   * @return the term
   */
  private static int firstTerm(int aSeed) {
    return fODD_PRIME_NUMBER * aSeed;
  }

  /**
   * Is the object an array?
   * 
   * @param aObject the object to test
   * @return true if the object's class has multiplicity greater than 1
   */
  private static boolean isArray(Object aObject) {
    return aObject.getClass().isArray();
  }
}
