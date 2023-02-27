import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          children: [
            ...DUMMY_CATEGORIES.map((catData) {
              return CategoryItem(
                id: catData.id,
                color: catData.color,
                title: catData.title,
              );
            }).toList(),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25),
        ),
      );
  }
}
