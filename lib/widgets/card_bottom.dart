// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_konsi/utils/app_colors.dart';

class CardBottom extends StatelessWidget {
  String toNavigate;
  String? title;
  IconData? icon;
  Color? color;
  CardBottom({this.title, this.icon, this.color, required this.toNavigate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 350,
      child: GestureDetector(
        key: key,
        onTap: (() {
          Modular.to.pushNamed(toNavigate);
        }),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 20,
          color: color,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  icon,
                  size: 75,
                  color: AppColors.lightLetterCollor,
                ),
              ),
              Text(
                title!.toUpperCase(),
                textAlign: TextAlign.start,
                style: const TextStyle(
                  wordSpacing: 5,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightLetterCollor,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
