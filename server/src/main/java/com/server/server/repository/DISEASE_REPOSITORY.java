package com.server.server.repository;



import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.server.server.model.DISEASE;

@Repository
public interface DISEASE_REPOSITORY extends CrudRepository<DISEASE,Long>{

}
