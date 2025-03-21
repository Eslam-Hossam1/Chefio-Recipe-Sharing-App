import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String? id;
  final String name;
  final String? categoryLocalizationKey;
  const Category( {this.id,required this.name,this.categoryLocalizationKey,});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['_id'] as String?,
        name: json['name'] as String,
        categoryLocalizationKey: getCategoryLocalizationKeyFromCategoryName(categoryName: json['name'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];

  static String? getCategoryLocalizationKeyFromCategoryName({required String categoryName}){
    if(categoryName=="General Dishes"){
      return AppLocalizationKeys.category.generalDishes;
    }else if(categoryName=="Main Dishes"){
      return AppLocalizationKeys.category.mainDishes;
    }else if(categoryName=="Fast Food"){
      return AppLocalizationKeys.category.fastFood;
    }else if(categoryName=="Healthy Food"){
      return AppLocalizationKeys.category.healthyMeals;
    }else if(categoryName=="Desserts & Bakery"){
      return AppLocalizationKeys.category.dessertsAndBakery;
    }else{
      return null;
    }
  }
}
