package com.server.server.model;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;



@StaticMetamodel( GO_TERMS.class )
public class GOTERMS_ {
	 public static volatile SingularAttribute<GO_TERMS, Integer> TERM_ID;
	 public static volatile SingularAttribute<GO_TERMS, String> NAME;
	 public static volatile SingularAttribute<GO_TERMS, String> DEFINITION;
	 public static volatile SingularAttribute<GO_TERMS, Byte> IS_OBSOLETE;
	 public static volatile SingularAttribute<GO_TERMS, PROTEIN> PROTEIN2;
	 public static volatile SingularAttribute<GO_TERMS, NAMESPACE> namespace;
	


}
