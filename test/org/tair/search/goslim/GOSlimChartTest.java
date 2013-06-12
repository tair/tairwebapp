package org.tair.search.goslim;

import java.sql.*;
import junit.framework.TestCase;

/**
 * Test the GOSlimChart class
 */
public class GOSlimChartTest extends TestCase {

	private int num;
	private int num2;
	private int max_num = 50;
	private String[] labels;
	private int[] values;
	private int lociCount;
	private int frame_height = 340; // minimum frame height
    
	protected void setUp() throws Exception {
		super.setUp();
		num = 10;
		num2 = 20;
		
		labels = new String[max_num];
		values = new int[max_num];
		lociCount = 20;
		
		for(int i = 0; i < num; i++) {
			int rand = (int)(Math.random()*10);
			values[i] = rand;
			labels[i] = "Number: " + i;
		}
	}
	
	/**
	 * Test the bar frame
	 * @throws SQLException
	 */
	public void testFrame() throws SQLException {
		int curHeight = 100;
		
		for (int i = 0; i < num; i++) {
			curHeight += 20;
		}
		System.out.println("height needed: " + curHeight);
		
		//frame_height doesn't change
		GOSlimPie pie = new GOSlimPie("comp", "Chart Test", 
	    		max_num, values, labels, num, true);
		assertEquals(frame_height, pie.frame_height);
		
		curHeight = 100;
		for (int i = 0; i < num2; i++) {
			curHeight += 20;
		}
		//frame height does change
		frame_height = curHeight;
		int[] values = new int[num2];
		String[] labels = new String[num2];
		
		GOSlimBar slimbar = new GOSlimBar("comp", "Chart Test2", max_num,
				values, labels, num2, lociCount, true);
		assertEquals(frame_height, slimbar.frame_height);
	}
	


}
