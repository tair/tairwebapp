/*
 *
 * $Id: Timer.java,v 1.1 2002/11/19 23:36:03 gc Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.utilities;

public class Timer {
        long t;

        // constructor

        public Timer() {
                reset();
        }

        // reset timer

        public void reset() {
                t = System.currentTimeMillis();
        }

        // return elapsed time

        public long elapsed() {
                return System.currentTimeMillis() - t;
        }

        // print explanatory string and elapsed time

        public void print(String s) {
                System.out.println(s + ": " + elapsed());
        }
}
