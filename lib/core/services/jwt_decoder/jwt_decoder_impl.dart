import 'package:chefio_app/core/services/jwt_decoder/jwt_decoder_interface.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JwtDecoderImpl implements JwtDecoderInterface {
  const JwtDecoderImpl();
  @override
  Map<String, dynamic>? decodeToken({required String? token}) {
    if (token == null) return null;
    var result = JwtDecoder.decode(token);
    return result;
  }
}
