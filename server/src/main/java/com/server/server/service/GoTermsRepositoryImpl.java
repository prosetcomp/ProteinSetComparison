package com.server.server.service;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Predicate;
import org.springframework.stereotype.Service;

import com.server.server.model.GO_TERMS;
import com.server.server.model.PROTEIN;
import com.server.server.repository.GoTermsRepositoryCustom;

@Service
public class GoTermsRepositoryImpl implements GoTermsRepositoryCustom{

    @PersistenceContext
    private EntityManager em;

	@Override
	public List<GO_TERMS> searchOntology(int ONTOLOGY) {
/*		 CriteriaBuilder builder = em.getCriteriaBuilder();
         CriteriaQuery<GO_TERMS> crit = builder.createQuery(GO_TERMS.class);
         Root<GO_TERMS> root = crit.from(GO_TERMS.class);
         Join<GO_TERMS,PROTEIN> garageJoin = root.join("PROTEIN2");
         crit.where(builder.equal(garageJoin.get("ACCESSION"), ONTOLOGY));
         
     return em.createQuery(crit).getResultList();*/

            CriteriaBuilder builder = em.getCriteriaBuilder();
	    CriteriaQuery<GO_TERMS> crit = builder.createQuery(GO_TERMS.class);
	    Root<GO_TERMS> protein = crit.from(GO_TERMS.class);
	    List<Predicate> restrictions = new ArrayList<>();
	    restrictions.add(builder.equal(protein.join("PROTEIN2").get("TAXON_ID"), ONTOLOGY));
	    crit.select(protein).where(restrictions.toArray(new Predicate[]{}));
        List<GO_TERMS> results = em.createQuery(crit).getResultList();
        return results;
	}
}


