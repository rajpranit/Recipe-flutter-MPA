import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe/models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem,
  });

  @override
  Widget build(BuildContext context) {
    void mealSelector(BuildContext context) {
      Navigator.of(context)
          .pushNamed('/meal-detail', arguments: id)
          .then((value) => removeItem(value));
    }

    return InkWell(
      onTap: () => mealSelector(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 5,
                child: Container(
                  color: Colors.black45,
                  width: 300,
                  child: Text(
                    title.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$duration min',
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.bar_chart),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${complexity.toString().split('.').last}',
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${affordability.toString().split('.').last}',
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
