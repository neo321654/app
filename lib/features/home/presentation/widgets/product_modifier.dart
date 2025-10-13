import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/custom_checkbox.dart';
import '../../../../core/widgets/text_switcher.dart';
import '../bloc/product_card_state/product_card_state_cubit.dart';
import '../../domain/entities/product_entity.dart';

class ProductModifier extends StatelessWidget {
  const ProductModifier({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCardStateCubit, ProductCardStateState>(
      buildWhen: (previous, current) =>
          previous.selectedQuantities != current.selectedQuantities,
      builder: (context, state) {
        final cubit = context.read<ProductCardStateCubit>();
        final modifiers = product.modifiers
            .where((m) => m.type == 'checkbox' || m.type == 'switcher')
            .toList();
        if (modifiers.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: modifiers.map((modifier) {
            final selected = cubit.selectedModifiersByParent(modifier);
            final totalSelectedQuantity = modifier.items.fold<int>(
              0,
              (sum, item) => sum + (state.selectedQuantities[item.id] ?? 0),
            );
            if (modifier.type == 'switcher') {
              if (selected.isEmpty && modifier.items.isNotEmpty) {
                cubit.addModifier(modifier.items[0]);
              }

              int selectedIndex = 0;
              for (int i = 0; i < modifier.items.length; i++) {
                if (selected.contains(modifier.items[i])) {
                  selectedIndex = i;
                  break;
                }
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextSwitcher(
                  items: modifier.items.map((item) => item.title).toList(),
                  onTap: (itemIndex) {
                    cubit.addUniqModifier(
                        modifier.items[itemIndex], modifier.items);
                  },
                  selectedIndex: selectedIndex,
                ),
              );
            }

            final hasImages = modifier.items
                .any((i) => i.image != null && i.image!.isNotEmpty);

            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(modifier.title, style: AppStyles.title3),
                        if (modifier.maxQuantity != null)
                          Text(
                            '$totalSelectedQuantity из ${modifier.maxQuantity}',
                            style: AppStyles.caption1
                                .copyWith(color: AppColors.gray),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: hasImages
                          ? SizedBox(
                              height: 230,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: modifier.items.length,
                                itemBuilder: (context, index) {
                                  final item = modifier.items[index];
                                  final quantity =
                                      state.selectedQuantities[item.id] ?? 0;
                                  final maxQty = item.maxQuantity ?? 1;
                                  final isSelected = quantity > 0;
                                  final disabled = modifier.maxQuantity !=
                                          null &&
                                      totalSelectedQuantity >=
                                          modifier.maxQuantity! &&
                                      quantity == 0 &&
                                      selected.every((sel) =>
                                          (state.selectedQuantities[sel.id] ??
                                              0) <=
                                          (sel.minQuantity ?? 0));

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Container(
                                      width: 150,
                                      height: 230,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                AppStyles.mediumRadius)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(0.05),
                                            blurRadius: 8.0,
                                            offset: const Offset(0.0, 4.0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(AppStyles
                                                    .productPicRadius)),
                                            child: CachedNetworkImage(
                                              imageUrl: item.image ?? '',
                                              width: 110,
                                              height: 90,
                                              fit: BoxFit.cover,
                                              placeholder: (_, __) => Container(
                                                  width: 110,
                                                  height: 90,
                                                  color: AppColors.shimmer),
                                              errorWidget: (_, __, ___) =>
                                                  Container(
                                                      width: 110,
                                                      height: 90,
                                                      color: AppColors.shimmer),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          SizedBox(
                                            height: 40,
                                            child: Text(
                                              item.title,
                                              style: AppStyles.footnote,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          SizedBox(
                                            height: 24,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (item.price != null)
                                                  Text(
                                                    '+${item.price} ₽',
                                                    style: AppStyles.headline,
                                                  ),
                                                if (item.weight != null) ...[
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '${item.weight} г.',
                                                    style: AppStyles.caption2,
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 26,
                                            child: quantity == 0
                                                ? ElevatedButton(
                                                    onPressed: !disabled
                                                        ? () => cubit
                                                            .incrementModifier(
                                                                item)
                                                        : null,
                                                    style: AppStyles
                                                        .greyElevatedButton
                                                        .copyWith(
                                                      padding:
                                                          const WidgetStatePropertyAll(
                                                        EdgeInsets.only(
                                                            left: 20,
                                                            right: 16),
                                                      ),
                                                      shape:
                                                          WidgetStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Выбрать',
                                                      style: AppStyles.footnote
                                                          .copyWith(
                                                        color: AppColors
                                                            .darkPrimary,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                            AppStyles
                                                                .radiusElement),
                                                      ),
                                                      color:
                                                          AppColors.superLight,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => cubit
                                                                .decrementModifier(
                                                                    item),
                                                            child: Container(
                                                              color: Colors
                                                                  .transparent,
                                                              child: Center(
                                                                child: Text(
                                                                  '−',
                                                                  style: AppStyles
                                                                      .callout
                                                                      .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .gray,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: Text(
                                                              '$quantity',
                                                              style: AppStyles
                                                                  .footnote
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .dark,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: quantity <
                                                                        maxQty &&
                                                                    (modifier.maxQuantity ==
                                                                            null ||
                                                                        totalSelectedQuantity <
                                                                            modifier.maxQuantity!)
                                                                ? () {
                                                                    cubit.incrementModifier(
                                                                        item);
                                                                  }
                                                                : null,
                                                            child: Container(
                                                              color: Colors
                                                                  .transparent,
                                                              child: Center(
                                                                child: Text(
                                                                  '+',
                                                                  style: AppStyles
                                                                      .callout
                                                                      .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .gray,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Column(
                              children: modifier.items.map((item) {
                                final quantity =
                                    state.selectedQuantities[item.id] ?? 0;
                                final isSelected = quantity > 0;
                                final disabled = modifier.maxQuantity != null &&
                                    totalSelectedQuantity >=
                                        modifier.maxQuantity! &&
                                    !isSelected &&
                                    selected.every((sel) =>
                                        (state.selectedQuantities[sel.id] ??
                                            0) <=
                                        (sel.minQuantity ?? 0));

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: CustomCheckBox(
                                    label: item.title,
                                    sufix: Text(
                                      item.price != null
                                          ? '+${item.price} ₽'
                                          : '',
                                      style: AppStyles.footnote,
                                    ),
                                    disabled: disabled,
                                    onSelect: (active) {
                                      if (active) {
                                        cubit.addModifier(item);
                                      } else {
                                        cubit.deleteModifier(item);
                                      }
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
