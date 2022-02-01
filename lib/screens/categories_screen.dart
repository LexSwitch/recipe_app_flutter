import 'package:flutter/material.dart';
import 'package:meals_app_flutter_app/widgets/category_item.dart';
import 'package:meals_app_flutter_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(
          title: catData.title,
          color: catData.color,
          id: catData.id,
        );
      }).toList(),
    );
  }
}
