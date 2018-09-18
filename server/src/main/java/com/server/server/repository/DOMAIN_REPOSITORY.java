package com.server.server.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.server.server.model.DOMAIN;

@Repository
public interface DOMAIN_REPOSITORY extends CrudRepository<DOMAIN,Long> {

}
