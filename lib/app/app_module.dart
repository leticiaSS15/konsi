// app_module.dart
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_konsi/features/maps/maps_page.dart';
import 'package:teste_konsi/features/search_zipcode/favorites_page.dart';
import 'package:teste_konsi/features/search_zipcode/search_page.dart';
import 'package:teste_konsi/home_page.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => const HomePage()),
  ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.leftToRight,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/homeSearch',
          transition: TransitionType.leftToRight,
          child: (context, args) => const HomeSearchPage(),
        ),
        ChildRoute(
          '/homeMaps',
          transition: TransitionType.leftToRight,
          child: (context, args) => const MapsHomePage(),
        ),
        ChildRoute(
          '/favoritos',
          transition: TransitionType.leftToRight,
          child: (context, args) => const FavoritesPage(),
        ),
      ];
}
