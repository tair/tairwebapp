// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;

import org.tair.utilities.*;

import javax.mail.*;
import javax.mail.internet.*;

/**
 * SymbolMailer sends all emails related to Gene Class Symbol insert/update functions 
 * to recipients including curators and users. Environment specific values 
 * such as MAIL_HOST name are found in WebApp object.
 */
public class SymbolMailer{
    
    private String toAddress ;
    private String submitter_email = null ;
    private String mutantCurator = WebApp.getProperty("MUTANT_SYMBOL_CURATOR_EMAIL") ;
    private String tairCurator = WebApp.getProperty("PRODUCT_SYMBOL_CURATOR_EMAIL");
    private String orgURL = WebApp.getServerURL();
    private String fromAddress = null ;

    public SymbolMailer(){
    }
   
    public void setSubmitterEmail (String email){
	submitter_email= email;  
    }
    
    public String getSubmitterEmail  (){
        return 	submitter_email;
    }

    /** Send notice to curator when a gene class symbol added to TAIR database
     * @param CompositeGeneClassSymbol the new gene class symbol submitted 
     */ 
    public void sendSubmitNoticeToCurator( CompositeGeneClassSymbol symbol) 
	throws InvalidParameterException {
        String  subject = "" ;
	if ( symbol.get_has_mutant_phenotype() != null && 
             symbol.get_has_mutant_phenotype().booleanValue()){ 
	    subject = "New Mutant Symbol submitted to TAIR database";
	    toAddress = mutantCurator;
        }else {
            toAddress = tairCurator ;
            subject = "New Gene Product Symbol submitted to TAIR database" ;
        }
        // TAIR-425: Set the from address to the submittor's address to get this into JIRA properly.
	    fromAddress=submitter_email;

        StringBuffer content = new StringBuffer(); 
        if (symbol.get_symbol() != null ){
	    content .append ("Symbol Name: " + symbol.get_symbol() + "\r\n");
        }
        if ( symbol.get_submitter_info() != null ){
            content.append ("Submitted By: " + symbol.get_submitter_info() + "\r\n" );
        }
        content.append ( "Log in to "+orgURL+", you can review/approve symbol from welcome page" );
        boolean cc = false ;
        sendEmail (  subject, content.toString(), cc );

    }

     /** Send curator decision to submitter when curator made a decision on  gene class symbol
     * @param CompositeGeneClassSymbol the new gene class symbol curator made decision on
     * @param comment symbol curator's comment on this symbol
     * @param jira JIRA issue number (optional)
     */ 
    public void sendCuratorDecisionToUser( CompositeGeneClassSymbol symbol, String comment, String jira ) 
	throws InvalidParameterException {
       
        // toAddress = submitter_email;
        // TAIR-430: Send the email to the JIRA curator email address; JIRA sends the comment to the end user.
        toAddress = tairCurator ;
        
        if ( toAddress != null ){
	    setFromAddress ( symbol);
	    String curator_signature = getCuratorSignature ( symbol);
	    String symbol_name = "" ;

	    if (symbol.get_symbol() != null ){
		symbol_name = symbol.get_symbol() ;
	    }else {
                return;  
            }

        StringBuffer subject_buffer = new StringBuffer(); 

        // Append the optional JIRA issue information to create JIRA comment.
        if (jira != null) {
            subject_buffer.append("[TAIR JIRA] Commented: (");
            subject_buffer.append(jira);
            subject_buffer.append(")");
        }
        subject_buffer.append("Gene Class Symbol: ");
	    subject_buffer.append ( symbol_name );
	    if ( symbol.get_status() != null){
		subject_buffer.append ( " has been reviewed" );  
	    } 
         
	    StringBuffer content_buffer = getEmailContentBody(symbol_name,symbol);
      
	    if( comment != null && comment.trim().length()>0){ 
		content_buffer.append("\nTAIR curator's comment:\n "+ comment+ "\n" ); 
	    }
        
	    content_buffer.append("\n\nSincerely,\n");

	    if (curator_signature != null){ content_buffer.append( curator_signature ); }

	    sendEmail (  subject_buffer.toString(), content_buffer.toString(), true );
        }
    }
   
    /** makes the email content body 
     * it contains basic informations about the GeneClassSymbol this email about
     * @param String symbal_name   
     * @param CompositeGeneClassSymbol the gene class symbol this email based on
     * @return a StringBuffer 
     */
    private StringBuffer  getEmailContentBody ( String name,CompositeGeneClassSymbol symbol){         
	String submitter_infor = symbol.get_submitter_info() != null ? symbol.get_submitter_info(): "User" ;
        StringBuffer content_buffer = 
	    new StringBuffer ( "Dear " + submitter_infor + ":\n\n" +
			       "Thank you for submitting the following symbol to TAIR:\n"+
			       "Gene Class Symbol: "+ name +"\n\n"  );
        if ( symbol.get_descriptive_symbol() != null ){
	    content_buffer.append ("Symbol Full Name: " + symbol.get_descriptive_symbol() + "\n" );
        }
	boolean phenotype = false; 
	if( symbol.get_has_mutant_phenotype() != null && symbol.get_has_mutant_phenotype().booleanValue() ){
	    phenotype =  symbol.get_has_mutant_phenotype().booleanValue();  
	}
        if (phenotype){
            content_buffer.append ("Gene name based on: " + (phenotype? "mutant phenotype":"gene product") + "\n");
        }
        if (symbol.getAssociatedOrgName( )!= null ){
            content_buffer.append ("Reference Laboratory: "+ symbol.getAssociatedOrgName( )+ "\n");
        }

        if (symbol.get_status() != null) {
	    content_buffer.append ("The status of this symbol is: " +  symbol.get_status()+ "\n");

            if ( symbol.get_status().equals ("approved") && symbol.get_tair_object_id() != null ){ 
		content_buffer.append("You can view a detail page for your symbol here:\n"+ 
				      orgURL + 
				      "/servlets/TairObject?type=gene_class_symbol&id=" +
				      symbol.get_tair_object_id() ) ;
            }else if ( symbol.get_status().equals ("pending")  ){
		content_buffer.append("You can modify this symbol by clicking this URL:\n"+
				      orgURL+"/servlets/processor?type=genesymbol&update_action=edit_symbol&id="+
				      symbol.get_tair_object_id() + "\n" + 
				      "Please reply to this email if you have any questions" ); 
            }
        }
        return 	content_buffer;
    }
    /**send message routine to send message
     */
    private void  sendEmail(String subject, String content, boolean cc)
	throws InvalidParameterException   {
	String from = null;
	from = fromAddress == null ? WebApp.getProperty( "FROM_ADDRESS" ): fromAddress;  
	try {     
	    if ( toAddress != null ) {
		   EMail.send(WebApp.getProperty( "MAIL_HOST" ), from, toAddress, subject, content, cc);
	    }
	} catch ( Exception e ) {
		throw new InvalidParameterException( "Mail could not be sent to " + 
						     toAddress + " : " + e.getMessage() );
	}
    }

    // set curator signature 
    private String getCuratorSignature (  CompositeGeneClassSymbol symbol){
          return "\n\nTAIR Curator\n" +
		 "The Arabidopsis Information Resource\n" +
		 "Carnegie Institution of Washington\n"+
		 "Department of Plant Biology\n"+
		 "260 Panama Street\n"+
	      "Stanford, CA 94305\n" ; 
    }

    // set fromAddress according to symbol type
    // if symbol_type is product symbol, set fromAddress to product symbol curator
    // if is mutant symbol, set fromAddress to mutant symbol curator
 
    private void setFromAddress(  CompositeGeneClassSymbol symbol) {
	fromAddress = WebApp.getProperty( "PRODUCT_SYMBOL_CURATOR_EMAIL" );
	if (symbol.get_has_mutant_phenotype() != null && 
	    symbol.get_has_mutant_phenotype().booleanValue() ){
	    fromAddress = WebApp.getProperty("MUTANT_SYMBOL_CURATOR_EMAIL");
	} 
    } 
}
