package com.server.server.model;

import java.io.Serializable;

import javax.persistence.*;
import javax.persistence.Embeddable;
 
@Embeddable
public class Protein_Crossref_ID implements Serializable {
        @Column(name = "TYPE")
        String TYPE;
        @Column(name = "CROSSREF")
        String CROSSREF;
        
        
        public Protein_Crossref_ID() {}
       

        public Protein_Crossref_ID(String tYPE, String cROSSREF) {
			super();
			TYPE = tYPE;
			CROSSREF = cROSSREF;
		}

  
	public String getTYPE() {
                return TYPE;
        }

        
        public String getCROSSREF() {
                return CROSSREF;
        }


		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((CROSSREF == null) ? 0 : CROSSREF.hashCode());
			result = prime * result + ((TYPE == null) ? 0 : TYPE.hashCode());
			return result;
		}


		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Protein_Crossref_ID other = (Protein_Crossref_ID) obj;
			if (CROSSREF == null) {
				if (other.CROSSREF != null)
					return false;
			} else if (!CROSSREF.equals(other.CROSSREF))
				return false;
			if (TYPE == null) {
				if (other.TYPE != null)
					return false;
			} else if (!TYPE.equals(other.TYPE))
				return false;
			return true;
		}


        
}


