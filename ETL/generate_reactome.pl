$file = "./normalized_data/pathway_hierarchy.tsv";
$file2 = "./normalized_data/pathway.tsv";
open IN, '<', $file or die "Couldn't open $file.\n";
open IN2, '<', $file2 or die "Couldn't open $file.\n";
open OUT2, '>', "./normalized_data/reactome.tsv";

@lines = <IN2>;
%reactome_names=();

foreach $line (@lines){

        chomp($line);
        @cols = split(/\t/, $line);
        $reactome_names{"$cols[0]"."$cols[2]"} = $cols[1];
}
seek IN2, 0, 0;


@lines = <IN>;
%parents=();

foreach $line (@lines){

        chomp($line);
        @cols = split(/\t/, $line);
        $parents{$cols[1].$cols[2]} = $cols[0];
}


@lines = <IN2>;
$par;
$parstring="";

foreach $line (@lines){

        $par="";
        $parstring="";

        chomp($line);
        @cols = split(/\t/, $line);

        $par=$parents{$cols[0].$cols[2]};
        $parent_reactid="R-".$cols[2]."-".$par;
        $url="<a href=\"https://www.reactome.org/content/detail/".$parent_reactid."\" target=\"_blank\">".$parent_reactid." ".$reactome_names{$par.$cols[2]}."</a>";
        $parstring = $url;


        while(exists $parents{$par.$cols[2]}){
                $par=$parents{$par.$cols[2]};
                $parent_reactid="R-".$cols[2]."-".$par;
        		$url="<a href=\"https://www.reactome.org/content/detail/".$parent_reactid."\" target=\"_blank\">".$parent_reactid." ".$reactome_names{$par.$cols[2]}."</a>";
                $parstring .= "<br>".$url;

        }
        $react_id="R-".$cols[2]."-".$cols[0];
        $url="<a href=\"https://www.reactome.org/content/detail/".$react_id."\" target=\"_blank\">".$react_id."</a>";
        print OUT2 "$cols[0]\t$cols[2]\t$url\t$cols[1]\t$parstring\n";


}

close IN; close IN2; close OUT2;



