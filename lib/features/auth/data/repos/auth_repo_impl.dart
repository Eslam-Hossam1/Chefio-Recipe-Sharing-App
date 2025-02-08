import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/core/errors/failures.dart';
import 'package:chefio_app/features/auth/data/models/sign_up_success_model/sign_up_success_model.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer _apiConsumer;

  AuthRepoImpl({required ApiConsumer apiConsumer}) : _apiConsumer = apiConsumer;

  @override
  Future<Either<Failure, SignUpSuccessModel>> signUp({required String username, required String email, required String password}) async{
    try {
      final response = await _apiConsumer.post(
        EndPoint.signUp,
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );
      final signUpSuccessModel = SignUpSuccessModel.fromJson(response);
      return Right(signUpSuccessModel);
    } catch (e) {
      if(e is DioException){
        return Left(DioApiFailure.fromDioException(e));
      }else{
        return Left(DioApiFailure(e.toString()));
      }
    }
  }
}