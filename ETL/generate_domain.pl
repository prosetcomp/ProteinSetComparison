require "./data/ipr2parents.pl";

$file3 = "./data/interpro_entrylist.txt";
open IN3, '<', $file3 or die "Couldn't open $file3.\n"; 
@lines3 = <IN3>; unless($lines3[0] =~ /^IPR/) { shift @lines3; } 
close IN3;

%ipr2info = ();

foreach $line (@lines3) {
        chomp $line;
        @cols = split(/\t/, $line);
	$ipr2info{$cols[0]}{"entry_type"} = $cols[1];
	$ipr2info{$cols[0]}{"name"} = $cols[2];
}

open DOMAIN, '>', "./normalized_data/domain.tsv"; 

$dir3 = "./data/protein2ipr";
opendir(DIR3, $dir3) or die $!;

%seen = ();


while ($f = readdir(DIR3)) {
        next if ($f =~ m/^\./);
        open IN4, '<', "$dir3/$f" or die "Couldn't open $f.\n";;
        @lines4 = <IN4>;
        close IN4;
        foreach $line (@lines4) {
                chomp $line;
                @cols = split(/\t/, $line);
			
		if (! exists $seen{"$cols[3]_$cols[1]"}) {
                	if ($cols[3] =~ /^PF/) {
				$pfam_no; $ipr_no;
 				if ($cols[3] =~ /^PF(\d+)$/){$pfam_no = $1;};
				if ($cols[1] =~ /^IPR(\d+)$/){$ipr_no = $1;};

				$ipr = $cols[1];
				$entry_type = $ipr2info{$ipr}{"entry_type"};
				$name = $ipr2info{$ipr}{"name"};
				$parents = $ipr2parents{$ipr}; 
				
				
				if (exists $ipr2parents{$ipr}){					
				$parents =~ /^IPR(\d+)::(.+)::$/;
				print DOMAIN "$pfam_no\t$ipr_no\t$entry_type\t$name\t$2\t$1\n";
				}
				else {
				print DOMAIN "$pfam_no\t$ipr_no\t$entry_type\t$name\t \t0\n";
				}
				
			}
			$seen{"$cols[3]_$cols[1]"} = 1;
		}
        }
}

close DOMAIN; 

print "generate_domain.pl DONE!!!\n";
exit;
