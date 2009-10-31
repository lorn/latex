#!/usr/bin/perl

=head1 NAME

    conta_acessos 
    
=head1 DESCRIPTION

=head1 AUTHOR

    Renan Rangel <rvr777@gmail.com>
    Lorn <lorn.br@gmail.com.br>

=head1 COPYRIGHT 

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
=cut

use strict;
use Data::Dumper;

die <DATA>
  unless scalar @ARGV;
  
our $VERSION = '0.1';

my ($c, @p, %option) = 0;
my %hash_count = ();
# look for options and patterns
my $ip = 0;
foreach (@ARGV) {
  if (/^-(.+)$/) {
      my $arg = $1;
    if($arg eq 'ip'){
        $ip = 1;
    }elsif ($arg eq 'h'){
        do { 
            print <DATA>;
            exit(0);
        };
    }elsif ($arg eq 'i'){
        do {
            $option{i} = 1;
            next;
        };
    }elsif ($arg eq 'v'){
        do {
            print "conta_acessos $VERSION\nAuthor: Renan Rangel <rvr777\@gmail.com>\n        Lorn <lorn.br\@gmail.com.br>\n";
            exit(0)
        };
    }else{
        die <DATA>;
    }
  }else{
      die <DATA>;
  }
}

# search and replace the pattern with the colored text
my $found = 0;
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

exit(0);

__DATA__
Usage: 
  tail -1000 /var/log/apache2/access.log | perl conta_acessos.pl -ip 
  
Options:
  -h = Print help message
  -i = Case insensitive
  -v = Show version
