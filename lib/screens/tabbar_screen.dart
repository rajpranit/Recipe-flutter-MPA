import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsBarScreen extends StatefulWidget {
  const TabsBarScreen({Key key}) : super(key: key);

  @override
  State<TabsBarScreen> createState() => _TabsBarScreenState();
}

class _TabsBarScreenState extends State<TabsBarScreen> {
  int _selectedIndex = 0;

  void _selectWidget(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, Object>> widgetOptions = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': const FavouritesScreen(), 'title': 'My Favourites'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widgetOptions[_selectedIndex]['title'])),
      drawer: MainDrawer(),
      body: widgetOptions[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
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
        selectedItemColor: Colors.white,
        onTap: _selectWidget,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
