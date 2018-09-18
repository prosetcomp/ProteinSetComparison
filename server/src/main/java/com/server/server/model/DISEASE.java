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
@Table(name = "DISEASE")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class DISEASE implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="MIM")
    private int MIM;
    @Column(name="ACC")
    private short ACC;
   	@Column(name="IDENTIFIER")
	private String IDENTIFIER;
	@Column(name="ACRONYM")
	private String ACRONYM;
	@Column(name="DEFINITION")
	private String DEFINITION;
	
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    @JoinTable(name = "PROTEIN_DISEASE",
            joinColumns = { @JoinColumn(name = "MIM") },
            inverseJoinColumns = { @JoinColumn(name = "ACCESSION") })

       private Set<PROTEIN> PROTEIN = new HashSet<>();


	
	public short getACC() {
		return ACC;
	}

	public void setACC(short aCC) {
		ACC = aCC;
	}

	public int getMIM() {
		return MIM;
	}

	public void setMIM(int mIM) {
		MIM = mIM;
	}

	public String getIDENTIFIER() {
		return IDENTIFIER;
	}

	public void setIDENTIFIER(String iDENTIFIER) {
		IDENTIFIER = iDENTIFIER;
	}

	public String getACRONYM() {
		return ACRONYM;
	}

	public void setACRONYM(String aCRONYM) {
		ACRONYM = aCRONYM;
	}

	public String getDEFINITION() {
		return DEFINITION;
	}

	public Set<PROTEIN> getPROTEIN() {
		return PROTEIN;
	}

	public void setPROTEIN(Set<PROTEIN> pROTEIN) {
		PROTEIN = pROTEIN;
	}

	public void setDEFINITION(String dEFINITION) {
		DEFINITION = dEFINITION;
	}


}



