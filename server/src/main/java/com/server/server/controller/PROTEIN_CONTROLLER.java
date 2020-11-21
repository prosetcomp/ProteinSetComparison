package com.server.server.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.server.server.repository.ProteinRepository;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Cookie;
import javax.servlet.http.*;
import org.springframework.http.HttpHeaders;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@RestController    // This means that this class is a Controller
@RequestMapping(path="/protein") 
public class PROTEIN_CONTROLLER {
	
	@Autowired
	private ProteinRepository protein_repo;
	
	@Autowired
	DataSource datasource;
	public Connection connection; 
	@CrossOrigin(origins = "http://localhost:3000", allowedHeaders = "*")
    @PostMapping(path="/query")
    @ResponseBody
    public String findTaxon(HttpEntity<String> httpEntity,HttpServletRequest request) throws IOException, SQLException {
		//Create SessionID For Every User
		SimpleDateFormat date =new SimpleDateFormat("ddMyyyyhhmmss");
		Date date_time=new Date();
		String concat_date = date.format(date_time);
		String json = httpEntity.getBody();
		MessageDigest messageDigest;
		String id_json=json+concat_date;
		try {
			messageDigest = MessageDigest.getInstance("SHA-1");
			messageDigest.update(id_json.getBytes());
			byte[] messageDigestAlg = messageDigest.digest();
			StringBuffer stringBuffer = new StringBuffer();
			for (byte bytes : messageDigestAlg) {
				stringBuffer.append(String.format("%02x", bytes & 0xff));
			}

		    id_json=stringBuffer.toString();
	
		} catch (NoSuchAlgorithmException exception) {
			// TODO Auto-generated catch block
			exception.printStackTrace();
		}

		//Parse JSON OBJECT
		connection=datasource.getConnection();
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(json);
		JsonNode body=jsonNode.get("body");
		JsonNode resultNode=body.get("rules");
	    JsonNode fileUpload=jsonNode.get("file");
	    JsonNode fileUploadName=jsonNode.get("fileName");
		System.out.println("JsonNode" + jsonNode);		   
        List<List<String>> file_list = new ArrayList<List<String>>();
	    List<List<String>> key_value_preview = new ArrayList<List<String>>();
        List<List<String>> file_list_collect = new ArrayList<List<String>>();
                      
        for(int i=0;i<fileUpload.size();i++) {
        	String fileUploadNameArraySeperate=fileUploadName.get(i).get("value").asText();
        	JsonNode fileUploadArraySeperate=fileUpload.get(i);
			List<String> key_value_file = new ArrayList<>();
			List<String> file_name = new ArrayList<>();
        	for(int j=0;j<fileUploadArraySeperate.size();j++) {
            	 String fileUploadArrayElement=fileUploadArraySeperate.get(j).asText();
			  	 fileUploadArrayElement=fileUploadArrayElement.replaceAll("\r\n" , ",");
				 key_value_file.add(fileUploadNameArraySeperate+"="+fileUploadArrayElement);
				 file_name.add(fileUploadNameArraySeperate);
        	}
        	file_list_collect.add(file_name);
			file_list.add(key_value_file);

    	}

		for(int a=0;a<file_list_collect.size();a++){
		 key_value_preview.add(file_list_collect.get(a));
		}

		List<List<String>> key_value_list = new ArrayList<List<String>>();
		List<List<String>> key_value_combinator_list = new ArrayList<List<String>>();
              			
		 for(int i=0; i<resultNode.size();i++) {
			  JsonNode resultNode2=resultNode.get(i).get("rules");
			  List<String> key_value = new ArrayList<>();
			  List<String> key_value_combinator = new ArrayList<>();
			  List<String> key_value_combinator_preview = new ArrayList<>();
                                                
			  for(int j=0; j<resultNode2.size();j++) {
				  String name = resultNode2.get(j).get("field").asText();
				  String value=resultNode2.get(j).get("value").asText();
				  key_value.add(name+"="+value);
				  String combinator=resultNode2.get(j).get("operator").asText();

				  if(j==0) {
					key_value_combinator_preview.add(name+"="+value);

				   }
				   else {
					key_value_combinator_preview.add(combinator + " " + name+"="+value+ " " );

				   }
				  key_value_combinator.add(combinator);
			  }
			  key_value_list.add(key_value);
			  key_value_combinator_list.add(key_value_combinator);
			  key_value_preview.add(key_value_combinator_preview);		         

		  }
		
		for(int i=0;i<file_list.size();i++) {
			 key_value_list.add(file_list.get(i));
			 
		 }

		Map<String, String> map = new HashMap<String, String>();
		String id_json2="";
        Enumeration headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = (String) headerNames.nextElement();
            String value = request.getHeader(key);
	  
		    if(key.equals("authorization")){
			   id_json2=value;
			}
 		}
        protein_repo.iterateJsonObject(key_value_list,id_json2,connection,key_value_combinator_list);
        String a = protein_repo.extendedQueryNumber();
		return a+key_value_preview;
	}

	
	@CrossOrigin(origins = "http://localhost:3000")
	@GetMapping(path="/gm")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnGM() throws SQLException, InterruptedException{
		return  protein_repo.call_GM_StoredProcedure(connection);
	}	

	@CrossOrigin(origins = "http://localhost:3000")
	@GetMapping(path="/gb")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnGB() throws SQLException, InterruptedException{
		return  protein_repo.call_GB_StoredProcedure(connection);
	}
	
	@CrossOrigin(origins = "http://localhost:3000")
	@GetMapping(path="/pw")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnPW() throws SQLException, InterruptedException{
		return  protein_repo.call_PW_StoredProcedure(connection);
	}
	
	@CrossOrigin(origins = "http://localhost:3000")
	@GetMapping(path="/dm")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnDM() throws SQLException, InterruptedException{
		return  protein_repo.call_DM_StoredProcedure(connection);
	}

	@CrossOrigin(origins = "http://localhost:3000")
	@GetMapping(path="/prot")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnPROT() throws SQLException, InterruptedException{
		return  protein_repo.call_PROT_StoredProcedure(connection);
	}
	@CrossOrigin(origins = "http://localhost:3000")
	@GetMapping(path="/dbank")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnDBANK() throws SQLException, InterruptedException{
		return  protein_repo.call_DBank_StoredProcedure(connection);
	}
	@CrossOrigin(origins = "http://localhost:3000")
	@GetMapping(path="/connection")
	@ResponseBody
	public void closeConnection() throws SQLException, InterruptedException{
		connection.close();
	}

    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping(path="/cookie")
    @ResponseBody
	public String readCookie(HttpServletRequest request) {
        //get all cookies
        Cookie[] cookies = request.getCookies();
        //iterate each cookie
        for (Cookie cookie : cookies) {
            //display only the cookie with the name 'website'
	  		if (cookie.getName().equals("sessionid")) {
                System.out.println("Cookie" + cookie.getValue());
            }
        }
        return "home";
    }

	 @CrossOrigin(origins = "http://localhost:3000", allowedHeaders = "*")
	 @PostMapping(path="/pwaccession")
	 @ResponseBody
     public List<List<HashMap<String,String>>> returnPWACCESSION(HttpEntity<String> httpEntity,HttpServletRequest request)  throws IOException, SQLException, InterruptedException{
		 String json = httpEntity.getBody();
		 ObjectMapper objectMapper = new ObjectMapper();
		 JsonNode jsonNode = objectMapper.readTree(json);
		 JsonNode body=jsonNode.get("body");
		 JsonNode region=jsonNode.get("region");
		 int ipr_id = body.get(0).asInt();
     	 List<String> regions = new ArrayList<>();
		 for(int i =0 ; i<region.size(); i++) {
			String loopRegion = region.get(i).asText();
			regions.add(loopRegion);
		 }

	     Map<String, String> map = new HashMap<String, String>();
		 String id_json2="";
		 Enumeration headerNames = request.getHeaderNames();
		 while (headerNames.hasMoreElements()) {
		   String key = (String) headerNames.nextElement();
		   String value = request.getHeader(key);
		   if(key.equals("authorization")){
			  id_json2=value;
			}
		 }
		 return protein_repo.PATHWAY_ACCESSION(id_json2,ipr_id,regions);
	}


	@CrossOrigin(origins = "http://localhost:3000", allowedHeaders = "*")
	@PostMapping(path="/mfaccession")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnMFACCESSION(HttpEntity<String> httpEntity,HttpServletRequest request)  throws IOException, SQLException, InterruptedException{
	     String json = httpEntity.getBody();
         ObjectMapper objectMapper = new ObjectMapper();
         JsonNode jsonNode = objectMapper.readTree(json);
         JsonNode body=jsonNode.get("body");
         JsonNode region=jsonNode.get("region");
         int go_id = body.get(0).asInt();

		 List<String> regions = new ArrayList<>();
		 for(int i =0 ; i<region.size(); i++) {
			String loopRegion = region.get(i).asText();
			regions.add(loopRegion);
		 }

		 Map<String, String> map = new HashMap<String, String>();
		 String id_json2="";
		 Enumeration headerNames = request.getHeaderNames();
		 while (headerNames.hasMoreElements()) {
		   String key = (String) headerNames.nextElement();
		   String value = request.getHeader(key);
		   if(key.equals("authorization")){
			  id_json2=value;
			 System.out.println("Auth Value2" + value);
		   }
		 }
		return protein_repo.MOLECULARFUNCTION_ACCESSION(id_json2,go_id,regions);
	}

	@CrossOrigin(origins = "http://localhost:3000", allowedHeaders = "*")
	@PostMapping(path="/bpaccession")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnBPACCESSION(HttpEntity<String> httpEntity,HttpServletRequest request)  throws IOException, SQLException, InterruptedException{
	    String json = httpEntity.getBody();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(json);
        JsonNode body=jsonNode.get("body");
        JsonNode region=jsonNode.get("region");
        int go_id = body.get(0).asInt();

	    List<String> regions = new ArrayList<>();
	    for(int i =0 ; i<region.size(); i++) {
	    	String loopRegion = region.get(i).asText();
			regions.add(loopRegion);
	    }

		 Map<String, String> map = new HashMap<String, String>();
		 String id_json2="";
		 Enumeration headerNames = request.getHeaderNames();
		 while (headerNames.hasMoreElements()) {
		   String key = (String) headerNames.nextElement();
		   String value = request.getHeader(key);
		   if(key.equals("authorization")){
			  id_json2=value;
		   }
		 }
	return protein_repo.BIOLOGICALPROCESS_ACCESSION(id_json2,go_id,regions);
	}


	@CrossOrigin(origins = "http://localhost:3000", allowedHeaders = "*")
	@PostMapping(path="/dmaccession")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnDMACCESSION(HttpEntity<String> httpEntity,HttpServletRequest request)  throws IOException, SQLException, InterruptedException{
	    String json = httpEntity.getBody();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(json);
        JsonNode body=jsonNode.get("body");
        JsonNode region=jsonNode.get("region");
        int ipr = body.get(0).asInt();
        List<String> regions = new ArrayList<>();
		for(int i =0 ; i<region.size(); i++) {
			String loopRegion = region.get(i).asText();
			regions.add(loopRegion);
		}

		Map<String, String> map = new HashMap<String, String>();
		String id_json2="";
		Enumeration headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
		   String key = (String) headerNames.nextElement();
		   String value = request.getHeader(key);
		   if(key.equals("authorization")){
			  id_json2=value;
		   }
		}
	return protein_repo.DOMAIN_ACCESSION(id_json2,ipr,regions);
	}



	@CrossOrigin(origins = "http://localhost:3000", allowedHeaders = "*")
	@PostMapping(path="/dbankaccession")
	@ResponseBody
	public List<List<HashMap<String,String>>> returnDBANKACCESSION(HttpEntity<String> httpEntity,HttpServletRequest request)  throws IOException, SQLException, InterruptedException{
		String json = httpEntity.getBody();
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(json);
		JsonNode body=jsonNode.get("body");
		JsonNode region=jsonNode.get("region");
		int cid = body.get(0).asInt();

		List<String> regions = new ArrayList<>();
		for(int i =0 ; i<region.size(); i++) {
			String loopRegion = region.get(i).asText();
			regions.add(loopRegion);
		}

		Map<String, String> map = new HashMap<String, String>();
		String id_json2="";
		Enumeration headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String key = (String) headerNames.nextElement();
			String value = request.getHeader(key);
			if(key.equals("authorization")){
				id_json2=value;
				System.out.println("Auth Value2" + value);
			}
		}
		return protein_repo.DRUGBANK_ACCESSION(id_json2,cid,regions);


	}      
}


