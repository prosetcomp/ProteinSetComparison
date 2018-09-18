package com.server.server.model;

import java.io.Serializable;

import javax.persistence.*;



import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "PRIMARY2SECONDARY")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")



public class PRIMARY2SECONDARY implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="SECONDARY_ACCESSION")
	private String SECONDARY_ACCESSION;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PRIMARY_ACCESSION")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
    private PROTEIN protein;
        

	public String getSECONDARY_ACCESSION() {
		return SECONDARY_ACCESSION;
	}
	public void setSECONDARY_ACCESSION(String sECONDARY_ACCESSION) {
		SECONDARY_ACCESSION = sECONDARY_ACCESSION;
	}
	public PROTEIN getProtein() {
		return protein;
	}
	public void setProtein(PROTEIN protein) {
		this.protein =protein;
	}
	
	
	
	
}
