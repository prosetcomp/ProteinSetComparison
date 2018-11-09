open INPATH,'<',"./normalized_data/pathway";
open INPH,'<',"./normalized_data/pathway_hierarchy";

open PATH,'>',"./normalized_data/pathway.tsv";
open PH,'>',"./normalized_data/pathway_hierarchy.tsv";

while(<INPATH>){

	chomp($_);
	@cols = split(/\t/, $_);
	$cols[0] =~ /R-(.{3})-([0-9]+)/;
	print PATH "$2\t$cols[1]\t$1\n";

}

my $parent="";
while(<INPH>){

	chomp($_);
	@cols = split(/\t/, $_);
	$cols[0] =~ /R-(.{3})-(\d+)$/;
	$parent = $2;
	$cols[1] =~ /R-(.{3})-(\d+)$/;
	print PH "$parent\t$2\t$1\t$1\n";

}
close INPATH; close INPH; close PATH; close PH;

`rm ./normalized_data/pathway`;
`rm ./normalized_data/pathway_hierarchy`;

print "generate_pathways.pl DONE!\n";
