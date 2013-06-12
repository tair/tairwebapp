// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3)
// Source File Name: ChromosomeMap.java

package org.tair.genefamily;


import java.awt.*;
import java.io.PrintWriter;
import java.util.*;


// Referenced classes of package org.tair.genefamily:
// GenericFeature

class Chromosome {
  class featureComparator implements Comparator<GenericFeature> {

    public int compare(GenericFeature a, GenericFeature b) {
      if (a.getFeatureStart() > b.getFeatureStart())
        return 1;
      return a.getFeatureStart() >= b.getFeatureStart() ? 0 : -1;
    }

    featureComparator() {
    }
  }

  Chromosome(long bp, long cm, int srx, int sry, long z) {
    radius = 5;
    zoom = z;
    features = new TreeSet<GenericFeature>(new featureComparator());
    bplen = bp;
    bpcentromere = cm;
    screencentromere = (int)(bpcentromere / zoom);
    screenx = srx;
    screeny = sry;
    screenlen = (int)(bplen / zoom);
    chromosomeColor = new Color(255, 128, 128);
    textColor = new Color(0, 0, 0);
    lineColor = new Color(128, 128, 128);
  }

  long getLength() {
    return bplen;
  }

  int getScreenx() {
    return screenx;
  }

  int getScreeny() {
    return screeny;
  }

  long getZoom() {
    return zoom;
  }

  void setZoom(int zoom) {
    this.zoom = zoom;
  }

  int getRadius() {
    return radius;
  }

  Color getTextColor() {
    return textColor;
  }

  void addFeature(Chromosome chr, long pos, long len, String label, String url,
                  Color c) {
    features.add(new GenericFeature(chr, pos, len, label, url, c));
  }

  void addFeature(GenericFeature gf) {
    features.add(gf);
  }

  void removeFeature(GenericFeature genericfeature) {
  }

  long getFeatureCount() {
    return (long)features.size();
  }

  long getLargestFeatureLabelCoordinate() {
    try {
      return (long)((GenericFeature)features.last()).getLabelPos();
    } catch (Exception exception) {
      return -1L;
    }
  }

  void checkFeatures(int x, int y) {
    GenericFeature f;
    for (Iterator itr = features.iterator(); itr.hasNext(); f
        .featureEvent(x, y))
      f = (GenericFeature)itr.next();

  }

  void organizeLabels(int fontHeight) {
    int lastlabelpos = -100;
    for (Iterator itr = features.iterator(); itr.hasNext();) {
      GenericFeature f = (GenericFeature)itr.next();
      int upperbound = lastlabelpos + fontHeight;
      if (f.getLabelPos() < upperbound)
        f.setLabelPos(lastlabelpos + fontHeight);
      f.enclosingRect.setBounds(getScreenx() + 4 * getRadius(), f.labelpos + 3,
                                50, fontHeight / 2);
      lastlabelpos = f.labelpos;
    }

  }

  void dumpChromosome(PrintWriter out) {
    GenericFeature f;
    int x1;
    int y1;
    int x2;
    int y2;
    for (Iterator itr = features.iterator(); itr.hasNext(); out
        .println("<AREA SHAPE=\"RECT\" COORDS=\"" + x1 + "," + y1 + "," + x2
                 + "," + y2 + "\" HREF=\"" + f.url + "\">")) {
      f = (GenericFeature)itr.next();
      x1 = f.enclosingRect.x;
      y1 = f.enclosingRect.y;
      x2 = x1 + f.enclosingRect.width;
      y2 = y1 + f.enclosingRect.height;
    }

  }

  void setColors(Color cc, Color tc, Color lc) {
    chromosomeColor = cc;
    textColor = tc;
    lineColor = lc;
  }

  void drawChromosome(Graphics g) {
    organizeLabels(9);
    g.setColor(chromosomeColor);
    int r = getRadius();
    g.fillRect(screenx - r, screeny + r, 2 * r, screencentromere - 2 * r);
    g.fillOval(screenx - r, screeny, 2 * r, 2 * r);
    g.fillOval(screenx - r, (screeny + screencentromere) - 2 * r, 2 * r, 2 * r);
    g.fillRect(screenx - r, screeny + screencentromere + r, 2 * r,
               screenlen - screencentromere - 2 * r);
    g.fillOval(screenx - r, screeny + screencentromere, 2 * r, 2 * r);
    g.fillOval(screenx - r, (screeny + screenlen) - 2 * r, 2 * r, 2 * r);
    g.setColor(Color.black);
    for (Iterator itr = features.iterator(); itr.hasNext();) {
      GenericFeature f = (GenericFeature)itr.next();
      f.drawFeature(g, f.featureColor);
      if (!f.label.equals("."))
        f.drawLabel(g);
    }

  }

  private int radius;
  private long bplen;
  private long bpcentromere;
  private long zoom;
  private int screenx;
  private int screeny;
  private int screenlen;
  private int screencentromere;
  private TreeSet<GenericFeature> features;
  private Color chromosomeColor;
  private Color textColor;
  @SuppressWarnings("unused")
  private Color lineColor;
}
