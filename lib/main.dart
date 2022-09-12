import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe/screens/categorymeals_screen.dart';
import 'package:recipe/screens/meal_detail_screen.dart';

import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: GoogleFonts.quicksand().toString(),
        secondaryHeaderColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 252, 1),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: GoogleFonts.merriweatherSans().toString(),
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontFamily:
                GoogleFonts.quicksand(fontWeight: FontWeight.w500, fontSize: 15)
                    .fontFamily,
            fontSize: 18,
          ),
        ),
      ),
      home: CategoriesScreen(),
      routes: {
        '/category-meals': (context) {
          return CategoryMealsScreen();
        },
        '/meal-detail': (context) {
          return MealDetail();
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipes'),
        ),
        body: const Center(
          child: Text('Navigation Wation'),
        ));
  }
}
