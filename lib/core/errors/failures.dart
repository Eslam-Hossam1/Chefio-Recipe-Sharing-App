import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  const Failure(this.errMsg);
}
