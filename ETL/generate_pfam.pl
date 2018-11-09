
require "./data/ipr2parents.pl";

$file = "./normalized_data/domain.tsv";
open IN, '<', $file or die "Couldn't open $file.\n";
open OUT, '>', "./normalized_data/pfam.tsv";

@lines = <IN>;

foreach $line (@lines){

        chomp($line);
        @cols = split(/\t/, $line);
        $ipr="IPR".$cols[1];
        $url = "<a href=\"https://www.ebi.ac.uk/interpro/entry/".$ipr."\" target=\"_blank\">".$ipr."</a>";

        @parents = split(/\;/,$ipr2parents{$ipr});
        $parstring="";
        foreach $l (@parents){
        	@m=split(/::/,$l);
        	$url2 = " <a href=\"https://www.ebi.ac.uk/interpro/entry/".$m[0]."\" target=\"_blank\">".$m[0]." ".$m[1]."</a>";
        	$parstring.=$url2."<br>";
        }
        if (exists $ipr2parents{$ipr}){

                print OUT "$cols[0]\t$cols[1]\t$url\t$cols[3]\t$parstring\n";
        }else{
                print OUT "$cols[0]\t$cols[1]\t$url\t$cols[3]\t\n";
        }
}

close IN; close OUT;




