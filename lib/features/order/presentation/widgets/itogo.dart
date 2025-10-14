import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import 'package:monobox/features/order/presentation/models/create_order_state.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';

class Itogo extends StatelessWidget {
  const Itogo({
    super.key,
    this.sheetController,
  });

  final SheetController? sheetController;

  @override
  Widget build(BuildContext context) {
    BasketBloc basketBloc = context.watch<BasketBloc>();

    return Container(
      height: 300,
      padding: const EdgeInsets.only(
        top: 20,
        right: 16,
        bottom: 16,
        left: 16,
      ),
      width: double.infinity,
      color: AppColors.white,
      // decoration: BoxDecoration(
      //   color: AppColors.white,
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(AppStyles.radiusBlock),
      //     topRight: Radius.circular(AppStyles.radiusBlock),
      //   ),
      // ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppStyles.radiusElement),
                    ),
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
                builder: (context, state) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (sheetController != null) {
                        if (!state.itogoIsCollapsed) {
                          sheetController!.collapse();
                        } else {
                          sheetController!.expand();
                        }
                      }
                    },
                    child: Container(
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
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Заказ',
                              style: AppStyles.headline,
                            ),
                            AnimatedRotation(
                              duration: const Duration(milliseconds: 100),
                              turns: state.itogoIsCollapsed ? 0 : .5,
                              child: SizedBox(
                                width: 22,
                                height: 22,
                                child: SvgPicture.asset(
                                  'assets/icons/arrows_up.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
                    success: (basketInfo, timeDelay) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
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
                        ),
                        ...basketInfo.pretotalInfo.map(
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
                      ],
                    ),
                  );
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Начислим бонусов',
              //       style: AppStyles.caption1,
              //     ),
              //     Row(
              //       children: [
              //         Text(
              //           '152',
              //           style: AppStyles.caption1Bold,
              //         ),
              //         AppStyles.xxsmall6HGap,
              //         SizedBox(
              //           width: 14,
              //           height: 14,
              //           child: SvgPicture.asset(
              //             'assets/icons/bonus_icn.svg',
              //             color: AppColors.lightPrimary,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 16,
              ),

              const SizedBox(
                height: 16,
              ),
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
              //         child: BlocBuilder<OrderBloc, OrderState>(
              //           builder: (context, state) {
              //             return ElevatedButton(
              //               onPressed: (state is OrderCreating)
              //                   ? null
              //                   : () {
              //                       final DeliveryEntity delivery = getIt<CreateOrderStateCubit>().state.delivery!;

              //                       final PaymentMethodEntity paymentMethod =
              //                           (getIt<PaymentMethodsBloc>().state as PaymentMethodsDone).paymentMethods![getIt<CreateOrderStateCubit>().state.paymentMethodIndex ?? 0];
              //                       final List<OrderedPositionEntity> orderedPositions = [];
              //                       (basketBloc.state as BasketLoaded)
              //                           .basket
              //                           .offers
              //                           .map(
              //                             (o) => orderedPositions.add(
              //                               OrderedPositionEntity(productId: o.product.id!, quantity: o.quantity ?? 1),
              //                             ),
              //                           )
              //                           .toList();

              //                       int? addressId = context.read<CreateOrderStateCubit>().state.delivery?.type == 'delivery'
              //                           ? context.read<CreateOrderStateCubit>().state.deliveryAddress?.id
              //                           : context.read<CreateOrderStateCubit>().state.deliveryShop?.id;

              //                       context.read<OrderBloc>().createOrder(
              //                             context.read<OrderBloc>().offer(
              //                                   paymentMethod: paymentMethod,
              //                                   delivery: delivery,
              //                                   orderedPositions: orderedPositions,
              //                                   addressId: addressId,
              //                                   promocode: (basketBloc.state as BasketLoaded).basket.promocode,
              //                                   moneyChange: (basketBloc.state as BasketLoaded).basket.moneyChange,
              //                                 ),
              //                           );
              //                       // Navigator.of(context).push(
              //                       //     MaterialPageRoute(builder: (context) => AuthPage()));
              //                     },
              //               child: (state is OrderCreating)
              //                   ? const SizedBox(
              //                       width: 24,
              //                       height: 24,
              //                       child: CircularProgressIndicator(
              //                         color: AppColors.white,
              //                         strokeWidth: 2,
              //                       ),
              //                     )
              //                   : const Text('К оплате'),
              //             );
              //           },
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
