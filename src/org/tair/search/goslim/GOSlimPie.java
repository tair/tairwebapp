// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 

package org.tair.search.goslim;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;

/**
 * A concrete instance of a GO SLIM chart that implements a pie chart.
 * 
 * @author rashmis
 * 
 */

public class GOSlimPie extends GOSlimChart {
  /**
   * Geneated Java serialization id
   */
  private static final long serialVersionUID = 1L;
  private int num_slices;
  private int[] slices;
  private static final int legend_spacing = 20;
  private static final int legend_y_start = 70;
  private static final int legend_y_text = legend_y_start + 15;
  private static final int legend_x_start = 250;
  private static final int legend_x_text = legend_x_start + 50;
  private static final int legend_width = 30;
  private static final int legend_height = 20;
  private static final int pie_x_start = 10;
  private static final int pie_y_start = 70;
  private static final int pie_width = 220;
  private static final int pie_height = 220;
  private static final int start_angle = 90;

  /**
   * Create a default pie chart.
   *
   */
  public GOSlimPie() {
    super();
  }

  /**
   * Create a parameterized pie chart.
   * @param keywordType the kind of terms with which to build the chart
   * @param titleString the chart title
   * @param maxNum the maximum number of pie slices
   * @param values the values for the pie slices
   * @param labels the slice labels
   * @param keywordCount the actual number of terms
   * @param create true if you want to create the chart, false otherwise
   */
  public GOSlimPie(String keywordType,
                   String titleString,
                   int maxNum,
                   int[] values,
                   String[] labels,
                   int keywordCount,
                   boolean create) {

    max_num = maxNum;
    if (create)
      setNum(keywordCount);

    slices = new int[getNum()];
    percent = new String[maxNum];
    title = titleString;

    calculate(values);
    setFrame();
    addNotify();
    setImage(labels);

  }

  protected void calculate(int[] raw_values) {
    int tot_counts = 0;

    java.text.DecimalFormat df = new java.text.DecimalFormat("#0.###");

    for (int j = 0; j < getNum(); j++)
      tot_counts += raw_values[j];

    for (int j = 0; j < getNum(); j++) {
      slices[j] =
          (int)((((float)raw_values[j] / (float)tot_counts) * 360) + 0.5);
      percent[j] =
          ": " + df.format(((float)raw_values[j] / (float)tot_counts) * 100)
              + "% ( raw value = " + raw_values[j] + " )";
    }
  }

  /*
   * (non-Javadoc)
   * 
   * @see org.tair.search.goslim.GOSlimChart#getGraphics(java.lang.String[],
   *      java.awt.Graphics2D)
   */
  @Override
  public Graphics2D getGraphics(String[] labels, Graphics2D g2) {

    int fill_rect_y = legend_y_start; // rectangle for legend colors
    int legend_text = legend_y_text; // legend text start
    int slices_cum = 0; // total slices

    // frame color is grey
    g2.setColor(new Color(223, 222, 224));
    // frame rectangle
    g2.fillRect(0, 0, frame_width, frame_height);

    // the actual pie
    for (int i = 0; i < getNum(); i++) {
      g2.setColor(getColor(i, labels[i]));
      g2.fillArc(pie_x_start, pie_y_start, pie_width, pie_height, start_angle
                                                                  - slices_cum,
                 -slices[i]);
      slices_cum += slices[i];
      g2.fillRect(legend_x_start, fill_rect_y, legend_width, legend_height);
      fill_rect_y += getSpacing();
    }

    // the title for each annotation
    g2.setColor(Color.black);
    g2.setFont(new Font("Arial", Font.BOLD, 18));
    g2.drawString(getTitle(), title_x, title_y);
    g2.setFont(new Font("Arial", Font.PLAIN, 15));

    // the legend
    for (int j = 0; j < getNum(); j++) {
      g2.drawString(labels[j] + percent[j], legend_x_text, legend_text);
      legend_text += getSpacing();
    }
    // draw a final circle around the pie slices
    g2.drawOval(pie_x_start, pie_y_start, pie_width, pie_height);

    return g2;
  }

  private Color getColor(int index, String label) {
    int idx = index;
    if ((label.equals("cellular component unknown"))
        || (label.equals("biological process unknown"))
        || (label.equals("molecular function unknown"))) {
      idx = 50;
    }
    return GOSlimPieColor.getColor(idx);
  }

  protected void setNum(int count) {
    if (count <= max_num)
      num_slices = count;
    else
      num_slices = max_num;

  }

  protected int getSpacing() {
    return legend_spacing;
  }

  public int getNum() {
    return num_slices;
  }
}
