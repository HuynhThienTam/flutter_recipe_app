import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';
import 'package:mevivu_recipe_app/screens/search_screen.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final bool isReadOnly;

  SearchBarWidget({
    Key? key,
    required this.controller,
    this.onChanged,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      readOnly: isReadOnly,
      onTap: () {
        if (isReadOnly) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Tìm kiếm sản phẩm",
        hintStyle: TextStyle(
          color: neutralColor.shade400,
          fontSize: 18,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: Image.asset(
            "assets/icons/search_icon.png",
            width: 12,
            height: 12,
            fit: BoxFit.contain,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
