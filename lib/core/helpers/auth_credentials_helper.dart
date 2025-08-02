import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/services/jwt_decoder/jwt_decoder_service.dart';
import 'package:chefio_app/core/cache/secure_storage_helper.dart';

class AuthCredentialsHelper {
  final SecureStorageHelper secureStorageHelper;
  final JwtDecoderService jwtDecoder;
  AuthCredentialsHelper({
    required this.secureStorageHelper,
    required this.jwtDecoder,
  });

  AuthCredentials? _authCredentialsModel;

  Future<void> init() async {
    _authCredentialsModel = AuthCredentials(
      accessToken: await getAccessToken(),
      refreshToken: await getRefreshToken(),
    );
  }

  String? get accessToken => _authCredentialsModel?.accessToken;
  String? get refreshToken => _authCredentialsModel?.refreshToken;
  String? get userId {
    var decodedToken = jwtDecoder.decodeToken(
      token: _authCredentialsModel?.accessToken,
    );
    return decodedToken?[Constants.jwtUserId];
  }

  Future<String?> getAccessToken() async {
    return await secureStorageHelper.getString(key: ApiKeys.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await secureStorageHelper.getString(key: ApiKeys.refreshToken);
  }

  Future<void> storeAccessToken(String token) async {
    await secureStorageHelper.setData(key: ApiKeys.accessToken, value: token);
    _authCredentialsModel?.accessToken = token;
  }

  Future<void> storeRefreshToken(String token) async {
    await secureStorageHelper.setData(key: ApiKeys.refreshToken, value: token);
    _authCredentialsModel?.refreshToken = token;
  }

  Future<void> storeTokens(
      {required String accessToken, required String refreshToken}) async {
    await Future.wait([
      storeAccessToken(accessToken),
      storeRefreshToken(refreshToken),
    ]);
    await init();
  }

  Future<void> clearTokens() async {
    await secureStorageHelper.clear();
    _authCredentialsModel?.accessToken = null;
    _authCredentialsModel?.refreshToken = null;
    _authCredentialsModel = null;
  }

  bool userIsAuthenticated() {
    bool isLoggedIn = _authCredentialsModel?.accessToken != null;
    return isLoggedIn;
  }
}

class AuthCredentials {
  String? accessToken;
  String? refreshToken;

  AuthCredentials({required this.accessToken, required this.refreshToken});
}
