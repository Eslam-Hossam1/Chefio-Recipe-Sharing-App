import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  final ProfileRepo _profileRepo;
  final AuthCredentialsHelper _authCredentialsHelper;
  MyProfileCubit({
    required ProfileRepo profileRepo,
    required AuthCredentialsHelper authCredentialsHelper,
  })  : _profileRepo = profileRepo,
        _authCredentialsHelper = authCredentialsHelper,
        super(MyProfileInitial());
  ProfileModel? profileModel;
  Future<void> fetchChefProfileWithInitialRecipes({
    int limit = Constants.recipesLimit,
  }) async {
    emit(MyProfileLoading());
    var result = await _profileRepo.fetchProfileWithInitialChefRecipes(
      chefId: _authCredentialsHelper.userId!,
      page: 1,
      limit: limit,
    );
    result.fold(
      (failure) => emit(
        MyProfileFailure(
          errMsg: failure.errMsg,
          errLocalizationError: failure.localizaitonKey,
        ),
      ),
      (profileModel) {
        this.profileModel = profileModel;
        emit(
          MyProfileSuccess(),
        );
      },
    );
  }

  Future<void> refresh({
    int limit = Constants.recipesLimit,
  }) async =>
      await fetchChefProfileWithInitialRecipes();
}
