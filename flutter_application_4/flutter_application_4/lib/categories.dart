﻿import 'package:flutter/material.dart';
import 'package:flutter_application_4/category.dart';
import 'package:flutter_application_4/components/bottomNavigation.dart';
import 'package:flutter_application_4/components/header.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    'Hepsi',
    'Bilgisayarlar',
    "Akıllı Telefonlar",
    "Hoparlörler",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Header kısmım
          header("Kategoriler", context),

          SizedBox(height: 16),

          //Kategoriler
          Expanded(
            child: ListView(
                children: categories
                    .map((String title) => buildCategory(title, context))
                    .toList()),
          ),
        ]),
      ),

      //Bottom Navigation
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildCategory(String title, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return CategoryPage(title);
          },
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034)),
      ),
    ),
  );
}
