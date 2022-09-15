import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  String? cep;

  @HiveField(1)
  String? logradouro;

  @HiveField(2)
  String? complemento;

  @HiveField(3)
  String? bairro;

  @HiveField(4)
  String? localidade;

  @HiveField(5)
  String? uf;

  FavoriteModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
  });

  favoriteAddress(snapshot) {
    var newFavorite = FavoriteModel(
      cep: snapshot.data!.cep,
      logradouro: snapshot.data!.logradouro,
      complemento: snapshot.data!.complemento,
      bairro: snapshot.data!.bairro,
      localidade: snapshot.data!.localidade,
      uf: snapshot.data!.uf,
    );
    return newFavorite;
  }
}
