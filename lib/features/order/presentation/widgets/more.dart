import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/features/order/presentation/bloc/payment_methods/payment_methods_bloc.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../injection_container.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../models/create_order_state.dart';

class More extends StatelessWidget {
  const More({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CreateOrderStateCubit>()
            ..setMakeCall(false)
            ..setStayNearDoor(false),
        ),
        BlocProvider.value(
          value: getIt<PaymentMethodsBloc>(),
        ),
      ],
      child: RoundedContainer(
        header: Text(
          'Обратный звонок',
          style: AppStyles.headline,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Перезвоните мне для\nподтверждения заказа',
                    style: AppStyles.subhead.copyWith(
                      color: AppColors.gray,
                    ),
                    maxLines: 2,
                  ),
                ),
                BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 31,
                      width: 55,
                      child: CupertinoSwitch(
                        activeTrackColor: AppColors.lightPrimary,
                        onChanged: (bool value) {
                          context
                              .read<CreateOrderStateCubit>()
                              .setMakeCall(value);
                        },
                        value: state.makeCall ?? false,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
              builder: (context, state) {
                return BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
                  builder: (context, paymentMethodsState) {
                    if (paymentMethodsState is PaymentMethodsDone) {
                      final paymentMethods =
                          paymentMethodsState.paymentMethods ?? [];
                      final paymentMethod =
                          paymentMethods[state.paymentMethodIndex ?? 0];

                      if (paymentMethod.name.toLowerCase() == 'онлайн') {
                        return Column(
                          children: [
                            Container(
                              height: 34,
                              width: double.infinity,
                              //padding: const EdgeInsets.only(bottom: 16),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: AppColors.superLight,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Оставить у двери',
                                style: AppStyles.headline.copyWith(height: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Выбрать эту функцию можно\nпри оплате онлайн',
                                    style: AppStyles.subhead.copyWith(
                                      color: AppColors.gray,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                BlocBuilder<CreateOrderStateCubit,
                                    CreateOrderState>(
                                  builder: (context, state) {
                                    return SizedBox(
                                      height: 31,
                                      width: 55,
                                      child: CupertinoSwitch(
                                        activeTrackColor:
                                            AppColors.lightPrimary,
                                        onChanged: (bool value) {
                                          context
                                              .read<CreateOrderStateCubit>()
                                              .setStayNearDoor(value);
                                        },
                                        value: state.stayNearDoor ?? false,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    }

                    return Container();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
