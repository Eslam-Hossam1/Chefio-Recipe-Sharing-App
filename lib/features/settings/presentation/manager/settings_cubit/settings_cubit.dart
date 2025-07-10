import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AuthRepo _authRepo;
  final AuthCredentialsHelper _authCredentialsHelper;
  SettingsCubit(
      {required AuthRepo authRepo,
      required AuthCredentialsHelper authCredentialsHelper})
      : _authRepo = authRepo,
        _authCredentialsHelper = authCredentialsHelper,
        super(SettingsInitial());

  Future<void> logout() async {
    emit(SettingsLoading());
    final result = await _authRepo.logout();
    result.fold(
      (failure) => emit(SettingsFailure(
        errorMessage: failure.errMsg,
        errorLocalizationkey: failure.errCode,
      )),
      (success) async {
        await _authCredentialsHelper.clearTokens();
        emit(SettingsSuccess());
      },
    );
  }
}
