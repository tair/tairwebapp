/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.processor.statistics;

import java.util.*;

import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * Statistics for a database table 's field
 */

public class FieldStatistics {
    private String field_name;
    private String display_value ;
    private String field_stats;

    public  FieldStatistics (){}

    public  FieldStatistics (String display_value , String field_name, String stats){
        this.display_value = display_value ;
        this.field_name = field_name;
        this.field_stats =  stats;
    }

    public String get_field_name (){ 
        return field_name ;
    }

    public String get_field_stats (){ return field_stats ; } 
    public String get_display_value (){ return display_value ; }       

    public void set_field_name (String value ){ field_name = value;  }
    public void set_field_stats (String value){  field_stats = value; }
    public void set_display_value (String value){  display_value = value;   }   
}
