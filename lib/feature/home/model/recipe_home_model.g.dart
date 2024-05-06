// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeHomeModel _$RecipeHomeModelFromJson(Map<String, dynamic> json) => RecipeHomeModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      duration: json['duration'] as int?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$RecipeHomeModelToJson(RecipeHomeModel instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'duration': instance.duration,
      'imageUrl': instance.imageUrl,
    };
