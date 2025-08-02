import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_failure_body.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({super.key, required this.id});
  final String id;
  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  @override
  void initState() {
    context.read<RecipeDetailsCubit>().fetchRecipeDetails(recipeId: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(RoutePaths.home);
        }
      },
      child: Scaffold(
        body: BlocConsumer<RecipeDetailsCubit, RecipeDetailsState>(
          listener: (context, state) {
            if (state is RecipeDetailsDeleteRecipeFailure) {
              DialogHelper.showErrorDialog(
                context,
                errorMessage: state.errorLocalizationKey.tr(),
                btnOkOnPress: () {},
              );
            } else if (state is RecipeDetailsDeleteRecipeSuccess) {
              context.pop(RoutePaths.home);
            }
          },
          builder: (context, state) {
            if (state is RecipeDetailsFailure) {
              return RecipeDetailsFailureBody(
                text: state.errorLocalizationKey.tr(),
              );
            } else if (state is RecipeDetailsSuccess || state is DeleteRecipe) {
              return ModalProgressHUD(
                inAsyncCall: state is RecipeDetailsDeleteRecipeLoading,
                child: RecipeDetailsViewBody(),
              );
            } else {
              return Center(
                child: CustomCircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
