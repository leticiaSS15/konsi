import 'package:flutter/material.dart';
import 'package:teste_konsi/features/search_zipcode/models/favorite_model.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile(this.favModel, this.index, {Key? key}) : super(key: key);
  final FavoriteModel favModel;
  final int index;
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  'CEP: ${widget.favModel.cep!}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                )),
                IconButton(
                  onPressed: () {
                    widget.favModel.delete();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black87,
              height: 20.0,
              thickness: 1.0,
            ),
            Text(
              'Logradouro: ${widget.favModel.logradouro!}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Bairro: ${widget.favModel.bairro!}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Complemento: ${widget.favModel.complemento!}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Localidade : ${widget.favModel.localidade!}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'UF: ${widget.favModel.uf!}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
