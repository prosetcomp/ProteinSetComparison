require "./data/tax2name.pl";
$file = "./normalized_data/protein.tsv";
open IN, '<', $file or die "Couldn't open $file.\n"; 

open OUT, '>', "./normalized_data/prot.tsv";

@lines = <IN>;

foreach $line (@lines){

        chomp($line);
        @cols = split(/\t/, $line);	
        $acc = "<a href=\"https://www.uniprot.org/uniprot/".$cols[0]."\" target=\"_blank\">".$cols[0]."</a>";
       
	$tax=$tax2sciname{$cols[3]};

	@names = split(/;/, $cols[2]);
	$namestring="";
	foreach $name (@names){

	$namestring.=$name."<br>";
	}
        print OUT "$cols[0]\t$acc\t$namestring\t$cols[3]\t$tax\t$cols[4]\n";        
     
}

close IN; 
close OUT;
