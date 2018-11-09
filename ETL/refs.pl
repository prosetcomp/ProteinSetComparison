$dir2 = "./data/idmapping";
opendir(DIR2, $dir2) or die $!;

open OUT, ">", "ref_types.txt";
%ref_types = ();

while ($f = readdir(DIR2)) {
        next if ($f =~ m/^\./);
        open IN2, '<', "$dir2/$f" or die "Couldn't open $f.\n";
        @lines2 = <IN2>;
        close IN2;

        foreach $line (@lines2) {
                chomp $line;
                $count = 0;
                @cols = split(/\t/, $line);
		if(! exists $ref_types{$cols[1]}) { $ref_types{$cols[1]} = 1; print OUT "$cols[1]\n"; }
	}
}
close DIR2; close OUT;

print "$0 DONE!!!\n";
exit;

