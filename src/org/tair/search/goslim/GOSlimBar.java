/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.goslim;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.sql.SQLException;

public class GOSlimBar extends GOSlimChart {
	
	/**
   * Generated serial version UID for serializable class
   */
  private static final long serialVersionUID = 4983307311081104958L;
  private static final int graph_x_start = 10;
    private static final int graph_y_start = 70;
    private static final int axis_spacing = 20;    
    private static final int graph_width = 480;
    private static final int graph_height = 270;
    //private static final float unit = (float)graph_width/100; // a unit on the bar graph
	private int num_bars = 0;  
    private int[] bars;
    private int locicount;
    private double division;
    private float maxpercent;
    private float unit;
    
    //testing variables
    private int b_width, b_xstart, b_ystart;
    private int t_x, t_y;
    private int text_x, text_y;
    

    public GOSlimBar() {
    }
    
    public GOSlimBar( String keywordType, String titleString, int maxNum, 
    		int[] values, String[] labels, int keywordCount, int lociCount, boolean create) 
    throws SQLException {
    
    	max_num = maxNum;
    	if (create)
    		setNum(keywordCount);
    	
    	bars = new int[maxNum];
    	percent = new String[maxNum];
    	locicount = lociCount;
    	title = titleString;
    	
    	if (create) {
    		calculate(values);
    		setFrame();            
    		addNotify();  
    		setImage(labels);
    	}
    }
    
    protected void calculate(int[] values) { 
        java.text.DecimalFormat df = new java.text.DecimalFormat("#0.###");
        float percentage = 0;
        maxpercent = 0;
        
        for (int i = 0; i < getNum(); i++) {
        	percentage = ( (float)values[i]/(float) locicount) * 100;
        	maxpercent = Math.max(percentage, maxpercent);
        	
        	if (percentage > 1)
        		bars[i] = (int) percentage;
        	else
        		bars[i] = (int) Math.ceil(percentage);
        	percent[i] = ":" + df.format(percentage) + "%";
        }
        
    
    }
    
    public Graphics2D getGraphics(String[] labels, Graphics2D g2) {

    	drawGraphFrame(g2);
    	drawGraphBars(g2);
        g2.setColor( Color.black ); 
        drawGraphTraits(g2);
        drawGraphXYTicks(g2);
        drawGraphKeywords(g2, labels);
        
    	return g2; 
    }
    
    protected void drawGraphFrame(Graphics2D g2) {
    	  //very light pink, as opposed to the light grey for the pie charts
        g2.setColor( new Color( 246,232,232 ) );
        g2.fillRect( 0, 0, frame_width, frame_height );
        
        //fill up the bar graph with background color
        g2.setColor( new Color( 190,190,190 ) ); //dark grey
        g2.fillRect(graph_x_start, graph_y_start, graph_width, graph_height);
        
    }
    
    protected void drawGraphBars(Graphics2D g2) {
    	//draw the bars green
        g2.setColor( new Color( 0,115,0 ) );
        division = graph_height/getNum();
        int bar_width = 0, bar_x_start = 0, bar_y_start = 0;
        int bar_height = 10;
        unit = graph_width/(maxpercent+5);
        
        //when drawing the bars, we start from the right, and count to the left
        for ( int i = 0; i < getNum(); i++ ) {
        	bar_width = (int) (unit*bars[i]);
        	bar_x_start = graph_x_start+ graph_width - bar_width;
        	bar_y_start = (int)(graph_y_start + i*division + 5);
        	g2.fillRect(bar_x_start, bar_y_start, bar_width, bar_height);
        }
        //testing variables
        b_xstart = bar_x_start;
        b_ystart = bar_y_start;
        b_width = bar_width;
    }
    
    protected void drawGraphTraits(Graphics2D g2) {
    	//Title of the annotation, and number of loci
        g2.setFont( new Font( "Arial", Font.BOLD, 18 ) );
        g2.drawString( getTitle(), title_x, title_y );
        g2.setFont( new Font("Arial", Font.PLAIN, 18));
        g2.drawString(" N = " + locicount, title_x, title_y + 23);
        //draw the x and y axes for the graph
        g2.drawRect(graph_x_start, graph_y_start, graph_width, graph_height);
        
    }
    
    protected void drawGraphXYTicks(Graphics2D g2) {
    	double division = (int)graph_height/getNum();
    	//make tick marks on the y axis
        int tick_x = graph_x_start + graph_width;
        int tick_y = 0;
        for (int i = 0; i < getNum(); i++) {
        	tick_y =(int) (graph_y_start + division*(i+1) );
        	g2.drawLine(tick_x, tick_y, tick_x + 5, tick_y); //tick marks are five pixels in length
        }
        t_y = tick_y;
        
        //make tick marks on the x axis (counting from right to left), and draw helping lines
        g2.setFont( new Font( "Arial", Font.PLAIN,9 ) );
        tick_y = graph_y_start + graph_height;
        for (int i = 0; i <= maxpercent; i+=5) { 
        	g2.drawLine(tick_x, tick_y, tick_x, tick_y+5);
        	tick_x =(int) (graph_x_start + graph_width - unit*i);
        	if (i%10 == 0) {
        		g2.drawString(i + "", tick_x - 2, tick_y + 15);
        		g2.drawLine(tick_x, graph_y_start, tick_x, tick_y);
        	}
        	//tick_x -=unit*5;
        }
        t_x = tick_x;
    }
    
    protected void drawGraphKeywords(Graphics2D g2, String[] labels) {
    	 //label the y axis with the category keywords
        g2.setFont( new Font( "Arial", Font.PLAIN,11 ) );
        int y_axis_text = 0;
        int graph_x_text = graph_x_start + graph_width + 3;
        division = graph_height/getNum();
        for ( int j = 0; j < getNum(); j++ ) {
        	y_axis_text = (int) (graph_y_start + division*(j+1) - 5);
            g2.drawString( labels[j] + percent[j], graph_x_text,
                           y_axis_text );
        }
        //testing variables
        text_x = graph_x_text;
        text_y = y_axis_text;
    }
    
    protected void setNum(int count) { 
    	if ( count > max_num )
            num_bars = max_num;
        else 
            num_bars = count;
    }
   
    protected int getNum() {  return num_bars; }
    protected int getSpacing() { return axis_spacing; }
  
    //testing methods
    protected int getBar(int i) { return bars[i];   }
    protected String getPercent(int i) { return percent[i]; }
    protected int getBarX() { return b_xstart; }
	protected int getBarY() { return b_ystart; }
	protected int getBarWidth() { return b_width; }
	protected int getTickX() {return t_x; }
	protected int getTickY() { return t_y; }
	protected int getTextX() { return text_x; }
	protected int getTextY() { return text_y; }
	
    
}
