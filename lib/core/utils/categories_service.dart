import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/category.dart';

class CategoriesService {
  List<Category> categories = [];
  final DioConsumer _dioConsumer;
  final String _endPoint;
  CategoriesService(this._dioConsumer, this._endPoint);
  Future<void> fetchAndSetCategories() async {
    final response = await _dioConsumer.get(_endPoint);
    categories =
        (response as List).map((json) => Category.fromJson(json)).toList();
  }
}
