import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget drawerList(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            // margin: const EdgeInsets.all(2),
            height: 120,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            // decoration: BoxDecoration(color: Theme.of(context).acc),
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          drawerList('Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          drawerList('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed('/filter-setting');
          })
        ],
      ),
    );
  }
}
