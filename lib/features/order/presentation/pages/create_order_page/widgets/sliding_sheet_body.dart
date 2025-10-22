import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/styles.dart';
import '../../../../../../core/widgets/widgets.dart';
import '../../../../../../injection_container.dart';
import '../../../../../address_setup/presentation/bloc/create_address/create_address_bloc.dart';
import '../../../../../address_setup/presentation/bloc/user_address/user_address_bloc.dart';
import '../../../../../basket/domain/entities/basket_info_request_entity.dart';
import '../../../../../basket/domain/entities/basket_modifire_entity.dart';
import '../../../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../../../../../basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import '../../../../../profile/presentation/bloc/profile/profile_cubit.dart';
import '../../../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../../../bloc/deliveries/deliveries_bloc.dart';
import '../../../bloc/payment_methods/payment_methods_bloc.dart';
import '../../../models/create_order_state.dart';
import '../../../widgets/widgets.dart';



class CheckoutBody extends StatelessWidget {
  const CheckoutBody({
    super.key,
    required this.cashPropouseTextController,
    required this.promoTextController,
    required this.commentController,
  });

  final TextEditingController cashPropouseTextController;
  final TextEditingController promoTextController;
  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Информация о доставке',
              style: AppStyles.title3,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
              builder: (context, state) {
                return BlocBuilder<DeliveryBloc, DeliveriesState>(
                  builder: (context, deliveriesState) {
                    if (deliveriesState is DeliveriesDone) {
                      if (state.delivery == null) {
                        context
                            .read<CreateOrderStateCubit>()
                            .setDelivery(
                            deliveriesState.deliveries![0]);
                      }
                      return TextSwitcher(
                        items: (deliveriesState.deliveries ?? [])
                            .map((e) => e.name)
                            .toList(),
                        selectedIndex: state.delivery == null
                            ? 0
                            : deliveriesState.deliveries!
                            .indexOf(state.delivery!),
                        onTap: (int itemIndex) {
                          final selectedDelivery =
                          deliveriesState.deliveries![itemIndex];
                          context
                              .read<CreateOrderStateCubit>()
                              .setDelivery(selectedDelivery);

                          context.read<PaymentMethodsBloc>().add(
                              GetPaymentMethods(
                                  deliveryId: selectedDelivery.id));

                          // Обновляем корзину с новым типом доставки
                          if (context.read<BasketBloc>().state
                          is BasketLoaded) {
                            final basket = (context
                                .read<BasketBloc>()
                                .state as BasketLoaded)
                                .basket;
                            context.read<BasketInfoBloc>().add(
                              BasketInfoEvent.getBasketInfo(
                                basket.offers
                                    .map((offer) =>
                                    BasketInfoRequestEntity(
                                      id: offer.product.id ?? 0,
                                      qnt: offer.quantity ?? 1,
                                      modifiers: offer
                                          .addOptions !=
                                          null
                                          ? offer.addOptions!
                                          .where(
                                              (modifier) =>
                                          modifier
                                              .id !=
                                              null)
                                          .map((modifier) =>
                                          BasketModifireEntity(
                                            id: modifier
                                                .id!,
                                            qnt: modifier
                                                .quantity,
                                          ))
                                          .toList()
                                          : [],
                                    ))
                                    .toList(),
                                deliveryId: selectedDelivery.id,
                              ),
                            );
                          }
                        },
                      );
                    }

                    if (deliveriesState is DeliveriesLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        enabled: true,
                        child: Container(
                          height: 38,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.superLight,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                AppStyles.radiusElement,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
            builder: (context, state) {
              if (state.delivery != null) {
                if (state.delivery!.type == 'delivery') {
                  return BlocListener<CreateAddressBloc,
                      CreateAddressState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: (address) =>
                            getIt<UserAddressBloc>().add(
                              const UserAddressEvent.getAddresses(),
                            ),
                      );
                    },
                    child: const YourAddress(),
                  );
                }
                if (state.delivery!.type == 'pickup') {
                  return const ShopAddresses();
                }
              }
              return Container();
            },
          ),
          const SizedBox(
            height: 8,
          ),
          const DeliveryTime(),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Оплата',
              style: AppStyles.title3,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          PaymentMethods(
            cashPropouseTextcontroller: cashPropouseTextController,
          ),
          const SizedBox(
            height: 8,
          ),
          context.watch<ProfileCubit>().state.maybeMap(
            done: (value) => value.profile.bonus != null &&
                value.profile.bonus!.count > 0
                ? const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Bonuses(),
            )
                : Container(),
            orElse: () => Container(),
          ),
          Promocode(
            controller: promoTextController,
          ),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Ещё',
              style: AppStyles.title3,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const More(),
          const SizedBox(
            height: 8,
          ),
          Comment(controller: commentController),
          const SizedBox(
            height: 8,
          ),
          if (Platform.isIOS)
            const SizedBox(
              height: 220,
            ),
          if (!Platform.isIOS)
            const SizedBox(
              height: 186,
            ),
        ],
      ),
    );
  }
}
