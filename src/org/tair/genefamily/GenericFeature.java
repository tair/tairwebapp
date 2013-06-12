// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3)
// Source File Name: ChromosomeMap.java

package org.tair.genefamily;


import java.awt.*;


// Referenced classes of package org.tair.genefamily:
// Chromosome

class GenericFeature {

  GenericFeature(Chromosome chr, long p, long l, String lbl, String u) {
    hiliteColor = new Color(255, 255, 255);
    featureColor = new Color(0, 0, 0);
    lineColor = new Color(100, 100, 100);
    chromosome = chr;
    fbppos = p;
    fbplen = l;
    label = lbl;
    url = u;
    screenpos = (int)fbppos / (int)chromosome.getZoom();
    screenlen = (int)fbplen / (int)chromosome.getZoom();
    labelpos = screenpos;
    if (screenlen < 1)
      screenlen = 1;
    hilited = false;
    enclosingRect =
        new Rectangle(chromosome.getScreenx() - 3,
                      (chromosome.getScreeny() + screenpos) - 1, 2 * chromosome
                          .getRadius(), screenlen + 1);
  }

  GenericFeature(Chromosome chr, long p, long l, String lbl, String u, Color c) {
    this(chr, p, l, lbl, u);
    setColor(c);
  }

  public boolean featureEvent(int x, int y) {
    if (enclosingRect.contains(x, y)) {
      if (!hilited) {
        hilited = true;
        return true;
      }
    } else if (hilited) {
      hilited = false;
      return true;
    }
    return false;
  }

  void drawLabel(Graphics g) {
    int r = chromosome.getRadius();
    if (hilited)
      g.setColor(new Color(0, 255, 255));
    else
      g.setColor(chromosome.getTextColor());
    g.drawString(label, chromosome.getScreenx() + 5 * r, chromosome
        .getScreeny()
                                                         + labelpos);
    if (hilited)
      g.setColor(new Color(0, 255, 255));
    else
      g.setColor(lineColor);
    g.drawLine(chromosome.getScreenx() + r,
               chromosome.getScreeny() + screenpos, chromosome.getScreenx() + 5
                                                    * r, chromosome
                   .getScreeny()
                                                         + labelpos);
  }

  void drawFeature(Graphics g) {
    drawFeature(g, featureColor);
  }

  void drawFeature(Graphics g, Color c) {
    if (hilited)
      g.setColor(new Color(0, 255, 255));
    else
      g.setColor(c);
    g.fillRect(chromosome.getScreenx() - 3,
               chromosome.getScreeny() + screenpos, 7, screenlen);
  }

  int getXCoord() {
    return chromosome.getScreenx() - 3;
  }

  int getYCoord() {
    return chromosome.getScreeny() + screenpos;
  }

  void hiliteFeature(Graphics g) {
    drawFeature(g, hiliteColor);
  }

  void unhiliteFeature(Graphics g) {
    drawFeature(g, featureColor);
  }

  Font getFont() {
    return F;
  }

  void setFont(Font F) {
    this.F = F;
  }

  int getLabelPos() {
    return labelpos;
  }

  void setLabelPos(int labelpos) {
    this.labelpos = labelpos;
  }

  long getFeatureStart() {
    return fbppos;
  }

  void setColor(Color c) {
    featureColor = c;
  }

  Chromosome getChr() {
    return chromosome;
  }

  GenericFeature getFeature() {
    return this;
  }

  long fbppos;
  long fbplen;
  String label;
  String url;
  int labelpos;
  int screenpos;
  int screenlen;
  Font F;
  Chromosome chromosome;
  Rectangle enclosingRect;
  boolean hilited;
  Color hiliteColor;
  Color featureColor;
  Color lineColor;
}
