// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeHomeModel _$RecipeHomeModelFromJson(Map<String, dynamic> json) => RecipeHomeModel(
      name: json['name'] as String?,
      category: json['category'] as String?,
      duration: json['duration'] as String?,
      imageUrl: json['image-url'] as String?,
    );

Map<String, dynamic> _$RecipeHomeModelToJson(RecipeHomeModel instance) => <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'duration': instance.duration,
      'imageUrl': instance.imageUrl,
    };
