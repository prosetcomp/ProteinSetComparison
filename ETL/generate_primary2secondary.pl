use SWISS::Entry;
use SWISS::ListBase;

open OUT, '>', "./normalized_data/primary2secondary.tsv";

$/ = "\/\/\n";
my $i=0; my $primary="";
while (<>){

$entry = SWISS::Entry->fromText($_);

$accs= $entry->ACs->list;
$primary = shift(@{$accs});

foreach $a (@{$accs}){
	print OUT "$primary\t$a\n";        	       
}
}
