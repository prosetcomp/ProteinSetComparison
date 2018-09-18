package com.server.server.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.server.server.model.PATHWAY;

@Repository
public interface PATHWAY_REPOSITORY extends CrudRepository<PATHWAY,Long> {

}
