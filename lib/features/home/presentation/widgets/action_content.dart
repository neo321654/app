import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:monobox/features/home/presentation/bloc/action/action_bloc.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class ActionContent extends StatelessWidget {
  const ActionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // const SizedBox(
        //   height: 12,
        // ),
        BlocBuilder<ActionBloc, ActionState>(
          builder: (context, state) {
            final double screenWidth = MediaQuery.of(context).size.width;
            final double height = ((screenWidth - 32) *
                (AppStyles.bannerHeight / AppStyles.bannerWidth));
            return state.maybeMap(
              success: (state) {
                return Column(
                  children: [
                    if (state.action.mobilePicture?.isNotEmpty == true)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CachedNetworkImage(
                          imageUrl: state.action.mobilePicture!,
                          imageBuilder: (context, imageProvider) => Container(
                            width: double.infinity,
                            height: height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(AppStyles.btnRadius),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              _bannerPlaceholder(height),
                          errorWidget: (context, url, error) =>
                              _bannerPlaceholder(height),
                        ),
                      ),
                    if (state.action.content?.isNotEmpty == true)
                      HtmlWidget(state.action.content!),
                  ],
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
        // Padding(
        //   padding: const EdgeInsets.only(
        //     bottom: 28,
        //   ),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: SizedBox(
        //           height: 52,
        //           child: ElevatedButton(
        //             onPressed: () async {
        //               getIt<SearchCubit>().clear();
        //               context.read<AppliedFilterStateCubit>().unselectAllTags();
        //               await AutoRouter.of(context).pop(false);
        //             },
        //             style: AppStyles.greyElevatedButton,
        //             child: Text(
        //               'Очистить',
        //               style: AppStyles.headline.copyWith(
        //                 color: AppColors.darkPrimary,
        //                 height: 1,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         width: 16,
        //       ),
        //       Expanded(
        //         child: SizedBox(
        //           height: 52,
        //           child: ElevatedButton(
        //             onPressed: () async {
        //               getIt<SearchCubit>().setFilters(context.read<AppliedFilterStateCubit>().state.selectedTags);
        //               await AutoRouter.of(context).pop(true);
        //               if (!context.mounted) return;
        //               context.navigateTo(SearchRoute(startSearch: true));
        //             },
        //             child: Text(
        //               'Готово',
        //               style: AppStyles.headline.copyWith(
        //                 color: AppColors.white,
        //                 height: 1,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget _bannerPlaceholder(double height) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.shimmer,
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.btnRadius),
        ),
      ),
    );
  }
}
