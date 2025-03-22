import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mevivu_recipe_app/model/recipe_model.dart';

Future<List<RecipeModel>> fetchRecipes() async {
  final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return (data['meals'] as List).map((meal) => RecipeModel.fromJson(meal)).toList();
  } else {
    throw Exception('Failed to load recipes');
  }
}

Future<List<RecipeModel>> fetchMealsByCategory(String category) async {
  final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return (data['meals'] as List).map((meal) => RecipeModel.fromJson(meal)).toList();
  } else {
    throw Exception('Failed to load meals');
  }
}
Future<List<String>> fetchCategories() async {
    final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['categories'] as List)
            .map((category) => category['strCategory'] as String)
            .toList();
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (error) {
      print("Error fetching categories: $error");
      return [];
    }
  }
  Future<List<RecipeModel>> fetchLatestMeals() async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['meals'] != null) {
        return (data['meals'] as List)
            .map((meal) => RecipeModel.fromJson(meal))
            .toList();
      }
      return [];
    } else {
      throw Exception('Failed to load latest meals');
    }
  }
  Future<List<RecipeModel>> searchRecipes(String query) async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['meals'] as List)
          .map((meal) => RecipeModel.fromJson(meal))
          .toList();
    }
    return [];
  }