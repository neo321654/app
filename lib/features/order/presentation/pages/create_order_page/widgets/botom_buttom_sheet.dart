
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/styles.dart';
import '../../../../../../injection_container.dart';
import '../../../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../../../../../basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import '../../../../../profile/presentation/bloc/profile/profile_cubit.dart';
import '../../../../domain/entities/delivery_entity.dart';
import '../../../../domain/entities/ordered_position_entity.dart';
import '../../../../domain/entities/payment_method_entity.dart';
import '../../../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../../../bloc/order/order_bloc.dart';
import '../../../bloc/payment_methods/payment_methods_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/create_order_state.dart';


class BottomButtonSheet extends StatelessWidget {
  final TextEditingController commentController;
  final BasketBloc basketBloc;

  const BottomButtonSheet({
    super.key,
    required this.commentController,
    required this.basketBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.only(
          right: 16,
          bottom: Platform.isIOS ? 36 : 16,
          left: 16,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<BasketInfoBloc, BasketInfoState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: (basketInfo, timeDelay) {
                          print(
                              'CREATE ORDER - TOTAL FROM BACKEND: ${basketInfo.totalInfo.total} ₽');
                          print(
                              'CREATE ORDER - DISCOUNT FROM BACKEND: ${basketInfo.totalInfo.discountPrice} ₽');

                          // Получаем тип доставки
                          final deliveryType =
                              getIt<CreateOrderStateCubit>()
                                  .state
                                  .delivery
                                  ?.type;
                          int totalWithDelivery =
                              basketInfo.totalInfo.total;

                          // Добавляем стоимость доставки только если это не самовывоз
                          if (deliveryType != 'pickup') {
                            // Ищем строку с доставкой в pretotalInfo
                            for (var pretotalItem
                            in basketInfo.pretotalInfo) {
                              // Проверяем, что это строка с адресом (содержит адрес и стоимость)
                              if (pretotalItem.title.contains('ул') ||
                                  pretotalItem.title.contains('д') ||
                                  pretotalItem.title.contains('г')) {
                                // Извлекаем стоимость доставки из строки "500 ₽"
                                String deliveryValue = pretotalItem.value;
                                if (deliveryValue.contains('₽')) {
                                  // Убираем " ₽" и парсим число
                                  String deliveryPriceStr = deliveryValue
                                      .replaceAll(' ₽', '')
                                      .trim();
                                  try {
                                    int deliveryPrice =
                                    int.parse(deliveryPriceStr);
                                    totalWithDelivery += deliveryPrice;
                                    print(
                                        'CREATE ORDER - DELIVERY COST FOUND: $deliveryPrice ₽');
                                    print(
                                        'CREATE ORDER - TOTAL WITH DELIVERY: $totalWithDelivery ₽');
                                    break; // Нашли доставку, выходим из цикла
                                  } catch (e) {
                                    print(
                                        'CREATE ORDER - ERROR PARSING DELIVERY PRICE: $deliveryPriceStr');
                                  }
                                }
                              }
                            }
                          } else {
                            print(
                                'CREATE ORDER - PICKUP SELECTED, NOT ADDING DELIVERY COST');
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$totalWithDelivery ₽',
                                style: AppStyles.bodyBold.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                timeDelay ?? '',
                                style: AppStyles.caption1,
                              ),
                            ],
                          );
                        },
                        orElse: () => Text(
                          '${basketBloc.subtotal} ₽',
                          // Fallback to subtotal if BasketInfoBloc is not in success state
                          style: AppStyles.bodyBold.copyWith(
                            color: AppColors.black,
                          ),
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
                child:
                BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
                  builder: (context, createOrderState) {
                    return BlocBuilder<OrderBloc, OrderState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: (state is OrderCreating ||
                              !getIt<CreateOrderStateCubit>()
                                  .isAllowToCreate())
                              ? null
                              : () {
                            final DeliveryEntity delivery =
                            getIt<CreateOrderStateCubit>()
                                .state
                                .delivery!;

                            final PaymentMethodEntity
                            paymentMethod =
                            (getIt<PaymentMethodsBloc>().state
                            as PaymentMethodsDone)
                                .paymentMethods![
                            getIt<CreateOrderStateCubit>()
                                .state
                                .paymentMethodIndex ??
                                0];
                            final List<OrderedPositionEntity>
                            orderedPositions = [];
                            (basketBloc.state as BasketLoaded)
                                .basket
                                .offers
                                .map(
                                  (o) => orderedPositions
                                  .add(OrderedPositionEntity(
                                productId: o.product.id!,
                                quantity: o.quantity ?? 1,
                                modifiers: o.addOptions ?? [],
                              )),
                            )
                                .toList();
                            int? addressId = context
                                .read<
                                CreateOrderStateCubit>()
                                .state
                                .delivery
                                ?.type ==
                                'delivery'
                                ? context
                                .read<CreateOrderStateCubit>()
                                .state
                                .deliveryAddress
                                ?.id
                                : context
                                .read<CreateOrderStateCubit>()
                                .state
                                .deliveryShop
                                ?.id;

                            String? bonusWithdraw = (context
                                .read<
                                CreateOrderStateCubit>()
                                .state
                                .useBonuses ??
                                false)
                                ? context
                                .read<ProfileCubit>()
                                .state
                                .maybeMap(
                              done: (value) {
                                return value.profile
                                    .bonus !=
                                    null
                                    ? value.profile.bonus!
                                    .count
                                    .toString()
                                    : '';
                              },
                              orElse: () => '',
                            )
                                : null;

                            context.read<OrderBloc>().createOrder(
                              context.read<OrderBloc>().offer(
                                paymentMethod:
                                paymentMethod,
                                delivery: delivery,
                                orderedPositions:
                                orderedPositions,
                                addressId: context
                                    .read<
                                    CreateOrderStateCubit>()
                                    .state
                                    .delivery
                                    ?.type ==
                                    'delivery'
                                    ? context
                                    .read<
                                    CreateOrderStateCubit>()
                                    .state
                                    .deliveryAddress
                                    ?.id
                                    : null,
                                filialId: context
                                    .read<
                                    CreateOrderStateCubit>()
                                    .state
                                    .delivery
                                    ?.type !=
                                    'delivery'
                                    ? context
                                    .read<
                                    CreateOrderStateCubit>()
                                    .state
                                    .deliveryShop
                                    ?.id
                                    : null,
                                promocode: (basketBloc.state
                                as BasketLoaded)
                                    .basket
                                    .promocode,
                                moneyChange:
                                (basketBloc.state
                                as BasketLoaded)
                                    .basket
                                    .moneyChange,
                                bonusWithdraw:
                                bonusWithdraw,
                                orderComment:
                                commentController.text,
                              ),
                            );
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => AuthPage()));
                          },
                          child: (state is OrderCreating)
                              ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                              strokeWidth: 2,
                            ),
                          )
                              : BlocBuilder<PaymentMethodsBloc,
                              PaymentMethodsState>(
                            builder: (context, state) {
                              if (getIt<PaymentMethodsBloc>().state
                              is PaymentMethodsDone) {
                                return Text(
                                  ((getIt<PaymentMethodsBloc>()
                                      .state
                                  as PaymentMethodsDone)
                                      .paymentMethods![getIt<
                                      CreateOrderStateCubit>()
                                      .state
                                      .paymentMethodIndex ??
                                      0]
                                      .name
                                      .toLowerCase() ==
                                      'онлайн'
                                      ? 'К оплате'
                                      : 'Создать'),
                                );
                              }
                              return const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                  strokeWidth: 2,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
