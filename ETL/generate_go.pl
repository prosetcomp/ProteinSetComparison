
$file = "./normalized_data/term_relations.tsv";
$file2 = "./normalized_data/go_terms.tsv";
open IN, '<', $file or die "Couldn't open $file.\n";
open IN2, '<', $file2 or die "Couldn't open $file.\n";
open OUT2, '>', "./normalized_data/biological_process.tsv";
open OUT3, '>', "./normalized_data/molecular_function.tsv";

@lines = <IN2>;
%go_names=();

foreach $line (@lines){

        chomp($line);
        @cols = split(/\t/, $line);
        $go_names{$cols[0]} = $cols[1];
}
seek IN2, 0, 0;

@lines = <IN>;
%parents=();

foreach $line (@lines){

        chomp($line);
        @cols = split(/\t/, $line);
        $parents{$cols[0]} = $cols[1];
}


@lines = <IN2>;
foreach $line (@lines){

        chomp($line);
        @cols = split(/\t/, $line);

        $deep=0;
        $par="";
        $parstring="";

        if (exists $parents{$cols[0]}){
        $par=$parents{$cols[0]};
        $go="GO:".$par;
        $name1=$go_names{$par};
        $url="<a href=\"http://amigo.geneontology.org/amigo/term/".$go."\" target=\"_blank\">".$go." ".$name1."</a>";
        $parstring.= $url ;
        $deep++;
	
   		}

	while (exists $parents{$par}){

		$par=$parents{$par};
		$go="GO:".$par;
		$name1=$go_names{$par};
       		$url="<a href=\"http://amigo.geneontology.org/amigo/term/".$go."\" target=\"_blank\">".$go." ".$name1."</a>";
	        $parstring.= "<br>".$url ;
	        $deep++;

	}	

   		$go="GO:".$cols[0];
   		$name=$cols[1];
   		$url="<a href=\"http://amigo.geneontology.org/amigo/term/".$go."\" target=\"_blank\">".$go."</a>";
        if ( $cols[2] == 0 ){

                print OUT2 "$cols[0]\t"."$url\t$name\t$parstring\t$deep\n";

        }elsif ( $cols[2] == 1 ){

                print OUT3 "$cols[0]\t"."$url\t$name\t$parstring\t$deep\n";
        }
        
}

close IN;
close IN2;
close OUT2;
close OUT3;


