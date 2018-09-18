package com.server.server.model;

import java.util.HashSet;
import java.util.Set;
import java.io.Serializable;
import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import com.fasterxml.jackson.annotation.JsonBackReference;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;

import com.fasterxml.jackson.annotation.ObjectIdGenerators;


@Entity
@Table(name = "PATHWAY")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class PATHWAY implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="ID")
	private int ID;
	
	@Column(name="NAME")
	private String NAME;
	
	@Column(name="SPECIES")
	private String SPECIES;

	
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    @JoinTable(name = "PROTEIN_PATHWAY",
            joinColumns = { @JoinColumn(name = "PATHWAY") },
            inverseJoinColumns = { @JoinColumn(name = "ACCESSION") })

       private Set<PROTEIN> PROTEIN = new HashSet<>();

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

	public String getSPECIES() {
		return SPECIES;
	}

	public void setSPECIES(String sPECIES) {
		SPECIES = sPECIES;
	}

	public Set<PROTEIN> getPROTEIN() {
		return PROTEIN;
	}

	public void setPROTEIN(Set<PROTEIN> pROTEIN) {
		PROTEIN = pROTEIN;
	}

	
	

	

}



