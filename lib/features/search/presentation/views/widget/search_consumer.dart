import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/features/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_empty_result.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_error.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_first_loading.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_initial.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_result.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchConsumer extends StatelessWidget {
  const SearchConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchRecipeCubit, SearchRecipeState>(
      listener: (context, state) {
        {
          if (state is LoadingMoreFailure) {
            showCustomToast(
              context,
              message: state.errorLocalizationKey.tr(),
            );
          }
        }
      },
      builder: (context, state) {
        if (state is SearchRecipeInitial) {
          return SearchInitial();
        } else if (state is FirstApiFetchFailure) {
          return SearchError(errText: state.errorLocalizationKey.tr());
        } else if (state is FirstLoading) {
          return SearchFirstLoading();
        } else if (state is SearchEmpty) {
          return SearchEmptyResult();
        } else {
          return SearchResult();
        }
      },
    );
  }
}
