import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import '../services/recipe_service.dart';

import 'post_widget.dart';

class RecipeCarousel extends StatefulWidget {
  @override
  _RecipeCarouselState createState() => _RecipeCarouselState();
}

class _RecipeCarouselState extends State<RecipeCarousel> {
  List<RecipeModel> recipes = [];

  @override
  void initState() {
    super.initState();
    fetchRecipes().then((data) {
      setState(() {
        recipes = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return recipes.isEmpty
        ? Center(child: CircularProgressIndicator())
        : SizedBox( // Fixed height for the whole carousel
            height: 300, 
            child: CarouselSlider(
              options: CarouselOptions(
                height: 280, // Ensure a fixed height
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 0.65, // Keeps all items at the same size
              ),
              items: recipes.map((recipe) => PostWidget(recipe: recipe)).toList(),
            ),
          );
  }
}
