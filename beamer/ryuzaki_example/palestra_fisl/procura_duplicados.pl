use strict;
use warnings;

use File::Find::Object;
use Digest::MD5;
use Data::Dumper;

my @targets = ( '/Users/lorn/foo/' );
my $tree = File::Find::Object->new({}, @targets);
my %hash_file = () ;
my $md5 = Digest::MD5->new;
while (my $r = $tree->next()) {
     if ( -d $r ){
         next;
     }
     open(my $file,'<',$r) or die "$!\n";
     $md5->addfile($file);
     my $digest = $md5->hexdigest;
     close $file;
     my @files = ( $r );
     push(@{$hash_file{$digest}},$r) ; 
}

print STDERR Dumper \%hash_file;

foreach my $md5hex ( sort { $hash_file{$a} <=> $hash_file{$b} }  keys
    %hash_file ) {
    if(scalar(@{$hash_file{$md5hex}}) > 1){
            print "Arquivo duplicado!\n";
            foreach my $file(@{$hash_file{$md5hex}}){
                print "file: $file\n";
            }
        }
}

