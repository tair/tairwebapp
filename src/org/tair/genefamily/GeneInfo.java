// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FindGenes.java

package org.tair.genefamily;


class GeneInfo
{

    GeneInfo(String locus, long start, long end)
    {
        this.locus = locus;
        this.start = start;
        this.end = end;
    }

    String getLocus()
    {
        return locus;
    }

    long getStart()
    {
        return start;
    }

    long getEnd()
    {
        return end;
    }

    private String locus;
    private long start;
    private long end;
}
