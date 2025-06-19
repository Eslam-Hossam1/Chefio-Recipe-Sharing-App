import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/features/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_view_body_empty.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_view_body_error.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_view_body_first_loading.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_view_body_initial.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_view_body_result.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchRecipeCubit, SearchRecipeState>(
        builder: (context, state) {
      if (state is SearchRecipeInitial) {
        return SearchViewBodyInitial();
      } else if (state is FirstApiFetchFailure) {
        return SearchViewBodyError(errText: state.errorLocalizationKey.tr());
      } else if (state is FirstLoading) {
        return SearchViewBodyFirstLoading();
      }else if (state is SearchEmpty){
                return SearchViewBodyEmpty();
      } else {
        return SearchViewBodyResult();
      }
    }, listener: (context, state) {
      {
        if (state is LoadingMoreFailure) {
          showCustomToast(
            context,
            message: state.errorLocalizationKey.tr(),
          );
        }
      }
    });
  }
}
