$file7 = "./data/tax2name.pl"; 
open IN7, '<', $file7 or die "Couldn't open $file7!\n"; 
@lines7 = <IN7>; 
close IN7;

#TAXON
open TAXON, '>', "./normalized_data/taxon.tsv"; foreach $line (@lines7) {
        chomp $line;
        if($line =~ /\s+([0-9]+)=>"(.*)",/) {
                print TAXON "$1\t$2\n";
        }
}
close TAXON;

print "generate_taxon.pl DONE!!!\n";
exit;
