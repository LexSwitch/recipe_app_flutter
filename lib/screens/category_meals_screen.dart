import 'package:flutter/material.dart';
import 'package:meals_app_flutter_app/models/meal.dart';
import 'package:meals_app_flutter_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryTitle;
  // final String categoryId;
  // CategoryMealsScreen(this.categoryTitle, this.categoryId);

  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              affordability: displayedMeals![index].affordability,
              complexity: displayedMeals![index].complexity,
              duration: displayedMeals![index].duration,
              id: displayedMeals![index].id,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals!.length,
        ));
  }
}
