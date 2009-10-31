my %idade = (
    "raul_seixas" => 10000,
    "arthur_dent" => 42
);
print $idade{'arthur_dent'};
# adicionando itens ao hash
$idade{"jeremias"}=27;
# deletando itens
delete($idade{'raul_seixas'});
