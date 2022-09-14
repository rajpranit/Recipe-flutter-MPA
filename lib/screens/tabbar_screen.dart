import 'package:flutter/material.dart';

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
      body: widgetOptions[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favourites',
            backgroundColor: Colors.pink,
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
