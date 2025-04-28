abstract class JwtDecoderInterface {
  Map<String, dynamic>? decodeToken({required String? token});
}
