import 'package:json_annotation/json_annotation.dart';

part 'recipe_home_model.g.dart';

@JsonSerializable()
class RecipeHomeModel {
  String? name;
  String? description;
  String? category;
  int? duration;
  String? imageUrl;

  RecipeHomeModel({this.name, this.description, this.category, this.duration, this.imageUrl});

  factory RecipeHomeModel.fromJson(Map<String, dynamic> json) {
    return _$RecipeHomeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecipeHomeModelToJson(this);
  }
}
