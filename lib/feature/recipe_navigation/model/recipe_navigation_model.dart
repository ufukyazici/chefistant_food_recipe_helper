// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_navigation_model.g.dart';

@JsonSerializable()
class RecipeNavigationModel {
  List<Steps>? steps;

  RecipeNavigationModel({this.steps});

  factory RecipeNavigationModel.fromJson(Map<String, dynamic> json) {
    return _$RecipeNavigationModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecipeNavigationModelToJson(this);
  }
}

@JsonSerializable()
class Steps extends Equatable {
  final String? step;
  final int? duration;

  const Steps({this.step, this.duration});

  factory Steps.fromJson(Map<String, dynamic> json) {
    return _$StepsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StepsToJson(this);
  }

  @override
  List<Object?> get props => [step, duration];
}
