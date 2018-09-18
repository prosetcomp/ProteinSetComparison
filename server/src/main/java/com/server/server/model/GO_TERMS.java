package com.server.server.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;


@Entity
@Table(name = "GO_TERMS")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class GO_TERMS implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="TERM_ID")
	private int TERM_ID;
	@Column(name="NAME")
	private String NAME;
//	private NAMESPACE NAMESPACE;
	@Column(name="DEFINITION")
	private String DEFINITION;
	@Column(name="IS_OBSOLETE")
	private byte IS_OBSOLETE;
	
	
	
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    @JoinTable(name = "PROTEIN_ONTOLOGY",
            joinColumns = { @JoinColumn(name = "ONTOLOGY") },
            inverseJoinColumns = { @JoinColumn(name = "ACCESSION") })
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
       public Set<PROTEIN> PROTEIN2 = new HashSet<>();
	
	
	 @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "NAMESPACE")
//	    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})  
     private NAMESPACE namespace;



/*	public Set<PROTEIN> getPROTEIN() {
		return PROTEIN;
	}
	public void setPROTEIN(Set<PROTEIN> pROTEIN) {
		PROTEIN = pROTEIN;
	}
	


*/

       public NAMESPACE getNamespace() {
		return namespace;
	}
	public Set<PROTEIN> getPROTEIN2() {
		return PROTEIN2;
	}
	public void setPROTEIN2(Set<PROTEIN> pROTEIN2) {
		PROTEIN2 = pROTEIN2;
	}
	public void setNamespace(NAMESPACE namespace) {
		this.namespace = namespace;
	}
       public int getTERM_ID() {
		return TERM_ID;
	}
	public void setTERM_ID(int tERM_ID) {
		TERM_ID = tERM_ID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	
	public String getDEFINITION() {
		return DEFINITION;
	}
	public void setDEFINITION(String dEFINITION) {
		DEFINITION = dEFINITION;
	}
	public byte getIS_OBSOLETE() {
		return IS_OBSOLETE;
	}
	public void setIS_OBSOLETE(byte iS_OBSOLETE) {
		IS_OBSOLETE = iS_OBSOLETE;
	}
	
	
}
