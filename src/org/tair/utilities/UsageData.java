/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.io.*;
import java.util.*;

public class UsageData {
    
    private double files_served;
    private double page_views;
    private double unique_visitors;
    private double fs_coord;
    private double pv_coord;
    private double uv_coord;
    private double x_coord;
    private int year;
    private int month;

    public UsageData () {
        files_served=0;
        page_views=0;
        unique_visitors=0;
        year=0;
        month=0;
        fs_coord = 0;
        pv_coord = 0;
        uv_coord=0;
        x_coord = 0;
    }
    
    public UsageData(int mo, int yr, double fs, double pv, double uv){
        year=yr;
        month=mo;
        files_served = fs;
        page_views = pv;
        unique_visitors = uv;
        fs_coord = 100;
        pv_coord = 100;
        uv_coord = 100;
        x_coord = 100;
    }
   
    /**
    * get 'em and set 'em
    */
    public void set_x_coord(double number) { x_coord = number; }  
    public void set_fs_coord(double number) { fs_coord = number; }  
    public void set_pv_coord(double number) { pv_coord = number; }  
    public void set_uv_coord(double number) { uv_coord = number; }  
    public double get_x_coord() { return x_coord; }
    public double get_fs_coord() { return fs_coord; }
    public double get_pv_coord() { return pv_coord; }
    public double get_uv_coord() { return uv_coord; }
    public double get_fs() { return files_served; }
    public double get_pv() { return page_views; }
    public double get_uv() { return unique_visitors; }
    public int get_year() { return year; }
    public int get_month(){ return month; }
}
