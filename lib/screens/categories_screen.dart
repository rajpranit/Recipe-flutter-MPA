import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        children: dummycategories
            .map(
              (category) =>
                  CategoryItem(category.id, category.title, category.color),
            )
            .toList(),
      ),
    );
  }
}
