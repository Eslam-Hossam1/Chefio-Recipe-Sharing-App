import 'package:chefio_app/core/errors/failures.dart';

abstract class ApiFailure extends Failure {
  final String localizaitonKey;
  final String errCode;
  const ApiFailure(super.errMsg, this.localizaitonKey, this.errCode);
}
