package com.server.server.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "PUBLICATION")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class PUBLICATION implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="PMID")
	private int PMID;
	@Column(name="TITLE")
	private String TITLE;
	@Column(name="LOCATION")
	private String LOCATION;
	
	
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    @JoinTable(name = "PROTEIN_PUBLICATION",
            joinColumns = { @JoinColumn(name = "PMID") },
            inverseJoinColumns = { @JoinColumn(name = "ACCESSION") })

       private Set<PROTEIN> PROTEIN = new HashSet<>();
	
	
	@OneToMany(mappedBy = "PUBLICATION",  cascade = CascadeType.ALL)
	 @Fetch(FetchMode.JOIN)
    private List<PMID2AUTHOR> pmid2author = new ArrayList<>() ;
    

	public List<PMID2AUTHOR> getPmid2author() {
		return pmid2author;
	}
	public void setPmid2author(List<PMID2AUTHOR> pmid2author) {
		this.pmid2author = pmid2author;
	}
	public Set<PROTEIN> getPROTEIN() {
		return PROTEIN;
	}
	public void setPROTEIN(Set<PROTEIN> pROTEIN) {
		PROTEIN = pROTEIN;
	}
	public int getPMID() {
		return PMID;
	}
	public void setPMID(int pMID) {
		PMID = pMID;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getLOCATION() {
		return LOCATION;
	}
	public void setLOCATION(String lOCATION) {
		LOCATION = lOCATION;
	}
	
	
	
	
	
}

