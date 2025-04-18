import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:convert';
import 'package:teste_konsi/features/search_zipcode/models/response_model.dart';
import 'package:teste_konsi/utils/app_colors.dart';
import 'package:teste_konsi/features/search_zipcode/response_page.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({Key? key}) : super(key: key);

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  late Map<String, dynamic> data;
  late Future<RespostaBuscaCep> respostaPesquisa;
  late ResponseCepPage responseCepPage;
  TextEditingController campoCep = TextEditingController();
  var cepMask = MaskTextInputFormatter(mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  bool flagBottom = false;

  Future<RespostaBuscaCep> buscarCep() async {
    var url;
    String cep = '';

    setState(() {
      cep = campoCep.text;
      url = "https://viacep.com.br/ws/$cep/json/";
    });

    http.Response response;

    if (cep.isNotEmpty) {
      response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return RespostaBuscaCep.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(snackBar("CEP não encontrado"));
      }
    } else {
      return RespostaBuscaCep(cep: cep, bairro: '', localidade: '', uf: '');
    }
  }

  @override
  void initState() {
    super.initState();
    respostaPesquisa = buscarCep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
        title: const Center(child: Text('Busca por CEP')),
      ),
      body: Stack(children: [
        searchZone(),
        campoCep.text.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/bannerSearchPage1.png')),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 250),
                child: FutureBuilder<RespostaBuscaCep>(
                  future: buscarCep(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return ResponseCepPage(snapshot: snapshot);
                    }
                    return Container();
                  }),
                ),
              )
      ]),
    );
  }

  Widget searchZone() {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
            child: Row(
              children: const [
                Text(
                  'Digite o CEP:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
          searchField(),
          bottom('Pesquisar', AppColors.bottomColorOrange)
        ],
      ),
    );
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        inputFormatters: [cepMask],
        controller: campoCep,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          labelText: "CEP",
          hintText: 'Ex: 12345-123',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

  Widget bottom(String title, Color corBottom) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () async {
          if (campoCep.text.isEmpty) {
            snackBar("Por favor, digite um CEP válido");
          }
          bool falgButtom = true;
          falgButtom ? const CircularProgressIndicator() : null;
          await buscarCep();
          falgButtom = false;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: corBottom,
        ),
        child: SizedBox(
          height: 50,
          width: 200,
          child: Center(
              child: Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 20),
          )),
        ),
      ),
    );
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
