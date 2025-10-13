import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/basket/domain/entities/basket_offer_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../../domain/entities/product_entity.dart';
import 'product_badge.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.height,
  });

  final ProductEntity product;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final BasketBloc basketBloc = context.watch<BasketBloc>();
    final BasketOfferEntity? offer = basketBloc.getProductOffer(product);

    final double imageWidth =
        (MediaQuery.of(context).size.width - (2 * 16) - (5 * 12)) / 2;
    //const double imageWidth = 134;

    return Container(
      height: height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppStyles.mediumRadius,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightDarkGray.withOpacity(.05),
            blurRadius: 8.0,
            offset: const Offset(
              0.0,
              4.0,
            ),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // showModalBottomSheet(
              //   isScrollControlled: true,
              //   backgroundColor: AppColors.white,
              //   useRootNavigator: true,
              //   context: context,
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(
              //         AppStyles.radiusBlock,
              //       ),
              //     ),
              //   ),
              //   builder: (BuildContext context) {
              //     return BottomSheetContainer(
              //       child: BlocProvider(
              //         create: (context) => ProductCardStateCubit(product),
              //         child: ProductPage(
              //           product: product,
              //         ),
              //       ),
              //     );
              //   },
              // );
              if (product.isHalfPizza) {
                context.router.push(
                  HalfPizzaRoute(
                    product: product,
                  ),
                );
              } else {
                context.router.push(
                  ProductRoute(
                    product: product,
                  ),
                );
              }
            },
            child: Stack(
              children: [
                Hero(
                  tag: 'product_img_${product.id}',
                  child: Center(
                    child: CachedNetworkImage(
                      key: Key(product.image ?? 'https://placehold.co/134x134'),
                      imageUrl: product.image ?? 'https://placehold.co/134x134',
                      //     'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                      //imageUrl: 'https://placehold.co/134x134',
                      imageBuilder: (context, imageProvider) => Container(
                        width: imageWidth,
                        height: imageWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.productPicRadius),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => _paceholder(imageWidth),
                      errorWidget: (context, url, error) =>
                          _paceholder(imageWidth),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ...product.tags.map(
                        (tag) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: 6,
                          ),
                          child: ProductBadge(
                            tag: tag,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppStyles.xsmall12VGap,
          SizedBox(
            height: 40,
            child: Text(
              product.name,
              style: AppStyles.footnote.copyWith(
                color: AppColors.dark,
              ),
            ),
          ),
          AppStyles.xsmall12VGap,
          if (!product.isHalfPizza)
            SizedBox(
              height: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price} ₽',
                    style: AppStyles.headline,
                  ),
                  Text(
                    product.weightText ?? "",
                    style: AppStyles.caption2,
                  ),
                ],
              ),
            ),
          //const SizedBox(height: 16),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: !basketBloc.isInBasket(product)
                ? ElevatedButton(
                    onPressed: () {
                      if (product.isHalfPizza) {
                        context.router.push(
                          HalfPizzaRoute(
                            product: product,
                          ),
                        );
                      } else {
                        basketBloc.add(
                          AddOffer(
                            BasketOfferEntity(
                              id: const Uuid().v4(),
                              product: product,
                              quantity: 1,
                            ),
                          ),
                        );
                      }
                    },
                    style: AppStyles.greyElevatedButton.copyWith(
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.only(
                          left: 20,
                          right: 16,
                        ),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: product.isHalfPizza
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Собрать',
                                style: AppStyles.callout.copyWith(
                                  color: AppColors.darkPrimary,
                                  height: 1,
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.21,
                                  vertical: 5.21,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/arrow_right.svg',
                                  color: AppColors.darkPrimary,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Добавить',
                                style: AppStyles.callout.copyWith(
                                  color: AppColors.darkPrimary,
                                  height: 1,
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.21,
                                  vertical: 5.21,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/union.svg',
                                  color: AppColors.darkPrimary,
                                ),
                              ),
                            ],
                          ),
                  )
                : Container(
                    width: double.infinity,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          AppStyles.radiusElement,
                        ),
                      ),
                      color: AppColors.superLight,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.deferToChild,
                            onTap: () => offer!.quantity! > 1
                                ? basketBloc.add(AddQtyOffer(offer, -1))
                                : basketBloc.add(
                                    RemoveOffer(offer),
                                  ),
                            child: Container(
                              color: Colors.transparent,
                              //width: 26,
                              height: double.infinity,
                              child: const Icon(
                                Icons.remove,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '${offer!.quantity!}',
                              style: AppStyles.footnote.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.deferToChild,
                            onTap: () => basketBloc.add(AddQtyOffer(offer, 1)),
                            child: Container(
                              color: Colors.transparent,
                              //width: 26,
                              height: double.infinity,
                              child: const Icon(
                                Icons.add,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget _paceholder(double imageWidth) {
    return Container(
      width: imageWidth,
      height: imageWidth,
      decoration: BoxDecoration(
        color: AppColors.shimmer,
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.productPicRadius),
        ),
      ),
    );
  }
}
