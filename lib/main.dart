import 'package:flutter/material.dart';
import 'package:meals_app_flutter_app/dummy_data.dart';
import 'package:meals_app_flutter_app/models/meal.dart';
import 'package:meals_app_flutter_app/screens/category_meals_screen.dart';
import 'package:meals_app_flutter_app/screens/filters_screen.dart';
import 'package:meals_app_flutter_app/screens/meal_detail.dart';
import 'package:meals_app_flutter_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 1) {
      setState(() {
        _favouritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealfavourite(String id) {
    return _favouritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edziban',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        colorScheme: const ColorScheme.light(
          primary: Colors.black54,
        ),
        canvasColor: Color.fromRGBO(255, 238, 173, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(161, 181, 125, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(217, 83, 79, 1),
            ),
            headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favouritedMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavourite, _isMealfavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              _filters,
              _setFilters,
            )
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
