import 'package:flutter/material.dart';

class TabsBarScreen extends StatefulWidget {
  const TabsBarScreen({Key key}) : super(key: key);

  @override
  State<TabsBarScreen> createState() => _TabsBarScreenState();
}

class _TabsBarScreenState extends State<TabsBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              )
            ]),
          ),
        ));
  }
}
