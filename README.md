# Um aplicativo Flutter para busca de CEP

O aplicativo fornece a funcinalidade de pesquisa de endereço via CEP e a criação de uma lista de CEPs favoritados.


## Estrutura

Este aplicativo utiliza a API do ViaCEP para suas requisições

Link: https://viacep.com.br/

Dentro do app é possível criar uma lista de CEPs favoritos, salvando os dados contidos na resposta do CEP de maneira local, por meio do Hive Database.


## Packages

- flutter_modular: ^5.0.3
- http: ^0.13.5
- mask_text_input_formatter: ^2.4.0
- hive: ^2.2.3
- hive_flutter: ^1.1.0
- build_runner: ^2.2.0
- hive_generator: ^1.1.3
