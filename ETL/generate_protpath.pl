#Protein_Pathway: file2 -> Reactome
open PROTPATH, '>', "./normalized_data/protein_pathway.tsv";

my @pathways = ` cut -d'\t' -f1 "./normalized_data/pathway.tsv" `;
my %pathway;
foreach $line ( @pathways ){
        chomp($line);
        $pathway{$line} = 1;
}

$dir2 = "./data/idmapping"; 
opendir(DIR2, $dir2) or die $!; 

while ($f = readdir(DIR2)) {
	next if ($f =~ m/^\./);
	open IN2, '<', "$dir2/$f" or die "Couldn't open $f.\n";
	@lines2 = <IN2>;
	close IN2;
	
	foreach $line (@lines2) {
		chomp $line;
		@cols = split(/\t/, $line);
		$cols[2] =~ /R-(.{3})-(\d+)/;
		if(($cols[1] eq "Reactome") && $pathway{$2} ) {
		
		 print PROTPATH "$cols[0]\t$2\t$1\n"; }
	}
}
close PROTPATH; close DIR2;

print "generate_protpath.pl  DONE!!!\n";
exit;
