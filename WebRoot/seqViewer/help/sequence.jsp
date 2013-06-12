<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Search Tips") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("/Blast/BLAST_help.jsp") %>' />
</jsp:include>
              <DL>
                <DT>Name Search
                  
                  <DD>
                    <UL>
                      <LI>Maximum query number: 250 (entries)
                        <LI>Format: tab and(or) new line delimited<BR>
                            <OL> 
                              <LI>Names separated by new lines:
<PRE>
at5g55270
BP-80
ATELP1
CHL6
CNX1
bal
</PRE>
                              <LI>Names separated by tabs:
                                <PRE>
at5g55270       BP-80   ATELP1  CHL6    CNX1    bal
                                </PRE>
                                </OL>
                    </UL>
                  </DD>
              </DT>
              <DT>Sequence Search
                <DD>
                    <UL>
                      <LI>Maximum query number: 4 (multifasta format only)
                        
                        <LI>Format:
                          <OL>
                            <LI>Simple sequence:
                              
                              <PRE>
agaagaagataacaactcaacacaatttttcatgaatgattattt
              </PRE> 		

                              <LI>Fasta format:
                                
                                <PRE>
>my primer
agaagaagataacaactcaacac		
              </PRE>                                 
              
                                
                                <LI>Multifasta format:

              <PRE>
>primer 1
agaagaagataacaactcaacac
>primer 2
tgggtatgcaacataatcagaag		
              </PRE> 

                          </OL>
                  </UL>
                  
                </DL>                        
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
