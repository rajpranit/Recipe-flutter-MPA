import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  const MealDetail();

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final mealItem = DUMMY_MEALS.where((meal) {
      return meal.id == mealid;
    }).toList();

    final meal = mealItem[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem[0].title),
      ),
      body: Container(
        width: double.infinity,
        child: Card(
          elevation: 15,
          child: Column(
            children: [
              const Text(
                'Ingredients',
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...meal.ingredients.map(
                      (ingredient) => Text(ingredient),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
