import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './dummy_data.dart';
import './models/meal.dart';
import '../screens/filter_setting.dart';
import '../screens/categorymeals_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabbar_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten-free": false,
    'vegan': false,
    'vegetarian': false,
    'lactose-free': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filterData['gluten-free'] && !meal.isGlutenFree) {
          return false;
        }
        if (filterData['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filterData['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filterData['lactose-free'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => mealId == meal.id);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: GoogleFonts.quicksand().toString(),
        scaffoldBackgroundColor: Colors.amber.shade100,
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
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) {
          return TabsBarScreen(_favoriteMeals);
        },
        '/category-meals': (context) {
          return CategoryMealsScreen(_availableMeals);
        },
        '/meal-detail': (context) {
          return MealDetail(_toggleFavorites, _isMealFavorite);
        },
        '/filter-setting': (context) {
          return FilterSetting(_filters, _setFilters);
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
