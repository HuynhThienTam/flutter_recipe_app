import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class PostResultWidget extends StatelessWidget {
  final RecipeModel recipe;

  const PostResultWidget({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 200, // Slightly smaller height since rating is removed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.network(
                  recipe.imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7), // Transparent white
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.pink, size: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              recipe.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: neutralColor.shade950),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(child: Container(),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  "by Pony",
                  style: TextStyle(fontSize: 14, color: neutralColor.shade400),
                ),
                Spacer(),
                Icon(Icons.schedule, color: primaryColor.shade600, size: 16),
                SizedBox(width: 4),
                Text(
                  "20m",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: neutralColor.shade700),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
