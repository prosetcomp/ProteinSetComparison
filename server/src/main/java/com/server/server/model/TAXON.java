package com.server.server.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "TAXON")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class TAXON {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="ID")
	private int ID;
	@Column(name="NAME")
	private String NAME;
	

@OneToMany(mappedBy = "TAXON",  cascade = CascadeType.ALL)
	private List<PROTEIN> PROTEIN = new ArrayList<>() ;
	

	public List<PROTEIN> getPROTEIN() {
		return PROTEIN;
	}
	public void setPROTEIN(List<PROTEIN> pROTEIN) {
		PROTEIN = pROTEIN;
	}
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}

}

