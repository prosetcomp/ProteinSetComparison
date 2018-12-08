$file = $ARGV[0];
open $handle, '<', $file;
chomp(@lines = <$handle>);
close $handle;

$size = scalar @lines;
@parents = ();
$degree = 0;

print "%ipr2parents = (\n";
for ($i=0; $i<$size; $i++){
        if ($lines[$i] =~ /^(-*)(IPR\d+)/){
                if(length($1) == 0){
                        while (scalar @parents > 0) {
                                shift @parents;
                        }
                        $degree = 0;
                }
                elsif (length($1) == $degree){
                        $degree = length($1);
                        foreach $p (@parents) {
                                if ($p =~ /^-+/) { $p =~ s/-//g; }
                        }
                        print  "\t\"$2\" => \"" . join(";", @parents) . "\",\n";
                }
                elsif (length($1) >  $degree){
                        push @parents, $lines[$i-1];
                        $degree = length($1);
                        foreach $p (@parents) {
                                if ($p =~ /^-+/) { $p =~ s/-//g; }
                        }
                        print  "\t\"$2\" => \"" . join(";", @parents) . "\",\n";
                }
                elsif (length($1) < $degree){
                        $dif = ($degree - length($1)) / 2;
                        for($j=0; $j<$dif; $j++){
                                pop @parents;
                        }
                        $degree = length($1);
                        foreach $p (@parents) {
                                if ($p =~ /^-+/) { $p =~ s/-//g; }
                        }
                        print  "\t\"$2\" => \"" . join(";", @parents) . "\",\n";
                }
        }
}
print ");";
exit;

