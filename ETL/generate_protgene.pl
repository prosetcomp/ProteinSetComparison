#Protein_Gene: file1 -> 1,3
open PROTGENE, '>', "./normalized_data/protein_gene.tsv";

$dir1 = "./data/idmapping_selected";
opendir(DIR1, $dir1) or die $!;

while ($f = readdir(DIR1)) {
	next if ($f =~ m/^\./);
	open IN1, '<', "$dir1/$f" or die "Couldn't open $f.\n";
	@lines1 = <IN1>;
	close IN1;

	foreach $line (@lines1) {
		chomp $line;
		@cols = split(/\t/, $line);

		#Protein - GeneID
		if($cols[2]) {
			@genes = split(/; /, $cols[2]);
			foreach $gene (@genes) {
				print PROTGENE "$cols[0]\t$gene\n";
			}
		}
	}
}
close PROTGENE; close DIR1;

print "generate_protgene.pl DONE!!!\n";
exit;
