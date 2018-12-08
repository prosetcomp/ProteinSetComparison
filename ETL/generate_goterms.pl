$file5 = "./data/go.obo";
open IN5, '<', $file5 or die "Couldn't open $file5!\n";
@lines5 = <IN5>; close IN5;

#GO_TERMS
open TERMS, '>', "./normalized_data/go_terms.tsv";
#TERM_RELATIONS
open TERM_RELATIONS, '>', "./normalized_data/term_relations.tsv"; 
#ALTERNATIVE_IDs
open OUT, '>', "./normalized_data/alternative_ids.tsv";
#NAMESPACE
open NAMESPACE, '>', "./normalized_data/namespace.tsv";

for($i=0; $i<@lines5; $i++) {
        chomp $lines5[$i];
        if($lines5[$i] =~ /\[Term\]/) {
                #GO Terms
                $term_id = ""; $name = ""; $namespace = ""; $def = ""; $is_obsolete = 0; @is_a = (); @alt_id=();
                until(($lines5[$i+1] =~ /\[Term\]/) || ($lines5[$i+1] =~ /\[Typedef\]/)) {
                        chomp $lines5[$i+1];
                        if($lines5[$i+1] =~ /^id:\s+GO:(\d+)$/) { $term_id = $1; }
                        if($lines5[$i+1] =~ /^name:\s+(.*)$/) { $name = $1; }
                        if($lines5[$i+1] =~ /^namespace:\s+(.*)$/) { 
				if ($1 eq "biological_process"){
                                        $namespace = 0;
                                }
                                elsif ($1 eq "molecular_function"){
                                        $namespace = 1;
                                }
                                elsif ($1 eq "cellular_component"){
                                        $namespace = 2;
                                }
			}
                        if($lines5[$i+1] =~ /^def:\s+"(.*)"(.*)$/) { $def = $1.$2; }
                        if($lines5[$i+1] =~ /^is_obsolete:\s+true$/) { $is_obsolete = 1; }
                        if($lines5[$i+1] =~ /^is_a:\s+GO:(\d+).*/) { push @is_a, $1; }
			if($lines5[$i+1] =~ /^alt_id:\s+(GO:\d+).*/) { push @alt_id, $1; }
                        $i++;
                }

                print TERMS "$term_id\t$name\t$namespace\t$def\t$is_obsolete\n";
                foreach $is_a (@is_a) {
                        print TERM_RELATIONS "$term_id\t$is_a\n"
                }
		 foreach $alt_id (@alt_id) {
                        print OUT"$alt_id\t$term_id\n"
                }
        }
}
		print NAMESPACE "0\tbiological_process\n1\tmolecular_function\n2\tcellular_component\n";

close TERMS; close TERM_RELATIONS; close OUT; close NAMESPACE;

print "generate_goterms.pl  DONE!!!\n";
exit;
