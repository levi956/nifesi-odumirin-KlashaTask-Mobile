class Ingredients {
  Ingredients({
    required this.title,
    required this.useBy,
  });

  String title;
  DateTime useBy;

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        title: json["title"],
        useBy: DateTime.parse(
          json["use-by"],
        ),
      );
}
