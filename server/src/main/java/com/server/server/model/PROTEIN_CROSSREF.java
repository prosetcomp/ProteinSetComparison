package com.server.server.model;


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "PROTEIN_CROSSREF")
//@IdClass(Protein_Crossref_ID.class)
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, 
property="@id")

public class PROTEIN_CROSSREF implements Serializable {
//	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="TYPE")
	private String TYPE;
 	 @Id
        @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="CROSSREF")
	private String CROSSREF;
	
  /*  @EmbeddedId
    private Protein_Crossref_ID id;	
*/
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ACCESSION")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
    private PROTEIN protein;



	public PROTEIN_CROSSREF() {
		
	}
	public PROTEIN_CROSSREF(String tYPE, String cROSSREF) {
		super();
		TYPE = tYPE;
		CROSSREF = cROSSREF;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getCROSSREF() {
		return CROSSREF;
	}
	public void setCROSSREF(String cROSSREF) {
		CROSSREF = cROSSREF;
	}
	

        public PROTEIN getProtein() {
		return protein;
	}
	public void setProtein(PROTEIN protein) {
		this.protein =protein;
	}	
/*        public Protein_Crossref_ID getId() {
		return id;
	}
	public void setId(Protein_Crossref_ID id) {
		this.id = id;
	}
*/
}
