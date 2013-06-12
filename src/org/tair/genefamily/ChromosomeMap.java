// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3)
// Source File Name: ChromosomeMap.java

package org.tair.genefamily;


import java.awt.Color;
import java.awt.Graphics;
import java.io.PrintWriter;


// Referenced classes of package org.tair.genefamily:
// HomologyGroups, Chromosome, GenericFeature

public class ChromosomeMap {

  public ChromosomeMap(long c[], long f[], long chrScale) {
    chrDist = 125;
    drawScale = false;
    hg = new HomologyGroups();
    this.chrScale = chrScale;
    chr = new Chromosome[c.length];
    for (int i = 0; i < c.length; i++)
      chr[i] =
          new Chromosome(c[i], f[i], (i + 1) * chrDist - chrDist / 2, 10,
                         chrScale);

  }

  public void drawMap(Graphics gr) {
    g = gr;
    for (int i = 0; i < chr.length; i++) {
      int number = i + 1;
      g.drawString(number + "", chr[i].getScreenx() - 10, 10);
    }

    for (int i = 0; i < chr.length; i++)
      chr[i].drawChromosome(g);

  }

  public void drawHomologyGroups(Graphics g) {
    hg.draw(g);
  }

  public void addHomologyGroup(GenericFeature f1, int chr1, GenericFeature f2,
                               int chr2, int groupId) {
    hg.add(f1, chr1, f2, chr2, groupId);
  }

  public void setColors(Color cc, Color tc, Color lc) {
    for (int i = 0; i < chr.length; i++)
      chr[i].setColors(cc, tc, lc);

  }

  public void dumpMap(PrintWriter out) {
    out.println("<MAP NAME=\"Features\"> ");
    for (int i = 0; i < chr.length; i++)
      chr[i].dumpChromosome(out);

    out.println("</MAP>");
  }

  public GenericFeature addFeature(int whichChromosome, long start,
                                   long length, String name, String url) {
    return addFeature(whichChromosome, start, length, name, url,
                      new Color(0, 0, 0));
  }

  public GenericFeature addFeature(int whichChromosome, long start,
                                   long length, String name, String url, Color c) {
    if (whichChromosome >= 1 && whichChromosome <= chr.length) {
      GenericFeature gf =
          new GenericFeature(chr[whichChromosome - 1], start, length, name,
                             url, c);
      chr[whichChromosome - 1].addFeature(gf);
      return gf;
    } else {
      return null;
    }
  }

  public long getImageHeight(int fontSize) {
    long max = 0L;
    long featureCoord = 0L;
    long maxChrLen = 0L;
    long chrLen = 0L;
    for (int i = 0; i < chr.length; i++) {
      chr[i].organizeLabels(fontSize);
      chrLen = chr[i].getLength();
      if (chrLen > maxChrLen)
        maxChrLen = chrLen;
      featureCoord = chr[i].getLargestFeatureLabelCoordinate();
      if (featureCoord > max)
        max = featureCoord;
    }

    if (max > maxChrLen / chrScale)
      return max + 50L;
    else
      return maxChrLen / chrScale + 50L;
  }

  public long getImageWidth() {
    return (long)(chr.length * 150);
  }

  int chrDist;
  Chromosome chr[];
  Color chromosomeColor;
  HomologyGroups hg;
  Graphics g;
  int scale;
  boolean drawScale;
  long chrScale;
}
