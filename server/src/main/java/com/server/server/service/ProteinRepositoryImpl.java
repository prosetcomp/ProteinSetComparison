
package com.server.server.service;



import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.*;
import java.util.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Service;
import java.util.regex.*;
import com.server.server.model.PROTEIN;
import com.server.server.repository.ProteinRepositoryCustom;
import java.util.HashMap;


@Service
public class ProteinRepositoryImpl implements ProteinRepositoryCustom {

        @PersistenceContext
        private EntityManager em;
        String sessionID;
	public Connection conn;
        
       int map_size;
       int temp_map_size=0;
     

public void iterateJsonObject(List<List<String>> key_value_list, String id_json, Connection connection,List<List<String>> key_value_combinator_list) throws SQLException{
        		List<List<CriteriaQuery>> criteriaList = new ArrayList<>();
           sessionID=id_json;
           conn=connection;
           map_size= key_value_list.size();
	combinatorList.addAll(key_value_combinator_list);
         
	
           //Set Up Criteria For Each Query
		 int variable=0;
            for(int a = 0 ;a< key_value_list.size();a++) {
            		temp_map_size++;
            		
				  List<String> list_element= key_value_list.get(a);
				  List<CriteriaQuery> temp_criteria = new ArrayList<>();
				  for (int b=0;b<list_element.size();b++){
					  String[] parts =list_element.get(b).split("=");
					  String key=parts[0];
					  String value =parts[1];
					
						Pattern pattern = Pattern.compile("(?i)(GO:[0]+|GO:)");
						Pattern pattern2 = Pattern.compile("(?i)(pf[0]+|pf)");
						Pattern pattern3 = Pattern.compile("(?i)(ipr[0]+|ipr)");
						Pattern pattern4 = Pattern.compile("(?i)(R-[A-Z]{3}-[0]+|R-[A-Z]{3}-)");
						Matcher matcher = pattern.matcher(value);
						Matcher matcher2 = pattern2.matcher(value);
						Matcher matcher3 = pattern3.matcher(value);
						Matcher matcher4 = pattern4.matcher(value);
						String regex_part = null;
						if (matcher.find())
						{
							regex_part=matcher.group();
							value=value.replace(regex_part, "");
						   
						}
						else if (matcher2.find())
						{
							regex_part=matcher2.group();
							value=value.replace(regex_part, "");
						   
						}
						
						else if (matcher3.find())
						{
							regex_part=matcher3.group();
							value=value.replace(regex_part, "");
						   
						}
						else if (matcher4.find())
						{
							regex_part=matcher4.group();
							value=value.replace(regex_part, "");
						   
						} 
						

						  String regex = "[0-9]+";
						  if(value.matches(regex)) {
							  int foo = Integer.parseInt(value);
							  
							  if(key.equals("disease_accession")) {
					            	CriteriaQuery cq =searchProteinbyDiseaseAcc (foo);
					            	temp_criteria.add(cq);
					           }
							  else if (key.equals("disease_mim")) {
					            	CriteriaQuery cq =searchProteinbyDiseaseMim (foo);
					            	temp_criteria.add(cq);
					           }
							  else if (key.equals("domain_iprid")) {
					            	CriteriaQuery cq =searchProteinbyDomainIpr_id(foo);
					            	temp_criteria.add(cq);
					           }
							  else if (key.equals("disease_mim")) {
					            	CriteriaQuery cq =searchProteinbyDiseaseMim(foo);
					            	temp_criteria.add(cq);
					           }
							  else if (key.equals("domain_pfam")) {
					            	CriteriaQuery cq =searchProteinbyDomainPfam(foo);
					            	temp_criteria.add(cq);
					           }
							  else if (key.equals("publication_pmid")) {
					            	CriteriaQuery cq =searchProteinbyPublicationPmid(foo);
					            	temp_criteria.add(cq);
					           }
							  else if (key.equals("pathway_id")) {
							          CriteriaQuery cq =searchProteinbyPathwayId(foo);
					            	temp_criteria.add(cq);
					           }
							  else if (key.equals("protein_isreviewed")) {
					            	CriteriaQuery cq =searchProteinbyProteinIs_reviewed(foo);
					            	temp_criteria.add(cq);
					           }
							  else if (key.equals("protein_taxonid")) {
					            	CriteriaQuery cq =searchProteinbyProteinTaxon_id(foo);
					            	temp_criteria.add(cq);
					           }
							else if (key.equals("go_id")) {
					            	CriteriaQuery cq =searchProteinbyGo_termsTerm_id(foo);
					            	temp_criteria.add(cq);
					           }  
								criteriaList.add(variable, temp_criteria);
								
													
						  }
						   
						  else {
						
						      if(key.equals("disease_acronym")) {
								   CriteriaQuery cq =searchProteinbyDiseaseAcronym (value);
			        	            	   temp_criteria.add(cq);
		        	               } 
							  else if (key.equals("disease_identifier")) {
						            	CriteriaQuery cq =searchProteinbyDiseaseIdentifier(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("goterms_name")) {
						            	CriteriaQuery cq =searchProteinbyGo_termsName(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("domain_name")) {
						            	CriteriaQuery cq =searchProteinbyDomainName(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("taxon_name")) {
						            	CriteriaQuery cq = searchProteinbyTaxonName(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("pdb_pdb")) {
						            	CriteriaQuery cq = searchProteinbyProtein_pdbPdb(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("pdb_chain")) {
						            	CriteriaQuery cq = searchProteinbyProtein_pdbChain(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("protein_name")) {
						            	CriteriaQuery cq = searchProteinbyProteinName(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("secondary_accession")) {
						            	CriteriaQuery cq = searchProteinbyPrimary_SecondarySecondaryAccession(value);
						            	temp_criteria.add(cq);
						      }
							  else if (key.equals("publication_title")) {
						            	CriteriaQuery cq = searchProteinbyPublicationTitle(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("pathway_name")) {
						            	CriteriaQuery cq = searchProteinbyPathwayName(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("protein_accession")) {
						            	CriteriaQuery cq = searchProteinbyProteinAccession(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("protein_id")) {
						            	CriteriaQuery cq = searchProteinbyProteinId(value);
						            	temp_criteria.add(cq);
					           }
							  else if (key.equals("allergome")||key.equals("biocyc") || key.equals("biogrid") || 
									  key.equals("biomuta") || key.equals("chembl") || key.equals("dictybase")
									  || key.equals("drugbank") || key.equals("echobase") || key.equals("embl")
									  || key.equals("embl-cds") || key.equals("ensembl") || key.equals("ensemblgenome")
									  || key.equals("ensemblgenome_pro") || key.equals("ensemblgenome_trs") || key.equals("ensembl_pro")
									  || key.equals("ensembl_trs") || key.equals("flybase") || key.equals("genecards")
									  || key.equals("genedb") || key.equals("geneid") || key.equals("gene_name")
									  || key.equals("gene_orderedlocusname") || key.equals("gene_orfname") || key.equals("genereviews") 
									  || key.equals("gene_synonym") || key.equals("gi") || key.equals("hgnc")
									  || key.equals("kegg") || key.equals("orthodb") || key.equals("peroxibase")
									  || key.equals("pombase") || key.equals("rebase") || key.equals("refseq")
									  || key.equals("refseq_nt") || key.equals("rgd") || key.equals("sgd") 
									  || key.equals("string") || key.equals("unigene") || key.equals("uniparc")
									  || key.equals("unipathway") || key.equals("uniprotkb-id") || key.equals("uniref100") 
									  || key.equals("uniref50") || key.equals("uniref90") || key.equals("vectorbase")
									  || key.equals("wormbase") || key.equals("xenbase")
									  ) {
					            	CriteriaQuery cq = searchProteinbyProtein_crossrefTypeCrossref(key,value);
					            	temp_criteria.add(cq);
					            	
					           }
						       else if(key.equals("uniprot_accession")) {
                                     String[] words = value.split(",");
                                     for(int index=0;index<words.length;index++) {
                                             all_uniprot_accession.add(words[index]);
 
                                    }
                                    temp_map_size--; 
                                    collect_lastset.add(all_uniprot_accession);

                                                     
                               }


				              else if(key.equals("uniprot_id")) {
			                             String[] words = value.split(",");
			                             List<String> uniprot_id = new ArrayList<>();
			                             List<String> uniprot_id_join = new ArrayList<>();
			                             
						  
			                             Statement stmt = conn.createStatement();	
			                  			 String uniprot_table_name="UNIPROTID"+sessionID;
			                            	 String sql = "CREATE TEMPORARY TABLE " + uniprot_table_name +
			         	                            "(ID VARCHAR(40) not NULL ," +
			         	                            "PRIMARY KEY my_pkey (ID))";
			         						  
				
				         		        stmt.executeUpdate(sql);
				         		        String insert_sql="INSERT INTO " +uniprot_table_name +"(ID) VALUES(?)";
				         		        PreparedStatement ps = conn.prepareStatement(insert_sql);
			
			                             for(int index=0;index<words.length;index++) {
			                            	 uniprot_id.add(words[index]);
			                             }
			                              final int batchSize = 1000;
			              			      int count = 0;
			              				 
			                          	for(String protein:uniprot_id){
			 		 				       ps.setString(1, protein);
			 		 				       ps.addBatch();
			 		 				         if(++count % batchSize == 0) {
					 			    				ps.executeBatch();
			 						 	     }
									       ps.executeBatch();
			 		 				  	}
						
								    ResultSet rs = stmt.executeQuery("select ACCESSION from " + uniprot_table_name + " join PROTEIN on "+uniprot_table_name+".ID=PROTEIN.ID" );
			 		   				
			 		   				while(rs.next()) {
			 		   			  		 uniprot_id_join.add(rs.getString("ACCESSION"));
									
			 		   				}
									  all_uniprot_id.addAll(uniprot_id_join);
									  collect_lastset.add(all_uniprot_id);
									  temp_map_size--; 
			                           
			                  }

						 else if(key.equals("refid")) {
									String[] words = value.split(",");
		                             List<String> ref_id = new ArrayList<>();
		                             List<String> ref_id_join = new ArrayList<>();
		                             Statement stmt = conn.createStatement();	
		                             //Create temp table
		                  			 String ref_table_name="REFID"+sessionID;
		                            	 String sql = "CREATE TEMPORARY TABLE " + ref_table_name +
		         	                            "(CROSSREF VARCHAR(40) not NULL ," +
		         	                            "PRIMARY KEY my_pkey (CROSSREF))";
		         						  
			         		        stmt.executeUpdate(sql);
			         		        //Insert elements that table
			         		        String insert_sql="INSERT INTO " +ref_table_name +"(CROSSREF) VALUES(?)";
			         		        PreparedStatement ps = conn.prepareStatement(insert_sql);
		
		                             for(int index=0;index<words.length;index++) {
		                            	   ref_id.add(words[index]);
		                             }
		                             final int batchSize = 1000;
		              			    int count = 0;
						             				
		                          	for(String protein:ref_id){
		 		 				       ps.setString(1, protein);
		 		 				       ps.addBatch();
			 		 				   if(++count % batchSize == 0) {
					 			    			
					 							ps.executeBatch();
			 						 	}
		 		 				       ps.executeBatch();
		 		 				  	}
		                          	//Get accession 
		                          	ResultSet rs = stmt.executeQuery("select ACCESSION from " + ref_table_name + " join PROTEIN_CROSSREF on "+ref_table_name+".CROSSREF=PROTEIN_CROSSREF.CROSSREF WHERE PROTEIN_CROSSREF.TYPE='RefSeq'" );
			                   		while(rs.next()) {
			 		   				   	ref_id_join.add(rs.getString("ACCESSION"));
			 		   			    }
			 		   			  
			                   		all_ref_id.addAll(ref_id_join);
			 		   			    collect_lastset.add(all_ref_id);
			      				
		                           
		                             temp_map_size--; 
						   }

							 else if(key.equals("ensembl_id")) {
								String[] words = value.split(",");
	                             List<String> ensembl_id = new ArrayList<>();
	                             List<String> ensembl_id_join = new ArrayList<>();
	                             Statement stmt = conn.createStatement();	
	                             //Create temp table
	                  			 String ensembl_table_name="ENSEMBLID"+sessionID;
	                            	 String sql = "CREATE TEMPORARY TABLE " + ensembl_table_name +
	         	                            "(CROSSREF VARCHAR(40) not NULL ," +
	         	                            "PRIMARY KEY my_pkey (CROSSREF))";
	         						  
		         		        stmt.executeUpdate(sql);
		         		        //Insert elements that table
		         		        String insert_sql="INSERT INTO " +ensembl_table_name +"(CROSSREF) VALUES(?)";
		         		        PreparedStatement ps = conn.prepareStatement(insert_sql);
	
	                             for(int index=0;index<words.length;index++) {
	                            	  ensembl_id.add(words[index]);
	                             }
	                             final int batchSize = 1000;
	              			    int count = 0;
					             				
	                          	for(String protein:ensembl_id){
	 		 				       ps.setString(1, protein);
	 		 				       ps.addBatch();
		 		 				   if(++count % batchSize == 0) {
				 			    			
				 							ps.executeBatch();
		 						 	}
	 		 				       ps.executeBatch();
	 		 				  	}
	                          	//Get accession 
	                          	ResultSet rs = stmt.executeQuery("select ACCESSION from " + ensembl_table_name + " join PROTEIN_CROSSREF on "+ensembl_table_name+".CROSSREF=PROTEIN_CROSSREF.CROSSREF WHERE PROTEIN_CROSSREF.TYPE='Ensembl'" );
		                   		while(rs.next()) {
		                   			ensembl_id_join.add(rs.getString("ACCESSION"));
		 		   			    }
		 		   			  
		                   		all_ensembl_id.addAll(ensembl_id_join);
		 		   			    collect_lastset.add(all_ensembl_id);
		      				
	                           
	                             temp_map_size--; 
					   }
						
							  criteriaList.add(variable, temp_criteria);
						
							
					}

					

						
				  }

				  variable++;
				 
			 }
            			
						
            			parseListOfList(criteriaList,conn);
  
            
              
        	 }
    
        int current_position=1;        
	
        public void parseListOfList(List<List<CriteriaQuery>> criteriaList, Connection conn) throws SQLException{
	        	 if(temp_map_size==0){
					createTempTable(sessionID,collect_lastset);
			 }
			 for(int a = 0 ;a<temp_map_size;a++) {
				  List<CriteriaQuery> cl =criteriaList.get(a);
        		     	  List<String> combinator_query = combinatorList.get(a);
        		          runCriteriaList(cl,combinator_query,a+1);
			 	  
				// runCriteriaList(cl,a+1);
			 	  current_position++; 
		     }
			 current_position=1;
			 temp_map_size=0;   			    		 
        	}

        public void runCriteriaList(List<CriteriaQuery> cl,List<String> combinator_query,int query_number){
	        	int i = cl.size()-1;
	        List<Set<String>> returnList= new ArrayList<Set<String>>();    
		 List<String> query_combinator = new ArrayList<>();
	        query_combinator.addAll(combinator_query);
	        while(i>-1) {
	         	CriteriaQuery cquery=cl.get(i);
		        List<String> result = em.createQuery(cquery).getResultList();

		  		Set<String> resultSet = new HashSet<>(result);
				returnList.add(resultSet);
		                i--;
	         }

	        processSetList(query_combinator,returnList,query_number);  
             
        }
        
  

	 List<Set<String>> collect_lastset =new ArrayList<Set<String>>();
	 Set<String> all_uniprot_accession=new HashSet<>();
	 Set<String> all_uniprot_id=new HashSet<>();
	 Set<String> all_ref_id=new HashSet<>();
	 Set<String> all_ensembl_id=new HashSet<>();
	 List<List<String>> combinatorList = new ArrayList<>();	
	public void processSetList(List<String> OperationList , List<Set<String>> returnList,int query_number) {	   
			Set<String> finalIntersectionSet = returnList.get(returnList.size()-1);
			//Set<String> lastintersection = new HashSet<>();
	        Set<String> lastset = new HashSet<>();
  	       
		//OperationList="AND";
  	        if(returnList.size()==1) {
                  lastset.addAll(finalIntersectionSet);
                         }
		 int index=1;
		int a =returnList.size()-2;
			 for(int i=returnList.size()-2;i>=0;i--) {
						String combinator=OperationList.get(index);
						if(combinator.equals("AND")) {
								finalIntersectionSet.retainAll(returnList.get(i));
						}
						else if(combinator.equals("OR")) {
										finalIntersectionSet.addAll(returnList.get(i));
					  }
						else if(combinator.equals("NOT")) {
        				finalIntersectionSet.removeAll(returnList.get(i));
        			 }
			     index++;
    	  }
		index=1;
		lastset.addAll(finalIntersectionSet);
		collect_lastset.add(lastset);                         
			 if(current_position==temp_map_size) {
		      	 createTempTable(sessionID,collect_lastset);
	       	 }
		 			     		
    }
        
      


		public void createTempTable(String session_ID, List<Set<String>> collect_lastset)  {
			try {
 
			    for(int group=1;group<=collect_lastset.size();group++) {
			        	 Statement stmt = conn.createStatement();	
				     String table_name = "protlist"+group+"_"+session_ID;
		
			        	 String sql = "CREATE TEMPORARY TABLE " + table_name +
		                            "(ACCESSION VARCHAR(40) not NULL ," +
		                            "PRIMARY KEY my_pkey (ACCESSION))";
							  
	
			        stmt.executeUpdate(sql);
			        String insert_sql="INSERT INTO " +table_name +"(ACCESSION) VALUES(?)";
			        PreparedStatement ps = conn.prepareStatement(insert_sql);
			        List<String> accession = new ArrayList<>();
					accession.addAll(collect_lastset.get(group-1));
	
				    //BATCH
				   final int batchSize = 10000;
				   int count = 0;
					for(String protein:accession){
					       ps.setString(1, protein);
					       ps.addBatch();
						   if(++count % batchSize == 0) {
			    				
							   ps.executeBatch();
						   }	
			        }
					ps.executeBatch();
					
				}
			   for(int table_index=0;table_index<map_size;table_index++){ 
			    if(collect_lastset.size()==map_size){
			
			     //Call Stored Procedure
			     	callStoredProcedure(conn,map_size,sessionID);
				break;
			     }
	
			   }         
		 } catch (SQLException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		  } catch(NullPointerException e){
		        System.out.println("Null Pointer exception");
		  }
		}
	

		public void callStoredProcedure(Connection connection , int querynumber ,String session_id) throws SQLException {

			if(map_size==1) {
							//SET
					      CallableStatement gm_1set =connection.prepareCall("{ call GM_1SET(?) }");
					      gm_1set.setString(1, sessionID);
					      gm_1set.execute();  
			            
			              //SET
			              CallableStatement gb_1set =connection.prepareCall("{ call GB_1SET(?) }");
			              gb_1set.setString(1, sessionID);
			              gb_1set.execute();  
			             
			              //SET
			              CallableStatement pw_1set =connection.prepareCall("{ call PW_1SET(?) }");
			              pw_1set.setString(1, sessionID);
			              pw_1set.execute();  
			             
			              //SET
			              CallableStatement dm_1set =connection.prepareCall("{ call DM_1SET(?) }");
			              dm_1set.setString(1, sessionID);
			              dm_1set.execute();  
			             
					      //SET
			              CallableStatement pr_1set =connection.prepareCall("{ call PROT_1SET(?) }");
			              pr_1set.setString(1, sessionID);
			              pr_1set.execute();  

		
			              callJoinFunction(conn);
		
				}
			else if(map_size==2) {
				  
				    
				  	//GM2SET
				  	//SET
				    CallableStatement gm_2set=connection.prepareCall("{ call GM_2SET(?) }");
				    gm_2set.setString(1, sessionID);
				    gm_2set.execute();  
                		
				    //SET
                		CallableStatement gb_2set =connection.prepareCall("{ call GB_2SET(?) }");
  	                gb_2set.setString(1, sessionID);
  	                gb_2set.execute();  
  	               
  	                //PW2SET
		            //SET
	                CallableStatement pw_2set =connection.prepareCall("{ call PW_2SET(?) }");
	                pw_2set.setString(1, sessionID);
	                pw_2set.execute();  
  	               
	                //DM2SET
		            //SET
	                CallableStatement dm_2set =connection.prepareCall("{ call DM_2SET(?) }");
		            dm_2set.setString(1, sessionID);
		            dm_2set.execute();  
		          
		            //PROT2SET
		            	//SET
		            CallableStatement pr_2set =connection.prepareCall("{ call PROT_2SET(?) }");
		            pr_2set.setString(1, sessionID);
		            pr_2set.execute();  
		            callJoinFunction(conn); 				
			}
			else if(map_size==3) {
				    //GM3SET
					//SET
					CallableStatement gm_3set=connection.prepareCall("{ call GM_3SET(?) }");
					gm_3set.setString(1, sessionID);
					gm_3set.execute();
			
					//GB3SET
	    	            //SET
             		CallableStatement gb_3set =connection.prepareCall("{ call GB_3SET(?) }");
	                gb_3set.setString(1, sessionID);
	                gb_3set.execute();  
	             
	             
	                //PW3SET
	                //SET
	                CallableStatement pw_3set =connection.prepareCall("{ call PW_3SET(?) }");
	                pw_3set.setString(1, sessionID);
	                pw_3set.execute();  
  	               
	                //DM3SET
		            //SET
	                CallableStatement dm_3set =connection.prepareCall("{ call DM_3SET(?) }");
		            dm_3set.setString(1, sessionID);
		            dm_3set.execute();  
		          
		            //PROT3SET
		            //SET
		            CallableStatement pr_3set =connection.prepareCall("{ call PROT_3SET(?) }");
		            pr_3set.setString(1, sessionID);
		            pr_3set.execute();  

		            callJoinFunction(conn); 
		}	
			else if(map_size==4) {
				
			    //GM4SET
				//SET
			    CallableStatement gm_4set=connection.prepareCall("{ call GM_4SET(?) }");
			    gm_4set.setString(1, sessionID);
			    gm_4set.execute();  
         		
         		//GB4SET

         		//SET
         		CallableStatement gb_4set =connection.prepareCall("{ call GB_4SET(?) }");
                gb_4set.setString(1, sessionID);
                gb_4set.execute();  
               
                //PW4SET
                //SET
                CallableStatement pw_4set =connection.prepareCall("{ call PW_4SET(?) }");
                pw_4set.setString(1, sessionID);
                pw_4set.execute();  
              
                //DM4SET
         		//SET
                CallableStatement dm_4set =connection.prepareCall("{ call DM_4SET(?) }");
	            dm_4set.setString(1, sessionID);
	            dm_4set.execute();  
	           
         		//PROT4SET
	            //SET
	            CallableStatement pr_4set =connection.prepareCall("{ call PROT_4SET(?) }");
	            pr_4set.setString(1, sessionID);
	            pr_4set.execute();  

	            
	            callJoinFunction(conn); 
				
			}
}
		
    
public void  callJoinFunction(Connection conn) throws SQLException {

		call_GM_StoredProcedure(conn);
	    call_GB_StoredProcedure(conn);  
	    call_PW_StoredProcedure(conn);
	    call_DM_StoredProcedure(conn);
	    call_PROT_StoredProcedure(conn);
		collect_lastset.clear();
		all_uniprot_accession.clear();
		all_uniprot_id.clear(); 
		all_ref_id.clear();
		all_ensembl_id.clear();		
		combinatorList.clear();			

	}


	public List<List<HashMap<String,String>>> call_GM_StoredProcedure(Connection connection) throws SQLException{
			List<List<HashMap<String,String>>> result2 = new ArrayList<List<HashMap<String, String>>>();
			List<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
			if(map_size==1) {
				 CallableStatement gm_1set_join =connection.prepareCall("{ call 1SET_GM_a_(?) }");
	             gm_1set_join.setString(1, sessionID);
	             gm_1set_join.execute(); 
	             ResultSet rs_gm_a_join =gm_1set_join.getResultSet();	
	             while(rs_gm_a_join.next()) {
		            	  HashMap<String, String> data = new HashMap<String, String>();
		            	  data.put("go_id", rs_gm_a_join.getString("GO_ID"));
		            	  data.put("name", rs_gm_a_join.getString("NAME"));
		            	  data.put("parents", rs_gm_a_join.getString("PARENTS"));
		            	  data.put("depth", rs_gm_a_join.getString("DEPTH"));
		            	  result.add(data);
		            	  	
		        } 
	             result2.add(result);
		   
	      }
			
			else if(map_size==2) {
				//2 QUERY REGION(A,B,C)
				List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
				//JOIN
				 CallableStatement gm_2set_join =connection.prepareCall("{ call 2SET_GM_a_(?) }");
	             gm_2set_join.setString(1, sessionID);
	             gm_2set_join.execute(); 
	             ResultSet rs_gm_a_join =gm_2set_join.getResultSet();	
				 while(rs_gm_a_join.next()) {
		            	  HashMap<String, String> data = new HashMap<String, String>();
		            	  data.put("go_id", rs_gm_a_join.getString("GO_ID"));
		            	  data.put("name", rs_gm_a_join.getString("NAME"));
		            	  data.put("parents", rs_gm_a_join.getString("PARENTS"));
		            	  data.put("depth", rs_gm_a_join.getString("DEPTH"));
		            	  result_a.add(data);
	            	  	
	              } 
	              //JOIN
   			     CallableStatement gm_2set_b_join =connection.prepareCall("{ call 2SET_GM_b_(?) }");
   	             gm_2set_b_join.setString(1, sessionID);
   	             gm_2set_b_join.execute(); 
   	             ResultSet rs_gm_b_join =gm_2set_b_join.getResultSet();
   	             while(rs_gm_b_join.next()) {
            	 		  HashMap<String, String> data = new HashMap<String, String>();
	   	            	  data.put("go_id", rs_gm_b_join.getString("GO_ID"));
		            	  data.put("name", rs_gm_b_join.getString("NAME"));
		            	  data.put("parents", rs_gm_b_join.getString("PARENTS"));
		            	  data.put("depth", rs_gm_b_join.getString("DEPTH"));
		            	  result_b.add(data);
   	              }  
         		
   	             //JOIN
  			     CallableStatement gm_2set_c_join =connection.prepareCall("{ call 2SET_GM_c_(?) }");
  	             gm_2set_c_join.setString(1, sessionID);
  	             gm_2set_c_join.execute(); 
  	             ResultSet rs_gm_c_join =gm_2set_c_join.getResultSet();
			     while(rs_gm_c_join.next()) {
  	            	  	  HashMap<String, String> data = new HashMap<String, String>();
	  	            	  data.put("go_id", rs_gm_c_join.getString("GO_ID"));
		            	  data.put("name", rs_gm_c_join.getString("NAME"));
		            	  data.put("parents", rs_gm_c_join.getString("PARENTS"));
		            	  data.put("depth", rs_gm_c_join.getString("DEPTH"));
		            	  result_c.add(data);
  	              }  
         		
  	              result2.add(result_a);
  	              result2.add(result_b);
  	              result2.add(result_c);
	            	 
	         }
				
			else if(map_size==3) {
				//QUERY 3 REGION(A,B,C,D,E,F,G)
				List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
				
				
				 //JOIN
 			     CallableStatement gm_3set_a_join =connection.prepareCall("{ call 3SET_GM_a_(?) }");
 	              gm_3set_a_join.setString(1, sessionID);
 	              gm_3set_a_join.execute(); 
 	              ResultSet rs_gm_a_join =gm_3set_a_join.getResultSet();
 	              while(rs_gm_a_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("go_id", rs_gm_a_join.getString("GO_ID"));
 	            	  	   data.put("name", rs_gm_a_join.getString("NAME"));
 	            	  	   data.put("parents", rs_gm_a_join.getString("PARENTS"));
 	            	  	   data.put("depth", rs_gm_a_join.getString("DEPTH"));
 	            	  	   result_a.add(data);
 	            	 }  

        		    //JOIN
			     CallableStatement gm_3set_b_join =connection.prepareCall("{ call 3SET_GM_b_(?) }");
	              gm_3set_b_join.setString(1, sessionID);
	              gm_3set_b_join.execute(); 
	             ResultSet rs_gm_b_join =gm_3set_b_join.getResultSet();
	              while(rs_gm_b_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("go_id", rs_gm_b_join.getString("GO_ID"));
	            	  	   data.put("name", rs_gm_b_join.getString("NAME"));
	            	  	   data.put("parents", rs_gm_b_join.getString("PARENTS"));
	            	  	   data.put("depth", rs_gm_b_join.getString("DEPTH"));
	            	  	   result_b.add(data);
	              }  
	            
        		 //JOIN
			     CallableStatement gm_3set_c_join =connection.prepareCall("{ call 3SET_GM_c_(?) }");
	              gm_3set_c_join.setString(1, sessionID);
	              gm_3set_c_join.execute(); 
	             ResultSet rs_gm_c_join =gm_3set_c_join.getResultSet();
	              while(rs_gm_c_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("go_id", rs_gm_c_join.getString("GO_ID"));
	            	  	   data.put("name", rs_gm_c_join.getString("NAME"));
	            	  	   data.put("parents", rs_gm_c_join.getString("PARENTS"));
	            	  	   data.put("depth", rs_gm_c_join.getString("DEPTH"));
	            	  	   result_c.add(data);
	              } 
	         
	              //JOIN
			     CallableStatement gm_3set_d_join =connection.prepareCall("{ call 3SET_GM_d_(?) }");
	              gm_3set_d_join.setString(1, sessionID);
	              gm_3set_d_join.execute(); 
	             ResultSet rs_gm_d_join =gm_3set_d_join.getResultSet();
	              while(rs_gm_d_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("go_id", rs_gm_d_join.getString("GO_ID"));
	            	  	   data.put("name", rs_gm_d_join.getString("NAME"));
	            	  	   data.put("parents", rs_gm_d_join.getString("PARENTS"));
	            	  	   data.put("depth", rs_gm_d_join.getString("DEPTH"));
	            	  	   result_d.add(data);
	              } 
	       
	              //JOIN
 			     CallableStatement gm_3set_e_join =connection.prepareCall("{ call 3SET_GM_e_(?) }");
 	              gm_3set_e_join.setString(1, sessionID);
 	              gm_3set_e_join.execute(); 
 	             ResultSet rs_gm_e_join =gm_3set_e_join.getResultSet();
 	              while(rs_gm_e_join.next()) {
	 	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("go_id", rs_gm_e_join.getString("GO_ID"));
	          	  	   data.put("name", rs_gm_e_join.getString("NAME"));
	          	  	   data.put("parents", rs_gm_e_join.getString("PARENTS"));
	          	  	   data.put("depth", rs_gm_e_join.getString("DEPTH"));
	          	  	   result_e.add(data);
 	              } 
 	         
 	              //JOIN
        		  CallableStatement gm_3set_f_join =connection.prepareCall("{ call 3SET_GM_f_(?) }");
   	              gm_3set_f_join.setString(1, sessionID);
   	              gm_3set_f_join.execute(); 
   	              ResultSet rs_gm_f_join =gm_3set_f_join.getResultSet();
   	              while(rs_gm_f_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("go_id", rs_gm_f_join.getString("GO_ID"));
	          	  	   data.put("name", rs_gm_f_join.getString("NAME"));
	          	  	   data.put("parents", rs_gm_f_join.getString("PARENTS"));
	          	  	   data.put("depth", rs_gm_f_join.getString("DEPTH"));
	          	  	   result_f.add(data);
	              } 
   	        
   	              //JOIN
      		  	  CallableStatement gm_3set_g_join =connection.prepareCall("{ call 3SET_GM_g_(?) }");
   	              gm_3set_g_join.setString(1, sessionID);
   	              gm_3set_g_join.execute(); 
   	              ResultSet rs_gm_g_join =gm_3set_g_join.getResultSet();
   	              while(rs_gm_g_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("go_id", rs_gm_g_join.getString("GO_ID"));
	          	  	   data.put("name", rs_gm_g_join.getString("NAME"));
	          	  	   data.put("parents", rs_gm_g_join.getString("PARENTS"));
	          	  	   data.put("depth", rs_gm_g_join.getString("DEPTH"));
	          	  	   result_g.add(data);
	              } 
   	              result2.add(result_a);
	              result2.add(result_b);
	              result2.add(result_c);
	              result2.add(result_d);
  	              result2.add(result_e);
  	              result2.add(result_f);
  	              result2.add(result_g);
			}
			
				else if(map_size==4) {
					//4 QUERY REGION(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O) 
					List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_h = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_i = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_j = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_k = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_l = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_m = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_n = new ArrayList<HashMap<String, String>>();
					List<HashMap<String, String>> result_o = new ArrayList<HashMap<String, String>>();
					
					//JOIN
	 			     CallableStatement gm_4set_a_join =connection.prepareCall("{ call 4SET_GM_a_(?) }");
	 	              gm_4set_a_join.setString(1, sessionID);
	 	              gm_4set_a_join.execute(); 
	 	              ResultSet rs_gm_a_join =gm_4set_a_join.getResultSet();
	 	              while(rs_gm_a_join.next()) {
	 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	 	            	  	   data.put("go_id", rs_gm_a_join.getString("GO_ID"));
	 	            	  	   data.put("name", rs_gm_a_join.getString("NAME"));
	 	            	  	   data.put("parents", rs_gm_a_join.getString("PARENTS"));
	 	            	  	   data.put("depth", rs_gm_a_join.getString("DEPTH"));
	 	            	  	   result_a.add(data);
	 	            	 }  

	        		    //JOIN
				     CallableStatement gm_4set_b_join =connection.prepareCall("{ call 4SET_GM_b_(?) }");
		              gm_4set_b_join.setString(1, sessionID);
		              gm_4set_b_join.execute(); 
		             ResultSet rs_gm_b_join =gm_4set_b_join.getResultSet();
		              while(rs_gm_b_join.next()) {
		            	  	   HashMap<String, String> data = new HashMap<String, String>();
		            	  	   data.put("go_id", rs_gm_b_join.getString("GO_ID"));
		            	  	   data.put("name", rs_gm_b_join.getString("NAME"));
		            	  	   data.put("parents", rs_gm_b_join.getString("PARENTS"));
		            	  	   data.put("depth", rs_gm_b_join.getString("DEPTH"));
		            	  	   result_b.add(data);
		              }  
		            
	        		    //JOIN
				     CallableStatement gm_4set_c_join =connection.prepareCall("{ call 4SET_GM_c_(?) }");
		              gm_4set_c_join.setString(1, sessionID);
		              gm_4set_c_join.execute(); 
		             ResultSet rs_gm_c_join =gm_4set_c_join.getResultSet();
		              while(rs_gm_c_join.next()) {
			            	   HashMap<String, String> data = new HashMap<String, String>();
		            	  	   data.put("go_id", rs_gm_c_join.getString("GO_ID"));
		            	  	   data.put("name", rs_gm_c_join.getString("NAME"));
		            	  	   data.put("parents", rs_gm_c_join.getString("PARENTS"));
		            	  	   data.put("depth", rs_gm_c_join.getString("DEPTH"));
		            	  	   result_c.add(data);
		              } 
		         
		              //JOIN
				     CallableStatement gm_4set_d_join =connection.prepareCall("{ call 4SET_GM_d_(?) }");
		              gm_4set_d_join.setString(1, sessionID);
		              gm_4set_d_join.execute(); 
		             ResultSet rs_gm_d_join =gm_4set_d_join.getResultSet();
		              while(rs_gm_d_join.next()) {
			            	   HashMap<String, String> data = new HashMap<String, String>();
		            	  	   data.put("go_id", rs_gm_d_join.getString("GO_ID"));
		            	  	   data.put("name", rs_gm_d_join.getString("NAME"));
		            	  	   data.put("parents", rs_gm_d_join.getString("PARENTS"));
		            	  	   data.put("depth", rs_gm_d_join.getString("DEPTH"));
		            	  	   result_d.add(data);
		              } 
		       
		              //JOIN
	 			     CallableStatement gm_4set_e_join =connection.prepareCall("{ call 4SET_GM_e_(?) }");
	 	              gm_4set_e_join.setString(1, sessionID);
	 	              gm_4set_e_join.execute(); 
	 	             ResultSet rs_gm_e_join =gm_4set_e_join.getResultSet();
	 	              while(rs_gm_e_join.next()) {
		 	            	   HashMap<String, String> data = new HashMap<String, String>();
		          	  	   data.put("go_id", rs_gm_e_join.getString("GO_ID"));
		          	  	   data.put("name", rs_gm_e_join.getString("NAME"));
		          	  	   data.put("parents", rs_gm_e_join.getString("PARENTS"));
		          	  	   data.put("depth", rs_gm_e_join.getString("DEPTH"));
		          	  	   result_e.add(data);
	 	              } 
	 	         
	 	              //JOIN
	        		  CallableStatement gm_4set_f_join =connection.prepareCall("{ call 4SET_GM_f_(?) }");
	   	              gm_4set_f_join.setString(1, sessionID);
	   	              gm_4set_f_join.execute(); 
	   	              ResultSet rs_gm_f_join =gm_4set_f_join.getResultSet();
	   	              while(rs_gm_f_join.next()) {
		   	            	   HashMap<String, String> data = new HashMap<String, String>();
		          	  	   data.put("go_id", rs_gm_f_join.getString("GO_ID"));
		          	  	   data.put("name", rs_gm_f_join.getString("NAME"));
		          	  	   data.put("parents", rs_gm_f_join.getString("PARENTS"));
		          	  	   data.put("depth", rs_gm_f_join.getString("DEPTH"));
		          	  	   result_f.add(data);
		              } 
	   	        
	   	              //JOIN
	      		  	  CallableStatement gm_4set_g_join =connection.prepareCall("{ call 4SET_GM_g_(?) }");
	   	              gm_4set_g_join.setString(1, sessionID);
	   	              gm_4set_g_join.execute(); 
	   	              ResultSet rs_gm_g_join =gm_4set_g_join.getResultSet();
	   	              while(rs_gm_g_join.next()) {
		   	            	   HashMap<String, String> data = new HashMap<String, String>();
		          	  	   data.put("go_id", rs_gm_g_join.getString("GO_ID"));
		          	  	   data.put("name", rs_gm_g_join.getString("NAME"));
		          	  	   data.put("parents", rs_gm_g_join.getString("PARENTS"));
		          	  	   data.put("depth", rs_gm_g_join.getString("DEPTH"));
		          	  	   result_g.add(data);
		              } 
	   	           //JOIN
	  			     CallableStatement gm_4set_h_join =connection.prepareCall("{ call 4SET_GM_h_(?) }");
	  	              gm_4set_h_join.setString(1, sessionID);
	  	              gm_4set_h_join.execute(); 
	  	              ResultSet rs_gm_h_join =gm_4set_h_join.getResultSet();
	  	              while(rs_gm_h_join.next()) {
	  	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	  	            	  	   data.put("go_id", rs_gm_h_join.getString("GO_ID"));
	  	            	  	   data.put("name", rs_gm_h_join.getString("NAME"));
	  	            	  	   data.put("parents", rs_gm_h_join.getString("PARENTS"));
	  	            	  	   data.put("depth", rs_gm_h_join.getString("DEPTH"));
	  	            	  	   result_h.add(data);
	  	            	 }  

	         		    //JOIN
	 			     CallableStatement gm_4set_i_join =connection.prepareCall("{ call 4SET_GM_i_(?) }");
	 	              gm_4set_i_join.setString(1, sessionID);
	 	              gm_4set_i_join.execute(); 
	 	             ResultSet rs_gm_i_join =gm_4set_i_join.getResultSet();
	 	              while(rs_gm_i_join.next()) {
	 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	 	            	  	   data.put("go_id", rs_gm_i_join.getString("GO_ID"));
	 	            	  	   data.put("name", rs_gm_i_join.getString("NAME"));
	 	            	  	   data.put("parents", rs_gm_i_join.getString("PARENTS"));
	 	            	  	   data.put("depth", rs_gm_i_join.getString("DEPTH"));
	 	            	  	   result_i.add(data);
	 	              }  
	 	            
	         		 //JOIN
	 			     CallableStatement gm_4set_j_join =connection.prepareCall("{ call 4SET_GM_j_(?) }");
	 	              gm_4set_j_join.setString(1, sessionID);
	 	              gm_4set_j_join.execute(); 
	 	             ResultSet rs_gm_j_join =gm_4set_j_join.getResultSet();
	 	              while(rs_gm_j_join.next()) {
	 		            	   HashMap<String, String> data = new HashMap<String, String>();
	 	            	  	   data.put("go_id", rs_gm_j_join.getString("GO_ID"));
	 	            	  	   data.put("name", rs_gm_j_join.getString("NAME"));
	 	            	  	   data.put("parents", rs_gm_j_join.getString("PARENTS"));
	 	            	  	   data.put("depth", rs_gm_j_join.getString("DEPTH"));
	 	            	  	   result_j.add(data);
	 	              } 
	 	         
	 	              //JOIN
	 			     CallableStatement gm_4set_k_join =connection.prepareCall("{ call 4SET_GM_k_(?) }");
	 	              gm_4set_k_join.setString(1, sessionID);
	 	              gm_4set_k_join.execute(); 
	 	             ResultSet rs_gm_k_join =gm_4set_k_join.getResultSet();
	 	              while(rs_gm_k_join.next()) {
	 		            	   HashMap<String, String> data = new HashMap<String, String>();
	 	            	  	   data.put("go_id", rs_gm_k_join.getString("GO_ID"));
	 	            	  	   data.put("name", rs_gm_k_join.getString("NAME"));
	 	            	  	   data.put("parents", rs_gm_k_join.getString("PARENTS"));
	 	            	  	   data.put("depth", rs_gm_k_join.getString("DEPTH"));
	 	            	  	   result_k.add(data);
	 	              } 
	 	       
	 	              //JOIN
	  			     CallableStatement gm_4set_l_join =connection.prepareCall("{ call 4SET_GM_l_(?) }");
	  	              gm_4set_l_join.setString(1, sessionID);
	  	              gm_4set_l_join.execute(); 
	  	             ResultSet rs_gm_l_join =gm_4set_l_join.getResultSet();
	  	              while(rs_gm_l_join.next()) {
	 	 	            	   HashMap<String, String> data = new HashMap<String, String>();
	 	          	  	   data.put("go_id", rs_gm_l_join.getString("GO_ID"));
	 	          	  	   data.put("name", rs_gm_l_join.getString("NAME"));
	 	          	  	   data.put("parents", rs_gm_l_join.getString("PARENTS"));
	 	          	  	   data.put("depth", rs_gm_l_join.getString("DEPTH"));
	 	          	  	   result_l.add(data);
	  	              } 
	  	         
	  	              //JOIN
	         		  CallableStatement gm_4set_m_join =connection.prepareCall("{ call 4SET_GM_m_(?) }");
	    	              gm_4set_m_join.setString(1, sessionID);
	    	              gm_4set_m_join.execute(); 
	    	              ResultSet rs_gm_m_join =gm_4set_m_join.getResultSet();
	    	              while(rs_gm_m_join.next()) {
	 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	 	          	  	   data.put("go_id", rs_gm_m_join.getString("GO_ID"));
	 	          	  	   data.put("name", rs_gm_m_join.getString("NAME"));
	 	          	  	   data.put("parents", rs_gm_m_join.getString("PARENTS"));
	 	          	  	   data.put("depth", rs_gm_m_join.getString("DEPTH"));
	 	          	  	   result_m.add(data);
	 	              } 
	    	        
	    	              //JOIN
	       		  	  CallableStatement gm_4set_n_join =connection.prepareCall("{ call 4SET_GM_n_(?) }");
	    	              gm_4set_n_join.setString(1, sessionID);
	    	              gm_4set_n_join.execute(); 
	    	              ResultSet rs_gm_n_join =gm_4set_n_join.getResultSet();
	    	              while(rs_gm_n_join.next()) {
	 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	 	          	  	   data.put("go_id", rs_gm_n_join.getString("GO_ID"));
	 	          	  	   data.put("name", rs_gm_n_join.getString("NAME"));
	 	          	  	   data.put("parents", rs_gm_n_join.getString("PARENTS"));
	 	          	  	   data.put("depth", rs_gm_n_join.getString("DEPTH"));
	 	          	  	   result_n.add(data);
	 	              } 
	                 //JOIN
	                  CallableStatement gm_4set_o_join =connection.prepareCall("{ call 4SET_GM_o_(?) }");
	    	              gm_4set_o_join.setString(1, sessionID);
	    	              gm_4set_o_join.execute(); 
	    	              ResultSet rs_gm_o_join =gm_4set_o_join.getResultSet();
	    	              while(rs_gm_o_join.next()) {
	 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	 	          	  	   data.put("go_id", rs_gm_o_join.getString("GO_ID"));
	 	          	  	   data.put("name", rs_gm_o_join.getString("NAME"));
	 	          	  	   data.put("parents", rs_gm_o_join.getString("PARENTS"));
	 	          	  	   data.put("depth", rs_gm_o_join.getString("DEPTH"));
	 	          	  	   result_o.add(data);
	 	              } 
	    	              result2.add(result_a);
	    	              result2.add(result_b);
	    	              result2.add(result_c);
	    	              result2.add(result_d);
      	              result2.add(result_e);
      	              result2.add(result_f);
      	              result2.add(result_g);
      	              result2.add(result_h);
	  	              result2.add(result_i);
	  	              result2.add(result_j);
	  	              result2.add(result_k);
	    	              result2.add(result_l);
	    	              result2.add(result_m);
	    	              result2.add(result_n);
	    	              result2.add(result_o);
				
				}
			return result2;
			
			
		}


	
	public List<List<HashMap<String,String>>> call_GB_StoredProcedure(Connection connection) throws SQLException{
		List<List<HashMap<String,String>>> result2 = new ArrayList<List<HashMap<String, String>>>();
		List<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		if(map_size==1) {
			 CallableStatement gb_1set_join =connection.prepareCall("{ call 1SET_GB_a_(?) }");
             gb_1set_join.setString(1, sessionID);
             gb_1set_join.execute(); 
             ResultSet rs_gb_a_join =gb_1set_join.getResultSet();	
             while(rs_gb_a_join.next()) {
	            	  HashMap<String, String> data = new HashMap<String, String>();
	            	  data.put("go_id", rs_gb_a_join.getString("GO_ID"));
	            	  data.put("name", rs_gb_a_join.getString("NAME"));
	            	  data.put("parents", rs_gb_a_join.getString("PARENTS"));
	            	  data.put("depth", rs_gb_a_join.getString("DEPTH"));
	            	  result.add(data);
	            	  	
	        } 
             result2.add(result);
        }
		
		else if(map_size==2) {
			//2 QUERY REGION(A,B,C)
			List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
			//JOIN
			 CallableStatement gb_1set_join =connection.prepareCall("{ call 2SET_GB_a_(?) }");
             gb_1set_join.setString(1, sessionID);
             gb_1set_join.execute(); 
             ResultSet rs_gb_a_join =gb_1set_join.getResultSet();	
			 while(rs_gb_a_join.next()) {
	            	  HashMap<String, String> data = new HashMap<String, String>();
	            	  data.put("go_id", rs_gb_a_join.getString("GO_ID"));
	            	  data.put("name", rs_gb_a_join.getString("NAME"));
	            	  data.put("parents", rs_gb_a_join.getString("PARENTS"));
	            	  data.put("depth", rs_gb_a_join.getString("DEPTH"));
	            	  result_a.add(data);
            	  	
              } 
              //JOIN
			     CallableStatement gb_2set_b_join =connection.prepareCall("{ call 2SET_GB_b_(?) }");
	             gb_2set_b_join.setString(1, sessionID);
	             gb_2set_b_join.execute(); 
	             ResultSet rs_gb_b_join =gb_2set_b_join.getResultSet();
	             while(rs_gb_b_join.next()) {
        	 		  HashMap<String, String> data = new HashMap<String, String>();
   	            	  data.put("go_id", rs_gb_b_join.getString("GO_ID"));
	            	  data.put("name", rs_gb_b_join.getString("NAME"));
	            	  data.put("parents", rs_gb_b_join.getString("PARENTS"));
	            	  data.put("depth", rs_gb_b_join.getString("DEPTH"));
	            	  result_b.add(data);
	              }  
     		
	             //JOIN
			     CallableStatement gb_2set_c_join =connection.prepareCall("{ call 2SET_GB_c_(?) }");
	             gb_2set_c_join.setString(1, sessionID);
	             gb_2set_c_join.execute(); 
	             ResultSet rs_gb_c_join =gb_2set_c_join.getResultSet();
		     while(rs_gb_c_join.next()) {
	            	  	  HashMap<String, String> data = new HashMap<String, String>();
  	            	  data.put("go_id", rs_gb_c_join.getString("GO_ID"));
	            	  data.put("name", rs_gb_c_join.getString("NAME"));
	            	  data.put("parents", rs_gb_c_join.getString("PARENTS"));
	            	  data.put("depth", rs_gb_c_join.getString("DEPTH"));
	            	  result_c.add(data);
	              }  
     		
	              result2.add(result_a);
	              result2.add(result_b);
	              result2.add(result_c);
            	 
         }
			
		else if(map_size==3) {
			//QUERY 3 REGION(A,B,C,D,E,F,G)
			List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
			
			
			 //JOIN
			     CallableStatement gb_3set_a_join =connection.prepareCall("{ call 3SET_GB_a_(?) }");
	              gb_3set_a_join.setString(1, sessionID);
	              gb_3set_a_join.execute(); 
	              ResultSet rs_gb_a_join =gb_3set_a_join.getResultSet();
	              while(rs_gb_a_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("go_id", rs_gb_a_join.getString("GO_ID"));
	            	  	   data.put("name", rs_gb_a_join.getString("NAME"));
	            	  	   data.put("parents", rs_gb_a_join.getString("PARENTS"));
	            	  	   data.put("depth", rs_gb_a_join.getString("DEPTH"));
	            	  	   result_a.add(data);
	            	 }  

    		    //JOIN
		     CallableStatement gb_3set_b_join =connection.prepareCall("{ call 3SET_GB_b_(?) }");
              gb_3set_b_join.setString(1, sessionID);
              gb_3set_b_join.execute(); 
             ResultSet rs_gb_b_join =gb_3set_b_join.getResultSet();
              while(rs_gb_b_join.next()) {
            	  	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("go_id", rs_gb_b_join.getString("GO_ID"));
            	  	   data.put("name", rs_gb_b_join.getString("NAME"));
            	  	   data.put("parents", rs_gb_b_join.getString("PARENTS"));
            	  	   data.put("depth", rs_gb_b_join.getString("DEPTH"));
            	  	   result_b.add(data);
              }  
            
    		 //JOIN
		     CallableStatement gb_3set_c_join =connection.prepareCall("{ call 3SET_GB_c_(?) }");
              gb_3set_c_join.setString(1, sessionID);
              gb_3set_c_join.execute(); 
             ResultSet rs_gb_c_join =gb_3set_c_join.getResultSet();
              while(rs_gb_c_join.next()) {
	            	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("go_id", rs_gb_c_join.getString("GO_ID"));
            	  	   data.put("name", rs_gb_c_join.getString("NAME"));
            	  	   data.put("parents", rs_gb_c_join.getString("PARENTS"));
            	  	   data.put("depth", rs_gb_c_join.getString("DEPTH"));
            	  	   result_c.add(data);
              } 
         
              //JOIN
		     CallableStatement gb_3set_d_join =connection.prepareCall("{ call 3SET_GB_d_(?) }");
              gb_3set_d_join.setString(1, sessionID);
              gb_3set_d_join.execute(); 
             ResultSet rs_gb_d_join =gb_3set_d_join.getResultSet();
              while(rs_gb_d_join.next()) {
	            	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("go_id", rs_gb_d_join.getString("GO_ID"));
            	  	   data.put("name", rs_gb_d_join.getString("NAME"));
            	  	   data.put("parents", rs_gb_d_join.getString("PARENTS"));
            	  	   data.put("depth", rs_gb_d_join.getString("DEPTH"));
            	  	   result_d.add(data);
              } 
       
              //JOIN
			     CallableStatement gb_3set_e_join =connection.prepareCall("{ call 3SET_GB_e_(?) }");
	              gb_3set_e_join.setString(1, sessionID);
	              gb_3set_e_join.execute(); 
	             ResultSet rs_gb_e_join =gb_3set_e_join.getResultSet();
	              while(rs_gb_e_join.next()) {
 	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("go_id", rs_gb_e_join.getString("GO_ID"));
          	  	   data.put("name", rs_gb_e_join.getString("NAME"));
          	  	   data.put("parents", rs_gb_e_join.getString("PARENTS"));
          	  	   data.put("depth", rs_gb_e_join.getString("DEPTH"));
          	  	   result_e.add(data);
	              } 
	         
	              //JOIN
    		  CallableStatement gb_3set_f_join =connection.prepareCall("{ call 3SET_GB_f_(?) }");
	              gb_3set_f_join.setString(1, sessionID);
	              gb_3set_f_join.execute(); 
	              ResultSet rs_gb_f_join =gb_3set_f_join.getResultSet();
	              while(rs_gb_f_join.next()) {
   	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("go_id", rs_gb_f_join.getString("GO_ID"));
          	  	   data.put("name", rs_gb_f_join.getString("NAME"));
          	  	   data.put("parents", rs_gb_f_join.getString("PARENTS"));
          	  	   data.put("depth", rs_gb_f_join.getString("DEPTH"));
          	  	   result_f.add(data);
              } 
	        
	              //JOIN
  		  	  CallableStatement gb_3set_g_join =connection.prepareCall("{ call 3SET_GB_g_(?) }");
	              gb_3set_g_join.setString(1, sessionID);
	              gb_3set_g_join.execute(); 
	              ResultSet rs_gb_g_join =gb_3set_g_join.getResultSet();
	              while(rs_gb_g_join.next()) {
   	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("go_id", rs_gb_g_join.getString("GO_ID"));
          	  	   data.put("name", rs_gb_g_join.getString("NAME"));
          	  	   data.put("parents", rs_gb_g_join.getString("PARENTS"));
          	  	   data.put("depth", rs_gb_g_join.getString("DEPTH"));
          	  	   result_g.add(data);
              } 
	              result2.add(result_a);
	              result2.add(result_b);
	              result2.add(result_c);
	              result2.add(result_d);
	              result2.add(result_e);
	              result2.add(result_f);
	              result2.add(result_g);
		}
		
			else if(map_size==4) {
				//4 QUERY REGION(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O) 
				List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_h = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_i = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_j = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_k = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_l = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_m = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_n = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_o = new ArrayList<HashMap<String, String>>();
				
				//JOIN
 			     CallableStatement gb_4set_a_join =connection.prepareCall("{ call 4SET_GB_a_(?) }");
 	              gb_4set_a_join.setString(1, sessionID);
 	              gb_4set_a_join.execute(); 
 	              ResultSet rs_gb_a_join =gb_4set_a_join.getResultSet();
 	              while(rs_gb_a_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("go_id", rs_gb_a_join.getString("GO_ID"));
 	            	  	   data.put("name", rs_gb_a_join.getString("NAME"));
 	            	  	   data.put("parents", rs_gb_a_join.getString("PARENTS"));
 	            	  	   data.put("depth", rs_gb_a_join.getString("DEPTH"));
 	            	  	   result_a.add(data);
 	            	 }  

        		    //JOIN
			     CallableStatement gb_4set_b_join =connection.prepareCall("{ call 4SET_GB_b_(?) }");
	              gb_4set_b_join.setString(1, sessionID);
	              gb_4set_b_join.execute(); 
	             ResultSet rs_gb_b_join =gb_4set_b_join.getResultSet();
	              while(rs_gb_b_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("go_id", rs_gb_b_join.getString("GO_ID"));
	            	  	   data.put("name", rs_gb_b_join.getString("NAME"));
	            	  	   data.put("parents", rs_gb_b_join.getString("PARENTS"));
	            	  	   data.put("depth", rs_gb_b_join.getString("DEPTH"));
	            	  	   result_b.add(data);
	              }  
	            
        		    //JOIN
			     CallableStatement gb_4set_c_join =connection.prepareCall("{ call 4SET_GB_c_(?) }");
	              gb_4set_c_join.setString(1, sessionID);
	              gb_4set_c_join.execute(); 
	             ResultSet rs_gb_c_join =gb_4set_c_join.getResultSet();
	              while(rs_gb_c_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("go_id", rs_gb_c_join.getString("GO_ID"));
	            	  	   data.put("name", rs_gb_c_join.getString("NAME"));
	            	  	   data.put("parents", rs_gb_c_join.getString("PARENTS"));
	            	  	   data.put("depth", rs_gb_c_join.getString("DEPTH"));
	            	  	   result_c.add(data);
	              } 
	         
	              //JOIN
			     CallableStatement gb_4set_d_join =connection.prepareCall("{ call 4SET_GB_d_(?) }");
	              gb_4set_d_join.setString(1, sessionID);
	              gb_4set_d_join.execute(); 
	             ResultSet rs_gb_d_join =gb_4set_d_join.getResultSet();
	              while(rs_gb_d_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("go_id", rs_gb_d_join.getString("GO_ID"));
	            	  	   data.put("name", rs_gb_d_join.getString("NAME"));
	            	  	   data.put("parents", rs_gb_d_join.getString("PARENTS"));
	            	  	   data.put("depth", rs_gb_d_join.getString("DEPTH"));
	            	  	   result_d.add(data);
	              } 
	       
	              //JOIN
 			     CallableStatement gb_4set_e_join =connection.prepareCall("{ call 4SET_GB_e_(?) }");
 	              gb_4set_e_join.setString(1, sessionID);
 	              gb_4set_e_join.execute(); 
 	             ResultSet rs_gb_e_join =gb_4set_e_join.getResultSet();
 	              while(rs_gb_e_join.next()) {
	 	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("go_id", rs_gb_e_join.getString("GO_ID"));
	          	  	   data.put("name", rs_gb_e_join.getString("NAME"));
	          	  	   data.put("parents", rs_gb_e_join.getString("PARENTS"));
	          	  	   data.put("depth", rs_gb_e_join.getString("DEPTH"));
	          	  	   result_e.add(data);
 	              } 
 	         
 	              //JOIN
        		  CallableStatement gb_4set_f_join =connection.prepareCall("{ call 4SET_GB_f_(?) }");
   	              gb_4set_f_join.setString(1, sessionID);
   	              gb_4set_f_join.execute(); 
   	              ResultSet rs_gb_f_join =gb_4set_f_join.getResultSet();
   	              while(rs_gb_f_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("go_id", rs_gb_f_join.getString("GO_ID"));
	          	  	   data.put("name", rs_gb_f_join.getString("NAME"));
	          	  	   data.put("parents", rs_gb_f_join.getString("PARENTS"));
	          	  	   data.put("depth", rs_gb_f_join.getString("DEPTH"));
	          	  	   result_f.add(data);
	              } 
   	        
   	              //JOIN
      		  	  CallableStatement gb_4set_g_join =connection.prepareCall("{ call 4SET_GB_g_(?) }");
   	              gb_4set_g_join.setString(1, sessionID);
   	              gb_4set_g_join.execute(); 
   	              ResultSet rs_gb_g_join =gb_4set_g_join.getResultSet();
   	              while(rs_gb_g_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("go_id", rs_gb_g_join.getString("GO_ID"));
	          	  	   data.put("name", rs_gb_g_join.getString("NAME"));
	          	  	   data.put("parents", rs_gb_g_join.getString("PARENTS"));
	          	  	   data.put("depth", rs_gb_g_join.getString("DEPTH"));
	          	  	   result_g.add(data);
	              } 
   	           //JOIN
  			     CallableStatement gb_4set_h_join =connection.prepareCall("{ call 4SET_GB_h_(?) }");
  	              gb_4set_h_join.setString(1, sessionID);
  	              gb_4set_h_join.execute(); 
  	              ResultSet rs_gb_h_join =gb_4set_h_join.getResultSet();
  	              while(rs_gb_h_join.next()) {
  	            	  	   HashMap<String, String> data = new HashMap<String, String>();
  	            	  	   data.put("go_id", rs_gb_h_join.getString("GO_ID"));
  	            	  	   data.put("name", rs_gb_h_join.getString("NAME"));
  	            	  	   data.put("parents", rs_gb_h_join.getString("PARENTS"));
  	            	  	   data.put("depth", rs_gb_h_join.getString("DEPTH"));
  	            	  	   result_h.add(data);
  	            	 }  

         		    //JOIN
 			     CallableStatement gb_4set_i_join =connection.prepareCall("{ call 4SET_GB_i_(?) }");
 	              gb_4set_i_join.setString(1, sessionID);
 	              gb_4set_i_join.execute(); 
 	             ResultSet rs_gb_i_join =gb_4set_i_join.getResultSet();
 	              while(rs_gb_i_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("go_id", rs_gb_i_join.getString("GO_ID"));
 	            	  	   data.put("name", rs_gb_i_join.getString("NAME"));
 	            	  	   data.put("parents", rs_gb_i_join.getString("PARENTS"));
 	            	  	   data.put("depth", rs_gb_i_join.getString("DEPTH"));
 	            	  	   result_i.add(data);
 	              }  
 	            
         		 //JOIN
 			     CallableStatement gb_4set_j_join =connection.prepareCall("{ call 4SET_GB_j_(?) }");
 	              gb_4set_j_join.setString(1, sessionID);
 	              gb_4set_j_join.execute(); 
 	             ResultSet rs_gb_j_join =gb_4set_j_join.getResultSet();
 	              while(rs_gb_j_join.next()) {
 		            	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("go_id", rs_gb_j_join.getString("GO_ID"));
 	            	  	   data.put("name", rs_gb_j_join.getString("NAME"));
 	            	  	   data.put("parents", rs_gb_j_join.getString("PARENTS"));
 	            	  	   data.put("depth", rs_gb_j_join.getString("DEPTH"));
 	            	  	   result_j.add(data);
 	              } 
 	         
 	              //JOIN
 			     CallableStatement gb_4set_k_join =connection.prepareCall("{ call 4SET_GB_k_(?) }");
 	              gb_4set_k_join.setString(1, sessionID);
 	              gb_4set_k_join.execute(); 
 	             ResultSet rs_gb_k_join =gb_4set_k_join.getResultSet();
 	              while(rs_gb_k_join.next()) {
 		            	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("go_id", rs_gb_k_join.getString("GO_ID"));
 	            	  	   data.put("name", rs_gb_k_join.getString("NAME"));
 	            	  	   data.put("parents", rs_gb_k_join.getString("PARENTS"));
 	            	  	   data.put("depth", rs_gb_k_join.getString("DEPTH"));
 	            	  	   result_k.add(data);
 	              } 
 	       
 	              //JOIN
  			     CallableStatement gb_4set_l_join =connection.prepareCall("{ call 4SET_GB_l_(?) }");
  	              gb_4set_l_join.setString(1, sessionID);
  	              gb_4set_l_join.execute(); 
  	             ResultSet rs_gb_l_join =gb_4set_l_join.getResultSet();
  	              while(rs_gb_l_join.next()) {
 	 	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("go_id", rs_gb_l_join.getString("GO_ID"));
 	          	  	   data.put("name", rs_gb_l_join.getString("NAME"));
 	          	  	   data.put("parents", rs_gb_l_join.getString("PARENTS"));
 	          	  	   data.put("depth", rs_gb_l_join.getString("DEPTH"));
 	          	  	   result_l.add(data);
  	              } 
  	         
  	              //JOIN
         		  CallableStatement gb_4set_m_join =connection.prepareCall("{ call 4SET_GB_m_(?) }");
    	              gb_4set_m_join.setString(1, sessionID);
    	              gb_4set_m_join.execute(); 
    	              ResultSet rs_gb_m_join =gb_4set_m_join.getResultSet();
    	              while(rs_gb_m_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("go_id", rs_gb_m_join.getString("GO_ID"));
 	          	  	   data.put("name", rs_gb_m_join.getString("NAME"));
 	          	  	   data.put("parents", rs_gb_m_join.getString("PARENTS"));
 	          	  	   data.put("depth", rs_gb_m_join.getString("DEPTH"));
 	          	  	   result_m.add(data);
 	              } 
    	        
    	              //JOIN
       		  	  CallableStatement gb_4set_n_join =connection.prepareCall("{ call 4SET_GB_n_(?) }");
    	              gb_4set_n_join.setString(1, sessionID);
    	              gb_4set_n_join.execute(); 
    	              ResultSet rs_gb_n_join =gb_4set_n_join.getResultSet();
    	              while(rs_gb_n_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("go_id", rs_gb_n_join.getString("GO_ID"));
 	          	  	   data.put("name", rs_gb_n_join.getString("NAME"));
 	          	  	   data.put("parents", rs_gb_n_join.getString("PARENTS"));
 	          	  	   data.put("depth", rs_gb_n_join.getString("DEPTH"));
 	          	  	   result_n.add(data);
 	              } 
                 //JOIN
                  CallableStatement gb_4set_o_join =connection.prepareCall("{ call 4SET_GB_o_(?) }");
    	              gb_4set_o_join.setString(1, sessionID);
    	              gb_4set_o_join.execute(); 
    	              ResultSet rs_gb_o_join =gb_4set_o_join.getResultSet();
    	              while(rs_gb_o_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("go_id", rs_gb_o_join.getString("GO_ID"));
 	          	  	   data.put("name", rs_gb_o_join.getString("NAME"));
 	          	  	   data.put("parents", rs_gb_o_join.getString("PARENTS"));
 	          	  	   data.put("depth", rs_gb_o_join.getString("DEPTH"));
 	          	  	   result_o.add(data);
 	              } 
    	              result2.add(result_a);
    	              result2.add(result_b);
    	              result2.add(result_c);
    	              result2.add(result_d);
  	              result2.add(result_e);
  	              result2.add(result_f);
  	              result2.add(result_g);
  	              result2.add(result_h);
  	              result2.add(result_i);
  	              result2.add(result_j);
  	              result2.add(result_k);
    	              result2.add(result_l);
    	              result2.add(result_m);
    	              result2.add(result_n);
    	              result2.add(result_o);
			
			}
		return result2;
		
		
	}





	public List<List<HashMap<String,String>>> call_PW_StoredProcedure(Connection connection) throws SQLException{
		List<List<HashMap<String,String>>> result2 = new ArrayList<List<HashMap<String, String>>>();
		List<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		if(map_size==1) {
			 CallableStatement pw_1set_join =connection.prepareCall("{ call 1SET_PW_a_(?) }");
             pw_1set_join.setString(1, sessionID);
             pw_1set_join.execute(); 
             ResultSet rs_pw_a_join =pw_1set_join.getResultSet();	
             while(rs_pw_a_join.next()) {
	            	  HashMap<String, String> data = new HashMap<String, String>();
	            	  data.put("ipr_id", rs_pw_a_join.getString("IPR_ID"));
	            	  data.put("name", rs_pw_a_join.getString("NAME"));
	            	  data.put("parents", rs_pw_a_join.getString("PARENTS"));
	            	 
	            	  result.add(data);
	            	  	
	        } 
             result2.add(result);
        }
		
		else if(map_size==2) {
			//2 QUERY REGION(A,B,C)
			List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
			//JOIN
			 CallableStatement pw_1set_join =connection.prepareCall("{ call 2SET_PW_a_(?) }");
             pw_1set_join.setString(1, sessionID);
             pw_1set_join.execute(); 
             ResultSet rs_pw_a_join =pw_1set_join.getResultSet();	
			 while(rs_pw_a_join.next()) {
	            	  HashMap<String, String> data = new HashMap<String, String>();
	            	  data.put("ipr_id", rs_pw_a_join.getString("IPR_ID"));
	            	  data.put("name", rs_pw_a_join.getString("NAME"));
	            	  data.put("parents", rs_pw_a_join.getString("PARENTS"));
	            	 
	            	  result_a.add(data);
            	  	
              } 
              //JOIN
			     CallableStatement pw_2set_b_join =connection.prepareCall("{ call 2SET_PW_b_(?) }");
	             pw_2set_b_join.setString(1, sessionID);
	             pw_2set_b_join.execute(); 
	             ResultSet rs_pw_b_join =pw_2set_b_join.getResultSet();
	             while(rs_pw_b_join.next()) {
        	 		  HashMap<String, String> data = new HashMap<String, String>();
   	            	  data.put("ipr_id", rs_pw_b_join.getString("IPR_ID"));
	            	  data.put("name", rs_pw_b_join.getString("NAME"));
	            	  data.put("parents", rs_pw_b_join.getString("PARENTS"));
	            	  
	            	  result_b.add(data);
	              }  
     		
	             //JOIN
			     CallableStatement pw_2set_c_join =connection.prepareCall("{ call 2SET_PW_c_(?) }");
	             pw_2set_c_join.setString(1, sessionID);
	             pw_2set_c_join.execute(); 
	             ResultSet rs_pw_c_join =pw_2set_c_join.getResultSet();
		     while(rs_pw_c_join.next()) {
	            	  	  HashMap<String, String> data = new HashMap<String, String>();
  	            	  data.put("ipr_id", rs_pw_c_join.getString("IPR_ID"));
	            	  data.put("name", rs_pw_c_join.getString("NAME"));
	            	  data.put("parents", rs_pw_c_join.getString("PARENTS"));
	            	  
	            	  result_c.add(data);
	              }  
     		
	              result2.add(result_a);
	              result2.add(result_b);
	              result2.add(result_c);
            	 
         }
			
		else if(map_size==3) {
			//QUERY 3 REGION(A,B,C,D,E,F,G)
			List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
			
			
			 //JOIN
			     CallableStatement pw_3set_a_join =connection.prepareCall("{ call 3SET_PW_a_(?) }");
	              pw_3set_a_join.setString(1, sessionID);
	              pw_3set_a_join.execute(); 
	              ResultSet rs_pw_a_join =pw_3set_a_join.getResultSet();
	              while(rs_pw_a_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("ipr_id", rs_pw_a_join.getString("IPR_ID"));
	            	  	   data.put("name", rs_pw_a_join.getString("NAME"));
	            	  	   data.put("parents", rs_pw_a_join.getString("PARENTS"));
	            	  	  
	            	  	   result_a.add(data);
	            	 }  

    		    //JOIN
		     CallableStatement pw_3set_b_join =connection.prepareCall("{ call 3SET_PW_b_(?) }");
              pw_3set_b_join.setString(1, sessionID);
              pw_3set_b_join.execute(); 
             ResultSet rs_pw_b_join =pw_3set_b_join.getResultSet();
              while(rs_pw_b_join.next()) {
            	  	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("ipr_id", rs_pw_b_join.getString("IPR_ID"));
            	  	   data.put("name", rs_pw_b_join.getString("NAME"));
            	  	   data.put("parents", rs_pw_b_join.getString("PARENTS"));
            	  	  
            	  	   result_b.add(data);
              }  
            
    		 //JOIN
		     CallableStatement pw_3set_c_join =connection.prepareCall("{ call 3SET_PW_c_(?) }");
              pw_3set_c_join.setString(1, sessionID);
              pw_3set_c_join.execute(); 
             ResultSet rs_pw_c_join =pw_3set_c_join.getResultSet();
              while(rs_pw_c_join.next()) {
	            	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("ipr_id", rs_pw_c_join.getString("IPR_ID"));
            	  	   data.put("name", rs_pw_c_join.getString("NAME"));
            	  	   data.put("parents", rs_pw_c_join.getString("PARENTS"));
            	  	 
            	  	   result_c.add(data);
              } 
         
              //JOIN
		     CallableStatement pw_3set_d_join =connection.prepareCall("{ call 3SET_PW_d_(?) }");
              pw_3set_d_join.setString(1, sessionID);
              pw_3set_d_join.execute(); 
             ResultSet rs_pw_d_join =pw_3set_d_join.getResultSet();
              while(rs_pw_d_join.next()) {
	            	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("ipr_id", rs_pw_d_join.getString("IPR_ID"));
            	  	   data.put("name", rs_pw_d_join.getString("NAME"));
            	  	   data.put("parents", rs_pw_d_join.getString("PARENTS"));
            	  	   
            	  	   result_d.add(data);
              } 
       
              //JOIN
			     CallableStatement pw_3set_e_join =connection.prepareCall("{ call 3SET_PW_e_(?) }");
	              pw_3set_e_join.setString(1, sessionID);
	              pw_3set_e_join.execute(); 
	             ResultSet rs_pw_e_join =pw_3set_e_join.getResultSet();
	              while(rs_pw_e_join.next()) {
 	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("ipr_id", rs_pw_e_join.getString("IPR_ID"));
          	  	   data.put("name", rs_pw_e_join.getString("NAME"));
          	  	   data.put("parents", rs_pw_e_join.getString("PARENTS"));
          	  	   
          	  	   result_e.add(data);
	              } 
	         
	              //JOIN
    		  CallableStatement pw_3set_f_join =connection.prepareCall("{ call 3SET_PW_f_(?) }");
	              pw_3set_f_join.setString(1, sessionID);
	              pw_3set_f_join.execute(); 
	              ResultSet rs_pw_f_join =pw_3set_f_join.getResultSet();
	              while(rs_pw_f_join.next()) {
   	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("ipr_id", rs_pw_f_join.getString("IPR_ID"));
          	  	   data.put("name", rs_pw_f_join.getString("NAME"));
          	  	   data.put("parents", rs_pw_f_join.getString("PARENTS"));
          	  	  
          	  	   result_f.add(data);
              } 
	        
	              //JOIN
  		  	  CallableStatement pw_3set_g_join =connection.prepareCall("{ call 3SET_PW_g_(?) }");
	              pw_3set_g_join.setString(1, sessionID);
	              pw_3set_g_join.execute(); 
	              ResultSet rs_pw_g_join =pw_3set_g_join.getResultSet();
	              while(rs_pw_g_join.next()) {
   	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("ipr_id", rs_pw_g_join.getString("IPR_ID"));
          	  	   data.put("name", rs_pw_g_join.getString("NAME"));
          	  	   data.put("parents", rs_pw_g_join.getString("PARENTS"));
          	  	  
          	  	   result_g.add(data);
              } 
	              result2.add(result_a);
	              result2.add(result_b);
	              result2.add(result_c);
	              result2.add(result_d);
	              result2.add(result_e);
	              result2.add(result_f);
	              result2.add(result_g);
		}
		
			else if(map_size==4) {
				//4 QUERY REGION(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O) 
				List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_h = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_i = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_j = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_k = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_l = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_m = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_n = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_o = new ArrayList<HashMap<String, String>>();
				
				//JOIN
 			     CallableStatement pw_4set_a_join =connection.prepareCall("{ call 4SET_PW_a_(?) }");
 	              pw_4set_a_join.setString(1,sessionID);
 	              pw_4set_a_join.execute(); 
 	              ResultSet rs_pw_a_join =pw_4set_a_join.getResultSet();
 	              while(rs_pw_a_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("ipr_id", rs_pw_a_join.getString("IPR_ID"));
 	            	  	   data.put("name", rs_pw_a_join.getString("NAME"));
 	            	  	   data.put("parents", rs_pw_a_join.getString("PARENTS"));
 	            	  	   
 	            	  	   result_a.add(data);
 	
			 }  

        		    //JOIN
			     CallableStatement pw_4set_b_join =connection.prepareCall("{ call 4SET_PW_b_(?) }");
	              pw_4set_b_join.setString(1, sessionID);
	              pw_4set_b_join.execute(); 
	             ResultSet rs_pw_b_join =pw_4set_b_join.getResultSet();
	              while(rs_pw_b_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("ipr_id", rs_pw_b_join.getString("IPR_ID"));
	            	  	   data.put("name", rs_pw_b_join.getString("NAME"));
	            	  	   data.put("parents", rs_pw_b_join.getString("PARENTS"));
	            	  	  
	            	  	   result_b.add(data);
	              }  
	            
        		    //JOIN
			     CallableStatement pw_4set_c_join =connection.prepareCall("{ call 4SET_PW_c_(?) }");
	              pw_4set_c_join.setString(1, sessionID);
	              pw_4set_c_join.execute(); 
	             ResultSet rs_pw_c_join =pw_4set_c_join.getResultSet();
	              while(rs_pw_c_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("ipr_id", rs_pw_c_join.getString("IPR_ID"));
	            	  	   data.put("name", rs_pw_c_join.getString("NAME"));
	            	  	   data.put("parents", rs_pw_c_join.getString("PARENTS"));
	            	  	   
	            	  	   result_c.add(data);
	              } 
	         
	              //JOIN
			     CallableStatement pw_4set_d_join =connection.prepareCall("{ call 4SET_PW_d_(?) }");
	              pw_4set_d_join.setString(1, sessionID);
	              pw_4set_d_join.execute(); 
	             ResultSet rs_pw_d_join =pw_4set_d_join.getResultSet();
	              while(rs_pw_d_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("ipr_id", rs_pw_d_join.getString("IPR_ID"));
	            	  	   data.put("name", rs_pw_d_join.getString("NAME"));
	            	  	   data.put("parents", rs_pw_d_join.getString("PARENTS"));
	            	  	  
	            	  	   result_d.add(data);
	              } 
	       
	              //JOIN
 			     CallableStatement pw_4set_e_join =connection.prepareCall("{ call 4SET_PW_e_(?) }");
 	              pw_4set_e_join.setString(1, sessionID);
 	              pw_4set_e_join.execute(); 
 	             ResultSet rs_pw_e_join =pw_4set_e_join.getResultSet();
 	              while(rs_pw_e_join.next()) {
	 	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("ipr_id", rs_pw_e_join.getString("IPR_ID"));
	          	  	   data.put("name", rs_pw_e_join.getString("NAME"));
	          	  	   data.put("parents", rs_pw_e_join.getString("PARENTS"));
	          	  	 
	          	  	   result_e.add(data);
 	              } 
 	         
 	              //JOIN
        		  CallableStatement pw_4set_f_join =connection.prepareCall("{ call 4SET_PW_f_(?) }");
   	              pw_4set_f_join.setString(1,sessionID);
   	              pw_4set_f_join.execute(); 
   	              ResultSet rs_pw_f_join =pw_4set_f_join.getResultSet();
   	              while(rs_pw_f_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("ipr_id", rs_pw_f_join.getString("IPR_ID"));
	          	  	   data.put("name", rs_pw_f_join.getString("NAME"));
	          	  	   data.put("parents", rs_pw_f_join.getString("PARENTS"));
	          	  	   
	          	  	   result_f.add(data);
	              } 
   	        
   	              //JOIN
      		  	  CallableStatement pw_4set_g_join =connection.prepareCall("{ call 4SET_PW_g_(?) }");
   	              pw_4set_g_join.setString(1, sessionID);
   	              pw_4set_g_join.execute(); 
   	              ResultSet rs_pw_g_join =pw_4set_g_join.getResultSet();
   	              while(rs_pw_g_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("ipr_id", rs_pw_g_join.getString("IPR_ID"));
	          	  	   data.put("name", rs_pw_g_join.getString("NAME"));
	          	  	   data.put("parents", rs_pw_g_join.getString("PARENTS"));
	          	  	   
	          	  	   result_g.add(data);
	              } 
   	           //JOIN
  			     CallableStatement pw_4set_h_join =connection.prepareCall("{ call 4SET_PW_h_(?) }");
  	              pw_4set_h_join.setString(1, sessionID);
  	              pw_4set_h_join.execute(); 
  	              ResultSet rs_pw_h_join =pw_4set_h_join.getResultSet();
  	              while(rs_pw_h_join.next()) {
  	            	  	   HashMap<String, String> data = new HashMap<String, String>();
  	            	  	   data.put("ipr_id", rs_pw_h_join.getString("IPR_ID"));
  	            	  	   data.put("name", rs_pw_h_join.getString("NAME"));
  	            	  	   data.put("parents", rs_pw_h_join.getString("PARENTS"));
  	            	  	  
  	            	  	   result_h.add(data);
  	            	 }  

         		    //JOIN
 			     CallableStatement pw_4set_i_join =connection.prepareCall("{ call 4SET_PW_i_(?) }");
 	              pw_4set_i_join.setString(1, sessionID);
 	              pw_4set_i_join.execute(); 
 	             ResultSet rs_pw_i_join =pw_4set_i_join.getResultSet();
 	              while(rs_pw_i_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("ipr_id", rs_pw_i_join.getString("IPR_ID"));
 	            	  	   data.put("name", rs_pw_i_join.getString("NAME"));
 	            	  	   data.put("parents", rs_pw_i_join.getString("PARENTS"));
 	            	  	  
 	            	  	   result_i.add(data);
 	              }  
 	            
         		 //JOIN
 			     CallableStatement pw_4set_j_join =connection.prepareCall("{ call 4SET_PW_j_(?) }");
 	              pw_4set_j_join.setString(1, sessionID);
 	              pw_4set_j_join.execute(); 
 	             ResultSet rs_pw_j_join =pw_4set_j_join.getResultSet();
 	              while(rs_pw_j_join.next()) {
 		            	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("ipr_id", rs_pw_j_join.getString("IPR_ID"));
 	            	  	   data.put("name", rs_pw_j_join.getString("NAME"));
 	            	  	   data.put("parents", rs_pw_j_join.getString("PARENTS"));
 	            	  	   
 	            	  	   result_j.add(data);
 	              } 
 	         
 	              //JOIN
 			     CallableStatement pw_4set_k_join =connection.prepareCall("{ call 4SET_PW_k_(?) }");
 	              pw_4set_k_join.setString(1, sessionID);
 	              pw_4set_k_join.execute(); 
 	             ResultSet rs_pw_k_join =pw_4set_k_join.getResultSet();
 	              while(rs_pw_k_join.next()) {
 		            	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("ipr_id", rs_pw_k_join.getString("IPR_ID"));
 	            	  	   data.put("name", rs_pw_k_join.getString("NAME"));
 	            	  	   data.put("parents", rs_pw_k_join.getString("PARENTS"));
 	            	  	   
 	            	  	   result_k.add(data);
 	              } 
 	       
 	              //JOIN
  			     CallableStatement pw_4set_l_join =connection.prepareCall("{ call 4SET_PW_l_(?) }");
  	              pw_4set_l_join.setString(1, sessionID);
  	              pw_4set_l_join.execute(); 
  	             ResultSet rs_pw_l_join =pw_4set_l_join.getResultSet();
  	              while(rs_pw_l_join.next()) {
 	 	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("ipr_id", rs_pw_l_join.getString("IPR_ID"));
 	          	  	   data.put("name", rs_pw_l_join.getString("NAME"));
 	          	  	   data.put("parents", rs_pw_l_join.getString("PARENTS"));
 	          	  	   
 	          	  	   result_l.add(data);
  	              } 
  	         
  	              //JOIN
         		  CallableStatement pw_4set_m_join =connection.prepareCall("{ call 4SET_PW_m_(?) }");
    	              pw_4set_m_join.setString(1, sessionID);
    	              pw_4set_m_join.execute(); 
    	              ResultSet rs_pw_m_join =pw_4set_m_join.getResultSet();
    	              while(rs_pw_m_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("ipr_id", rs_pw_m_join.getString("IPR_ID"));
 	          	  	   data.put("name", rs_pw_m_join.getString("NAME"));
 	          	  	   data.put("parents", rs_pw_m_join.getString("PARENTS"));
 	          	  	  
 	          	  	   result_m.add(data);
 	              } 
    	        
    	              //JOIN
       		  	  CallableStatement pw_4set_n_join =connection.prepareCall("{ call 4SET_PW_n_(?) }");
    	              pw_4set_n_join.setString(1, sessionID);
    	              pw_4set_n_join.execute(); 
    	              ResultSet rs_pw_n_join =pw_4set_n_join.getResultSet();
    	              while(rs_pw_n_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("ipr_id", rs_pw_n_join.getString("IPR_ID"));
 	          	  	   data.put("name", rs_pw_n_join.getString("NAME"));
 	          	  	   data.put("parents", rs_pw_n_join.getString("PARENTS"));
 	          	  	  
 	          	  	   result_n.add(data);
 	              } 
                 //JOIN
                  CallableStatement pw_4set_o_join =connection.prepareCall("{ call 4SET_PW_o_(?) }");
    	              pw_4set_o_join.setString(1, sessionID);
    	              pw_4set_o_join.execute(); 
    	              ResultSet rs_pw_o_join =pw_4set_o_join.getResultSet();
    	              while(rs_pw_o_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("ipr_id", rs_pw_o_join.getString("IPR_ID"));
 	          	  	   data.put("name", rs_pw_o_join.getString("NAME"));
 	          	  	   data.put("parents", rs_pw_o_join.getString("PARENTS"));
 	          	  	  
 	          	  	   result_o.add(data);
 	              } 
    	              result2.add(result_a);
    	              result2.add(result_b);
    	              result2.add(result_c);
    	              result2.add(result_d);
  	              result2.add(result_e);
  	              result2.add(result_f);
  	              result2.add(result_g);
  	              result2.add(result_h);
  	              result2.add(result_i);
  	              result2.add(result_j);
  	              result2.add(result_k);
    	              result2.add(result_l);
    	              result2.add(result_m);
    	              result2.add(result_n);
    	              result2.add(result_o);
			
			}
		return result2;
		
		
	}

		
	public List<List<HashMap<String,String>>> call_DM_StoredProcedure(Connection connection) throws SQLException{
		List<List<HashMap<String,String>>> result2 = new ArrayList<List<HashMap<String, String>>>();
		List<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		if(map_size==1) {
			 CallableStatement dm_1set_join =connection.prepareCall("{ call 1SET_DM_a_(?) }");
             dm_1set_join.setString(1, sessionID);
             dm_1set_join.execute(); 
             ResultSet rs_dm_a_join =dm_1set_join.getResultSet();	
             while(rs_dm_a_join.next()) {
	            	  HashMap<String, String> data = new HashMap<String, String>();
	            	  data.put("ipr", rs_dm_a_join.getString("IPR"));
	            	  data.put("name", rs_dm_a_join.getString("NAME"));
	            	  data.put("parents", rs_dm_a_join.getString("PARENTS"));
	            	 
	            	  result.add(data);
	            	  	
	        } 
             result2.add(result);
        }
		
		else if(map_size==2) {
			//2 QUERY REGION(A,B,C)
			List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
			//JOIN
			 CallableStatement dm_1set_join =connection.prepareCall("{ call 2SET_DM_a_(?) }");
             dm_1set_join.setString(1, sessionID);
             dm_1set_join.execute(); 
             ResultSet rs_dm_a_join =dm_1set_join.getResultSet();	
			 while(rs_dm_a_join.next()) {
	            	  HashMap<String, String> data = new HashMap<String, String>();
	            	  data.put("ipr", rs_dm_a_join.getString("IPR"));
	            	  data.put("name", rs_dm_a_join.getString("NAME"));
	            	  data.put("parents", rs_dm_a_join.getString("PARENTS"));
	            	 
	            	  result_a.add(data);
            	  	
              } 
              //JOIN
			     CallableStatement dm_2set_b_join =connection.prepareCall("{ call 2SET_DM_b_(?) }");
	             dm_2set_b_join.setString(1, sessionID);
	             dm_2set_b_join.execute(); 
	             ResultSet rs_dm_b_join =dm_2set_b_join.getResultSet();
	             while(rs_dm_b_join.next()) {
        	 		  HashMap<String, String> data = new HashMap<String, String>();
   	            	  data.put("ipr", rs_dm_b_join.getString("IPR"));
	            	  data.put("name", rs_dm_b_join.getString("NAME"));
	            	  data.put("parents", rs_dm_b_join.getString("PARENTS"));
	            	 
	            	  result_b.add(data);
	              }  
     		
	             //JOIN
			     CallableStatement dm_2set_c_join =connection.prepareCall("{ call 2SET_DM_c_(?) }");
	             dm_2set_c_join.setString(1, sessionID);
	             dm_2set_c_join.execute(); 
	             ResultSet rs_dm_c_join =dm_2set_c_join.getResultSet();
		     while(rs_dm_c_join.next()) {
	            	  	  HashMap<String, String> data = new HashMap<String, String>();
  	            	  data.put("ipr", rs_dm_c_join.getString("IPR"));
	            	  data.put("name", rs_dm_c_join.getString("NAME"));
	            	  data.put("parents", rs_dm_c_join.getString("PARENTS"));
	            	 
	            	  result_c.add(data);
	              }  
     		
	              result2.add(result_a);
	              result2.add(result_b);
	              result2.add(result_c);
            	 
         }
			
		else if(map_size==3) {
			//QUERY 3 REGION(A,B,C,D,E,F,G)
			List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
			
			
			 //JOIN
			     CallableStatement dm_3set_a_join =connection.prepareCall("{ call 3SET_DM_a_(?) }");
	              dm_3set_a_join.setString(1, sessionID);
	              dm_3set_a_join.execute(); 
	              ResultSet rs_dm_a_join =dm_3set_a_join.getResultSet();
	              while(rs_dm_a_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("ipr", rs_dm_a_join.getString("IPR"));
	            	  	   data.put("name", rs_dm_a_join.getString("NAME"));
	            	  	   data.put("parents", rs_dm_a_join.getString("PARENTS"));
	            	  	   
	            	  	   result_a.add(data);
	            	 }  

    		    //JOIN
		     CallableStatement dm_3set_b_join =connection.prepareCall("{ call 3SET_DM_b_(?) }");
              dm_3set_b_join.setString(1, sessionID);
              dm_3set_b_join.execute(); 
             ResultSet rs_dm_b_join =dm_3set_b_join.getResultSet();
              while(rs_dm_b_join.next()) {
            	  	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("ipr", rs_dm_b_join.getString("IPR"));
            	  	   data.put("name", rs_dm_b_join.getString("NAME"));
            	  	   data.put("parents", rs_dm_b_join.getString("PARENTS"));
            	  	  
            	  	   result_b.add(data);
              }  
            
    		 //JOIN
		     CallableStatement dm_3set_c_join =connection.prepareCall("{ call 3SET_DM_c_(?) }");
              dm_3set_c_join.setString(1, sessionID);
              dm_3set_c_join.execute(); 
             ResultSet rs_dm_c_join =dm_3set_c_join.getResultSet();
              while(rs_dm_c_join.next()) {
	            	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("ipr", rs_dm_c_join.getString("IPR"));
            	  	   data.put("name", rs_dm_c_join.getString("NAME"));
            	  	   data.put("parents", rs_dm_c_join.getString("PARENTS"));
            	  	  
            	  	   result_c.add(data);
              } 
         
              //JOIN
		     CallableStatement dm_3set_d_join =connection.prepareCall("{ call 3SET_DM_d_(?) }");
              dm_3set_d_join.setString(1, sessionID);
              dm_3set_d_join.execute(); 
             ResultSet rs_dm_d_join =dm_3set_d_join.getResultSet();
              while(rs_dm_d_join.next()) {
	            	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("ipr", rs_dm_d_join.getString("IPR"));
            	  	   data.put("name", rs_dm_d_join.getString("NAME"));
            	  	   data.put("parents", rs_dm_d_join.getString("PARENTS"));
            	  	  
            	  	   result_d.add(data);
              } 
       
              //JOIN
			     CallableStatement dm_3set_e_join =connection.prepareCall("{ call 3SET_DM_e_(?) }");
	              dm_3set_e_join.setString(1, sessionID);
	              dm_3set_e_join.execute(); 
	             ResultSet rs_dm_e_join =dm_3set_e_join.getResultSet();
	              while(rs_dm_e_join.next()) {
 	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("ipr", rs_dm_e_join.getString("IPR"));
          	  	   data.put("name", rs_dm_e_join.getString("NAME"));
          	  	   data.put("parents", rs_dm_e_join.getString("PARENTS"));
          	  	  
          	  	   result_e.add(data);
	              } 
	         
	              //JOIN
    		  CallableStatement dm_3set_f_join =connection.prepareCall("{ call 3SET_DM_f_(?) }");
	              dm_3set_f_join.setString(1, sessionID);
	              dm_3set_f_join.execute(); 
	              ResultSet rs_dm_f_join =dm_3set_f_join.getResultSet();
	              while(rs_dm_f_join.next()) {
   	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("ipr", rs_dm_f_join.getString("IPR"));
          	  	   data.put("name", rs_dm_f_join.getString("NAME"));
          	  	   data.put("parents", rs_dm_f_join.getString("PARENTS"));
          	  	   
          	  	   result_f.add(data);
              } 
	        
	              //JOIN
  		  	  CallableStatement dm_3set_g_join =connection.prepareCall("{ call 3SET_DM_g_(?) }");
	              dm_3set_g_join.setString(1, sessionID);
	              dm_3set_g_join.execute(); 
	              ResultSet rs_dm_g_join =dm_3set_g_join.getResultSet();
	              while(rs_dm_g_join.next()) {
   	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("ipr", rs_dm_g_join.getString("IPR"));
          	  	   data.put("name", rs_dm_g_join.getString("NAME"));
          	  	   data.put("parents", rs_dm_g_join.getString("PARENTS"));
          	  	 
          	  	   result_g.add(data);
              } 
	              result2.add(result_a);
	              result2.add(result_b);
	              result2.add(result_c);
	              result2.add(result_d);
	              result2.add(result_e);
	              result2.add(result_f);
	              result2.add(result_g);
		}
		
			else if(map_size==4) {
				//4 QUERY REGION(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O) 
				List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_h = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_i = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_j = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_k = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_l = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_m = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_n = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_o = new ArrayList<HashMap<String, String>>();
				
				//JOIN
 			     CallableStatement dm_4set_a_join =connection.prepareCall("{ call 4SET_DM_a_(?) }");
 	              dm_4set_a_join.setString(1, sessionID);
 	              dm_4set_a_join.execute(); 
 	              ResultSet rs_dm_a_join =dm_4set_a_join.getResultSet();
 	              while(rs_dm_a_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("ipr", rs_dm_a_join.getString("IPR"));
 	            	  	   data.put("name", rs_dm_a_join.getString("NAME"));
 	            	  	   data.put("parents", rs_dm_a_join.getString("PARENTS"));
 	            	  	  
 	            	  	   result_a.add(data);
 	            	 }  

        		    //JOIN
			     CallableStatement dm_4set_b_join =connection.prepareCall("{ call 4SET_DM_b_(?) }");
	              dm_4set_b_join.setString(1, sessionID);
	              dm_4set_b_join.execute(); 
	             ResultSet rs_dm_b_join =dm_4set_b_join.getResultSet();
	              while(rs_dm_b_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("ipr", rs_dm_b_join.getString("IPR"));
	            	  	   data.put("name", rs_dm_b_join.getString("NAME"));
	            	  	   data.put("parents", rs_dm_b_join.getString("PARENTS"));
	            	  	  
	            	  	   result_b.add(data);
	              }  
	            
        		    //JOIN
			     CallableStatement dm_4set_c_join =connection.prepareCall("{ call 4SET_DM_c_(?) }");
	              dm_4set_c_join.setString(1, sessionID);
	              dm_4set_c_join.execute(); 
	             ResultSet rs_dm_c_join =dm_4set_c_join.getResultSet();
	              while(rs_dm_c_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("ipr", rs_dm_c_join.getString("IPR"));
	            	  	   data.put("name", rs_dm_c_join.getString("NAME"));
	            	  	   data.put("parents", rs_dm_c_join.getString("PARENTS"));
	            	  	  
	            	  	   result_c.add(data);
	              } 
	         
	              //JOIN
			     CallableStatement dm_4set_d_join =connection.prepareCall("{ call 4SET_DM_d_(?) }");
	              dm_4set_d_join.setString(1, sessionID);
	              dm_4set_d_join.execute(); 
	             ResultSet rs_dm_d_join =dm_4set_d_join.getResultSet();
	              while(rs_dm_d_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("ipr", rs_dm_d_join.getString("IPR"));
	            	  	   data.put("name", rs_dm_d_join.getString("NAME"));
	            	  	   data.put("parents", rs_dm_d_join.getString("PARENTS"));
	            	  	   
	            	  	   result_d.add(data);
	              } 
	       
	              //JOIN
 			     CallableStatement dm_4set_e_join =connection.prepareCall("{ call 4SET_DM_e_(?) }");
 	              dm_4set_e_join.setString(1, sessionID);
 	              dm_4set_e_join.execute(); 
 	             ResultSet rs_dm_e_join =dm_4set_e_join.getResultSet();
 	              while(rs_dm_e_join.next()) {
	 	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("ipr", rs_dm_e_join.getString("IPR"));
	          	  	   data.put("name", rs_dm_e_join.getString("NAME"));
	          	  	   data.put("parents", rs_dm_e_join.getString("PARENTS"));
	          	  	 
	          	  	   result_e.add(data);
 	              } 
 	         
 	              //JOIN
        		  CallableStatement dm_4set_f_join =connection.prepareCall("{ call 4SET_DM_f_(?) }");
   	              dm_4set_f_join.setString(1, sessionID);
   	              dm_4set_f_join.execute(); 
   	              ResultSet rs_dm_f_join =dm_4set_f_join.getResultSet();
   	              while(rs_dm_f_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("ipr", rs_dm_f_join.getString("IPR"));
	          	  	   data.put("name", rs_dm_f_join.getString("NAME"));
	          	  	   data.put("parents", rs_dm_f_join.getString("PARENTS"));
	          	  
	          	  	   result_f.add(data);
	              } 
   	        
   	              //JOIN
      		  	  CallableStatement dm_4set_g_join =connection.prepareCall("{ call 4SET_DM_g_(?) }");
   	              dm_4set_g_join.setString(1, sessionID);
   	              dm_4set_g_join.execute(); 
   	              ResultSet rs_dm_g_join =dm_4set_g_join.getResultSet();
   	              while(rs_dm_g_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("ipr", rs_dm_g_join.getString("IPR"));
	          	  	   data.put("name", rs_dm_g_join.getString("NAME"));
	          	  	   data.put("parents", rs_dm_g_join.getString("PARENTS"));
	          	  	  
	          	  	   result_g.add(data);
	              } 
   	           //JOIN
  			     CallableStatement dm_4set_h_join =connection.prepareCall("{ call 4SET_DM_h_(?) }");
  	              dm_4set_h_join.setString(1, sessionID);
  	              dm_4set_h_join.execute(); 
  	              ResultSet rs_dm_h_join =dm_4set_h_join.getResultSet();
  	              while(rs_dm_h_join.next()) {
  	            	  	   HashMap<String, String> data = new HashMap<String, String>();
  	            	  	   data.put("ipr", rs_dm_h_join.getString("IPR"));
  	            	  	   data.put("name", rs_dm_h_join.getString("NAME"));
  	            	  	   data.put("parents", rs_dm_h_join.getString("PARENTS"));
  	            	  	  
  	            	  	   result_h.add(data);
  	            	 }  

         		    //JOIN
 			     CallableStatement dm_4set_i_join =connection.prepareCall("{ call 4SET_DM_i_(?) }");
 	              dm_4set_i_join.setString(1, sessionID);
 	              dm_4set_i_join.execute(); 
 	             ResultSet rs_dm_i_join =dm_4set_i_join.getResultSet();
 	              while(rs_dm_i_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("ipr", rs_dm_i_join.getString("IPR"));
 	            	  	   data.put("name", rs_dm_i_join.getString("NAME"));
 	            	  	   data.put("parents", rs_dm_i_join.getString("PARENTS"));
 	            	  	  
 	            	  	   result_i.add(data);
 	              }  
 	            
         		 //JOIN
 			     CallableStatement dm_4set_j_join =connection.prepareCall("{ call 4SET_DM_j_(?) }");
 	              dm_4set_j_join.setString(1, sessionID);
 	              dm_4set_j_join.execute(); 
 	             ResultSet rs_dm_j_join =dm_4set_j_join.getResultSet();
 	              while(rs_dm_j_join.next()) {
 		            	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("ipr", rs_dm_j_join.getString("IPR"));
 	            	  	   data.put("name", rs_dm_j_join.getString("NAME"));
 	            	  	   data.put("parents", rs_dm_j_join.getString("PARENTS"));
 	            	  	  
 	            	  	   result_j.add(data);
 	              } 
 	         
 	              //JOIN
 			     CallableStatement dm_4set_k_join =connection.prepareCall("{ call 4SET_DM_k_(?) }");
 	              dm_4set_k_join.setString(1, sessionID);
 	              dm_4set_k_join.execute(); 
 	             ResultSet rs_dm_k_join =dm_4set_k_join.getResultSet();
 	              while(rs_dm_k_join.next()) {
 		            	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("ipr", rs_dm_k_join.getString("IPR"));
 	            	  	   data.put("name", rs_dm_k_join.getString("NAME"));
 	            	  	   data.put("parents", rs_dm_k_join.getString("PARENTS"));
 	            	  	  
 	            	  	   result_k.add(data);
 	              } 
 	       
 	              //JOIN
  			     CallableStatement dm_4set_l_join =connection.prepareCall("{ call 4SET_DM_l_(?) }");
  	              dm_4set_l_join.setString(1, sessionID);
  	              dm_4set_l_join.execute(); 
  	             ResultSet rs_dm_l_join =dm_4set_l_join.getResultSet();
  	              while(rs_dm_l_join.next()) {
 	 	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("ipr", rs_dm_l_join.getString("IPR"));
 	          	  	   data.put("name", rs_dm_l_join.getString("NAME"));
 	          	  	   data.put("parents", rs_dm_l_join.getString("PARENTS"));
 	          	  	  
 	          	  	   result_l.add(data);
  	              } 
  	         
  	              //JOIN
         		  CallableStatement dm_4set_m_join =connection.prepareCall("{ call 4SET_DM_m_(?) }");
    	              dm_4set_m_join.setString(1, sessionID);
    	              dm_4set_m_join.execute(); 
    	              ResultSet rs_dm_m_join =dm_4set_m_join.getResultSet();
    	              while(rs_dm_m_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("ipr", rs_dm_m_join.getString("IPR"));
 	          	  	   data.put("name", rs_dm_m_join.getString("NAME"));
 	          	  	   data.put("parents", rs_dm_m_join.getString("PARENTS"));
 	          	  	 
 	          	  	   result_m.add(data);
 	              } 
    	        
    	              //JOIN
       		  	  CallableStatement dm_4set_n_join =connection.prepareCall("{ call 4SET_DM_n_(?) }");
    	              dm_4set_n_join.setString(1, sessionID);
    	              dm_4set_n_join.execute(); 
    	              ResultSet rs_dm_n_join =dm_4set_n_join.getResultSet();
    	              while(rs_dm_n_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("ipr", rs_dm_n_join.getString("IPR"));
 	          	  	   data.put("name", rs_dm_n_join.getString("NAME"));
 	          	  	   data.put("parents", rs_dm_n_join.getString("PARENTS"));
 	          	  	   
 	          	  	   result_n.add(data);
 	              } 
                 //JOIN
                  CallableStatement dm_4set_o_join =connection.prepareCall("{ call 4SET_DM_o_(?) }");
    	              dm_4set_o_join.setString(1, sessionID);
    	              dm_4set_o_join.execute(); 
    	              ResultSet rs_dm_o_join =dm_4set_o_join.getResultSet();
    	              while(rs_dm_o_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("ipr", rs_dm_o_join.getString("IPR"));
 	          	  	   data.put("name", rs_dm_o_join.getString("NAME"));
 	          	  	   data.put("parents", rs_dm_o_join.getString("PARENTS"));
 	          	  	  
 	          	  	   result_o.add(data);
 	              } 
    	              result2.add(result_a);
    	              result2.add(result_b);
    	              result2.add(result_c);
    	              result2.add(result_d);
  	              result2.add(result_e);
  	              result2.add(result_f);
  	              result2.add(result_g);
  	              result2.add(result_h);
  	              result2.add(result_i);
  	              result2.add(result_j);
  	              result2.add(result_k);
    	              result2.add(result_l);
    	              result2.add(result_m);
    	              result2.add(result_n);
    	              result2.add(result_o);
			
			}
		return result2;
		
		
	}

	public List<List<HashMap<String,String>>> call_PROT_StoredProcedure(Connection connection) throws SQLException{
		List<List<HashMap<String,String>>> result2 = new ArrayList<List<HashMap<String, String>>>();
		List<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		if(map_size==1) {
			 CallableStatement prot_1set_join =connection.prepareCall("{ call 1SET_P_a_(?) }");
             prot_1set_join.setString(1, sessionID);
             prot_1set_join.execute(); 
             ResultSet rs_prot_a_join =prot_1set_join.getResultSet();	
             while(rs_prot_a_join.next()) {
	            	  HashMap<String, String> data = new HashMap<String, String>();
	            	  data.put("accession", rs_prot_a_join.getString("ACCESSION"));
	            	  data.put("name", rs_prot_a_join.getString("NAME"));
	            	  data.put("taxon_id", rs_prot_a_join.getString("TAXON_ID"));
	            	  data.put("taxon_name", rs_prot_a_join.getString("TAXON_NAME"));
                  	  data.put("is_reviewed", rs_prot_a_join.getString("IS_REVIEWED"));
	            	  result.add(data);
	            	  	
	        } 
           
             		result2.add(result);
        	}
		
		else if(map_size==2) {
			//2 QUERY REGION(A,B,C)
			List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
			//JOIN
			 CallableStatement prot_2set_join =connection.prepareCall("{ call 2SET_P_a_(?) }");
             prot_2set_join.setString(1, sessionID);
             prot_2set_join.execute(); 
             ResultSet rs_prot_a_join =prot_2set_join.getResultSet();	
			 while(rs_prot_a_join.next()) {
	            	  HashMap<String, String> data = new HashMap<String, String>();
	            	  data.put("accession", rs_prot_a_join.getString("ACCESSION"));
	            	  data.put("name", rs_prot_a_join.getString("NAME"));
	            	  data.put("taxon_id", rs_prot_a_join.getString("TAXON_ID"));
	            	  data.put("taxon_name", rs_prot_a_join.getString("TAXON_NAME"));
                	  data.put("is_reviewed", rs_prot_a_join.getString("IS_REVIEWED"));
	            	  result_a.add(data);
            	  	
              } 
              //JOIN
		     CallableStatement prot_2set_b_join =connection.prepareCall("{ call 2SET_P_b_(?) }");
	             prot_2set_b_join.setString(1, sessionID);
	             prot_2set_b_join.execute(); 
	             ResultSet rs_prot_b_join =prot_2set_b_join.getResultSet();
	             while(rs_prot_b_join.next()) {
        	 	  HashMap<String, String> data = new HashMap<String, String>();
   	            	  data.put("accession", rs_prot_b_join.getString("ACCESSION"));
	            	  data.put("name", rs_prot_b_join.getString("NAME"));
	            	  data.put("taxon_id", rs_prot_b_join.getString("TAXON_ID"));
	            	  data.put("taxon_name", rs_prot_b_join.getString("TAXON_NAME"));
                	  data.put("is_reviewed", rs_prot_b_join.getString("IS_REVIEWED"));
	            	  result_b.add(data);
	              }  
     		
	             //JOIN
		     CallableStatement prot_2set_c_join =connection.prepareCall("{ call 2SET_P_c_(?) }");
	             prot_2set_c_join.setString(1, sessionID);
	             prot_2set_c_join.execute(); 
	             ResultSet rs_prot_c_join =prot_2set_c_join.getResultSet();
		     while(rs_prot_c_join.next()) {
	            	  	HashMap<String, String> data = new HashMap<String, String>();
  	            	  data.put("accession", rs_prot_c_join.getString("ACCESSION"));
	            	  data.put("name", rs_prot_c_join.getString("NAME"));
	            	  data.put("taxon_id", rs_prot_c_join.getString("TAXON_ID"));
	            	  data.put("taxon_name", rs_prot_c_join.getString("TAXON_NAME"));
                  data.put("is_reviewed", rs_prot_c_join.getString("IS_REVIEWED"));
	            	  result_c.add(data);
	              }  
     		
	              result2.add(result_a);
	              result2.add(result_b);
	              result2.add(result_c);
            	 
         }
			
		else if(map_size==3) {
			//QUERY 3 REGION(A,B,C,D,E,F,G)
			List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
			List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
			
			
			 //JOIN
			     CallableStatement prot_3set_a_join =connection.prepareCall("{ call 3SET_P_a_(?) }");
	              prot_3set_a_join.setString(1, sessionID);
	              prot_3set_a_join.execute(); 
	              ResultSet rs_prot_a_join =prot_3set_a_join.getResultSet();
	              while(rs_prot_a_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("accession", rs_prot_a_join.getString("ACCESSION"));
	            	  	   data.put("name", rs_prot_a_join.getString("NAME"));
	            	  	   data.put("taxon_id", rs_prot_a_join.getString("TAXON_ID"));
	            	  	   data.put("taxon_name", rs_prot_a_join.getString("TAXON_NAME"));
                       data.put("is_reviewed", rs_prot_a_join.getString("IS_REVIEWED"));  
	            	  	   result_a.add(data);
	            	 }  

    		    //JOIN
		     CallableStatement prot_3set_b_join =connection.prepareCall("{ call 3SET_P_b_(?) }");
              prot_3set_b_join.setString(1, sessionID);
              prot_3set_b_join.execute(); 
             ResultSet rs_prot_b_join =prot_3set_b_join.getResultSet();
              while(rs_prot_b_join.next()) {
            	  	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("accession", rs_prot_b_join.getString("ACCESSION"));
            	  	   data.put("name", rs_prot_b_join.getString("NAME"));
            	  	   data.put("taxon_id", rs_prot_b_join.getString("TAXON_ID"));
            	  	   data.put("taxon_name", rs_prot_b_join.getString("TAXON_NAME"));
                   data.put("is_reviewed", rs_prot_b_join.getString("IS_REVIEWED"));
            	  	   result_b.add(data);
              }  
            
    		 //JOIN
		     CallableStatement prot_3set_c_join =connection.prepareCall("{ call 3SET_P_c_(?) }");
              prot_3set_c_join.setString(1, sessionID);
              prot_3set_c_join.execute(); 
             ResultSet rs_prot_c_join =prot_3set_c_join.getResultSet();
              while(rs_prot_c_join.next()) {
	            	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("accession", rs_prot_c_join.getString("ACCESSION"));
            	  	   data.put("name", rs_prot_c_join.getString("NAME"));
            	  	   data.put("taxon_id", rs_prot_c_join.getString("TAXON_ID"));
            	  	   data.put("taxon_name", rs_prot_c_join.getString("TAXON_NAME"));
                   data.put("is_reviewed", rs_prot_c_join.getString("IS_REVIEWED"));
            	  	   result_c.add(data);
              } 
         
              //JOIN
		     CallableStatement prot_3set_d_join =connection.prepareCall("{ call 3SET_P_d_(?) }");
              prot_3set_d_join.setString(1, sessionID);
              prot_3set_d_join.execute(); 
             ResultSet rs_prot_d_join =prot_3set_d_join.getResultSet();
              while(rs_prot_d_join.next()) {
	            	   HashMap<String, String> data = new HashMap<String, String>();
            	  	   data.put("accession", rs_prot_d_join.getString("ACCESSION"));
            	  	   data.put("name", rs_prot_d_join.getString("NAME"));
            	  	   data.put("taxon_id", rs_prot_d_join.getString("TAXON_ID"));
            	  	   data.put("taxon_name", rs_prot_d_join.getString("TAXON_NAME"));
                   data.put("is_reviewed", rs_prot_d_join.getString("IS_REVIEWED"));
            	  	   result_d.add(data);
              } 
       
              //JOIN
			     CallableStatement prot_3set_e_join =connection.prepareCall("{ call 3SET_P_e_(?) }");
	              prot_3set_e_join.setString(1, sessionID);
	              prot_3set_e_join.execute(); 
	             ResultSet rs_prot_e_join =prot_3set_e_join.getResultSet();
	              while(rs_prot_e_join.next()) {
 	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("accession", rs_prot_e_join.getString("ACCESSION"));
          	  	   data.put("name", rs_prot_e_join.getString("NAME"));
          	  	   data.put("taxon_id", rs_prot_e_join.getString("TAXON_ID"));
          	  	   data.put("taxon_name", rs_prot_e_join.getString("TAXON_NAME"));
                 data.put("is_reviewed", rs_prot_e_join.getString("IS_REVIEWED"));
          	  	   result_e.add(data);
	              } 
	         
	              //JOIN
    		  CallableStatement prot_3set_f_join =connection.prepareCall("{ call 3SET_P_f_(?) }");
	              prot_3set_f_join.setString(1, sessionID);
	              prot_3set_f_join.execute(); 
	              ResultSet rs_prot_f_join =prot_3set_f_join.getResultSet();
	              while(rs_prot_f_join.next()) {
   	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("accession", rs_prot_f_join.getString("ACCESSION"));
          	  	   data.put("name", rs_prot_f_join.getString("NAME"));
          	  	   data.put("taxon_id", rs_prot_f_join.getString("TAXON_ID"));
          	  	   data.put("taxon_name", rs_prot_f_join.getString("TAXON_NAME"));
                 data.put("is_reviewed", rs_prot_f_join.getString("IS_REVIEWED"));
          	  	   result_f.add(data);
              } 
	        
	              //JOIN
  		  	  CallableStatement prot_3set_g_join =connection.prepareCall("{ call 3SET_P_g_(?) }");
	              prot_3set_g_join.setString(1, sessionID);
	              prot_3set_g_join.execute(); 
	              ResultSet rs_prot_g_join =prot_3set_g_join.getResultSet();
	              while(rs_prot_g_join.next()) {
   	            	   HashMap<String, String> data = new HashMap<String, String>();
          	  	   data.put("accession", rs_prot_g_join.getString("ACCESSION"));
          	  	   data.put("name", rs_prot_g_join.getString("NAME"));
          	  	   data.put("taxon_id", rs_prot_g_join.getString("TAXON_ID"));
          	  	   data.put("taxon_name", rs_prot_g_join.getString("TAXON_NAME"));
                 data.put("is_reviewed", rs_prot_g_join.getString("IS_REVIEWED"));
          	  	   result_g.add(data);
              } 
	              result2.add(result_a);
              result2.add(result_b);
              result2.add(result_c);
              result2.add(result_d);
	              result2.add(result_e);
	              result2.add(result_f);
	              result2.add(result_g);
		}
		
			else if(map_size==4) {
				//4 QUERY REGION(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O) 
				List<HashMap<String, String>> result_a = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_b = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_c = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_d = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_e = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_f = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_g = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_h = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_i = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_j = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_k = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_l = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_m = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_n = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, String>> result_o = new ArrayList<HashMap<String, String>>();
				
				//JOIN
 			     CallableStatement prot_4set_a_join =connection.prepareCall("{ call 4SET_P_a_(?) }");
 	              prot_4set_a_join.setString(1, sessionID);
 	              prot_4set_a_join.execute(); 
 	              ResultSet rs_prot_a_join =prot_4set_a_join.getResultSet();
 	              while(rs_prot_a_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("accession", rs_prot_a_join.getString("ACCESSION"));
 	            	  	   data.put("name", rs_prot_a_join.getString("NAME"));
 	            	  	   data.put("taxon_id", rs_prot_a_join.getString("TAXON_ID"));
 	            	  	   data.put("taxon_name", rs_prot_a_join.getString("TAXON_NAME"));
                      data.put("is_reviewed", rs_prot_a_join.getString("IS_REVIEWED"));
 	            	  	   result_a.add(data);
 	            	 }  

        		    //JOIN
			     CallableStatement prot_4set_b_join =connection.prepareCall("{ call 4SET_P_b_(?) }");
	              prot_4set_b_join.setString(1, sessionID);
	              prot_4set_b_join.execute(); 
	             ResultSet rs_prot_b_join =prot_4set_b_join.getResultSet();
	              while(rs_prot_b_join.next()) {
	            	  	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("accession", rs_prot_b_join.getString("ACCESSION"));
	            	  	   data.put("name", rs_prot_b_join.getString("NAME"));
	            	  	   data.put("taxon_id", rs_prot_b_join.getString("TAXON_ID"));
	            	  	   data.put("taxon_name", rs_prot_b_join.getString("TAXON_NAME"));
                     data.put("is_reviewed", rs_prot_b_join.getString("IS_REVIEWED"));
	            	  	   result_b.add(data);
	              }  
	            
        		    //JOIN
			     CallableStatement prot_4set_c_join =connection.prepareCall("{ call 4SET_P_c_(?) }");
	              prot_4set_c_join.setString(1, sessionID);
	              prot_4set_c_join.execute(); 
	             ResultSet rs_prot_c_join =prot_4set_c_join.getResultSet();
	              while(rs_prot_c_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("accession", rs_prot_c_join.getString("ACCESSION"));
	            	  	   data.put("name", rs_prot_c_join.getString("NAME"));
	            	  	   data.put("taxon_id", rs_prot_c_join.getString("TAXON_ID"));
	            	  	   data.put("taxon_name", rs_prot_c_join.getString("TAXON_NAME"));
                     data.put("is_reviewed", rs_prot_c_join.getString("IS_REVIEWED"));
	            	  	   result_c.add(data);
	              } 
	         
	              //JOIN
			     CallableStatement prot_4set_d_join =connection.prepareCall("{ call 4SET_P_d_(?) }");
	              prot_4set_d_join.setString(1, sessionID);
	              prot_4set_d_join.execute(); 
	             ResultSet rs_prot_d_join =prot_4set_d_join.getResultSet();
	              while(rs_prot_d_join.next()) {
		            	   HashMap<String, String> data = new HashMap<String, String>();
	            	  	   data.put("accession", rs_prot_d_join.getString("ACCESSION"));
	            	  	   data.put("name", rs_prot_d_join.getString("NAME"));
	            	  	   data.put("taxon_id", rs_prot_d_join.getString("TAXON_ID"));
	            	  	   data.put("taxon_name", rs_prot_d_join.getString("TAXON_NAME"));
                     data.put("is_reviewed", rs_prot_d_join.getString("IS_REVIEWED"));
	            	  	   result_d.add(data);
	              } 
	       
	              //JOIN
 			     CallableStatement prot_4set_e_join =connection.prepareCall("{ call 4SET_P_e_(?) }");
 	              prot_4set_e_join.setString(1, sessionID);
 	              prot_4set_e_join.execute(); 
 	             ResultSet rs_prot_e_join =prot_4set_e_join.getResultSet();
 	              while(rs_prot_e_join.next()) {
	 	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("accession", rs_prot_e_join.getString("ACCESSION"));
	          	  	   data.put("name", rs_prot_e_join.getString("NAME"));
	          	  	   data.put("taxon_id", rs_prot_e_join.getString("TAXON_ID"));
	          	  	   data.put("taxon_name", rs_prot_e_join.getString("TAXON_NAME"));
                   data.put("is_reviewed", rs_prot_e_join.getString("IS_REVIEWED"));
	          	  	   result_e.add(data);
 	              } 
 	         
 	              //JOIN
        		  CallableStatement prot_4set_f_join =connection.prepareCall("{ call 4SET_P_f_(?) }");
   	              prot_4set_f_join.setString(1, sessionID);
   	              prot_4set_f_join.execute(); 
   	              ResultSet rs_prot_f_join =prot_4set_f_join.getResultSet();
   	              while(rs_prot_f_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("accession", rs_prot_f_join.getString("ACCESSION"));
	          	  	   data.put("name", rs_prot_f_join.getString("NAME"));
	          	  	   data.put("taxon_id", rs_prot_f_join.getString("TAXON_ID"));
	          	  	   data.put("taxon_name", rs_prot_f_join.getString("TAXON_NAME"));
                   data.put("is_reviewed", rs_prot_f_join.getString("IS_REVIEWED"));
	          	  	   result_f.add(data);
	              } 
   	        
   	              //JOIN
      		  	  CallableStatement prot_4set_g_join =connection.prepareCall("{ call 4SET_P_g_(?) }");
   	              prot_4set_g_join.setString(1, sessionID);
   	              prot_4set_g_join.execute(); 
   	              ResultSet rs_prot_g_join =prot_4set_g_join.getResultSet();
   	              while(rs_prot_g_join.next()) {
	   	            	   HashMap<String, String> data = new HashMap<String, String>();
	          	  	   data.put("accession", rs_prot_g_join.getString("ACCESSION"));
	          	  	   data.put("name", rs_prot_g_join.getString("NAME"));
	          	  	   data.put("taxon_id", rs_prot_g_join.getString("TAXON_ID"));
	          	  	   data.put("taxon_name", rs_prot_g_join.getString("TAXON_NAME"));
                   data.put("is_reviewed", rs_prot_g_join.getString("IS_REVIEWED"));
	          	  	   result_g.add(data);
	              } 
   	           //JOIN
  			     CallableStatement prot_4set_h_join =connection.prepareCall("{ call 4SET_P_h_(?) }");
  	              prot_4set_h_join.setString(1, sessionID);
  	              prot_4set_h_join.execute(); 
  	              ResultSet rs_prot_h_join =prot_4set_h_join.getResultSet();
  	              while(rs_prot_h_join.next()) {
  	            	  	   HashMap<String, String> data = new HashMap<String, String>();
  	            	  	   data.put("accession", rs_prot_h_join.getString("ACCESSION"));
  	            	  	   data.put("name", rs_prot_h_join.getString("NAME"));
  	            	  	   data.put("taxon_id", rs_prot_h_join.getString("TAXON_ID"));
  	            	  	   data.put("taxon_name", rs_prot_h_join.getString("TAXON_NAME"));
                       data.put("is_reviewed", rs_prot_h_join.getString("IS_REVIEWED"));
  	            	  	   result_h.add(data);
  	            	 }  

         		    //JOIN
 			     CallableStatement prot_4set_i_join =connection.prepareCall("{ call 4SET_P_i_(?) }");
 	              prot_4set_i_join.setString(1, sessionID);
 	              prot_4set_i_join.execute(); 
 	             ResultSet rs_prot_i_join =prot_4set_i_join.getResultSet();
 	              while(rs_prot_i_join.next()) {
 	            	  	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("accession", rs_prot_i_join.getString("ACCESSION"));
 	            	  	   data.put("name", rs_prot_i_join.getString("NAME"));
 	            	  	   data.put("taxon_id", rs_prot_i_join.getString("TAXON_ID"));
 	            	  	   data.put("taxon_name", rs_prot_i_join.getString("TAXON_NAME"));
                      data.put("is_reviewed", rs_prot_i_join.getString("IS_REVIEWED"));
 	            	  	   result_i.add(data);
 	              }  
 	            
         		 //JOIN
 			     CallableStatement prot_4set_j_join =connection.prepareCall("{ call 4SET_P_j_(?) }");
 	              prot_4set_j_join.setString(1, sessionID);
 	              prot_4set_j_join.execute(); 
 	             ResultSet rs_prot_j_join =prot_4set_j_join.getResultSet();
 	              while(rs_prot_j_join.next()) {
 		            	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("accession", rs_prot_j_join.getString("ACCESSION"));
 	            	  	   data.put("name", rs_prot_j_join.getString("NAME"));
 	            	  	   data.put("taxon_id", rs_prot_j_join.getString("TAXON_ID"));
 	            	  	   data.put("taxon_name", rs_prot_j_join.getString("TAXON_NAME"));
                      data.put("is_reviewed", rs_prot_j_join.getString("IS_REVIEWED"));
 	            	  	   result_j.add(data);
 	              } 
 	         
 	              //JOIN
 			     CallableStatement prot_4set_k_join =connection.prepareCall("{ call 4SET_P_k_(?) }");
 	              prot_4set_k_join.setString(1, sessionID);
 	              prot_4set_k_join.execute(); 
 	             ResultSet rs_prot_k_join =prot_4set_k_join.getResultSet();
 	              while(rs_prot_k_join.next()) {
 		            	   HashMap<String, String> data = new HashMap<String, String>();
 	            	  	   data.put("accession", rs_prot_k_join.getString("ACCESSION"));
 	            	  	   data.put("name", rs_prot_k_join.getString("NAME"));
 	            	  	   data.put("taxon_id", rs_prot_k_join.getString("TAXON_ID"));
 	            	  	   data.put("taxon_name", rs_prot_k_join.getString("TAXON_NAME"));
                      data.put("is_reviewed", rs_prot_k_join.getString("IS_REVIEWED"));
 	            	  	   result_k.add(data);
 	              } 
 	       
 	              //JOIN
  			     CallableStatement prot_4set_l_join =connection.prepareCall("{ call 4SET_P_l_(?) }");
  	              prot_4set_l_join.setString(1, sessionID);
  	              prot_4set_l_join.execute(); 
  	             ResultSet rs_prot_l_join =prot_4set_l_join.getResultSet();
  	              while(rs_prot_l_join.next()) {
 	 	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("accession", rs_prot_l_join.getString("ACCESSION"));
 	          	  	   data.put("name", rs_prot_l_join.getString("NAME"));
 	          	  	   data.put("taxon_id", rs_prot_l_join.getString("TAXON_ID"));
 	          	  	   data.put("taxon_name", rs_prot_l_join.getString("TAXON_NAME"));
                    data.put("is_reviewed", rs_prot_l_join.getString("IS_REVIEWED"));
 	          	  	   result_l.add(data);
  	              } 
  	         
  	              //JOIN
         		  CallableStatement prot_4set_m_join =connection.prepareCall("{ call 4SET_P_m_(?) }");
    	              prot_4set_m_join.setString(1, sessionID);
    	              prot_4set_m_join.execute(); 
    	              ResultSet rs_prot_m_join =prot_4set_m_join.getResultSet();
    	              while(rs_prot_m_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("accession", rs_prot_m_join.getString("ACCESSION"));
 	          	  	   data.put("name", rs_prot_m_join.getString("NAME"));
 	          	  	   data.put("taxon_id", rs_prot_m_join.getString("TAXON_ID"));
 	          	  	   data.put("taxon_name", rs_prot_m_join.getString("TAXON_NAME"));
                       data.put("is_reviewed", rs_prot_m_join.getString("IS_REVIEWED"));
 	          	  	   result_m.add(data);
 	              } 
    	        
    	              //JOIN
       		  	  CallableStatement prot_4set_n_join =connection.prepareCall("{ call 4SET_P_n_(?) }");
    	              prot_4set_n_join.setString(1, sessionID);
    	              prot_4set_n_join.execute(); 
    	              ResultSet rs_prot_n_join =prot_4set_n_join.getResultSet();
    	              while(rs_prot_n_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("accession", rs_prot_n_join.getString("ACCESSION"));
 	          	  	   data.put("name", rs_prot_n_join.getString("NAME"));
 	          	  	   data.put("taxon_id", rs_prot_n_join.getString("TAXON_ID"));
 	          	  	   data.put("taxon_name", rs_prot_n_join.getString("TAXON_NAME"));
 	          	  	   data.put("is_reviewed", rs_prot_n_join.getString("IS_REVIEWED"));
 	          	  	   result_n.add(data);
 	              } 
                 //JOIN
                  CallableStatement prot_4set_o_join =connection.prepareCall("{ call 4SET_P_o_(?) }");
    	              prot_4set_o_join.setString(1, sessionID);
    	              prot_4set_o_join.execute(); 
    	              ResultSet rs_prot_o_join =prot_4set_o_join.getResultSet();
    	              while(rs_prot_o_join.next()) {
 	   	            	   HashMap<String, String> data = new HashMap<String, String>();
 	          	  	   data.put("accession", rs_prot_o_join.getString("ACCESSION"));
 	          	  	   data.put("name", rs_prot_o_join.getString("NAME"));
 	          	  	   data.put("taxon_id", rs_prot_o_join.getString("TAXON_ID"));
 	          	  	   data.put("taxon_name", rs_prot_o_join.getString("TAXON_NAME"));
 	          	  	   data.put("is_reviewed", rs_prot_o_join.getString("IS_REVIEWED"));
 	          	  	   result_o.add(data);
 	              } 
    	              result2.add(result_a);
    	              result2.add(result_b);
    	              result2.add(result_c);
    	              result2.add(result_d);
  	              result2.add(result_e);
  	              result2.add(result_f);
  	              result2.add(result_g);
  	              result2.add(result_h);
  	              result2.add(result_i);
  	              result2.add(result_j);
  	              result2.add(result_k);
    	              result2.add(result_l);
    	              result2.add(result_m);
    	              result2.add(result_n);
    	              result2.add(result_o);
			
			}
		return result2;
		
		
	}
		
		


        		//1		
			public CriteriaQuery searchProteinbyDiseaseAcc (int ACC) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("DISEASE").get("ACC"), ACC));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//2		 
			public CriteriaQuery searchProteinbyDiseaseMim (int MIM) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("DISEASE").get("MIM"), MIM));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			//3
			public CriteriaQuery searchProteinbyDiseaseIdentifier (String IDENTIFIER) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("DISEASE").get("IDENTIFIER"),"%"+IDENTIFIER+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//4
			public CriteriaQuery searchProteinbyDiseaseAcronym (String ACRONYM) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("DISEASE").get("ACRONYM"), "%"+ACRONYM+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//5
			public CriteriaQuery searchProteinbyDiseaseDefinition (String DEFINITION) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("DISEASE").get("DEFINITION"), DEFINITION));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//6 
			public CriteriaQuery searchProteinbyDomainPfam (int PFAM) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("DOMAIN").get("PFAM"), PFAM));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//7 
			public CriteriaQuery searchProteinbyDomainIpr_id (int IPR_ID) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("DOMAIN").get("IPR_ID"), IPR_ID));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//8 
			public CriteriaQuery searchProteinbyDomainEntry_type (String ENTRY_TYPE) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("DOMAIN").get("ENTRY_TYPE"), ENTRY_TYPE));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//9 
			public CriteriaQuery searchProteinbyDomainName (String NAME) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("DOMAIN").get("NAME"), "%"+NAME+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//10
			public CriteriaQuery searchProteinbyDomainParent_name (String PARENT_NAME) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("DOMAIN").get("PARENT_NAME"), PARENT_NAME));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//11 
			public CriteriaQuery searchProteinbyDomainParent_id (int PARENT_ID) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("DOMAIN").get("PARENT_ID"), PARENT_ID));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//12 
			public CriteriaQuery searchProteinbyGeneId (int ID) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("GENE").get("ID"), ID));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//13 
			public CriteriaQuery searchProteinbyGeneSymbol (String SYMBOL) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("GENE").get("SYMBOL"), SYMBOL));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//14 
			public CriteriaQuery searchProteinbyGeneLocustag (String LOCUSTAG) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("GENE").get("LOCUSTAG"), LOCUSTAG));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//15 
			public CriteriaQuery searchProteinbyGeneDescription (String DESCRIPTION) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("GENE").get("DESCRIPTION"), DESCRIPTION));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//16
			public CriteriaQuery searchProteinbyGo_termsTerm_id (int TERM_ID) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("GO_TERMS").get("TERM_ID"), TERM_ID));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//17 
			public CriteriaQuery searchProteinbyGo_termsName (String NAME) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("GO_TERMS").get("NAME"),"%"+NAME+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//18 
			public CriteriaQuery searchProteinbyGo_termsNamespace (int NAMESPACE) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("GO_TERMS").get("NAMESPACE"), NAMESPACE));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//19 
			public CriteriaQuery searchProteinbyGo_termsDefinition (String DEFINITION) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("GO_TERMS").get("DEFINITION"), DEFINITION));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//20
			public CriteriaQuery searchProteinbyGo_termsIs_obsolete (int IS_OBSOLETE) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("GO_TERMS").get("IS_OBSOLETE"), IS_OBSOLETE));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//21 
			public CriteriaQuery searchProteinbyPathwayId (int ID) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("PATHWAY").get("ID"), ID));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//22 
			public CriteriaQuery searchProteinbyPathwayName (String NAME) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("PATHWAY").get("NAME"), "%"+NAME+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//23 
			public CriteriaQuery searchProteinbyPathwaySpecies (String SPECIES) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("PATHWAY").get("SPECIES"), SPECIES));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//24
			public CriteriaQuery searchProteinbyProteinAccession (String ACCESSION) {
				CriteriaBuilder cb = em.getCriteriaBuilder();
				CriteriaQuery cq = cb.createQuery();
				Root<PROTEIN> protein = cq.from(PROTEIN.class);
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.like(protein.get("ACCESSION"), "%"+ACCESSION+"%"));
				cq.select(protein.get("ACCESSION")).where(predicates.toArray(new Predicate[]{}));
				return cq;
			}
			
			//25
			public CriteriaQuery searchProteinbyProteinId (String ID) {
				CriteriaBuilder cb = em.getCriteriaBuilder();
				CriteriaQuery cq = cb.createQuery();
				Root<PROTEIN> protein = cq.from(PROTEIN.class);
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.like(protein.get("ID"), "%"+ID+"%"));
				cq.select(protein.get("ACCESSION")).where(predicates.toArray(new Predicate[]{}));
				return cq;
			}
			
			//26
			public CriteriaQuery searchProteinbyProteinName (String NAME) {
				CriteriaBuilder cb = em.getCriteriaBuilder();
				CriteriaQuery cq = cb.createQuery();
				Root<PROTEIN> protein = cq.from(PROTEIN.class);
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.like(protein.get("NAME"), "%"+NAME+"%"));
				cq.select(protein.get("ACCESSION")).where(predicates.toArray(new Predicate[]{}));
				return cq;
			}
			
			//27
			public CriteriaQuery searchProteinbyProteinTaxon_id (int TAXON_ID) {
				CriteriaBuilder cb = em.getCriteriaBuilder();
				CriteriaQuery cq = cb.createQuery();
				Root<PROTEIN> protein = cq.from(PROTEIN.class);
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.equal(protein.get("TAXON_ID"), TAXON_ID));
				cq.select(protein.get("ACCESSION")).where(predicates.toArray(new Predicate[]{}));
				return cq;
			}
			
			//28
			public CriteriaQuery searchProteinbyProteinIs_reviewed (int IS_REVIEWED) {
				CriteriaBuilder cb = em.getCriteriaBuilder();
				CriteriaQuery cq = cb.createQuery();
				Root<PROTEIN> protein = cq.from(PROTEIN.class);
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.equal(protein.get("IS_REVIEWED"), IS_REVIEWED));
				cq.select(protein.get("ACCESSION")).where(predicates.toArray(new Predicate[]{}));
				return cq;
			}
			
			//29
			public CriteriaQuery searchProteinbyProteinLength (int LENGTH) {
				CriteriaBuilder cb = em.getCriteriaBuilder();
				CriteriaQuery cq = cb.createQuery();
				Root<PROTEIN> protein = cq.from(PROTEIN.class);
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.equal(protein.get("LENGTH"), LENGTH));
				cq.select(protein.get("ACCESSION")).where(predicates.toArray(new Predicate[]{}));
				return cq;
			}
			
			//30 
			public CriteriaQuery searchProteinbyProtein_crossrefAccession (String ACCESSION) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("protein_crossref").get("ACCESSION"), ACCESSION));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//31
			public CriteriaQuery searchProteinbyProtein_crossrefType (String TYPE) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("protein_crossref").get("TYPE"), TYPE));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//32 
			public CriteriaQuery searchProteinbyProtein_crossrefCrossref (String CROSSREF) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("protein_crossref").get("CROSSREF"), CROSSREF));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//33 
			public CriteriaQuery searchProteinbyProtein_pdbAccession (String ACCESSION) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("PROTEIN_PDB").get("ACCESSION"), ACCESSION));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//34
			public CriteriaQuery searchProteinbyProtein_pdbPdb (String PDB) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("PROTEIN_PDB").get("PDB"),"%"+PDB+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//35
			public CriteriaQuery searchProteinbyProtein_pdbChain (String CHAIN) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("PROTEIN_PDB").get("CHAIN"), "%"+CHAIN+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//36
			public CriteriaQuery searchProteinbyPublicationPmid (int PMID) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("PUBLICATION").get("PMID"), PMID));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//37
			public CriteriaQuery searchProteinbyPublicationTitle (String TITLE) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("PUBLICATION").get("TITLE"), "%"+TITLE+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//38
			public CriteriaQuery searchProteinbyPublicationLocation (String LOCATION) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("PUBLICATION").get("LOCATION"), LOCATION));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//39
			public CriteriaQuery searchProteinbyTaxonId (int ID) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.equal(protein.join("TAXON").get("ID"), ID));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			//40
			public CriteriaQuery searchProteinbyTaxonName (String NAME) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("TAXON").get("NAME"), "%"+NAME+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}

			//41
			public CriteriaQuery searchProteinbyProtein_crossrefTypeCrossref (String TYPE , String CROSSREF) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("protein_crossref").get("TYPE"), "%"+TYPE+"%"));
				restrictions.add(builder.equal(protein.join("protein_crossref").get("CROSSREF"), CROSSREF));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			
			
			
			//42	
			public CriteriaQuery searchProteinbyPrimary_SecondarySecondaryAccession (String SECONDARY_ACCESSION) {
				CriteriaBuilder builder = em.getCriteriaBuilder();
				CriteriaQuery<PROTEIN> crit = builder.createQuery(PROTEIN.class);
				Root<PROTEIN> protein = crit.from(PROTEIN.class);
				List<Predicate> restrictions = new ArrayList<>();
				restrictions.add(builder.like(protein.join("primary2secondary").get("SECONDARY_ACCESSION"),"%"+SECONDARY_ACCESSION+"%"));
				crit.select(protein.get("ACCESSION")).where(restrictions.toArray(new Predicate[]{}));	          
				return crit;    
			}
			

}





