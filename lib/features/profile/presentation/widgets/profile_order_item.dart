import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../basket/domain/entities/basket_offer_entity.dart';
import '../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../../../order/domain/entities/order_entity.dart';
import 'order_badge.dart';

class ProfileOrderItem extends StatelessWidget {
  const ProfileOrderItem({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: RoundedContainer(
        height: 214,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        header: GestureDetector(
          onTap: () => context.navigateTo(
            OrderRoute(
              orderId: order.id,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Заказ #${(order.number?.isNotEmpty == true ? order.number! : order.id.toString())}',
                style: AppStyles.bodyBold.copyWith(
                  color: AppColors.black,
                ),
              ),
              OrderBadge(
                text: order.status,
                status: OrderStatus.delivered,
              ),
            ],
          ),
        ),
        child: Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => context.navigateTo(
                  OrderRoute(
                    orderId: order.id,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 129,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${order.products.length} ${Intl.plural(
                              order.products.length,
                              two: 'блюда',
                              few: 'блюд',
                              many: 'блюд',
                              other: 'блюдо',
                            )}, ${order.totalPrice} ₽',
                            //'7 '+(plural)+', 3 259 ₽',
                            style: AppStyles.subheadBold.copyWith(
                              color: AppColors.darkGray,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Создан ${DateFormat('d MMM kk:mm', 'ru_RU').format(order.createdAt.toLocal())}',
                            style: AppStyles.footnote.copyWith(
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 149,
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: order.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              _productItem(order.products[index].image),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Expanded(
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: 16,
                    //       ),
                    //       _productItem(),
                    //       SizedBox(
                    //         width: 12,
                    //       ),
                    //       _productItem(),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 46,
                width: double.infinity,
                child: ElevatedButton(
                  style: AppStyles.superLightElevatedButton,
                  onPressed: () async {
                    final bool? result = await showDialog<bool?>(
                        context: context,
                        builder: (BuildContext context) {
                          return _repeatOrderDialog(context);
                        });

                    if (result != null && result) {
                      order.products
                          .map((product) => context.read<BasketBloc>().add(
                                AddOffer(
                                  BasketOfferEntity(
                                    id: const Uuid().v4(),
                                    product: ProductEntity(
                                      id: product.id,
                                      name: product.title,
                                      price: product.price,
                                      image: product.image,
                                      isCombo: product.isCombo,
                                      isHalfPizza: product.isHalfPizza,
                                    ),
                                    quantity: product.qnt,
                                  ),
                                ),
                              ))
                          .toList();
                      if (!context.mounted) return;
                      context.router
                          .parent<TabsRouter>()
                          ?.navigate(const BasketRoute());
                    }
                  },
                  child: Center(
                    child: Text(
                      'Повторить заказ',
                      style: AppStyles.callout.copyWith(
                        color: AppColors.darkPrimary,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productItem(String? img) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        image: img != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(img),
              )
            : null,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        color: AppColors.superLight,
      ),
    );
  }

  Widget _repeatOrderDialog(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: const Text("Повторить заказ"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "Отмена",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Повторить",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ],
        content: const Text(
          "Мы поместим блюда из этого заказа в корзину",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: .25,
            color: Color(0xFF000000),
          ),
        ),
      );
    }

    return AlertDialog(
      //backgroundColor: Color(0xFFECE6F0),
      title: const Text("Повторить заказ"),
      titleTextStyle: AppStyles.title2.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      actionsOverflowButtonSpacing: 20,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            "Отмена",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            "Повторить",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
      ],
      content: const Text(
        "Мы поместим блюда из этого заказа в корзину",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: .25,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
