import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teste_konsi/app/app_module.dart';
import 'package:teste_konsi/app/app_widget.dart';
import 'package:teste_konsi/features/search_zipcode/models/favorite_model.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<FavoriteModel>(FavoriteModelAdapter());
  box = await Hive.openBox<FavoriteModel>("favorites");
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
