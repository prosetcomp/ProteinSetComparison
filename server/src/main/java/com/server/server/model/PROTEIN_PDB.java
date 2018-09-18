package com.server.server.model;

import java.io.Serializable;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "PROTEIN_PDB")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")

public class PROTEIN_PDB implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="PDB")
	private String PDB;
	@Column(name="CHAIN")
	private String CHAIN;
	
	

	 @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "ACCESSION")
	    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
	    private PROTEIN protein;
	 
	 
	public PROTEIN getProtein() {
		return protein;
	}
	public void setProtein(PROTEIN protein) {
		this.protein = protein;
	}
	public String getPDB() {
		return PDB;
	}
	public void setPDB(String pDB) {
		PDB = pDB;
	}
	public String getCHAIN() {
		return CHAIN;
	}
	public void setCHAIN(String cHAIN) {
		CHAIN = cHAIN;
	}
	
	
	 
}

