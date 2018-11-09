$file = "./data/gene_info";
open IN, '<', $file or die "Couldnt open $file.\n";
open GENE, '>', "./normalized_data/gene.tsv";
@lines = <IN>;
shift @lines;

foreach $line (@lines){

        chomp $line;
        @cols = split(/\t/, $line);
        print GENE "$cols[1]\t$cols[2]\t$cols[3]\t$cols[8]\n";
}

close IN; close GENE;

print "generate_gene.pl DONE!\n";
exit;


