$file = "./normalized_data/compound.tsv";
open IN, '<', $file or die "Couldn't open $file.\n";

$file2 = "./normalized_data/protein_compound.tsv";
open IN2, '<', $file2 or die "Couldn't open $file.\n";


@ln = <IN2>;

foreach $lns (@ln){

	chomp($lns);
	 @cols = split(/\t/, $lns);
	 $hash{$cols[0]} = $cols[1];
}


open OUT, '>', "./normalized_data/drug.tsv";

@lines = <IN>;

foreach $line (@lines){

        chomp($line);
        @cols = split(/\t/, $line);
        $cid = "<a href=\"https://www.drugbank.ca/drugs/DB".$cols[0]."\" target=\"_blank\"> DB".$cols[0]."</a>";
        $name = $cols[1];
        $desc = $cols[2];
        $syn = $cols[3];
        $action = $hash{$cols[0]};
        print OUT "$cols[0]\t$cid\t$name\t$syn\t$desc\t$action\n";
}

close IN,IN2;
close OUT;
