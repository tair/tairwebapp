/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.goslim;


import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.sql.SQLException;

import javax.swing.JPanel;


/**
 * An abstract representation of a GO SLIM chart. The concrete implementation
 * classes must implement the abstract methods, especially the getGraphics
 * method that draws the chart.
 * 
 * @author rashmis
 * 
 */
public abstract class GOSlimChart extends JPanel {

  protected static int max_num;
  protected static String title;
  protected static final int frame_width = 730;
  protected static final int title_x = 90;
  protected static final int title_y = 25;
  protected String[] percent;
  protected Image image;
  protected int frame_height = 340; // minimum frame height

  /**
   * Create a default GO SLIM chart.
   *
   */
  public GOSlimChart() {
  }

  /**
   * Create a parameterized GO SLIM chart.
   * @param keywordType the kind of terms with which to build the chart
   * @param sessionID the id of the web session
   * @throws SQLException when there is a problem querying the chart data
   */
  public GOSlimChart(String keywordType, String sessionID) throws SQLException {
  }

  protected void setFrame() {
    int cumHeight = 100;
    for (int j = 0; j < getNum(); j++)
      cumHeight += getSpacing();

    if (cumHeight > frame_height)
      frame_height = cumHeight;
    setSize(frame_width, frame_height);
  }

  protected void setImage(String[] labels) {
    image =
        new BufferedImage(getWidth(), getHeight(), BufferedImage.TYPE_INT_RGB);
    Graphics g = image.getGraphics();
    Graphics2D g2 = (Graphics2D)g;
    g2
        .setRenderingHints(new RenderingHints(
                                              RenderingHints.KEY_TEXT_ANTIALIASING,
                                              RenderingHints.VALUE_TEXT_ANTIALIAS_ON));

    getGraphics(labels, g2);
  }

  /**
   * Get the image of the chart.
   * @return an image
   */
  public Image getImage() {
    return image;
  }

  /**
   * Get the 2D graphics object for the chart.
   * @param labels the chart labels
   * @param g2 the Graphics2D object in which to draw the chart
   * @return the input object with the drawn chart
   */
  public abstract Graphics2D getGraphics(String[] labels, Graphics2D g2);

  protected abstract void setNum(int count);

  protected abstract void calculate(int[] values);

  protected abstract int getNum();

  protected abstract int getSpacing();

  protected String getTitle() {
    return title;
  }

  /**
   * Get the frame height for the chart. Used for testing.
   * @return the frame height
   */
  public int getFrameHeight() {
    return frame_height;
  }

  /**
   * Get the frame width for the chart. Used for testing.
   * @return the frame width.
   */
  public int getFrameWidth() {
    return frame_width;
  }
}
