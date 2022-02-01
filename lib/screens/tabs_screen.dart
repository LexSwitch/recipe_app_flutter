import 'package:flutter/material.dart';
import 'package:meals_app_flutter_app/widgets/main_drawer.dart';
import './categories_screen.dart';
import 'package:meals_app_flutter_app/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'My Favourites'}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 16,
        type: BottomNavigationBarType.shifting,
        unselectedFontSize: 14,
        selectedItemColor: Color.fromRGBO(217, 83, 79, 1),
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            //  backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
