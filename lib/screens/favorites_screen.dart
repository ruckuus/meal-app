import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites, start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            complexity: meal.complexity,
            affordability: meal.affordability,
            duration: meal.duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
