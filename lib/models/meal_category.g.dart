// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealCategoryResponse _$MealCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    MealCategoryResponse(
      (json['categories'] as List<dynamic>)
          .map((e) => MealCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealCategoryResponseToJson(
        MealCategoryResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

MealCategory _$MealCategoryFromJson(Map<String, dynamic> json) => MealCategory(
      json['idCategory'] as String,
      json['strCategory'] as String,
      json['strCategoryThumb'] as String,
      json['strCategoryDescription'] as String,
    );

Map<String, dynamic> _$MealCategoryToJson(MealCategory instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
