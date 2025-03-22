import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class PostLatestWidget extends StatelessWidget {
  final RecipeModel recipe;

  const PostLatestWidget({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165, // Fixed width for each carousel item
      height: 250, // Fixed height
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all( Radius.circular(16)),
            child: Image.network(
              recipe.imageUrl,
              height: 165,
              width: 165,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 165,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                recipe.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryColor.shade900,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(height: 2),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 14, // Fixed size for avatar
                  backgroundImage: AssetImage("assets/images/user_avatar.png"),
                ),
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top:3),
                      child: Text(
                        "        Nguyễn Đình Trọng",
                        style: TextStyle(
                          fontSize: 16,
                          color: secondaryColor.shade950,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
