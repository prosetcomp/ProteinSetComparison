package com.server.server.repository;

import org.springframework.data.repository.CrudRepository;

import com.server.server.model.GO_TERMS;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GoTermsRepository extends JpaRepository<GO_TERMS , Long>, GoTermsRepositoryCustom{

}

