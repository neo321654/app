import 'package:auto_route/auto_route.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../domain/entities/collection_entity.dart';
import '../bloc/collections/collections_bloc.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            'Подборки',
            style: AppStyles.title2,
          ),
        ),
        AppStyles.xsmall12VGap,
        SizedBox(
          width: double.infinity,
          height: 90,
          child: BlocBuilder<CollectionsBloc, CollectionsState>(
            builder: (context, state) {
              if (state is CollectionsDone) {
                final List<CollectionEntity> collections =
                    state.collections ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: collections.length,
                  itemBuilder: (BuildContext context, int index) {
                    final CollectionEntity collection = collections[index];

                    return Row(
                      children: [
                        if (index == 0)
                          const SizedBox(
                            width: 16,
                          ),
                        GestureDetector(
                          onTap: () => context.navigateTo(CatalogRoute(
                            selectedCategoryId: collection.id,
                          )),
                          child: SizedBox(
                            width: 145,
                            height: 90,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppStyles.btnRadius),
                              child: FastCachedImage(
                                width: 145,
                                height: 90,
                                url: collection.picture,
                                fit: BoxFit.cover,
                                fadeInDuration: const Duration(seconds: 0),
                                errorBuilder: (context, exception, stacktrace) {
                                  return Container();
                                },
                              ),
                            ),
                            // decoration: BoxDecoration(
                            //   color: AppColors.shimmer,
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(AppStyles.btnRadius),
                            //   ),
                            //   image: DecorationImage(
                            //     fit: BoxFit.fill,
                            //     image: NetworkImage(collection.picture),
                            //   ),
                            // ),
                          ),
                        ),
                        if (collections.length != (index + 1))
                          const SizedBox(width: 12),
                        if (collections.length == (index + 1))
                          const SizedBox(
                            width: 16,
                          ),
                      ],
                    );
                  },
                );
              }

              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 16),
                  Container(
                    width: 145,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.shimmer,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppStyles.btnRadius),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 145,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.shimmer,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppStyles.btnRadius),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 145,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.shimmer,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppStyles.btnRadius),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 145,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.shimmer,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppStyles.btnRadius),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 145,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.shimmer,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppStyles.btnRadius),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
