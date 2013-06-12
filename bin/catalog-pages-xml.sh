#!/bin/bash

HTML_OUT=$1

if [ -z "$HTML_OUT" ]
then
 echo usage: $(basename $0) HTML_OUT
 exit 1
fi

gen_page(){
 CAT_CLASS=$1
 SHEET=WebRoot/catalog/$2.xsl
 /usr/local/bin/ant catalog-pages-xml -Dcategory.class=$CAT_CLASS -Dstylesheet=$SHEET -Dcatalog.html.output=$HTML_OUT
}

gen_page org.tair.abrc.catalog.category.PooledGenomicCategory      pooled_genomic
gen_page org.tair.abrc.catalog.category.MutantSeedCategory         mutant_seed
gen_page org.tair.abrc.catalog.category.CellLinesCategory          cell_lines 
gen_page org.tair.abrc.catalog.category.ProteinChipsCategory       protein_chips 
gen_page org.tair.abrc.catalog.category.EducationKitCategory       education_kits 
gen_page org.tair.abrc.catalog.category.SetOfLinesCategory         set_of_lines
gen_page org.tair.abrc.catalog.category.MASetOfLinesCategory       ma_set_of_lines
gen_page org.tair.abrc.catalog.category.MutantAccumulationCategory       mutant_accumulation 

