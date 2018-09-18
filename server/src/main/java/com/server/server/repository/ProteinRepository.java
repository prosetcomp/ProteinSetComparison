package com.server.server.repository;

// import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.server.server.model.PROTEIN;


public interface ProteinRepository extends JpaRepository<PROTEIN, String>, ProteinRepositoryCustom{
	
}

