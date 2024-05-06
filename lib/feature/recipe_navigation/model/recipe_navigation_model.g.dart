// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_navigation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeNavigationModel _$RecipeNavigationModelFromJson(
        Map<String, dynamic> json) =>
    RecipeNavigationModel(
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeNavigationModelToJson(
        RecipeNavigationModel instance) =>
    <String, dynamic>{
      'steps': instance.steps,
    };

Steps _$StepsFromJson(Map<String, dynamic> json) => Steps(
      step: json['step'] as String?,
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$StepsToJson(Steps instance) => <String, dynamic>{
      'step': instance.step,
      'duration': instance.duration,
    };
