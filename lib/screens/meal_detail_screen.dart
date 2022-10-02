import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:favorite_button/favorite_button.dart';

import '../dummy_data.dart';

class MealDetail extends StatefulWidget {
  const MealDetail();

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final mealItem = DUMMY_MEALS.where((meal) {
      return meal.id == mealid;
    }).toList();

    final meal = mealItem[0];

    Widget titleContainer(BuildContext context, String text) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          text,
          style: GoogleFonts.abel(textStyle: const TextStyle(fontSize: 35)),
        ),
      );
    }

    Widget listContainer(
      BuildContext context,
      Widget child,
    ) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        height: 200,
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child,
      );
    }

    void popFunciton() => Navigator.of(context).pop(mealid);

    return Scaffold(
      // backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(mealItem[0].title),
        actions: [
          FavoriteButton(
            valueChanged: (value) {
              setState(() {
                favorite = value;
              });
            },
            iconColor: Colors.amber,
            iconDisabledColor: Colors.white,
            iconSize: 40,
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.contain),
            ),
            titleContainer(context, 'Ingredients'),
            listContainer(
              context,
              ListView.builder(
                itemBuilder: ((context, index) => Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Container(
                        color: Colors.amber,
                        child: Text(
                          ' ${meal.ingredients[index]}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    )),
                itemCount: meal.ingredients.length,
              ),
            ),
            titleContainer(context, 'Steps'),
            listContainer(
              context,
              ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '# ${index + 1}',
                            ),
                          ),
                          title: Text('${meal.steps}'),
                        ),
                        const Divider(
                          color: Colors.black,
                        )
                      ],
                    )),
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () => popFunciton(),
      ),
    );
  }
}
