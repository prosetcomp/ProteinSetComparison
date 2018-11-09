use SWISS::Entry;
use SWISS::ListBase;

#Publications
open PUBS, '>', "./normalized_data/publications.tsv";

open P2AUTHOR, '>', "./normalized_data/pmid2author.tsv";

%seen = ();
my @author;
# Read an entire record at a time
$/ = "\/\/\n";
while (<>){
	$entry = SWISS::Entry->fromText($_);
	
	$pmid = ""; $title = ""; $authors = ""; $location = "";
	
	#get refs
	foreach $ref ($entry->Refs->elements) {
		#PubMed identifier - check if empty
		if($ref->RX) {
			%ids = %{$ref->RX};
			$pmid = ${$ids{"PubMed"}}[0];
			if(exists $seen{$pmid}) { next; }
			else {
				$seen{$pmid} = 1;
								
				#title - check if empty
				if(defined $ref->RT) { 
					$title = $ref->RT; 
				}

				#author
				if($ref->RA) { 
					$authors = join ";", @{${$ref->RA}{"list"}}; 
				}
				
				#location
				if($ref->RL) { 
					$location = $ref->RL;
				}
			}
			
			 
				if ( $pmid ne ""){				
					print PUBS "$pmid\t$title\t$location\n"; 
					chomp $authors;
					@author = split /;/, $authors;
				
					foreach $a (@author){
						print P2AUTHOR "$pmid\t$a\n";
					}
				}

		}
	}
}
close PUBS; close P2AUTHOR;

print "generate_pubs.pl done!!!\n";
exit;
