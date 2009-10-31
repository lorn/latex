foreach my $md5hex ( sort { $hash_file{$a} <=> $hash_file{$b} }  keys
    %hash_file ) {
    if(scalar(@{$hash_file{$md5hex}}) > 1){
            print "Arquivo duplicado!\n";
            foreach my $file(@{$hash_file{$md5hex}}){
                print "file: $file\n";
            }
        }
}

