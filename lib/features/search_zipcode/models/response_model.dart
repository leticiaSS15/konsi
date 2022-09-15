class RespostaBuscaCep {
  String cep;
  String? logradouro;
  String? complemento;
  String bairro;
  String localidade;
  String uf;
  String? ddd;

  RespostaBuscaCep({
    required this.cep,
    this.logradouro,
    required this.bairro,
    this.complemento,
    required this.localidade,
    required this.uf,
    this.ddd,
  });

  factory RespostaBuscaCep.fromJson(Map<String, dynamic> data) {
    return RespostaBuscaCep(
      cep: data['cep'],
      logradouro: data['logradouro'],
      bairro: data['bairro'],
      complemento: data['complemento'],
      localidade: data['localidade'],
      uf: data['uf'],
      ddd: data['ddd'],
    );
  }
}
