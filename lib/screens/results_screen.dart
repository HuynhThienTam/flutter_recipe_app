// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mevivu_recipe_app/components/post_result_widget.dart';
// import 'package:mevivu_recipe_app/components/search_bar_widget.dart';
// import 'package:mevivu_recipe_app/model/recipe_model.dart';
// import 'package:mevivu_recipe_app/utils/color_themes.dart';

// class ResultsScreen extends StatelessWidget {
//   final List<RecipeModel> results;

//   ResultsScreen({Key? key, required this.results}) : super(key: key);
//   void onFilterPressed() {}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: neutralColor.shade50,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 40,
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: 10, left: 14),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: SearchBarWidget(
//                     controller: TextEditingController(),
//                     isReadOnly: true,
//                     onPressed: () {},
//                   ),
//                 ),
                
//                 IconButton(
//                   icon: Icon(Icons.filter_list_alt,
//                       color: primaryColor.shade600, size: 28,), 
//                       // Icon filter
//                   onPressed:
//                       onFilterPressed, // Gọi hàm xử lý khi nhấn vào icon filter
//                 ),
//               ],
//             ),
//           ),
       
//           Expanded(
//             child: results.isEmpty
//                 ? Center(child: Text('Không có kết quả nào'))
//                 : Padding(
//                     padding: const EdgeInsets.only(right: 8, left: 8, bottom: 12),
//                     child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 0,
//                         mainAxisSpacing: 16,
//                         childAspectRatio: 0.85,
//                       ),
//                       itemCount: results.length,
//                       itemBuilder: (context, index) {
//                         return PostResultWidget(recipe: results[index]);
//                       },
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/components/post_result_widget.dart';
import 'package:mevivu_recipe_app/components/search_bar_widget.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class ResultsScreen extends StatefulWidget {
  final List<RecipeModel> results;

  ResultsScreen({Key? key, required this.results}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<String> categories = [];
  List<String> ingredients = [];
  List<String> areas = [];
  List<String> selectedFilters = [];

  @override
  void initState() {
    super.initState();
    fetchFilterOptions();
  }

  Future<void> fetchFilterOptions() async {
    // Fetch categories, ingredients, and areas from API
    setState(() {
      categories = ["Cơm", "Mì", "Cháo"];
      ingredients = ["Gà", "Bò", "Cá"];
      areas = ["Hà Nội", "Sài Gòn", "Đà Nẵng"];
    });
  }

  void openFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 1.0,
          builder: (_, scrollController) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lọc", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {
                          setState(() => selectedFilters.clear());
                          Navigator.pop(context);
                        },
                        child: Text("Đặt lại", style: TextStyle(color: Colors.red, fontSize: 16)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildFilterSection("Danh mục", categories),
                          buildFilterSection("Nguyên liệu", ingredients),
                          buildFilterSection("Khu vực", areas),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) => buildFilterButton(option)).toList(),
        ),
      ],
    );
  }

  Widget buildFilterButton(String category) {
    bool isSelected = selectedFilters.contains(category);
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected ? selectedFilters.remove(category) : selectedFilters.add(category);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.shade600 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? null
              : Border.all(color: Colors.black.withOpacity(0.3), width: 1),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : neutralColor.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralColor.shade50,
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 14),
            child: Row(
              children: [
                Expanded(
                  child: SearchBarWidget(
                    controller: TextEditingController(),
                    isReadOnly: true,
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list_alt, color: primaryColor.shade600, size: 28),
                  onPressed: openFilterSheet,
                ),
              ],
            ),
          ),
          Expanded(
            child: widget.results.isEmpty
                ? Center(child: Text('Không có kết quả nào'))
                : Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8, bottom: 12),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: widget.results.length,
                      itemBuilder: (context, index) {
                        return PostResultWidget(recipe: widget.results[index]);
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
