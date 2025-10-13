import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monobox/injection_container.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../bloc/cubit/applied_filter_state_cubit.dart';
import '../bloc/cubit/search_cubit.dart';
import '../bloc/tags/tags_bloc.dart';
import 'filter_badge.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 12,
        ),
        BlocBuilder<TagsBloc, TagsState>(
          builder: (context, state) {
            return state.maybeMap(
              success: (state) {
                return BlocBuilder<AppliedFilterStateCubit,
                    AppliedFilterStateState>(
                  builder: (context, appliedFilterState) {
                    return Wrap(
                      runSpacing: 8,
                      spacing: 4,
                      children: [
                        ...state.tags.map(
                          (tag) => GestureDetector(
                            onTap: () => context
                                    .read<AppliedFilterStateCubit>()
                                    .isActive(tag)
                                ? context
                                    .read<AppliedFilterStateCubit>()
                                    .unselectTag(tag)
                                : context
                                    .read<AppliedFilterStateCubit>()
                                    .selectTag(tag),
                            child: FilterBadge(
                              text: tag.title,
                              color: tag.color,
                              icon: tag.icon,
                              isActive: context
                                  .read<AppliedFilterStateCubit>()
                                  .isActive(tag),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              loading: (_) => const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
              orElse: () => Container(),
            );
          },
        ),
        const SizedBox(
          height: 32,
        ),
        //const Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 28,
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () async {
                      getIt<SearchCubit>().clear();
                      context.read<AppliedFilterStateCubit>().unselectAllTags();
                      await AutoRouter.of(context).pop(false);
                    },
                    style: AppStyles.greyElevatedButton,
                    child: Text(
                      'Очистить',
                      style: AppStyles.headline.copyWith(
                        color: AppColors.darkPrimary,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () async {
                      getIt<SearchCubit>().setFilters(context
                          .read<AppliedFilterStateCubit>()
                          .state
                          .selectedTags);
                      await AutoRouter.of(context).pop(true);
                      if (!context.mounted) return;
                      context.navigateTo(SearchRoute(startSearch: true));
                    },
                    child: Text(
                      'Готово',
                      style: AppStyles.headline.copyWith(
                        color: AppColors.white,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
