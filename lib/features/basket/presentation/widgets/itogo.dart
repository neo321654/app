import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import 'package:monobox/features/basket/presentation/widgets/itogo_bottom.dart';
import 'package:monobox/features/order/presentation/bloc/create_order_state_cubit/create_order_state_cubit.dart';
import 'package:monobox/features/basket/domain/entities/basket_pretotal_info_entity.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../bloc/basket/basket_bloc.dart';

class Itogo extends StatelessWidget {
  const Itogo({super.key});

  @override
  Widget build(BuildContext context) {
    BasketBloc basketBloc = context.watch<BasketBloc>();
    //BasketInfoBloc basketInfoBloc = context.watch<BasketInfoBloc>();

    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        right: 16,
        bottom: 16,
        left: 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppStyles.radiusBlock),
          topRight: Radius.circular(AppStyles.radiusBlock),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: AppColors.superLight,
                ),
              ),
            ),
            child: Text(
              'Заказ',
              style: AppStyles.headline,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<BasketInfoBloc, BasketInfoState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Container(),
                // loading: () => const Center(
                //   child: Padding(
                //     padding: EdgeInsets.all(16),
                //     child: Center(
                //       child: SizedBox(
                //         width: 16,
                //         height: 16,
                //         child: CircularProgressIndicator(
                //           strokeWidth: 1,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                success: (basketInfo) {
                  print(
                      'PRETOTAL INFO: \n${basketInfo.pretotalInfo.map((e) => ' [32m${e.title}: ${e.value} [0m').join("\n")}');
                  print('WARNINGS: ${basketInfo.warnings}');
                  print(
                      'BASKET - SELECTED ADDRESS:  [33m${context.read<CreateOrderStateCubit>().state.deliveryAddress?.address} (ID: ${context.read<CreateOrderStateCubit>().state.deliveryAddress?.id}) [0m');
                  print(
                      'BASKET - DELIVERY TYPE:  [33m${context.read<CreateOrderStateCubit>().state.delivery?.type} (ID: ${context.read<CreateOrderStateCubit>().state.delivery?.id}) [0m');
                  print(
                      'BASKET - DELIVERY NAME:  [33m${context.read<CreateOrderStateCubit>().state.delivery?.name} [0m');

                  // Копируем pretotalInfo для возможного добавления строки доставки
                  final List<BasketPretotalnfoEntity> pretotalInfo =
                      List.from(basketInfo.pretotalInfo);
                  final deliveryType = context
                      .read<CreateOrderStateCubit>()
                      .state
                      .delivery
                      ?.type;
                  final totalWithDelivery = context
                              .read<CreateOrderStateCubit>()
                              .state
                              .delivery
                              ?.type ==
                          'delivery'
                      ? context.read<CreateOrderStateCubit>().state.delivery !=
                              null
                          ? basketInfo.totalInfo.total +
                              _getDeliveryCostFromPretotal(pretotalInfo)
                          : basketInfo.totalInfo.total
                      : basketInfo.totalInfo.total;

                  // Проверяем, есть ли строка доставки
                  bool hasDeliveryRow = pretotalInfo
                      .any((e) => e.title.toLowerCase().contains('доставка'));
                  // Если доставки нет, но доставка выбрана и сумма больше, чем total, добавляем вручную
                  if (deliveryType == 'delivery' &&
                      !hasDeliveryRow &&
                      totalWithDelivery > basketInfo.totalInfo.total) {
                    final deliveryCost =
                        totalWithDelivery - basketInfo.totalInfo.total;
                    pretotalInfo.add(BasketPretotalnfoEntity(
                        title: 'Доставка', value: '$deliveryCost ₽'));
                  }

                  return Column(
                    children: [
                      ...pretotalInfo.map(
                        (pretotalInfo) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pretotalInfo.title,
                                style: AppStyles.caption1,
                              ),
                              Text(
                                pretotalInfo.value,
                                style: AppStyles.caption1Bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            basketInfo.bonusInfo.title,
                            style: AppStyles.caption1,
                          ),
                          Row(
                            children: [
                              Text(
                                basketInfo.bonusInfo.value,
                                style: AppStyles.caption1Bold,
                              ),
                              AppStyles.xxsmall6HGap,
                              SizedBox(
                                width: 14,
                                height: 14,
                                child: SvgPicture.asset(
                                  'assets/icons/bonus_icn.svg',
                                  color: AppColors.lightPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
          // const SizedBox(
          //   height: 8,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Бизнес пицца',
          //       style: AppStyles.caption1,
          //     ),
          //     Text(
          //       '-70 ₽',
          //       style: AppStyles.caption1Bold,
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 8,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Сумма без учёта скидок',
          //       style: AppStyles.caption1,
          //     ),
          //     Text(
          //       '${basketBloc.subtotal} ₽',
          //       style: AppStyles.caption1Bold,
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 8,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Промокод',
          //       style: AppStyles.caption1,
          //     ),
          //     Text(
          //       '— 140 ₽',
          //       style: AppStyles.caption1Bold,
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 8,
          // ),
          const SizedBox(
            height: 16,
          ),
          const ItogoBottom(),
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 1,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             '${basketBloc.subtotal} ₽',
          //             style: AppStyles.bodyBold.copyWith(
          //               color: AppColors.black,
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 4,
          //           ),
          //           Text(
          //             '45–50 мин',
          //             style: AppStyles.caption1,
          //           ),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       flex: 2,
          //       child: SizedBox(
          //         height: 52,
          //         child: ElevatedButton(
          //           onPressed: () {
          //             context.navigateTo(CreateOrderRoute(
          //               basket: (basketBloc.state as BasketLoaded).basket,
          //             ));
          //           },
          //           child: const Text('Оформить'),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

// Добавить вспомогательную функцию для получения стоимости доставки из pretotalInfo
int _getDeliveryCostFromPretotal(List<BasketPretotalnfoEntity> pretotalInfo) {
  for (var pretotalItem in pretotalInfo) {
    if (pretotalItem.title.toLowerCase().contains('доставка')) {
      final value = pretotalItem.value.replaceAll(' ₽', '').trim();
      final cost = int.tryParse(value);
      if (cost != null) return cost;
    }
  }
  return 0;
}
