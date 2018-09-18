package com.server.server.model;

import java.io.Serializable;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "PMID2AUTHOR")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")
public class PMID2AUTHOR implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="AUTHOR_NAME")
	private String AUTHOR_NAME;
	
	 @ManyToOne(fetch = FetchType.LAZY)
	 @JoinColumn(name = "PMID")
	 @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
	 private PUBLICATION PUBLICATION;

	public String getAUTHOR_NAME() {
		return AUTHOR_NAME;
	}

	public void setAUTHOR_NAME(String aUTHOR_NAME) {
		AUTHOR_NAME = aUTHOR_NAME;
	}

	public PUBLICATION getPUBLICATION() {
		return PUBLICATION;
	}

	public void setPUBLICATION(PUBLICATION pUBLICATION) {
		PUBLICATION = pUBLICATION;
	}
	 
	 
}

