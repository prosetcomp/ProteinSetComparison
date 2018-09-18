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

@RestController    // This means that this class is a Controller
@RequestMapping(path="/protein") 
public class PROTEIN_CONTROLLER {
	
	@Autowired
	private ProteinRepository protein_repo;
	
	@Autowired
	DataSource datasource;
	public Connection connection; 
	@CrossOrigin(origins = "http://localhost:3000")
    @PostMapping(path="/query")
    @ResponseBody
    public String findTaxon(HttpEntity<String> httpEntity) throws IOException, SQLException {
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

			System.out.println("data:" + id_json);
		        id_json=stringBuffer.toString();
			System.out.println(id_json);
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

		List<List<String>> key_value_list = new ArrayList<List<String>>();
		 for(int i=0; i<resultNode.size();i++) {
			  JsonNode resultNode2=resultNode.get(i).get("rules");
			  List<String> key_value = new ArrayList<>();
			  for(int j=0; j<resultNode2.size();j++) {
				  String name = resultNode2.get(j).get("field").asText();
				  String value=resultNode2.get(j).get("value").asText();
				  key_value.add(name+"="+value);
			  }
			  key_value_list.add(key_value);
		  }
		
		protein_repo.iterateJsonObject(key_value_list,id_json,connection);		

         
<<<<<<< HEAD
            return ""+key_value_list;
=======
            return ""+key_value_list;;
>>>>>>> 983cd9c9b74d7ecac24fee41f22f45d456a121f0
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
}

