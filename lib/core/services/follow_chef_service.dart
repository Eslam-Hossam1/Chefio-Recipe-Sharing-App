import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FollowChefService {
  final ApiConsumer _apiConsumer;
  FollowChefService({
    required ApiConsumer apiConsumer,
  }) : _apiConsumer = apiConsumer;
  Future<Either<ApiFailure, void>> toggleFollowChef(
      {required String chefId}) async {
    try {
      var result = await _apiConsumer.post(
        EndPoints.getToggleFollowChefEndpoint(
          chefId,
        ),
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return left(DioApiFailure.fromDioException(e));
      } else {
        return left(DioApiFailure.unknown(e.toString()));
      }
    }
  }
}
