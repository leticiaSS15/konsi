import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teste_konsi/features/search_zipcode/models/favorite_model.dart';
import 'package:teste_konsi/utils/app_colors.dart';
import 'package:teste_konsi/widgets/custom_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          'Favoritos',
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<FavoriteModel>>(
        valueListenable: Hive.box<FavoriteModel>("favorites").listenable(),
        builder: (context, box, _) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      FavoriteModel currentFav = box.getAt(index)!;
                      return CustomListTile(currentFav, index);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
