use SWISS::Entry;
use SWISS::ListBase;

open PROT, '>', "./normalized_data/protein.tsv";
open OUT, '>', "./normalized_data/primary2secondary.tsv";

# Read an entire record at a time
$/ = "\/\/\n";

while (<>){
	$entry = SWISS::Entry->fromText($_);
	
	$acc = $entry->AC; #accession
	$id = $entry->ID; #uniprot_id
	$length = $entry->IDs->length;
	$accs= $entry->ACs->list;
	$primary="";

	@id = split(/_/, $id);
	$is_reviewed = length $id[0] >=6 ? 0 : 1;
	
	#get secondary accessions
	$primary = shift(@{$accs});
	foreach $a (@{$accs}){
        print OUT "$primary\t$a\n";
	}

	#get alternative names
	@names = ();
	foreach $name ($entry->DEs->elements) {
		push @names, $name->text;
	}
	$names = join ';', @names;
	
	#get taxid
        $tax = 0;
        $text = ${$entry}{"_text"};
        if($$text =~ /OX\s+NCBI_TaxID=(\d+)/) { $tax = $1; }
	
	if($acc ne "") { 
		print PROT "$acc\t$id\t$names\t$tax\t$is_reviewed\t$length\n"; }
}
close PROT;
close OUT;


print "generate_protein.pl  DONE!!!\n";
exit;
