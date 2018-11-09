$file8 = "./data/tax2parent.pl"; 
open IN8, '<', $file8 or die "Couldn't open $file8!\n"; 
@lines8 = <IN8>; 
close IN8;

#TAXON_HIERARCHY
open TAXONHIERARCHY, '>', "./normalized_data/taxon_hierarchy.tsv"; foreach $line (@lines8) {
        chomp $line;
        if($line =~ /\s+([0-9]+)=>([0-9]+),/) {
                print TAXONHIERARCHY "$1\t$2\n";
        }
}
close TAXONHIERARCHY;

print "$0 DONE!!!\n";
exit;
