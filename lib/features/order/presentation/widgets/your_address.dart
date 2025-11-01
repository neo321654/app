import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../injection_container.dart';
import '../../../address_setup/domain/entities/address_entity.dart';
import '../../../address_setup/presentation/bloc/user_address/user_address_bloc.dart';
import '../../../basket/domain/entities/basket_info_request_entity.dart';
import '../../../basket/domain/entities/basket_modifire_entity.dart';
import '../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../../../basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../models/create_order_state.dart';
import '../../../../core/widgets/your_address_item.dart';

class YourAddress extends StatelessWidget {
  const YourAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<AddressEntity> addresses = [];

    return BlocProvider.value(
      value: getIt<CreateOrderStateCubit>(),
      child: RoundedContainer(
        header: Text(
          'Ваши адреса',
          style: AppStyles.headline,
        ),
        child: BlocBuilder<UserAddressBloc, UserAddressState>(
          builder: (context, stateUserAddress) {
            return BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
              builder: (context, state) {
                stateUserAddress.maybeMap(
                  success: (value) {
                    addresses.clear();
                    addresses.addAll(value.addresses);
                  },
                  orElse: () => null,
                );

                bool selectedAddressExists = false;

                addresses.map((address) {
                  if (state.deliveryAddress?.id == address.id) {
                    selectedAddressExists = true;
                  }
                }).toList();

                if (!selectedAddressExists && addresses.isNotEmpty) {
                  getIt<CreateOrderStateCubit>()
                      .setDeliveryAddress(addresses[0]);
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: addresses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: YourAddressItem(
                              val: addresses[index].address,
                              isActive: state.deliveryAddress?.id ==
                                  addresses[index].id,
                              onTap: () {
                                context
                                    .read<CreateOrderStateCubit>()
                                    .setDeliveryAddress((addresses[index]));

                                // Обновляем корзину с новым типом доставки
                                if (context.read<BasketBloc>().state
                                    is BasketLoaded) {
                                  final basket = (context.read<BasketBloc>().state
                                          as BasketLoaded)
                                      .basket;
                                  final deliveryId = context.read<CreateOrderStateCubit>().state.delivery?.id;

                                  if (deliveryId != null) {
                                      context.read<BasketInfoBloc>().add(
                                            BasketInfoEvent.getBasketInfo(
                                              basket.offers
                                                  .map((offer) => BasketInfoRequestEntity(
                                                        id: offer.product.id ?? 0,
                                                        qnt: offer.quantity ?? 1,
                                                        modifiers: offer.addOptions !=
                                                                null
                                                            ? offer.addOptions!
                                                                .where((modifier) =>
                                                                    modifier.id != null)
                                                                .map((modifier) =>
                                                                    BasketModifireEntity(
                                                                      id: modifier.id!,
                                                                      qnt: modifier
                                                                          .quantity,
                                                                    ))
                                                                .toList()
                                                            : [],
                                                      ))
                                                  .toList(),
                                              deliveryId: deliveryId,
                                            ),
                                          );
                                  }
                                }
                              },
                              onEditTap: () {
                                context.router.push(
                                  EditAddressRoute(address: addresses[index]),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          context.navigateTo(
                            AddressMapRoute(
                              pageRoute: MyAddressesRoute.page,
                              mode: 'order',
                            ),
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: AppStyles.subheadBold.copyWith(
                                        color: AppColors.dark,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Добавить новый',
                                  style: AppStyles.subheadBold.copyWith(
                                    color: AppColors.dark,
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
              },
            );
          },
        ),
      ),
    );
  }
}
