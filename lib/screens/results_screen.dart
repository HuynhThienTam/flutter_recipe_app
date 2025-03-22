import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/components/post_widget.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class ResultsScreen extends StatelessWidget {
  final List<RecipeModel> results;

  ResultsScreen({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralColor.shade50,
      appBar: AppBar(title: Text('Kết quả tìm kiếm')),
      body: results.isEmpty
          ? Center(child: Text('Không có kết quả nào'))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return PostWidget(recipe: results[index]);
                },
              ),
            ),
    );
  }
}
