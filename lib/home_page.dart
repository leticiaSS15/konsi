import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_konsi/utils/app_colors.dart';
import 'package:teste_konsi/widgets/card_bottom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;

  initState() {
    super.initState();

    _isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    var myMenuItems = <String>[
      'Favoritos',
      'Configurações',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return myMenuItems.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: (item) {
              switch (item) {
                case 'Favoritos':
                  Modular.to.pushNamed('/favoritos');
                  break;
                case 'Configurações':
                  break;
              }
            },
          )
        ],
        title: const Text(
          'Bem vindo!',
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _initialCardImage(),
          CardBottom(
            title: 'Buscar por \n cep',
            icon: Icons.search,
            color: AppColors.bottomColorGreen,
            toNavigate: '/homeSearch',
          ),
          CardBottom(
            title: 'Buscar por \n nome da rua',
            icon: Icons.location_on_outlined,
            color: AppColors.bottomColorGreen,
            toNavigate: '/homeMaps',
          ),
        ],
      ),
    );
  }

  Widget _initialCardImage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/images/BannerHomePage.png'),
            // fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
