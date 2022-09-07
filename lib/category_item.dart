import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding:
          const EdgeInsets.only(left: 60, right: 40, top: 120, bottom: 100),
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
      child: Text(title),
    );
  }
}
