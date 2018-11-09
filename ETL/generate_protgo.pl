#Protein_Ontology: file1 -> 1,7
open PROTGO, '>', "./normalized_data/protein_ontology.tsv";
open IN, '<', "./normalized_data/alternative_ids.tsv";

my %alternativeids;
my @a=();
while(<IN>){
        chomp($_);
        @a = split(/\t/,$_);
        $alternativeids{$a[0]}= $a[1];

}
close IN;

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

		#Protein - Gene Ontology
		if($cols[6]) {
			@gos = split(/; /, $cols[6]);

			foreach $go (@gos) {
			    if (  exists ($alternativeids{$go}) ){
      
                        	print PROTGO "$cols[0]\t$alternativeids{$go}\n";

                	    }else{
                		$go =~ /^GO:(\d+)$/;
                        	print PROTGO "$cols[0]\t$1\n";
                	    }
			}
		}
	}
}
close PROTGO; close DIR1;
`rm "./normalized_data/alternative_ids.tsv"`;
print "generate_protgo.pl DONE!";
