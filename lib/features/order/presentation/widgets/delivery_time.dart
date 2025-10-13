import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../core/widgets/text_switcher.dart';
import '../../../../injection_container.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../models/create_order_state.dart';
import 'delivery_immediately.dart';
import 'select_delivery_datetime.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CreateOrderStateCubit>()..setDeliveryTimeTypeIndex(0),
      child: RoundedContainer(
        header: BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
          builder: (context, state) {
            return Text(
              state.delivery?.type == 'delivery'
                  ? 'Время доставки'
                  : 'Получение',
              style: AppStyles.headline,
            );
          },
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
              builder: (context, state) {
                return TextSwitcher(
                  items: const [
                    'Cразу',
                    'Ко времени',
                  ],
                  selectedIndex: state.deliveryTimeTypeIndex ?? 0,
                  onTap: (int itemIndex) {
                    context
                        .read<CreateOrderStateCubit>()
                        .setDeliveryTimeTypeIndex(itemIndex);
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
              builder: (context, state) {
                if (state.deliveryTimeTypeIndex == 0) {
                  return const DeliveryImmediately();
                }
                return const SelectDeliveryDateTime();
              },
            ),
          ],
        ),
      ),
    );
  }
}
