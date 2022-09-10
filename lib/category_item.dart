import './screens/categorymeals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    void selectCategory(ctx) {
      Navigator.of(ctx).push(
        MaterialPageRoute(
          builder: (_) => const CategoryMealsScreen(),
        ),
      );
    }

    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color.withOpacity(0.8),
              color.withOpacity(0.9),
              color
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
