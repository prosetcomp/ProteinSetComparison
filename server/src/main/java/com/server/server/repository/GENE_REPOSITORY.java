package com.server.server.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.server.server.model.GENE;

@Repository
public interface GENE_REPOSITORY extends JpaRepository<GENE,Long>{

}