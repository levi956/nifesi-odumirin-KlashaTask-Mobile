class Recipes {
  Recipes({
    required this.title,
    required this.ingredients,
  });

  String title;
  List<String> ingredients;

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
        title: json["title"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "ingredients": List<String>.from(ingredients.map((x) => x)),
      };
}
