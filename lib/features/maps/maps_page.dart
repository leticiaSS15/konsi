import 'package:flutter/material.dart';
import 'package:teste_konsi/utils/app_colors.dart';

class MapsHomePage extends StatefulWidget {
  const MapsHomePage({Key? key}) : super(key: key);

  @override
  State<MapsHomePage> createState() => _MapsHomePageState();
}

class _MapsHomePageState extends State<MapsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        title: const Text('Mapa'),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 100, right: 100, top: 50),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Text(
                'Esta funcionalidade esta desativada no momento!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Icon(
              Icons.location_off_outlined,
              size: 200,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
