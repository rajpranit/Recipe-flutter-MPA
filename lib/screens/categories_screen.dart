import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        children: dummycategories
            .map(
              (category) => CategoryItem(category.title, category.color),
            )
            .toList(),
      ),
    );
  }
}
