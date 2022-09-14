import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          height: 250,
          width: 300,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: child);
    }

    return Scaffold(
      // backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(mealItem[0].title),
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
                ))
          ],
        ),
      ),
    );
  }
}
