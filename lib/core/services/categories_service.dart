import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/core/models/category.dart';

class CategoriesService {
  List<Category> categories = [];
  final ApiConsumer _apiConsumer;
  final String _endPoint;
  CategoriesService(this._apiConsumer, this._endPoint);
  Future<List<Category>> getCategories() async {
    if (categories.isEmpty) {
      final response = await _apiConsumer.get(_endPoint);
      dynamic responseCategories = response['categories'];
      categories = (responseCategories as List)
          .map((json) => Category.fromJson(json))
          .toList();
    }
    return categories;
  }
}
