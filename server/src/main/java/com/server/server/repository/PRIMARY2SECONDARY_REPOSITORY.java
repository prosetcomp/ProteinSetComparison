package com.server.server.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.server.server.model.PRIMARY2SECONDARY;

@Repository
public interface PRIMARY2SECONDARY_REPOSITORY extends JpaRepository<PRIMARY2SECONDARY,Long> {

}

/*
package com.server.server.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.server.server.model.PRIMARY2SECONDARY;

@Repository
public interface PRIMARY2SECONDARY_REPOSITORY extends CrudRepository<PRIMARY2SECONDARY,Long> {

	public List<PRIMARY2SECONDARY> findAll();
}

*/
