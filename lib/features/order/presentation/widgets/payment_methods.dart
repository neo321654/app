import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../injection_container.dart';
import '../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../bloc/payment_methods/payment_methods_bloc.dart';
import '../models/create_order_state.dart';
import 'cash_propouse.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
    required this.cashPropouseTextcontroller,
  });

  final TextEditingController cashPropouseTextcontroller;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CreateOrderStateCubit>()..setPaymentMethodIndex(0),
        ),
        BlocProvider.value(
          value: getIt<PaymentMethodsBloc>()..add(const GetPaymentMethods()),
        ),
      ],
      child: RoundedContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 28,
        ),
        headerPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        header: Text(
          'Способ оплаты',
          style: AppStyles.headline,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 72,
              child: BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
                builder: (context, state) {
                  return BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
                    builder: (context, paymentMethodsState) {
                      if (paymentMethodsState is PaymentMethodsDone) {
                        final paymentMethods =
                            paymentMethodsState.paymentMethods ?? [];
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: paymentMethods.length,
                          itemBuilder: (context, index) => Row(
                            children: [
                              if (index == 0)
                                const SizedBox(
                                  width: 16,
                                ),
                              PaymentMethodItem(
                                title: paymentMethods[index].name,
                                icon: 'assets/icons/cash.svg',
                                isSelected: state.paymentMethodIndex == index
                                    ? true
                                    : false,
                                onTap: () => context
                                    .read<CreateOrderStateCubit>()
                                    .setPaymentMethodIndex(index),
                              ),
                              if ((index + 1) != paymentMethods.length)
                                const SizedBox(
                                  width: 8,
                                ),
                              if ((index + 1) == paymentMethods.length)
                                const SizedBox(
                                  width: 16,
                                ),
                            ],
                          ),
                        );
                      }
                      return Container();
                      // return ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   children: [
                      //     SizedBox(
                      //       width: 16,
                      //     ),
                      //     PaymentMethodItem(
                      //       title: 'Наличные',
                      //       icon: 'assets/icons/cash.svg',
                      //       isSelected:
                      //           state.paymentMethodIndex == 0 ? true : false,
                      //       onTap: () => context
                      //           .read<CreateOrderStateCubit>()
                      //           .setPaymentMethodIndex(0),
                      //     ),
                      //     SizedBox(
                      //       width: 8,
                      //     ),
                      //     PaymentMethodItem(
                      //       title: 'Карта *** 4323',
                      //       icon: 'assets/icons/mir.svg',
                      //       isSelected:
                      //           state.paymentMethodIndex == 1 ? true : false,
                      //       onTap: () => context
                      //           .read<CreateOrderStateCubit>()
                      //           .setPaymentMethodIndex(1),
                      //     ),
                      //     SizedBox(
                      //       width: 8,
                      //     ),
                      //     PaymentMethodItem(
                      //       title: 'СБП',
                      //       icon: 'assets/icons/sbp.svg',
                      //       isSelected:
                      //           state.paymentMethodIndex == 2 ? true : false,
                      //       onTap: () => context
                      //           .read<CreateOrderStateCubit>()
                      //           .setPaymentMethodIndex(2),
                      //     ),
                      //     SizedBox(
                      //       width: 8,
                      //     ),
                      //     PaymentMethodItem(
                      //       title: 'Новая карта',
                      //       icon: 'assets/icons/add_new_card.svg',
                      //       isSelected:
                      //           state.paymentMethodIndex == 3 ? true : false,
                      //       onTap: () => context
                      //           .read<CreateOrderStateCubit>()
                      //           .setPaymentMethodIndex(3),
                      //     ),
                      //     SizedBox(
                      //       width: 16,
                      //     ),
                      //   ],
                      // );
                    },
                  );
                },
              ),
            ),
            BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
              builder: (context, state) {
                if (state.paymentMethodIndex == 2) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 20,
                      right: 16,
                    ),
                    child: CashPropouse(
                        controller: cashPropouseTextcontroller,
                        onSubmitted: (value) {
                          context
                              .read<BasketBloc>()
                              .add(SetMoneyChange(moneyChange: value));
                        }),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.isSelected = false,
  });

  final String title;
  final String icon;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 72,
        width: 140,
        decoration: BoxDecoration(
          color: AppColors.lightScaffoldBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppStyles.radiusElement,
            ),
          ),
          border: Border.all(
            width: 1.0,
            color: isSelected
                ? AppColors.darkPrimary
                : AppColors.lightScaffoldBackground,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 54,
                padding: const EdgeInsets.symmetric(
                  vertical: 6.52,
                  horizontal: 11.41,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppStyles.radiusElement,
                    ),
                  ),
                ),
                child: SizedBox(
                  child: SvgPicture.asset(
                    icon,
                  ),
                ),
              ),
              Text(
                title,
                style: AppStyles.footnote.copyWith(
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
