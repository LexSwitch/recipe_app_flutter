import 'package:flutter/material.dart';
import 'package:meals_app_flutter_app/screens/category_meals_screen.dart';
import 'package:meals_app_flutter_app/screens/filters_screen.dart';
import 'package:meals_app_flutter_app/screens/meal_detail.dart';
import 'package:meals_app_flutter_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen()
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
