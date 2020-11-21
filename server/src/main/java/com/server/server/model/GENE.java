package com.server.server.model;

import java.util.HashSet;
import java.util.Set;
import java.io.Serializable;
import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import com.fasterxml.jackson.annotation.JsonBackReference;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;


@Entity
@Table(name = "GENE")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class GENE implements Serializable {
	
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		@Column(name="ID")
		private int ID;
		@Column(name="SYMBOL")
		private String SYMBOL;
		@Column(name="LOCUSTAG")
		private String LOCUSTAG;
		@Column(name="DESCRIPTION")
		private String DESCRIPTION;

	/*
		@ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "ACCESSION")
	    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
	    private PROTEIN protein;
	*/
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
           @JoinTable(name = "PROTEIN_GENE",
            joinColumns = { @JoinColumn(name = "GENE") },
            inverseJoinColumns = { @JoinColumn(name = "ACCESSION") })
	public Set<PROTEIN> PROTEIN = new HashSet<>();
	
	
	


	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}

	public String getSYMBOL() {
		return SYMBOL;
	}

	public void setSYMBOL(String sYMBOL) {
		SYMBOL = sYMBOL;
	}

	public String getLOCUSTAG() {
		return LOCUSTAG;
	}

	public void setLOCUSTAG(String lOCUSTAG) {
		LOCUSTAG = lOCUSTAG;
	}

	public String getDESCRIPTION() {
		return DESCRIPTION;
	}

	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}

	public Set<PROTEIN> getPROTEIN() {
		return PROTEIN;
	}

	public void setPROTEIN(Set<PROTEIN> pROTEIN) {
		PROTEIN = pROTEIN;
	}	


}

