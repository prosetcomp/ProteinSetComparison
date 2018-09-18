package com.server.server.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
@Entity
@Table(name="DOMAIN")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class DOMAIN implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="PFAM")
	private int PFAM;
	
	@Column(name="IPR_ID")
	private int IPR_ID;
	
	@Column(name="ENTRY_TYPE")
	private String ENTRY_TYPE;
	
	@Column(name="NAME")
	private String NAME;
	
	@Column(name="PARENT_NAME")
	private String PARENT_NAME;
	
	@Column(name="PARENT_ID")
	private Integer PARENT_ID;


@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
           @JoinTable(name = "PROTEIN_DOMAIN",
            joinColumns = { @JoinColumn(name = "DOMAIN") },
            inverseJoinColumns = { @JoinColumn(name = "ACCESSION") })

    
        private Set<PROTEIN> PROTEIN = new HashSet<>();
	public int getPFAM() {
		return PFAM;
	}

	public void setPFAM(int pFAM) {
		PFAM = pFAM;
	}

	public int getIPR_ID() {
		return IPR_ID;
	}

	public void setIPR_ID(int iPR_ID) {
		IPR_ID = iPR_ID;
	}

	public String getENTRY_TYPE() {
		return ENTRY_TYPE;
	}

	public void setENTRY_TYPE(String eNTRY_TYPE) {
		ENTRY_TYPE = eNTRY_TYPE;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getPARENT_NAME() {
		return PARENT_NAME;
	}

	public void setPARENT_NAME(String pARENT_NAME) {
		PARENT_NAME = pARENT_NAME;
	}

	public Integer getPARENT_ID() {
		return PARENT_ID;
	}

	public void setPARENT_ID(Integer pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}

	public Set<PROTEIN> getPROTEIN() {
		return PROTEIN;
	}

	public void setPROTEIN(Set<PROTEIN> pROTEIN) {
		PROTEIN = pROTEIN;
	}
	
	
	
	
}
