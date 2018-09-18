package com.server.server.model;


import javax.persistence.*;

import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Fetch;
import java.util.*;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "PROTEIN")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class PROTEIN implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ACCESSION")
    private String ACCESSION;
	
	@Column(name="ID")
	private String ID;
	
	@Column(name="NAME")
	private String NAME;
	
	@Column(name="TAXON_ID")
	private int TAXON_ID;
	
	@Column(name="IS_REVIEWED")
	private byte IS_REVIEWED;
	
	@Column(name="LENGTH")
	private int LENGTH;

		//DISEASE
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    	@JoinTable(name = "PROTEIN_DISEASE",
            joinColumns = { @JoinColumn(name = "ACCESSION") },
            inverseJoinColumns = { @JoinColumn(name = "MIM") })

            private Set<DISEASE> DISEASE = new HashSet<>();

	public Set<DISEASE> getDISEASE() {
		return DISEASE;
	}

	public void setDISEASE(Set<DISEASE> dISEASE) {
		DISEASE = dISEASE;
	}



		//GO_TERMS
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    	@JoinTable(name = "PROTEIN_ONTOLOGY",
            joinColumns = { @JoinColumn(name = "ACCESSION") },
            inverseJoinColumns = { @JoinColumn(name = "ONTOLOGY") })
    	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
       
	public Set<GO_TERMS> GO_TERMS = new HashSet<>();
       
       
	
	public Set<GO_TERMS> getGO_TERMS() {
		return GO_TERMS;
	}

	public void setGO_TERMS(Set<GO_TERMS> gO_TERMS) {
		GO_TERMS = gO_TERMS;
	}

	
		//DOMAIN
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
           @JoinTable(name = "PROTEIN_DOMAIN",
            joinColumns = { @JoinColumn(name = "ACCESSION") },
            inverseJoinColumns = { @JoinColumn(name = "DOMAIN") })
	public Set<DOMAIN> DOMAIN = new HashSet<>();
	
	
	
	public Set<DOMAIN> getDOMAIN() {
		return DOMAIN;
	}

	public void setDOMAIN(Set<DOMAIN> dOMAIN) {
		DOMAIN = dOMAIN;
	}

	
	  //GENE
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
           @JoinTable(name = "PROTEIN_GENE",
            joinColumns = { @JoinColumn(name = "ACCESSION") },
            inverseJoinColumns = { @JoinColumn(name = "GENE") })
	public Set<GENE> GENE = new HashSet<>();
	
	
	

	public Set<GENE> getGENE() {
		return GENE;
	}

	public void setGENE(Set<GENE> gENE) {
		GENE = gENE;
	}

	//PATHWAY
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    	@JoinTable(name = "PROTEIN_PATHWAY",
            joinColumns = { @JoinColumn(name = "ACCESSION") },
            inverseJoinColumns = { @JoinColumn(name = "PATHWAY") })
	public Set<PATHWAY> PATHWAY = new HashSet<>();

	public Set<PATHWAY> getPATHWAY() {
		return PATHWAY;
	}

	public void setPATHWAY(Set<PATHWAY> pATHWAY) {
		PATHWAY = pATHWAY;
	}

	//PUBLICATION
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    	@JoinTable(name = "PROTEIN_PUBLICATION",
            joinColumns = { @JoinColumn(name = "ACCESSION") },
            inverseJoinColumns = { @JoinColumn(name = "PMID") })
	public Set<PUBLICATION> PUBLICATION = new HashSet<>();
	
	

	public Set<PUBLICATION> getPUBLICATION() {
		return PUBLICATION;
	}

	public void setPUBLICATION(Set<PUBLICATION> pUBLICATION) {
		PUBLICATION = pUBLICATION;
	}




       		//PROTEIN_CROSSREF
	  @OneToMany(mappedBy = "protein",  cascade = CascadeType.ALL)
//      @Fetch(FetchMode.JOIN)
      private List<PROTEIN_CROSSREF> protein_crossref = new ArrayList<>() ;


	public List<PROTEIN_CROSSREF> getProtein_crossref() {
		return protein_crossref;
	}

	public void setProtein_crossref(List<PROTEIN_CROSSREF> protein_crossref) {
		this.protein_crossref = protein_crossref;
	}


		//PRIMARY2SECONDARY
  @OneToMany(mappedBy = "protein",  cascade = CascadeType.ALL)
      @Fetch(FetchMode.JOIN)
      private List<PRIMARY2SECONDARY> primary2secondary = new ArrayList<>() ;
	  public List<PRIMARY2SECONDARY> getPrimary2secondary() {
			return primary2secondary;
		}

		public void setPrimary2secondary(List<PRIMARY2SECONDARY> primary2secondary) {
			this.primary2secondary = primary2secondary;
		}

	
	//PROTEIN_PDB
	@OneToMany(mappedBy = "protein",  cascade = CascadeType.ALL)
	 private List<PROTEIN_PDB> PROTEIN_PDB = new ArrayList<>() ;
		

	
	public List<PROTEIN_PDB> getPROTEIN_PDB() {
			return PROTEIN_PDB;
		}

		public void setPROTEIN_PDB(List<PROTEIN_PDB> pROTEIN_PDB) {
			PROTEIN_PDB = pROTEIN_PDB;
		}


	//TAXON	
	 @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "TAXON_ID", insertable=false, updatable=false)
	    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
	    private TAXON TAXON;
	 
	        
	public TAXON getTAXON() {
		return TAXON;
	}

	public void setTAXON(TAXON tAXON) {
		TAXON = tAXON;
	}


	public PROTEIN() {
	}
	
	public PROTEIN(String aCCESSION, String iD, String nAME, int tAXON_ID, byte iS_REVIEWED, int lENGTH) {
		super();
		ACCESSION = aCCESSION;
		ID = iD;
		NAME = nAME;
		TAXON_ID = tAXON_ID;
		IS_REVIEWED = iS_REVIEWED;
		LENGTH = lENGTH;
	}

	public String getACCESSION() {
		return ACCESSION;
	}

	public void setACCESSION(String aCCESSION) {
		ACCESSION = aCCESSION;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public int getTAXON_ID() {
		return TAXON_ID;
	}

	public void setTAXON_ID(int tAXON_ID) {
		TAXON_ID = tAXON_ID;
	}

	public byte getIS_REVIEWED() {
		return IS_REVIEWED;
	}

	public void setIS_REVIEWED(byte iS_REVIEWED) {
		IS_REVIEWED = iS_REVIEWED;
	}

	public int getLENGTH() {
		return LENGTH;
	}

	public void setLENGTH(int lENGTH) {
		LENGTH = lENGTH;
	}


}
