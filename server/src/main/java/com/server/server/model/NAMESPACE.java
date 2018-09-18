package com.server.server.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Fetch;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "NAMESPACE")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class NAMESPACE implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="NAMESPACE")
        private byte NAMESPACE;

	@Column(name="NAME")
	private String NAME;
	
	 @OneToMany(mappedBy = "namespace",  cascade = CascadeType.ALL)
       @Fetch(FetchMode.JOIN)
     private List<GO_TERMS> ontology = new ArrayList<>() ;
     
     
     
		
	public List<GO_TERMS> getOntology() {
		return ontology;
	}
	public void setOntology(List<GO_TERMS> ontology) {
		this.ontology = ontology;
	}
	public byte getNAMESPACE() {
		return NAMESPACE;
	}
	public void setNAMESPACE(byte nAMESPACE) {
		NAMESPACE = nAMESPACE;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	
	
}
