#Protein_PDB: file1 -> 1,6
open PROTPDB, '>', "./normalized_data/protein_pdb.tsv";

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

		#Protein - PDB
		if($cols[5]) {
			@pdbs = split(/; /, $cols[5]);
			foreach $pdb (@pdbs) {
				$pdb =~ /^(.*)(:.{1})$/;
				print PROTPDB "$cols[0]\t$1\t$2\n";
			}
		}
	}
}
close PROTPDB; close DIR1;

print "generate_protpdb.pl DONE!!!\n";
exit;
