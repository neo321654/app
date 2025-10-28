import 'package:auto_route/auto_route.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:monobox/config/routes/app_router.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../domain/entities/banner_entity.dart';
import '../bloc/banners/banners_bloc.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 8.0;
    const double bannerSpacing = 8.0;
    const double aspectRatio = 11 / 4;

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final bannerWidth = screenWidth - 4 * horizontalPadding;
        final bannerHeight = bannerWidth / aspectRatio;

        return SizedBox(
          height: bannerHeight,
          child: BlocBuilder<BannersBloc, BannersState>(
            builder: (context, state) {
              if (state is BannersLoading) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: horizontalPadding),
                    _bannerPlaceholder(bannerWidth, bannerHeight),
                    const SizedBox(width: bannerSpacing),
                    _bannerPlaceholder(bannerWidth, bannerHeight),
                    const SizedBox(width: horizontalPadding),
                  ],
                );
              }

              if (state is BannersDone) {
                final List<BannerEntity> banners = state.banners!;
                final int bannersCount = banners.length;

                return FlutterCarousel(
                  options: CarouselOptions(
                    disableCenter: true,
                    showIndicator: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction:
                        (screenWidth - 2 * horizontalPadding) / screenWidth,
                    autoPlay: bannersCount > 1,
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                  items: banners.map((banner) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            if (banner.url?.isNotEmpty == true) {
                              AutoRouter.of(context).push(
                                ActionRoute(
                                  title: banner.title,
                                  actionId:
                                      int.parse(banner.url!.split('/').last),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: banners.indexOf(banner) == 0
                                  ? horizontalPadding
                                  : 0,
                              right: banners.indexOf(banner) == bannersCount - 1
                                  ? horizontalPadding
                                  : bannerSpacing,
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppStyles.btnRadius),
                              child: FastCachedImage(
                                url: banner.image,
                                // fit: BoxFit.contain,
                                fit: BoxFit.fill,
                                width: bannerWidth,
                                height: bannerHeight,
                                fadeInDuration: const Duration(seconds: 0),
                                errorBuilder: (context, exception, stacktrace) {
                                  return _bannerPlaceholder(
                                      bannerWidth, bannerHeight);
                                },
                                loadingBuilder: (context, progress) {
                                  return _bannerPlaceholder(
                                      bannerWidth, bannerHeight);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              }

              return Container();
            },
          ),
        );
      },
    );
  }

  Widget _bannerPlaceholder(double width, double height) {
    return Container(
      width: width,
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
