import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String catId;
  // final String catTitle;
  // CategoryMealScreen({this.catId,this.catTitle});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            catTitle,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (cntxt, index) {
            return MealItem(
              id: categoryMeals[index].id,
              affordability: categoryMeals[index].affordability,
              title: categoryMeals[index].title,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
