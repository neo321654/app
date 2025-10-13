import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../domain/entities/basket_offer_entity.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({
    super.key,
    required this.offer,
    this.onInc,
    this.onDec,
    this.onDelete,
  });

  final BasketOfferEntity offer;
  final void Function()? onInc;
  final void Function()? onDec;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return SwipeableTile.card(
      color: Colors.white,
      borderRadius: AppStyles.radiusBlock,
      shadow: BoxShadow(
        color: AppColors.lightDarkGray.withOpacity(.05),
        blurRadius: 8.0,
        spreadRadius: 0.0,
        offset: const Offset(
          0.0,
          4.0,
        ),
      ),
      horizontalPadding: 0,
      verticalPadding: 0,
      direction: SwipeDirection.endToStart,
      onSwiped: (direction) {
        if (onDelete != null) {
          onDelete!();
        }
      },
      backgroundBuilder: (context, direction, progress) {
        return AnimatedBuilder(
          animation: progress,
          builder: (context, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              color: AppColors.destructive,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(
                    'assets/icons/trash.svg',
                    color: AppColors.white,
                  ),
                ),
              ),
            );
          },
        );
      },
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppStyles.radiusBlock,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 77,
              height: 77,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      offer.product.image ?? 'https://placehold.co/134x134'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyles.radiusElement,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          offer.product.name,
                          style: AppStyles.callout.copyWith(
                            color: AppColors.dark,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 8,
                      // ),
                      // Text(
                      //   '',
                      //   style: AppStyles.caption2.copyWith(
                      //     color: AppColors.darkGray,
                      //   ),
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (offer.addOptions?.isEmpty == true &&
                      offer.removeOptions?.isEmpty == true)
                    Text(
                      'Без изменений',
                      style: AppStyles.caption1.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  if (offer.addOptions?.isNotEmpty == true)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...offer.addOptions!.map(
                          (op) => Text(
                            op.name,
                            style: AppStyles.caption1.copyWith(
                              color: AppColors.gray,
                            ),
                          ),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${offer.productPrice} ₽',
                        style: AppStyles.headline.copyWith(
                          color: AppColors.dark,
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 94,
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
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: onDec,
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
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${offer.quantity}',
                                  style: AppStyles.footnote.copyWith(
                                    color: AppColors.dark,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: onInc,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
