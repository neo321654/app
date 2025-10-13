import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uuid/uuid.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../../domain/entities/basket_offer_entity.dart';
import '../bloc/basket/basket_bloc.dart';

class DopProductItem extends StatelessWidget {
  const DopProductItem({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final BasketBloc basketBloc = context.watch<BasketBloc>();
    final BasketOfferEntity? offer = basketBloc.getProductOffer(product);

    return SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 77,
            height: 44,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.all(
                Radius.circular(AppStyles.xsmallRadius),
              ),
            ),
            child: CachedNetworkImage(
              key: Key(product.image ?? 'https://placehold.co/134x134'),
              imageUrl: product.image ?? 'https://placehold.co/134x134',
              placeholder: (context, url) => _paceholder(),
              errorWidget: (context, url, error) => _paceholder(),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppStyles.callout.copyWith(
                    color: AppColors.dark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  product.description ?? '',
                  style: AppStyles.caption1.copyWith(
                    color: AppColors.gray,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 94,
            child: SizedBox(
              width: double.infinity,
              height: 42,
              child: !basketBloc.isInBasket(product)
                  ? ElevatedButton(
                      onPressed: () {
                        basketBloc.add(
                          AddOffer(
                            BasketOfferEntity(
                              id: const Uuid().v4(),
                              product: product,
                              quantity: 1,
                            ),
                          ),
                        );
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
                      child: SizedBox(
                        height: 25,
                        child: SvgPicture.asset(
                          'assets/icons/plus.svg',
                          color: AppColors.darkPrimary,
                        ),
                      ),
                      // Text(
                      //   '+',
                      //   style: AppStyles.footnote.copyWith(
                      //     color: AppColors.darkPrimary,
                      //     height: 1,
                      //   ),
                      // ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 32,
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
                              behavior: HitTestBehavior.opaque,
                              onTap: () => offer!.quantity! > 1
                                  ? basketBloc.add(AddQtyOffer(offer, -1))
                                  : basketBloc.add(
                                      RemoveOffer(offer),
                                    ),
                              child: Container(
                                color: Colors.transparent,
                                child: const SizedBox(
                                  height: double.infinity,
                                  width: 33,
                                  child: Icon(
                                    Icons.remove,
                                    size: 18,
                                  ),
                                  // child: Text(
                                  //   '-',
                                  //   style: AppStyles.subhead.copyWith(
                                  //     color: AppColors.gray,
                                  //     fontSize: 16,
                                  //     height: 1,
                                  //   ),
                                  //   textAlign: TextAlign.right,
                                  // ),
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
                              behavior: HitTestBehavior.opaque,
                              onTap: () =>
                                  basketBloc.add(AddQtyOffer(offer, 1)),
                              child: const SizedBox(
                                width: 33,
                                height: double.infinity,
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                                // child: Text(
                                //   '+',
                                //   style: AppStyles.subhead.copyWith(
                                //     color: AppColors.gray,
                                //     fontSize: 16,
                                //     height: 1,
                                //   ),
                                //   textAlign: TextAlign.left,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paceholder() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.shimmer,
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.productPicRadius),
        ),
      ),
    );
  }
}
