
/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 * 
 * ArrayElementHybDescription is a composite class that extends <code>TfcHybDescription</code>
 * to present it's associated HybData for an ArrayElement and a HybDescription
 */
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;

public class ArrayElementHybDescription extends TfcHybDescription {
    // for dual channel
    private Float fold_change;
    private Float fold_change_std_err ;
    // for single channel
    private Float signal ; 
    private Float signal_percentile ;

    private String hyb_name ;  
  
    public ArrayElementHybDescription (  DBconnection conn, Long hyb_description_id)
        throws SQLException{
	super(conn,hyb_description_id);
    } 
    
    public void setHybName ( String name ){
        this.hyb_name = name ; 
    }
   
    public void setFoldChange ( Float value){
        this.fold_change = value ;
    }
    public void setFoldChangeStdErr ( Float value){
        this. fold_change_std_err = value ;
    }

    public Float getFoldChange (){
        return fold_change;
    }
    public Float getFoldChangeStdErr(){
	return  fold_change_std_err ;
  
    }

    public void setSignal(  Float value ){
        signal = value ;
    }
    public void setSignalPercentile(  Float value ){
        signal_percentile = value ;
    }
   
    public Float getSignal(  ){
        return signal ;
    }
    public Float getSignalPercentile(  ){
        return signal_percentile ;
    } 
    
    public String getHybName(){
        return hyb_name ;
    }   

    public String getDisplayFoldChangeAndStdErr( ){
        return TextConverter.floatToString ( getFoldChange ( ) )+ " (" + 
	    TextConverter.floatToString ( getFoldChangeStdErr ( ))+")";
    }
   
    public String getDisplaySignalAndPercentile(){
        return TextConverter.floatToString ( getSignal(  ) )+ " (" +  
            TextConverter.floatToString (getSignalPercentile(  ))+")";
    }
   
}
