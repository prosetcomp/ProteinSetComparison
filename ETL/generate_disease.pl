$file6 = "./data/humdisease.txt"; 
open IN6, '<', $file6 or die "Couldn't open $file6!\n"; @lines6 = <IN6>; 
close IN6;

#DISEASE
open DISEASE, '>', "./normalized_data/disease.tsv";


for($i=0; $i<@lines6; $i++) {
	chomp $lines6[$i];
        if($lines6[$i] =~ /^ID\s+(.*)\.$/) {
                #Disease
                $acc = ""; $mim = ""; $id=$1;  $acronym = ""; $def = ""; $synm = "";
                until($lines6[$i+1] =~ /\/\//) {
                        chomp $lines6[$i+1];
                        if($lines6[$i+1] =~ /^AC\s+DI-(\d+)$/) { $acc = $1; }
                        if($lines6[$i+1] =~ /^DR\s+MIM;\s([0-9]+).*$/) { $mim = $1; }
                        if($lines6[$i+1] =~ /^AR\s+(.*)\.$/) { $acronym = $1; }
                        if($lines6[$i+1] =~ /^DE\s+(.*)$/) { $def = $def." ".$1; }
			if($lines6[$i+1] =~ /^SY\s+(.*)$/) { $synm = $synm."; ".$1; }
                        $i++;
                }
		$id = $id.";".$synm;
                print DISEASE "$acc\t$mim\t$id\t$acronym\t$def\n";
        }
}
close DISEASE;

print "generate_disease.pl  DONE!!!\n";
exit;
