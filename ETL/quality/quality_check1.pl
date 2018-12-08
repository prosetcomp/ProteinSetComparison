use strict;
use warnings;

my %hash = (
        'protein.tsv' => 6,
        'pathway_hierarchy.tsv' => 4,
        'pathway.tsv' => 3,
        'protein_pathway.tsv' => 3,
        'taxon.tsv' => 2,
        'taxon_hierarchy.tsv' => 2,
        'publications.tsv' => 3,
        'protein_publication2.tsv' => 2,
        'pmid2author2.tsv' => 2,
        'disease.tsv' => 5,
        'protein_disease.tsv' => 2,
        'protein_gene.tsv' => 2,
        'gene.tsv' => 4,
        'protein_pdb2.tsv' => 3,
        'domain.tsv' => 6,
        'protein_domain.tsv' => 2,
        'domain_coordinates.tsv' => 4,
        'go_terms.tsv' => 5,
        'protein_ontology2.tsv' => 2,
        'term_relations.tsv' => 2,
        'namespace.tsv' => 2,
        'protein_crossref2.tsv' => 3,
        'primary2secondary.tsv' => 2,
        'molecular_function.tsv' => 5,
        'biological_process.tsv' => 5,
        'pfam.tsv' => 5,
        'reactome.tsv' => 5,
        'prot.tsv' => 6        
          
        );

my @a;

foreach my $key(keys %hash){
	
	open OUT, '>', "./qualitycheck1/$key.log";
	@a=();

	@a = ` awk  'BEGIN { FS = "\t" }; { if( NF != $hash{$key} ) print NR," ",NF;  }' "../normalized_data/$key" `;
	for(my $i=0; $i<@a;$i++) {
		print OUT "$a[$i]\n";
        }

	close OUT;
}

