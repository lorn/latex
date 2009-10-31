while (my $line = <STDIN>) {
	    my ($ip) = split(/\s/,$line);
		    $hash_count{$ip} = $hash_count{$ip} + 1;
}

print Dumper \%hash_count;
foreach my $line ( sort { $hash_count{$b} <=> $hash_count{$a} } keys
%hash_count) {
	    my $acessos = $hash_count{$line};
		    print "ip: $line\tacessos:\t$acessos\n";
}
