package com.server.server.repository;

import java.util.List;

import com.server.server.model.GO_TERMS;
import com.server.server.model.PROTEIN;

public interface GoTermsRepositoryCustom {
//        List<GO_TERMS> getAllGoTerms();
	 List<GO_TERMS> searchOntology(int ONTOLOGY);
}

