#Protein_Publication: file1 -> 1,16,22
open PROTPUB, '>', "./normalized_data/protein_publication.tsv"; 

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

		#Protein - Pubmed
		if($cols[15]) {
			@pubs = split(/; /, $cols[15]);
#			if($cols[21]) {
#				@addpubs = split(/; /, $cols[21]);
#				push (@pubs, @addpubs);
#			}
			foreach $pub (@pubs) {
				print PROTPUB "$cols[0]\t$pub\n";
			}
		}
	}
}
close PROTPUB; close DIR1;

print "generate_protpub.pl DONE!!!\n";
exit;
