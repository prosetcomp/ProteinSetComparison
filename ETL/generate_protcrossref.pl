#Protein_Crossref: file2 -> except 'GeneID','MIM','NCBI_TaxID','PDB','Reactome','UniProtKB-ID'
open PROTCROSSREF, '>', "./normalized_data/protein_crossref.tsv";

@necessaryRefs = ("Allergome", "BioCyc", "BioGrid", "BioMuta", "ChEMBL", "dictyBase", "DrugBank", "EchoBASE", "EMBL", "EMBL-CDS", "Ensembl", "EnsemblGenome", "EnsemblGenome_PRO", "EnsemblGenome_TRS", "Ensembl_PRO", "Ensembl_TRS", "FlyBase", "GeneCards", "GeneDB", "GeneID", "Gene_Name", "Gene_OrderedLocusName", "Gene_ORFName", "GeneReviews", "Gene_Synonym", "GI", "HGNC", "KEGG", "MaizeGDB", "OrthoDB", "PeroxiBase", "PomBase", "REBASE", "RefSeq", "RefSeq_NT", "RGD", "SGD", "STRING", "UniGene", "UniParc", "UniPathway", "UniProtKB-ID", "UniRef100", "UniRef50", "UniRef90", "VectorBase", "WormBase", "Xenbase"); 
%necessaryRefs = map {$_ => 1} @necessaryRefs; 

$dir2 = "./data/idmapping"; 
opendir(DIR2, $dir2) or die $!; 
my %seen;

while ($f = readdir(DIR2)) {
	next if ($f =~ m/^\./);
	open IN2, '<', "$dir2/$f" or die "Couldn't open $f.\n";
	@lines2 = <IN2>;
	close IN2;
	
	foreach $line (@lines2) {
		chomp $line;
		
		@cols = split(/\t/, $line);
		
			if(exists $necessaryRefs{$cols[1]}) {
				if($cols[0] !~ /^(.*)-(\d*)$/){
					print PROTCROSSREF "$cols[0]\t$cols[1]\t$cols[2]\n";
        			}elsif(  !exists ($seen{$cols[0]}) ){
					$seen{$cols[0]} =1;									
					print PROTCROSSREF "$1\tUniprotIsoformID\t$2\n";
				}
			}
		
	}
}
close PROTCROSSREF; close DIR2;

print "generate_protcrossref.pl DONE!!!\n";
exit;
