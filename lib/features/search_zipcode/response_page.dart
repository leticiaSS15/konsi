import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teste_konsi/features/search_zipcode/models/favorite_model.dart';
import 'package:teste_konsi/features/search_zipcode/models/response_model.dart';
import 'package:teste_konsi/utils/app_colors.dart';

class ResponseCepPage extends StatefulWidget {
  const ResponseCepPage({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<RespostaBuscaCep> snapshot;

  @override
  State<ResponseCepPage> createState() => _ResponseCepPageState();
}

class _ResponseCepPageState extends State<ResponseCepPage> {
  bool flagBottom = false;
  Box<FavoriteModel> favoriteBox = Hive.box<FavoriteModel>("favorites");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              'Resultado',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                wordSpacing: 3,
              ),
            ),
            const Divider(),
            expandedRow(
              'CEP',
              'Logradouro',
              widget.snapshot.data!.cep,
              widget.snapshot.data!.logradouro,
            ),
            expandedRow('Complemento', 'Bairro', widget.snapshot.data!.complemento, widget.snapshot.data!.bairro),
            expandedRow(
              'Localidade',
              'UF',
              widget.snapshot.data!.localidade,
              widget.snapshot.data!.uf,
            ),
            rowBottomFavorit()
          ],
        ),
      ),
    );
  }

  Widget expandedRow(String title1, String title2, snapshot1, snapshot2) {
    return Column(
      children: [
        resultField(title2, snapshot2),
        resultField(title1, snapshot1),
      ],
    );
  }

  Widget resultField(String title, data) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              style: const TextStyle(fontSize: 20),
              enabled: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                labelText: data == '' ? 'Não informado' : data,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowBottomFavorit() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: flagBottom ? Colors.red : Colors.grey,
            onPressed: () async {
              setState(() {
                flagBottom ? flagBottom = false : flagBottom = true;
              });
              var newFavorite = favoriteAddress();
              await favoriteBox.add(newFavorite);
              snackBar('CEP salvo nos favoritos');
            },
            icon: const Icon(
              Icons.favorite,
              size: 50,
            ),
          ),
          const SizedBox(
            width: 75,
          ),
          ElevatedButton(
            onPressed: () async {},
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.bottomColorGreen, fixedSize: const Size(200, 50)),
            child: const Text(
              'VER NO MAPA',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  favoriteAddress() {
    var newFavorite = FavoriteModel(
      cep: widget.snapshot.data!.cep.isEmpty ? 'Não Informado' : widget.snapshot.data!.cep,
      logradouro: widget.snapshot.data!.logradouro!.isEmpty ? 'Não Informado' : widget.snapshot.data!.logradouro,
      complemento: widget.snapshot.data!.complemento!.isEmpty ? 'Não Informado' : widget.snapshot.data!.complemento,
      bairro: widget.snapshot.data!.bairro.isEmpty ? 'Não Informado' : widget.snapshot.data!.bairro,
      localidade: widget.snapshot.data!.localidade.isEmpty ? 'Não Informado' : widget.snapshot.data!.localidade,
      uf: widget.snapshot.data!.uf.isEmpty ? 'Não Informado' : widget.snapshot.data!.uf,
    );
    return newFavorite;
  }

  snackBar(String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.darkGreen,
        padding: const EdgeInsets.all(25),
        content: Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
