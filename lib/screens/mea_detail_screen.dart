import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle (BuildContext cont , String texxt){
    return Container(
      margin: EdgeInsets.all(5),
      child: Text(texxt,
        style: Theme.of(cont).textTheme.headline5,
      ),
    );
  }

  Widget buildCard (BuildContext context,List selMea){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(6),
      height: 150,
      width: 390,
      child: ListView.builder(
          itemCount: selMea.length,
          itemBuilder: (ctx, index) => Card(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('# ${index+1} - ${selMea[index]}'),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),

          buildSectionTitle(context, 'Ingredients'),
          buildCard(context, selectedMeal.ingredients),
          buildSectionTitle(context, 'Steps'),
          buildCard(context, selectedMeal.steps),
        ],
      ),
    );
  }
}
