import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/features/home/domain/entities/modifier_item_entity.dart';
import 'package:monobox/features/home/presentation/bloc/product_card_state/product_card_state_cubit.dart';

class HalfPizzaCard extends StatelessWidget {
  const HalfPizzaCard({
    super.key,
    required this.product,
  });

  final ModifierItemEntity product;

  @override
  Widget build(BuildContext context) {
    final productCardCubit = context.read<ProductCardStateCubit>();
    final bool isSelected =
        (productCardCubit.state.selectedQuantities[product.id] ?? 0) > 0;

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          width: 140,
          height: 200,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (context
                        .read<ProductCardStateCubit>()
                        .pizzaHalfMod()
                        .length <
                    2) {
                  productCardCubit.incrementModifier(product);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                width: 120,
                height: 188,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.white
                      : AppColors.lightScaffoldBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.darkPrimary
                        : AppColors.lightScaffoldBackground,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 96,
                      height: 96,
                      child: CachedNetworkImage(
                        imageUrl: product.image ?? 'https://placehold.co/96x96',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => _paceholder(),
                        errorWidget: (context, url, error) => _paceholder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 36,
                      child: Text(
                        product.title,
                        style: AppStyles.footnote,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (product.price != null)
                          Text(
                            '${product.price!} ₽',
                            style: AppStyles.callout,
                          ),
                        if (product.weight != null)
                          Text(
                            product.weight!,
                            style: AppStyles.caption2,
                            textAlign: TextAlign.right,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isSelected)
          Positioned(
            width: 49,
            height: 24,
            top: 0,
            right: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              onTap: () {
                productCardCubit.decrementModifier(product);
              },
              child: SizedBox(
                width: 55,
                height: 30,
                child: Stack(
                  children: [
                    Container(
                      width: 49,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                        border: Border.all(
                          color: AppColors.lightScaffoldBackground,
                          width: 1,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 28,
                          child: Center(
                            child: Text(
                              (productCardCubit.state
                                          .selectedQuantities[product.id] ??
                                      0)
                                  .toString(),
                              style: AppStyles.caption1Bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: AppColors.dark,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/cross.svg',
                          width: 20,
                          height: 20,
                          color: AppColors.lightGray,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _paceholder() {
    return Container(
      width: 96,
      height: 96,
      decoration: const BoxDecoration(
        color: AppColors.shimmer,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
