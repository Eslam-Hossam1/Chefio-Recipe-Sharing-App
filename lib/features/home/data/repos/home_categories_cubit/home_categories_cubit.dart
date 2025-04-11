import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/repos/home_repo.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_categories_builder.dart';
import 'package:equatable/equatable.dart';

part 'home_categories_state.dart';

class HomeCategoriesCubit extends Cubit<HomeCategoriesState> {
  HomeCategoriesCubit(this._homeRepo) : super(HomeCategoriesInitial());
  final HomeRepo _homeRepo;
  List<Category> categories = [];
  Future<void> fetchCategories() async {
    emit(HomeCategoriesLoading());
    var result = await _homeRepo.fetchCategories();
    result.fold((failure) {
      emit(
        HomeCategoriesFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      );
    }, (categories) {
      this.categories = categories;
      emit(HomeCategoriesLoaded());
    });
  }

  Future<void> refreshCategories() async {
    categories.clear();
    await fetchCategories();
  }
}
