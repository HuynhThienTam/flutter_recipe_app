
import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class PostWidget extends StatelessWidget {
  final RecipeModel recipe;

  const PostWidget({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 260, // Fixed height for PostWidget
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  recipe.imageUrl,
                  height: 140, // Fixed height for the image
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor.shade500,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text('${recipe.rating}',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                Text(
                  "1 tiếng 20 phút",
                  style: TextStyle(
                      color: secondaryColor.shade900, fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(Icons.favorite_border, color: Colors.black),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 40, // Fixed height for the title
              child: Text(
                recipe.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Spacer(), // Pushes avatar to the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20, // Fixed size for avatar
                  backgroundImage: AssetImage("assets/images/user_avatar.png"),
                ),
                SizedBox(width: 8),
                Text(
                  "Đình Trọng Phúc", // Username
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: primaryColor.shade600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
