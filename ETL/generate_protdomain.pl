#Protein_Domain: file4 -> 1,2 (check duplicates)
open DOMAIN_CO, '>', "./normalized_data/domain_coordinates.tsv"; 

$dir3 = "./data/protein2ipr"; 
opendir(DIR3, $dir3) or die $!; 

while ($f = readdir(DIR3)) {
	next if ($f =~ m/^\./);
	open IN4, '<', "$dir3/$f" or die "Couldn't open $f.\n";;
	@lines4 = <IN4>;
	close IN4;
	foreach $line (@lines4) {
		chomp $line;
		@cols = split(/\t/, $line);
		if ($cols[3] =~ /^PF(\d+)$/) { print DOMAIN_CO "$cols[0]\t$1\t$cols[4]\t$cols[5]\n"; }
	}
}

`cut -f 1,2 ./normalized_data/domain_coordinates.tsv | sort -u > "./normalized_data/protein_domain.tsv"`;
close DIR3; close DOMAIN_CO;

print "generate_protdomain.pl DONE!!!\n";
exit;
