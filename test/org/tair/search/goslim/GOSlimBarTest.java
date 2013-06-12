package org.tair.search.goslim;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.sql.*;

import junit.framework.TestCase;

/**
 * This class tests the GOSlimBar graph drawn after selecting "gene pie charts"
 * under GOAnnotations.
 * Two graphics objects can not be compared against one another 
 * (with an equals() method or equivalent). To test GOSlimBar,I tested 
 * each individual attribute of the graphics object that pertained to 
 * drawing the bar graph.
 */
public class GOSlimBarTest extends TestCase {
		private int[] raw_values, raw_values2;
		private String[] labels, labels2;
		private String keywordType;
		private String title;
		private int max_num;
		private int keywordCount;
		private int lociCount,lociCount2;
		
		private int[] bars, bars2;
		private String[] percent, percent2;
		private float maxpercent;
		private Graphics2D g, gTest, gTest2;
		private int num1 = 3, num2 = 4;
		private int graph_width = 480, graph_height = 270;
	
	protected void setUp() throws Exception{
		super.setUp();
		keywordType = "comp";
		title = "Bar Graph Test";
		max_num = 10;
		keywordCount = 12;
		lociCount = 10;
		lociCount2 = 6;
		raw_values = new int[max_num];
		raw_values2 = new int[max_num];
		labels = new String[max_num];
		labels2 = new String[max_num];
		bars = new int[keywordCount];
		bars2 = new int[num2];
		percent = new String[keywordCount];
		percent2 = new String[num2];
		maxpercent = 0;
		
		java.text.DecimalFormat df = new java.text.DecimalFormat("#0.###");
		raw_values[0] = 0;
		raw_values[1] = 2;
		raw_values[2] = 10;
		raw_values2[0] = 0;
		raw_values2[1] = 3;
		raw_values2[2] = 2;
		raw_values2[3] = 6;
		
		float percentage;
		for (int i = 0; i< max_num; i++) {
			percentage = ((float)raw_values[i]/(float)lociCount) *100;
			maxpercent = Math.max(maxpercent, percentage);
			bars[i] = (int) percentage;
			percent[i] = ":" + df.format(percentage) + "%";
		}
		
		for (int i = 0; i< num2; i++) {
			percentage = ((float)raw_values2[i]/(float)lociCount2) *100;
			bars2[i] = (int) percentage;
			percent2[i] = ":" + df.format(percentage) + "%";
		}
		
		Image image = new BufferedImage( 730, 
                340, 
                BufferedImage.TYPE_INT_RGB );
		Graphics g1 = image.getGraphics();
		g = ( Graphics2D )g1;
		g.setRenderingHints(new RenderingHints(RenderingHints.KEY_TEXT_ANTIALIASING,RenderingHints.VALUE_TEXT_ANTIALIAS_ON));
		gTest = (Graphics2D)(g.create());
		gTest2 = (Graphics2D)(g.create());
		
	}
	
	
	/**
	 * Test the Calculate method
	 * @throws SQLException
	 */
	public void testCalculate() throws SQLException{
		
		GOSlimBar slimbar = new GOSlimBar(keywordType, title, max_num, 
	    		raw_values, labels, keywordCount, lociCount, true);
		
		assertEquals(slimbar.getNum(), max_num);
		assertEquals(slimbar.getTitle(), title);
	
		for (int i = 0; i < max_num ; i++) {
			assertEquals(slimbar.getBar(i), bars[i]);
			System.out.println(bars[i] + "");
			System.out.println(percent[i] + "");
			assertEquals(slimbar.getPercent(i), percent[i]);
		}
		
	}

	/**
	 * Test Cases:
	 * maxNum > keywordCount
	 * maxNum = keywordCount
	 * maxNum < keywordCount
	 * lociCount = 0, create = false
	 * @throws SQLException 
	 */
	public void testGOSlimBar()throws SQLException {
		int testmax_num = 20;
		int keyCount = 10;
		raw_values = new int[testmax_num];
		labels = new String[testmax_num];
		
		GOSlimBar bar1 = new GOSlimBar(keywordType, title, testmax_num,
				raw_values, labels, keyCount, lociCount, true);
		assertEquals(keyCount, bar1.getNum());
		
		keyCount = 20;
		GOSlimBar bar2 = new GOSlimBar(keywordType, title, testmax_num,
				raw_values, labels, keyCount, lociCount, true);
		assertEquals(keyCount, bar2.getNum());
		
		keyCount = 30;
		GOSlimBar bar3 = new GOSlimBar(keywordType, title, testmax_num,
				raw_values, labels, keyCount, lociCount, true);
		assertEquals(testmax_num, bar3.getNum());

		GOSlimBar bar4 = new GOSlimBar(keywordType, title, testmax_num, 
		   		raw_values, labels, keyCount, lociCount, false);	
		assertEquals(0, bar4.getNum());
		
		
	}
	
	
	/**
	 * The ensuing methods provide test cases:
	 * -division divides evenly with graph height (test with num1)
	 * -division does not divide evenly with graph height (test with num2)
	 * In both cases, the x and y axis ticks should line up (or almost line up?)
	 * with the graph frame, and the bars and labels should line up in 
	 * between the y-axis ticks.
	 * Note: Since it is difficult to test what the graph looks like in between
	 * stages of drawing, I have only tested the attributes at the end of each stage.
	 * Each test variable is calculated slightly different than in the actual class, with
	 * expected values, to give expected results. These variables are then tested against
	 * what GOSlimBar calculates.
	 * @throws SQLException 
	 */
	
	public void testDrawBars() throws SQLException {
		GOSlimBar slimbar = new GOSlimBar(keywordType, title, max_num, 
	    		raw_values, labels, num1, lociCount, true);
	
		//pink
		g.setColor( new Color( 246,232,232 ) );
	    g.fillRect( 0, 0, 730, 320 );
        g.setColor( new Color( 190,190,190 ) ); //dark grey
        g.fillRect(10, 70, 480, 270);
        slimbar.drawGraphFrame(gTest);
        
        //draw the bars green
        g.setColor( new Color( 0,115,0 ) );
        double division = graph_height/num1;
        float unit = (float)graph_width/100;
        int graphy = 0, graphx = 0, width = 0;
     
        for (int i = 0; i < num1; i++) {
        	width = (int) (bars[i]*unit);
        	graphx = (10+ graph_width) - width;
        	graphy = (int) (70 + division*i + 5);
        	g.fillRect( graphx, graphy, width, 10);
        }
        slimbar.drawGraphBars(gTest);
        assertTrue(g.getColor().equals(gTest.getColor()));
        //the last bar should be at 100%, so it should reach til the end of the graph
        assertEquals(graphx, slimbar.getBarX()); // the last bar's starting x (10)
        assertEquals(graphy, slimbar.getBarY());
        assertEquals(graph_width, slimbar.getBarWidth());
        
        
        /**test case when division does not divide evenly**/
        GOSlimBar slimbar2 = new GOSlimBar(keywordType, title, max_num, 
	    		raw_values2, labels2, num2, lociCount2, true);
        division = graph_height/num2;
        for (int i = 0; i < num2; i++) {
        	width = (int) (bars2[i]*unit);
        	graphx = (10+ graph_width) - width;
        	graphy = (int) (70 + division*i + 5);
        	g.fillRect( graphx, graphy, width, 10);
        }
        //last bar should reach til the end of the graph
        slimbar2.drawGraphBars(gTest2);
        assertEquals(graphx, slimbar2.getBarX());
        assertEquals(graphy, slimbar2.getBarY());
        assertEquals(graph_width, slimbar.getBarWidth());
	}
	
	/**
	 * Test the drawGraphTraits method
	 * @throws SQLException
	 */
	public void testDrawGraphTraits() throws SQLException{
		GOSlimBar slimbar = new GOSlimBar(keywordType, title, max_num, 
	    		raw_values, labels, keywordCount, lociCount, true);
		
		g.setColor(Color.black);
        g.setFont( new Font( "Arial", Font.BOLD, 18 ) );
        g.drawString( title, 90, 25 );
        g.setFont( new Font("Arial", Font.PLAIN, 18));
        g.drawString(" N = " + lociCount, 90, 25 + 23);
        //draw the x and y axes for the graph
        g.drawRect(10, 70, graph_width, graph_height);
        slimbar.drawGraphTraits(gTest);
        assertTrue(g.getFont().equals(gTest.getFont()));
	}
	
	/**
	 * Test the drawGraphXYTicks method
	 * @throws SQLException
	 */
	public void testDrawGraphXYTicks() throws SQLException {
		GOSlimBar slimbar = new GOSlimBar(keywordType, title, max_num, 
	    		raw_values, labels, num1, lociCount, true);
		
		double division = graph_height/num1;
		float unit = (float)graph_width/100;
		//make tick marks on the y axis
        int tick_x = 10 + graph_width;
        int tick_y = 70;
        for (int i = 1; i <= num1; i++) {
        	tick_y += division;
        	g.drawLine(tick_x, tick_y, tick_x + 5, tick_y); //tick marks are five pixels in length
        }
        
        //make tick marks on the x axis, with increments of 10
        tick_x = 10+graph_width;
        for (int i = 0; i <= 100; i+=5) {
        	g.drawLine(tick_x, (70+graph_height), tick_x, (70+graph_height+5));
        	if (i%10 == 0) {
        		g.drawString(i + "", tick_x-2, (70+graph_height+15));
        		g.drawLine(tick_x, 70, tick_x, 70+graph_height);
        	}
        	tick_x-=(unit*5);
        }
        
        slimbar.drawGraphXYTicks(gTest);
        assertEquals(tick_x, slimbar.getTickX());
        assertEquals(tick_y, slimbar.getTickY());
        
        /**test case when division does not divide evenly*/
        GOSlimBar slimbar2 = new GOSlimBar(keywordType, title, max_num, 
	    		raw_values2, labels2, num2, lociCount2, true);
        division = graph_height/num2;
        System.out.println("division: " + division);
        tick_x = 10 + graph_width;
        tick_y = 70;
        for (int i = 1; i <= num2; i++) {
        	tick_y += division;
        	g.drawLine(tick_x, tick_y, tick_x + 5, tick_y); //tick marks are five pixels in length
        }
        for (int i = 0; i <= 100; i+=5) {
        	g.drawLine(tick_x, (70+graph_height), tick_x, (70+graph_height+5));
        	if (i%10 == 0) {
        		g.drawString(i + "", tick_x-2, (70+graph_height+15));
        		g.drawLine(tick_x, 70, tick_x, 70+graph_height);
        	}
        	tick_x-=(unit*5);
        }
        slimbar.drawGraphXYTicks(gTest2);
        assertEquals(tick_x, slimbar2.getTickX());
        //the y ticks will not match up, the slimbar's y tick will be a little off
        assertFalse(70+graph_height==slimbar2.getTickY());
	}
	
	/**
	 * Test the drawGraphKeywords method
	 * @throws SQLException
	 */
	public void testDrawGraphKeywords() throws SQLException{
		GOSlimBar slimbar = new GOSlimBar(keywordType, title, max_num, 
	    		raw_values, labels, num1, lociCount, true);
	
		double division = graph_height/num1;
		int text_y  = (int) (70 + division - 5);
		int text_x = 10 + graph_width + 3;
		
		for (int i = 1; i < num1; i++) {
	       	text_y += division;
	       	g.drawString(labels[i] + percent[i], text_x, text_y );
	       }
		slimbar.drawGraphKeywords(gTest, labels);
		assertEquals(text_x, slimbar.getTextX());
		assertEquals(text_y, slimbar.getTextY());
		
		/**test case when division does not divide evenly*/
		GOSlimBar slimbar2 = new GOSlimBar(keywordType, title, max_num, 
	    		raw_values2, labels2, num2, lociCount2, true);
		division = graph_height/num2;
		text_y  = (int) (70 + division - 5);
		for (int i = 1; i < num2; i++) {
	       	text_y += division;
	       	g.drawString(labels[i] + percent[i], text_x, text_y );
	       }
		slimbar2.drawGraphKeywords(gTest2, labels);
		assertEquals(text_x, slimbar2.getTextX());
		assertEquals(text_y, slimbar2.getTextY());
	}

}
