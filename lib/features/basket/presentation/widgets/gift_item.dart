import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../bloc/basket/basket_bloc.dart';

class GiftItem extends StatelessWidget {
  const GiftItem({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final BasketBloc basketBloc = context.watch<BasketBloc>();

    return Container(
      padding: const EdgeInsets.only(
        top: 12,
        right: 16,
        bottom: 12,
        left: 12,
      ),
      constraints: const BoxConstraints(minWidth: 219, maxWidth: 320),
      height: 101,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppStyles.radiusBlock,
          ),
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightDarkGray.withOpacity(.1),
            blurRadius: 12.0,
            offset: const Offset(
              0.0,
              0.0,
            ),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 77,
            height: 77,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  product.image ?? 'https://placehold.co/134x134',
                ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  minWidth: 102,
                  maxWidth: 180,
                ),
                height: 20,
                child: Text(
                  product.name,
                  style: AppStyles.subheadBold.copyWith(
                    color: AppColors.dark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${product.price} ₽',
                style: AppStyles.caption1.copyWith(
                  color: AppColors.gray,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 102,
                height: 29,
                child: ElevatedButton(
                  onPressed: () {
                    basketBloc.chooseGift(
                        basketBloc.giftIsInBasket(product) ? null : product);
                    // if (basketBloc.giftIsInBasket(product)) {
                    //   basketBloc.add(RemoveGift(product));
                    // } else {
                    //   basketBloc.add(AddGift(product));
                    // }
                  },
                  style: AppStyles.greyElevatedButton,
                  child: SizedBox(
                    height: 18,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        basketBloc.giftIsInBasket(product)
                            ? 'Убрать'
                            : 'Выбрать',
                        style: AppStyles.footnoteBold.copyWith(
                          color: AppColors.darkPrimary,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
