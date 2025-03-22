class RecipeModel {
  final String id;
  final String title;
  final String imageUrl;
  final String category;
  final String area;
  final String instructions;
  final double rating;

  RecipeModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.area,
    required this.instructions,
    required this.rating,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['idMeal'],
      title: json['strMeal'],
      imageUrl: json['strMealThumb'],
      category: json['strCategory'] ?? 'Unknown',
      area: json['strArea'] ?? 'Unknown',
      instructions: json['strInstructions'] ?? '',
      rating: (json['idMeal'].hashCode % 5) + 1.0, // Fake rating (1-5)
    );
  }
}
