import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/features/basket/presentation/bloc/basket/basket_bloc.dart';
import 'package:monobox/features/basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import 'package:monobox/features/order/presentation/bloc/promocode/promocode_bloc.dart';
import 'package:monobox/features/order/presentation/bloc/create_order_state_cubit/create_order_state_cubit.dart';
import 'package:monobox/injection_container.dart';

class ItogoBottom extends StatelessWidget {
  const ItogoBottom({super.key});

  @override
  Widget build(BuildContext context) {
    BasketBloc basketBloc = context.watch<BasketBloc>();
    //BasketInfoBloc basketInfoBloc = context.watch<BasketInfoBloc>();

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<BasketInfoBloc, BasketInfoState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => Text(
                      '...',
                      style: AppStyles.bodyBold.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    success: (basketInfo, timeDelay) {
                      // Получаем тип доставки
                      final deliveryType =
                          getIt<CreateOrderStateCubit>().state.delivery?.type;

                      // Получаем флаг использования бонусов
                      final useBonuses = getIt<CreateOrderStateCubit>().state.useBonuses ?? false;
                      final availableBonuses = basketInfo.profileBonus?.availableBonus ?? 0;

                      // Если это самовывоз, показываем только total без доставки
                      if (deliveryType == 'pickup') {
                        int finalTotal = basketInfo.totalInfo.total;
                        if (useBonuses && availableBonuses > 0) {
                          finalTotal -= availableBonuses;
                        }
                        return Text(
                          '$finalTotal ₽',
                          style: AppStyles.bodyBold.copyWith(
                            color: AppColors.black,
                          ),
                        );
                      }

                      // Если это доставка, ищем строку с адресом в pretotalInfo
                      int totalWithDelivery = basketInfo.totalInfo.total;
                      bool deliveryFound = false;

                      for (var pretotalItem in basketInfo.pretotalInfo) {
                        // Ищем строку с адресом (содержит адрес и стоимость доставки)
                        if (pretotalItem.title.contains('ул') ||
                            pretotalItem.title.contains('д') ||
                            pretotalItem.title.contains('г') ||
                            pretotalItem.title.contains('пр-кт')) {
                          String deliveryValue = pretotalItem.value;
                          if (deliveryValue.contains('₽')) {
                            String deliveryPriceStr =
                                deliveryValue.replaceAll(' ₽', '').trim();
                            try {
                              int deliveryPrice = int.parse(deliveryPriceStr);
                              totalWithDelivery += deliveryPrice;
                              print(
                                  'BASKET - DELIVERY COST FOUND: $deliveryPrice ₽');
                              print(
                                  'BASKET - TOTAL WITH DELIVERY: $totalWithDelivery ₽');
                              deliveryFound = true;
                              break; // Нашли доставку, выходим из цикла
                            } catch (e) {
                              print(
                                  'BASKET - ERROR PARSING DELIVERY PRICE: $deliveryPriceStr');
                            }
                          }
                        }
                      }

                      if (!deliveryFound) {
                        print(
                            'BASKET - NO DELIVERY COST FOUND, USING TOTAL ONLY');
                      }

                      // Вычитаем бонусы из итоговой суммы, если они используются
                      if (useBonuses && availableBonuses > 0) {
                        totalWithDelivery -= availableBonuses;
                      }

                      return Text(
                        '$totalWithDelivery ₽',
                        style: AppStyles.bodyBold.copyWith(
                          color: AppColors.black,
                        ),
                      );
                    },
                  );
                },
              ),
              // Text(
              //   '${basketBloc.subtotal} ₽',
              //   style: AppStyles.bodyBold.copyWith(
              //     color: AppColors.black,
              //   ),
              // ),
              const SizedBox(
                height: 4,
              ),
              BlocBuilder<BasketInfoBloc, BasketInfoState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () =>  Text(
                      '',
                      style: AppStyles.caption1,
                    ),
                    success: (basketInfo, timeDelay) => Text(
                      timeDelay ?? '',
                      style: AppStyles.caption1,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 52,
            child: BlocBuilder<BasketInfoBloc, BasketInfoState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.maybeWhen(
                    orElse: () => null,
                    success: (basketInfo, timeDelay) => () {
                      getIt<PromocodeBloc>().state.maybeWhen(
                            error: (error) => getIt<PromocodeBloc>()
                                .emit(const PromocodeState.initial()),
                            orElse: () => null,
                          );
                      context.navigateTo(CreateOrderRoute(
                        basket: (basketBloc.state as BasketLoaded).basket,
                      ));
                    },
                  ),
                  child: Text(
                    state.maybeWhen(
                      orElse: () => 'Оформить',
                      success: (basketInfo, timeDelay) =>
                          basketInfo.warnings.isEmpty
                              ? 'Оформить'
                              : basketInfo.warnings[0],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
