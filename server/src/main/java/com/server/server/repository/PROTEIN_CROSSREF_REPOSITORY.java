package com.server.server.repository;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.server.server.model.PROTEIN_CROSSREF;

@Repository
public interface PROTEIN_CROSSREF_REPOSITORY extends JpaRepository<PROTEIN_CROSSREF, Long>{

}
