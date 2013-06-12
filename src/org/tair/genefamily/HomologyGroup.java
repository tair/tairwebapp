// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3)
// Source File Name: ChromosomeMap.java

package org.tair.genefamily;


import java.awt.Color;


// Referenced classes of package org.tair.genefamily:
// GenericFeature

class HomologyGroup {

  HomologyGroup(GenericFeature f1,
                int f1chromosome,
                GenericFeature f2,
                int f2chromosome,
                int groupId) {
    this.f1 = f1;
    this.f2 = f2;
    this.f1chromosome = f1chromosome;
    this.f2chromosome = f2chromosome;
    this.groupId = groupId;
  }

  GenericFeature getFeature1() {
    return f1;
  }

  GenericFeature getFeature2() {
    return f2;
  }

  int getf1chromosome() {
    return f1chromosome;
  }

  int getf2chromosome() {
    return f2chromosome;
  }

  int getGroup() {
    return groupId;
  }

  Color getColor() {
    int red = 0;
    int green = 0;
    int blue = 200;
    if (groupId % 3 == 0)
      red = 255 - groupId;
    else if (groupId % 2 == 0)
      green = 255 - groupId;
    else if (groupId % 5 == 0)
      blue = 255 - groupId;
    else
      red = groupId;
    System.out.println("Group-ID = " + groupId);
    if (groupId == 1)
      return new Color(255, 0, 0);
    if (groupId == 2)
      return new Color(0, 255, 0);
    if (groupId == 3)
      return new Color(0, 0, 255);
    else
      return new Color(red, green, blue);
  }

  private GenericFeature f1;
  private GenericFeature f2;
  private int f1chromosome;
  private int f2chromosome;
  private int groupId;
}
