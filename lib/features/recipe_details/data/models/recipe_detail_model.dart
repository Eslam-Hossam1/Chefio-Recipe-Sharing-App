class RecipeDetailModel {
  final int id;
  final String imageUrl;
  final String foodName;
  final String foodDescription;
  final String categoryName;
  final int foodCookDuration;
  final List<String> ingredients;
  final List<String> steps;

  const RecipeDetailModel(
      {
        required this.id,required this.imageUrl,
      required this.foodName,
      required this.foodDescription,
      required this.categoryName,
      required this.foodCookDuration,
      required this.ingredients,
      required this.steps});
}
