class Recipe {
  List<RecipeElement> recipes;
  int total;
  int skip;
  int limit;

  Recipe({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  Recipe copyWith({
    List<RecipeElement>? recipes,
    int? total,
    int? skip,
    int? limit,
  }) =>
      Recipe(
        recipes: recipes ?? this.recipes,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        recipes: List<RecipeElement>.from(
            json["recipes"].map((x) => RecipeElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class RecipeElement {
  int id;
  String name;
  List<String> ingredients;
  List<String> instructions;
  int prepTimeMinutes;
  int cookTimeMinutes;
  int servings;
  Difficulty difficulty;
  String cuisine;
  int caloriesPerServing;
  List<String> tags;
  int userId;
  String image;
  double rating;
  int reviewCount;
  List<String> mealType;

  RecipeElement({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  RecipeElement copyWith({
    int? id,
    String? name,
    List<String>? ingredients,
    List<String>? instructions,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    int? servings,
    Difficulty? difficulty,
    String? cuisine,
    int? caloriesPerServing,
    List<String>? tags,
    int? userId,
    String? image,
    double? rating,
    int? reviewCount,
    List<String>? mealType,
  }) =>
      RecipeElement(
        id: id ?? this.id,
        name: name ?? this.name,
        ingredients: ingredients ?? this.ingredients,
        instructions: instructions ?? this.instructions,
        prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
        cookTimeMinutes: cookTimeMinutes ?? this.cookTimeMinutes,
        servings: servings ?? this.servings,
        difficulty: difficulty ?? this.difficulty,
        cuisine: cuisine ?? this.cuisine,
        caloriesPerServing: caloriesPerServing ?? this.caloriesPerServing,
        tags: tags ?? this.tags,
        userId: userId ?? this.userId,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        reviewCount: reviewCount ?? this.reviewCount,
        mealType: mealType ?? this.mealType,
      );

  factory RecipeElement.fromJson(Map<String, dynamic> json) => RecipeElement(
        id: json["id"],
        name: json["name"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        prepTimeMinutes: json["prepTimeMinutes"],
        cookTimeMinutes: json["cookTimeMinutes"],
        servings: json["servings"],
        difficulty: difficultyValues.map[json["difficulty"]]!,
        cuisine: json["cuisine"],
        caloriesPerServing: json["caloriesPerServing"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        userId: json["userId"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        reviewCount: json["reviewCount"],
        mealType: List<String>.from(json["mealType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "prepTimeMinutes": prepTimeMinutes,
        "cookTimeMinutes": cookTimeMinutes,
        "servings": servings,
        "difficulty": difficultyValues.reverse[difficulty],
        "cuisine": cuisine,
        "caloriesPerServing": caloriesPerServing,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "userId": userId,
        "image": image,
        "rating": rating,
        "reviewCount": reviewCount,
        "mealType": List<dynamic>.from(mealType.map((x) => x)),
      };
}

enum Difficulty { EASY, MEDIUM }

final difficultyValues =
    EnumValues({"Easy": Difficulty.EASY, "Medium": Difficulty.MEDIUM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
