import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo,
        super(ProfileInitial());
  ProfileModel? profileModel;
  late String chefId;
  Future<void> fetchChefProfileWithInitialRecipes({
    required String chefId,
    required int limit,
  }) async {
    emit(ProfileLoading());
    this.chefId = chefId;
    var result = await _profileRepo.fetchProfileWithInitialChefRecipes(
      chefId: chefId,
      page: 1,
      limit: limit,
    );
    result.fold(
      (failure) => emit(
        ProfileFailure(
          errMsg: failure.errMsg,
          errLocalizationError: failure.localizaitonKey,
        ),
      ),
      (profileModel) {
        this.profileModel = profileModel;
        emit(
          ProfileSuccess(),
        );
      },
    );
  }
}
