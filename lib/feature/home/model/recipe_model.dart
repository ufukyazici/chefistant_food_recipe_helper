class RecipeModel {
  Recipe? recipe;
  RecipeDetails? recipeDetails;
  List<RecipeNavigation>? recipeNavigation;

  RecipeModel({this.recipe, this.recipeDetails, this.recipeNavigation});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
    recipeDetails = json['recipe-details'] != null ? RecipeDetails.fromJson(json['recipe-details']) : null;
    if (json['recipe-navigation'] != null) {
      recipeNavigation = <RecipeNavigation>[];
      json['recipe-navigation'].forEach((v) {
        recipeNavigation!.add(RecipeNavigation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    if (recipeDetails != null) {
      data['recipe-details'] = recipeDetails!.toJson();
    }
    if (recipeNavigation != null) {
      data['recipe-navigation'] = recipeNavigation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipe {
  String? name;
  String? description;
  String? category;
  int? duration;
  String? imageUrl;

  Recipe({this.name, this.description, this.category, this.duration, this.imageUrl});

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    category = json['category'];
    duration = json['duration'];
    imageUrl = json['image-url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['duration'] = duration;
    data['image-url'] = imageUrl;
    return data;
  }
}

class RecipeDetails {
  List<Ingredients>? ingredients;

  RecipeDetails({this.ingredients});

  RecipeDetails.fromJson(Map<String, dynamic> json) {
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  String? name;
  String? amount;

  Ingredients({this.name, this.amount});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount;
    return data;
  }
}

class RecipeNavigation {
  String? step;
  int? duration;

  RecipeNavigation({this.step, this.duration});

  RecipeNavigation.fromJson(Map<String, dynamic> json) {
    step = json['step'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['step'] = step;
    data['duration'] = duration;
    return data;
  }
}
