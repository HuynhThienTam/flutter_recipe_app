import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/components/search_bar_widget.dart';
import 'package:mevivu_recipe_app/model/recipe_model.dart';
import 'package:mevivu_recipe_app/screens/results_screen.dart';
import 'package:mevivu_recipe_app/services/recipe_service.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<RecipeModel> _searchResults = [];
  bool _isSearching = false;

  //
  void _onSearchChanged(String query) async {
    String trimmedQuery = query.trim(); // Xóa khoảng trắng 2 đầu

    if (trimmedQuery.isEmpty) {
      setState(() {
        _searchResults = [];
        _isSearching = false; // Ngừng trạng thái loading nếu có
      });
      return;
    }

    setState(() => _isSearching = true);

    List<RecipeModel> results = await searchRecipes(trimmedQuery);

    setState(() {
      _searchResults = results;
      _isSearching = false;
    });
  }

  void _onResultSelected(List<RecipeModel> recipes) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(results: recipes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralColor.shade50,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SearchBarWidget(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onPressed: () => _onResultSelected(_searchResults),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          if (_searchResults.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => _onResultSelected([_searchResults[index]]),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 40, // Giữ nguyên chiều cao
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Đẩy icon sang phải
                        children: [
                          Text(
                            _searchResults[index].title,
                            style: TextStyle(
                                fontSize: 18, color: neutralColor.shade950),
                          ),
                          Icon(
                            Icons.arrow_forward_ios, // Mũi tên chỉ sang phải
                            size: 14,
                            color: primaryColor.shade600, // Màu mờ hơn cho icon
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          if (_isSearching) CircularProgressIndicator(),
        ],
      ),
    );
  }
}
