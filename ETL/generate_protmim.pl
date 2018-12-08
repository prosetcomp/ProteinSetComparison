#Protein_Disease: file1 -> 1,14
open PROTMIM, '>', "./normalized_data/protein_disease.tsv";

my @mims = ` cut -d'\t' -f2 "./normalized_data/disease.tsv" `;
my %mimhash;
foreach $line ( @mims ){
	chomp($line);
	$mimhash{$line} = 1;
}

$dir1 = "./data/idmapping_selected/";
opendir(DIR1, $dir1) or die $!; 

while ($f = readdir(DIR1)) {
	next if ($f =~ m/^\./);
	open IN1, '<', "$dir1/$f" or die "Couldn't open $f.\n";
	@lines1 = <IN1>;
	close IN1;

	foreach $line (@lines1) {
		chomp $line;
		@cols = split(/\t/, $line);

		#Protein - MIM
		if($cols[13]) {
			@mims = split(/; /, $cols[13]);
			foreach $mim (@mims) {
				if ( ($mimhash{$mim}) ){
					print PROTMIM "$cols[0]\t$mim\n";
				}
			}
		}
	}
}
close PROTMIM; close DIR1;

print "generate_protmim.pl DONE!!!\n";
exit;
