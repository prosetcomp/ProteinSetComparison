package com.server.server.model;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel( PROTEIN.class )
public class PROTEIN_ {
	 public static volatile SingularAttribute<PROTEIN, String> ACCESSION;
	 public static volatile SingularAttribute<PROTEIN, String> ID;
	 public static volatile SingularAttribute<PROTEIN, String> NAME;
	 public static volatile SingularAttribute<PROTEIN, Integer> TAXON_ID;
	 public static volatile SingularAttribute<PROTEIN, Byte> IS_REVIEWED;
	 public static volatile SingularAttribute<PROTEIN, Integer> LENGTH;

}
