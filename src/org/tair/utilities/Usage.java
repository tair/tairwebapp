/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/
package org.tair.utilities;

import java.io.*;
import java.util.*;

public class Usage {
    
    private double fs_coord_max;
    private double uv_coord_max;
    private double pv_coord_max;
    double fs_max;
    double uv_max;
    double pv_max;
    double fs_yunit;
    double pv_yunit;
    double uv_yunit;
    int xdiv;
    int ydiv;
    private ArrayList data;    
    
    public Usage() {
        fs_coord_max = 0;
        uv_coord_max = 0;
        pv_coord_max = 0;
        data = new ArrayList();
    }
    
    public Usage(String type, String analyzer){
        data = new ArrayList();
        if (type.equals("executive") ) {
            populate_executive(analyzer);
        }else if (type.equals("yearly") ) {
            populate_yearly(analyzer);
        }
    }
   
    public int get_fs_coord_max() { return (int)fs_coord_max; }
    public int get_pv_coord_max() { return (int)pv_coord_max; }
    public int get_uv_coord_max() { return (int)uv_coord_max; }
    public int get_xdiv() { return xdiv; }
    public int get_ydiv() { return ydiv; }
    public int get_fs_yunit() { return (int)fs_yunit; }
    public int get_uv_yunit() { return (int)uv_yunit; }
    public int get_pv_yunit() { return (int)pv_yunit; }
    public Iterator iterator() { return data.iterator(); }

    /**
    * This method is used by outside functions in case you want to use this class
    * with multiple statistics (ie: awstats and awtats. in able to plot them in 
    * the same window, the maxs wil need to change
    * it will then call set_coord_max and set_divs to recalculate everything
    */
    public void max_recalculate(int fs, int uv, int pv) {
        if (fs_coord_max < (double)fs) { fs_coord_max = (double)fs; }
        if (uv_coord_max < (double)uv) { uv_coord_max = (double)uv; }
        if (pv_coord_max < (double)pv) { pv_coord_max = (double)pv; }
        set_divs();
        set_yunit();
        set_coords();
    }
    
    private void set_yunit() {
        fs_yunit = fs_coord_max / (double)5;
        pv_yunit = pv_coord_max / (double)5;
        uv_yunit = uv_coord_max / (double)5;
    
    } 
    
    /**
    * this method is used for you to set divs. 
    * in this method we assume that the dimensions are 500 x 270
    * xdiv should always stay the same, but ydiv will depend on the year
    */
    private void set_divs() {
        Calendar toDay = Calendar.getInstance();
        int year = toDay.get(Calendar.YEAR);
        
        ydiv = 270 / 6;
        xdiv = 500 / (year - 1999 + 1);
    }
    
    private void set_coords() {
        Calendar toDay = Calendar.getInstance();
        int year = toDay.get(Calendar.YEAR);
        int totalYears = year - 1999; 
        Iterator iter = iterator();
        while ( iter.hasNext() ){
            UsageData data = (UsageData) iter.next();
            double xdiv_transform = 100 + (xdiv * (totalYears - (year - data.get_year())));
            double fs_coord_transform = data.get_fs() * ((270 - ydiv) / fs_coord_max );
            double uv_coord_transform = data.get_uv() * ((270 - ydiv) / uv_coord_max );
            double pv_coord_transform = data.get_pv() * ((270 - ydiv) / pv_coord_max );
            data.set_x_coord(xdiv_transform);
            data.set_fs_coord(fs_coord_transform);
            data.set_uv_coord(uv_coord_transform);
            data.set_pv_coord(pv_coord_transform);
        }
    }
        
    
    /**
    * this is the coord max because you want to make sure it is divisible by 5
    * to make the graph look okay.
    */
    private void set_coord_max() {
        // round fs to the nearest top 500,000
        if (fs_max  < 5000000) { 
            fs_coord_max = 5000000; 
        }else{
            fs_coord_max = fs_max + ( 5000000 - (fs_max % 5000000) );
        }
        
        // round pv to the nearest 50,000
        if (pv_max < 500000) {
            pv_coord_max = 500000;
        }else{  
            pv_coord_max = pv_max + (500000 - (pv_max % 500000) );
        }
        
        //round uv to te nearest 5,000
        if (uv_max < 50000) {
            uv_coord_max = 50000;
        }else{  
            uv_coord_max = uv_max + (50000 - (uv_max % 50000) );
        }
    } 
    
    private void set_max(){
        fs_max= 0;
        uv_max = 0;
        pv_max = 0;
        
        Iterator iter = iterator();
        while ( iter.hasNext() ){
            UsageData data = (UsageData) iter.next();
            if (data.get_fs() > fs_max ){ fs_max = data.get_fs(); }
            if (data.get_pv() > pv_max ){ pv_max = data.get_pv(); }
            if (data.get_uv() > uv_max ){ uv_max = data.get_uv(); }
        }
    }
    
    private void populate_yearly(String analyzer){
        Calendar toDay = Calendar.getInstance();
        int year = toDay.get(Calendar.YEAR);
        
        String datafile= WebApp.getAppRoot() + "/tmp/awstats/yearly";
        try{
            
            BufferedReader reader = new BufferedReader(new FileReader(datafile));
            try{
                
                // 
                // parse out all informatin and then store them into the UsageData arraylist
                //
                String line;
                int stats_size = year-1999+1;
                String[] stats_line;
                double[][][] stats = new double[stats_size][12][3]; 
                
                //initialize
                for (int i=0; i<stats_size; i++){
                    for (int k=0; k<12; k++){
                        for (int j=0; j<3; j++){
                            stats[i][k][j] = 0;
                        }
                    }
                }
                while ((line = reader.readLine()) != null) {
                    
                    //ignore comments
                    if (!line.startsWith("//")){
                        stats_line = line.split(":");
                        
                        //only read lines that are in the correct format (have enough fields. otherwise, dispose of those lines as well)
                        if (stats_line.length == 5){
                            if (stats_line[4].equals(analyzer)){
                                if (stats_line[0].equals("files served") ){
                                    stats[Integer.parseInt(stats_line[1])-1999][Integer.parseInt(stats_line[3])-1][0] = Double.parseDouble(stats_line[2]);
                                }else if (stats_line[0].equals("page views") ){
                                    stats[Integer.parseInt(stats_line[1])-1999][Integer.parseInt(stats_line[3])-1][1] = Double.parseDouble(stats_line[2]);
                                }else if (stats_line[0].equals("unique visitors") ){
                                    stats[Integer.parseInt(stats_line[1])-1999][Integer.parseInt(stats_line[3])-1][2] = Double.parseDouble(stats_line[2]);
                                } 
                            }
                        }
                    }
                }
                
                //store them in UsageData
                for (int i=stats_size-1; i>=0; i--){
                    for (int k=11; k>=0; k--){
                        UsageData temp_data = new UsageData(k+1, i+1999, stats[i][k][0], stats[i][k][1], stats[i][k][2]);
                        data.add(temp_data);
                    }
                }
            }finally{
                reader.close();
            }
        } catch (IOException ex){
            ex.printStackTrace();
        }
    } 
    
    
    
    private void populate_executive(String analyzer){
        Calendar toDay = Calendar.getInstance();
        int year = toDay.get(Calendar.YEAR);
        
        String datafile= WebApp.getAppRoot() + "/tmp/awstats/executive";
        try{
            
            BufferedReader reader = new BufferedReader(new FileReader(datafile));
            try{
                
                // 
                // parse out all informatin and then store them into the UsageData arraylist
                //
                String line;
                int stats_size = year-1999+1;
                String[] stats_line;
                double[][] stats = new double[stats_size][3]; 
                
                //initialize
                for (int i=0; i<stats_size; i++){
                    for (int j=0; j<3; j++){
                        stats[i][j] = 0;
                    }
                }
                while ((line = reader.readLine()) != null) {
                    
                    //ignore comments
                    if (!line.startsWith("//")){
                        stats_line = line.split(":");
                        
                        //only read lines that are in the correct format (have enough fields. otherwise, dispose of those lines as well)
                        if (stats_line.length == 4){
                            if (stats_line[3].equals(analyzer)){
                                if (stats_line[0].equals("files served") ){
                                    stats[Integer.parseInt(stats_line[1])-1999][0] = Double.parseDouble(stats_line[2]);
                                }else if (stats_line[0].equals("page views") ){
                                    stats[Integer.parseInt(stats_line[1])-1999][1] = Double.parseDouble(stats_line[2]);
                                }else if (stats_line[0].equals("unique visitors") ){
                                    stats[Integer.parseInt(stats_line[1])-1999][2] = Double.parseDouble(stats_line[2]);
                                } 
                            }
                        }
                    }
                }
                
                //store them in UsageData
                for (int i=stats_size-1; i>=0; i--){
                    if (! (analyzer.equals("wusage") && (i+1999 > 2006)) ){  
                        UsageData temp_data = new UsageData(1, i+1999, stats[i][0], stats[i][1], stats[i][2]);
                        data.add(temp_data);
                    }
                }
                
                setGraph();
            }finally{
                reader.close();
            }
        } catch (IOException ex){
            ex.printStackTrace();
        }
    }
    private void setGraph(){
        set_max();
        set_coord_max();
        set_divs();
        set_yunit();
        set_coords();
    }
}
