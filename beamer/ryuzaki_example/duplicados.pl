my @targets = ( '/home/lorn/foo/' );
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
