
package com.server.server.repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface ProteinRepositoryCustom {
	void iterateJsonObject(List<List<String>> key_value_list, String id_json, Connection connection,List<List<String>> key_value_combinator_list) throws SQLException;
	List<List<HashMap<String,String>>> call_GM_StoredProcedure(Connection connection) throws SQLException;
	List<List<HashMap<String,String>>> call_GB_StoredProcedure(Connection connection) throws SQLException;
	List<List<HashMap<String,String>>> call_PW_StoredProcedure(Connection connection) throws SQLException;
	List<List<HashMap<String,String>>> call_DM_StoredProcedure(Connection connection) throws SQLException;
	List<List<HashMap<String,String>>> call_PROT_StoredProcedure(Connection connection) throws SQLException;	

}

