// import 'package:flutter/material.dart';
// import 'package:mevivu_recipe_app/utils/color_themes.dart';

// class CategoryTabBar extends StatefulWidget {
//   final List<String> categories;
//   final Function(String) onCategorySelected;

//   const CategoryTabBar({
//     required this.categories,
//     required this.onCategorySelected,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _CategoryTabBarState createState() => _CategoryTabBarState();
// }

// class _CategoryTabBarState extends State<CategoryTabBar> {
//   String selectedCategory = '';

//   @override
//   void initState() {
//     super.initState();
//     selectedCategory = widget.categories.isNotEmpty ? widget.categories[0] : '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40, // Fixed height for the tab bar
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 8),
//         itemCount: widget.categories.length,
//         itemBuilder: (context, index) {
//           final category = widget.categories[index];
//           final isSelected = category == selectedCategory;

//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedCategory = category;
//               });
//               widget.onCategorySelected(category);
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
//               margin: EdgeInsets.symmetric(horizontal: 4),
//               decoration: BoxDecoration(
//                 color: isSelected ? primaryColor.shade600 : Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 border: isSelected
//                     ? null
//                     : Border.all(
//                         color: Colors.black.withOpacity(0.3), // Border color
//                         width: 1, // Border width
//                       ),
//               ),
//               child: Center(
//                 child: Text(
//                   category,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: isSelected ? Colors.white : neutralColor.shade800,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';
class CategoryTabBar extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  const CategoryTabBar({
    required this.categories,
    required this.onCategorySelected,
    Key? key,
  }) : super(key: key);

  @override
  _CategoryTabBarState createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories.isNotEmpty ? widget.categories[0] : '';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          shrinkWrap: true, // Let the grid take only as much space as needed
          physics: NeverScrollableScrollPhysics(), // Disable scrolling (let parent handle it)
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 buttons per row
            childAspectRatio: 2.5, // Adjust width-to-height ratio
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            final category = widget.categories[index];
            final isSelected = category == selectedCategory;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
                widget.onCategorySelected(category);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor.shade600 : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: isSelected
                      ? null
                      : Border.all(
                          color: Colors.black.withOpacity(0.3),
                          width: 1,
                        ),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.white : neutralColor.shade800,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
