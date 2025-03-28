import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/core/models/category.dart';

class CategoriesService {
  List<Category> categories = [Category(name: 'meals'),Category(name: 'مقبلات'),];
  final ApiConsumer _apiConsumer;
  final String _endPoint;
  CategoriesService(this._apiConsumer, this._endPoint);
  Future<void> fetchAndSetCategories() async {
    final response = await _apiConsumer.get(_endPoint);
    categories =
        (response as List).map((json) => Category.fromJson(json)).toList();
  }
}
