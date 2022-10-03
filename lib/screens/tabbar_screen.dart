import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';
import '../models/meal.dart';

class TabsBarScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsBarScreen(this.favoriteMeals);

  @override
  State<TabsBarScreen> createState() => _TabsBarScreenState();
}

class _TabsBarScreenState extends State<TabsBarScreen> {
  int _selectedIndex = 0;
  List<Map<String, Object>> _widgetOptions;

  void _selectWidget(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  initState() {
    _widgetOptions = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favoriteMeals), 'title': 'My Favourites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_widgetOptions[_selectedIndex]['title'])),
      drawer: MainDrawer(),
      body: _widgetOptions[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: 'Category',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_outline),
            label: 'Favourites',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
        selectedItemColor: Colors.amber,
        showUnselectedLabels: true,
        onTap: _selectWidget,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
