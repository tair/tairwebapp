// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3)
// Source File Name: ChromosomeMap.java

package org.tair.genefamily;


import java.awt.Graphics;
import java.util.*;


// Referenced classes of package org.tair.genefamily:
// HomologyGroup, GenericFeature, Chromosome

class HomologyGroups {

  HomologyGroups() {
    homologyGroups = new ArrayList<HomologyGroup>();
  }

  public void add(GenericFeature f1, int chr1, GenericFeature f2, int chr2,
                  int groupId) {
    HomologyGroup hg = new HomologyGroup(f1, chr1, f2, chr2, groupId);
    homologyGroups.add(hg);
  }

  public void draw(Graphics g) {
    for (Iterator i = homologyGroups.iterator(); i.hasNext();) {
      HomologyGroup hg = (HomologyGroup)i.next();
      GenericFeature f1 = hg.getFeature1();
      GenericFeature f2 = hg.getFeature2();
      f1.drawFeature(g, f1.featureColor);
      f2.drawFeature(g, f2.featureColor);
      g.setColor(hg.getColor());
      System.out
          .println("FROM X: " + f1.getXCoord() + " Y: " + f1.getYCoord()
                   + " TO X: " + f2.getXCoord() + " Y: " + f2.getYCoord());
      if (f1.getYCoord() > f2.getYCoord()) {
        GenericFeature hold = f2;
        f2 = f1;
        f1 = hold;
      }
      int x1 = f1.getXCoord();
      int y1 = f1.getYCoord();
      int x2 = f2.getXCoord();
      int y2 = f2.getYCoord();

      int h = y2 - y1;
      if (f1.getXCoord() == f2.getXCoord())
        g.drawArc(x1 - 20, y1, 40, h, 90, 180);
      else if (f1.getXCoord() > f2.getXCoord())
        g.drawLine(x1, y1, x2 + f2.getChr().getRadius(), y2);
      else
        g.drawLine(x1 + f1.getChr().getRadius(), y1, x2, y2);
    }

  }

  private ArrayList<HomologyGroup> homologyGroups;
}
