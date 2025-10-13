import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/core/widgets/rounded_container.dart';
import 'package:monobox/features/order/presentation/bloc/promocode/promocode_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../injection_container.dart';
import '../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';

class Promocode extends StatelessWidget {
  const Promocode({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CreateOrderStateCubit>()..setUseBonuses(false),
        ),
        BlocProvider.value(
          value: getIt<PromocodeBloc>(),
        ),
      ],
      child: RoundedContainer(
        header: Text(
          'Промокод',
          style: AppStyles.headline,
        ),
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return BlocListener<PromocodeBloc, PromocodeState>(
              listener: (context, promocodeState) {
                promocodeState.maybeWhen(
                  success: (_) {
                    context.read<BasketBloc>().add(SetPromo(
                          promo: ((state.basket.promocode == null ||
                                  state.basket.promocode?.isEmpty == true))
                              ? controller.text
                              : '',
                        ));

                    // if (state is BasketLoaded && state.basket.promocode?.isNotEmpty == true) {
                    //   controller.setText('');
                    // }
                    controller.setText('');
                  },
                  orElse: () => null,
                );
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          controller: controller,
                          hintText: (state is BasketLoaded &&
                                  (state.basket.promocode == null ||
                                      state.basket.promocode?.isEmpty == true))
                              ? 'Введите промокод'
                              : (state as BasketLoaded).basket.promocode,
                          readOnly:
                              (state.basket.promocode?.isNotEmpty == true),
                          height: 46,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 46,
                        width: 96,
                        child: BlocBuilder<PromocodeBloc, PromocodeState>(
                          builder: (context, promocodeState) {
                            return ElevatedButton(
                              onPressed: promocodeState.maybeWhen(
                                orElse: () => () {
                                  if (state.basket.promocode?.isNotEmpty ==
                                      true) {
                                    context.read<BasketBloc>().add(SetPromo(
                                        promo:
                                            ((state.basket.promocode == null ||
                                                    state.basket.promocode
                                                            ?.isEmpty ==
                                                        true))
                                                ? controller.text
                                                : ''));

                                    if (state.basket.promocode?.isNotEmpty ==
                                        true) {
                                      controller.setText('');
                                    }
                                    getIt<PromocodeBloc>()
                                        .emit(const PromocodeState.initial());
                                  } else if (controller.text.isNotEmpty) {
                                    getIt<PromocodeBloc>().add(
                                        PromocodeEvent.getPromocode(
                                            controller.text));
                                    // context
                                    //     .read<BasketBloc>()
                                    //     .add(SetPromo(promo: (state is BasketLoaded && (state.basket.promocode == null || state.basket.promocode?.isEmpty == true)) ? controller.text : ''));

                                    // if (state is BasketLoaded && state.basket.promocode?.isNotEmpty == true) {
                                    //   controller.setText('');
                                    // }
                                  }
                                },
                              ),
                              style: AppStyles.greyElevatedButton,
                              child: Text(
                                ((state.basket.promocode == null ||
                                        state.basket.promocode?.isEmpty ==
                                            true))
                                    ? 'Ввести'
                                    : 'Отменить',
                                style: AppStyles.footnoteBold.copyWith(
                                  color: ((state.basket.promocode == null ||
                                          state.basket.promocode?.isEmpty ==
                                              true))
                                      ? AppColors.darkPrimary
                                      : AppColors.darkGray,
                                  height: 18 / 13,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<PromocodeBloc, PromocodeState>(
                    builder: (context, promocodeState) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: promocodeState.maybeWhen(
                            error: (_) => 4,
                            orElse: () => 16,
                          ),
                          left: 12,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            promocodeState.maybeWhen(
                              success: (promocodeInfo) =>
                                  promocodeInfo.message ?? promocodeInfo.code,
                              error: (error) => error.message,
                              orElse: () => '',
                            ),
                            style: AppStyles.footnote.copyWith(
                              color: promocodeState.maybeWhen(
                                error: (_) => AppColors.destructive,
                                orElse: () => AppColors.gray,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
