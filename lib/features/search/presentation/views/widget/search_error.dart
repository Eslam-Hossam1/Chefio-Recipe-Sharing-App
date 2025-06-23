import 'package:chefio_app/core/widgets/custom_info_message_with_button.dart';
import 'package:chefio_app/features/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchError extends StatelessWidget {
  const SearchError({super.key, required this.errText});
  final String errText;
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        hasScrollBody: false,
        child: CustomInfoMessageWithButton(
          message: errText,
          onPressed: context.read<SearchRecipeCubit>().trySearchAgain,
        ));
  }
}
