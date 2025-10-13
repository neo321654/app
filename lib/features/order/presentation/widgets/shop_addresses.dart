import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../core/widgets/your_address_item.dart';
import '../../../home/presentation/bloc/filials/filials_bloc.dart';
import '../../../more/domain/entities/shop_entity.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../models/create_order_state.dart';

class ShopAddresses extends StatelessWidget {
  const ShopAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ShopEntity> shops = [];

    return RoundedContainer(
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Заведение',
            style: AppStyles.headline,
          ),
          Text(
            'Откуда заберёте заказ?',
            style: AppStyles.subhead.copyWith(
              color: AppColors.gray,
            ),
          ),
        ],
      ),
      child: BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
        builder: (context, state) {
          return BlocBuilder<FilialsBloc, FilialsState>(
            builder: (context, filialsState) {
              filialsState.maybeMap(
                success: (value) {
                  shops.clear();
                  if (getIt<AuthBloc>().store.cityId != null) {
                    shops.addAll(value.shops.where((shop) =>
                        shop.cityId == getIt<AuthBloc>().store.cityId));
                  } else {
                    shops.addAll(value.shops);
                  }
                },
                orElse: () => null,
              );

              if (shops.isNotEmpty &&
                  (context.read<CreateOrderStateCubit>().state.deliveryShop ==
                          null ||
                      !shops.contains(context
                          .read<CreateOrderStateCubit>()
                          .state
                          .deliveryShop))) {
                context
                    .read<CreateOrderStateCubit>()
                    .setDeliveryShop((shops[0]));
              }

              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: shops.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: (shops.length > (index + 1)) ? 20 : 0),
                      child: YourAddressItem(
                        val: shops[index].address,
                        isActive: state.deliveryShop?.id == shops[index].id,
                        onTap: () {
                          context.read<CreateOrderStateCubit>().setDeliveryShop(
                                shops[index],
                              );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
