import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[CategoriesScreen(), FavoritesScreen()],
        ),
      ),
    );
  }
}
