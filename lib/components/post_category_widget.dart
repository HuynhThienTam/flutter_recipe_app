import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class PostCategoryWidget extends StatelessWidget {
  final RecipeModel recipe;

  const PostCategoryWidget({required this.recipe, Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, // Fixed width for each carousel item
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Positioned(
            top: 70,
            child: Center(
              child: Container(
                width: 180,
                height: 200,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor.shade600.withOpacity(0.15),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32), // Space for overlapping image
                    Container(
                      width: 180,
                      child: Text(
                        recipe.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor.shade900),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 180,
                      child: Text(
                        'Tạo bởi \nTrần Đình Trọng',
                        style: TextStyle(
                            fontSize: 16,
                            color: primaryColor.shade950,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '20 phút',
                              style: TextStyle(
                                  fontSize: 16, color: primaryColor.shade950),
                            ),
                          ],
                        ),
                        Icon(Icons.sticky_note_2,
                            size: 24, color: primaryColor.shade900),
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipOval(
              child: Image.network(
                recipe.imageUrl,
                height: 100,
                width: 100, // Set width equal to height for a perfect circle
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
