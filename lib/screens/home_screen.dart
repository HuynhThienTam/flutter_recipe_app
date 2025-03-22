import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mevivu_recipe_app/components/category_tabbar.dart';
import 'package:mevivu_recipe_app/components/post_category_widget.dart';
import 'package:mevivu_recipe_app/components/post_latest_widget.dart';
import 'package:mevivu_recipe_app/components/recipe_carousel.dart';
import 'package:mevivu_recipe_app/components/search_bar_widget.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import 'package:mevivu_recipe_app/services/recipe_service.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [];
  bool isLoading = true;
  String selectedCategory = "";
  List<RecipeModel> meals = [];
  late Future<List<RecipeModel>> futureMeals;
  @override
  void initState() {
    super.initState();
    loadCategories();
    futureMeals = fetchLatestMeals();
    // if(selectedCategory!=""){
    //   fetchMeals(selectedCategory);
    // }
  }

  void fetchMeals(String category) async {
    final fetchedMeals = await fetchMealsByCategory(category);
    setState(() {
      meals = fetchedMeals;
    });
  }

  Future<void> loadCategories() async {
    List<String> fetchedCategories = await fetchCategories();

    setState(() {
      categories = fetchedCategories;
      isLoading = false;
      selectedCategory = categories.isNotEmpty ? categories[0] : "";
    });

    if (selectedCategory.isNotEmpty) {
      fetchMeals(selectedCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralColor.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SearchBarWidget(
                controller: TextEditingController(),
                isReadOnly: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "TP. Hồ Chí Minh",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    "Xem tất cả",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: primaryColor.shade600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RecipeCarousel(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Danh mục",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    "Xem tất cả",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: primaryColor.shade600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            CategoryTabBar(
              categories: categories,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
                fetchMeals(category);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 270,
              child: CarouselSlider.builder(
                itemCount: meals.length,
                itemBuilder: (context, index, realIndex) {
                  return PostCategoryWidget(
                    recipe: meals[index],
                  );
                },
                options: CarouselOptions(
                  height: 270,
                  enlargeCenterPage: false,
                  viewportFraction: 0.50,
                  enableInfiniteScroll: false,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Công thức gần đây",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder<List<RecipeModel>>(
              future: futureMeals,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load latest meals'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No meals found'));
                }

                final meals = snapshot.data!;

                return Container(
                  height: 270,
                  child: CarouselSlider.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index, realIndex) {
                      return PostLatestWidget(
                        recipe: meals[index],
                      );
                    },
                    options: CarouselOptions(
                      height: 270,
                      enlargeCenterPage: false,
                      viewportFraction: 0.45,
                      enableInfiniteScroll: false,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
