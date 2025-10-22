import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/core/widgets/warning_container.dart';
import 'package:monobox/features/order/presentation/bloc/orders_list/orders_list_bloc.dart';
import 'package:monobox/features/order/presentation/bloc/payment_methods/payment_methods_bloc.dart';
import 'package:monobox/features/order/presentation/bloc/promocode/promocode_bloc.dart';
import 'package:monobox/features/profile/presentation/bloc/profile/profile_cubit.dart';
import 'package:pinput/pinput.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

import '/../../../../config/routes/app_router.dart';
import '/../../../../config/themes/colors.dart';
import '/../../../../config/themes/styles.dart';
import '/../../../../injection_container.dart';
import '../../../../address_setup/presentation/bloc/create_address/create_address_bloc.dart';
import '../../../../basket/domain/entities/basket_entity.dart';
import '../../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../../bloc/deliveries/deliveries_bloc.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/order_details/order_details_bloc.dart';
import '../../models/create_order_state.dart';
import '../../widgets/widgets.dart';
import 'widgets/botom_buttom_sheet.dart';
import 'widgets/order_app_bar.dart';
import 'widgets/sliding_sheet_body.dart';

@RoutePage()
class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({
    super.key,
    required this.basket,
  });

  final BasketEntity basket;

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  late TextEditingController cashPropouseTextController;
  late TextEditingController promoTextController;
  late SheetController sheetController;
  late TextEditingController commentController;

  @override
  void initState() {
    sheetController = SheetController();
    cashPropouseTextController = TextEditingController();
    commentController = TextEditingController();
    promoTextController = TextEditingController()
      ..setText((getIt<BasketBloc>().state is BasketLoaded &&
              (getIt<BasketBloc>().state as BasketLoaded).basket.promocode !=
                  null)
          ? (getIt<BasketBloc>().state as BasketLoaded).basket.promocode!
          : '');
    super.initState();
  }

  @override
  void dispose() {
    cashPropouseTextController.dispose();
    promoTextController.dispose();
    super.dispose();
  }

  void _setCashPropouse() {
    getIt<BasketBloc>()
        .add(SetMoneyChange(moneyChange: cashPropouseTextController.text));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CreateOrderStateCubit>(),
        ),
        BlocProvider.value(
          value: getIt<DeliveryBloc>(),
        ),
        BlocProvider.value(
          value: getIt<OrderBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CreateAddressBloc>(),
        ),
        BlocProvider.value(
          value: getIt<PaymentMethodsBloc>(),
        ),
        BlocProvider.value(
          value: getIt<ProfileCubit>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<OrderBloc, OrderState>(
            listener: (context, state) {
              if (state is OrderCreated) {
                // ВАЖНО: Очищаем корзину и обновляем список заказов ВСЕГДА после создания заказа
                print('ORDER CREATED - CLEARING BASKET AND UPDATING ORDERS');
                getIt<BasketBloc>().add(const RemoveAllOffers());
                getIt<PromocodeBloc>().emit(const PromocodeState.initial());
                getIt<OrdersListBloc>().add(const OrdersListEvent.getOrders());

                if (state.created.paymentUrl?.isNotEmpty == true) {
                  context.navigateTo(
                    CustonWebViewRoute(
                      title: '',
                      url: state.created.paymentUrl!,
                      onPageFinished: (finishUrl) {
                        if (finishUrl.contains('/tinkoff/success')) {
                          getIt<OrderDetailsBloc>().add(
                              OrderDetailsEvent.paymentCompleted(
                                  state.created.id));
                        }
                        if (finishUrl.contains('/tinkoff/success') ||
                            finishUrl.contains('/tinkoff/fail')) {
                          // Дополнительно обновляем список заказов после оплаты
                          getIt<OrdersListBloc>()
                              .add(const OrdersListEvent.getOrders());
                          context.router
                              .parent<TabsRouter>()
                              ?.navigate(OrderRoute(
                                orderId: state.created.id,
                                isNew: true,
                              ));
                        }
                      },
                    ),
                  );
                } else {
                  // Если нет paymentUrl, сразу переходим к заказу
                  context.router.parent<TabsRouter>()?.navigate(OrderRoute(
                        orderId: state.created.id,
                        isNew: true,
                      ));
                }
              }

              if (state is OrderError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: Container(
                      padding: const EdgeInsets.all(12),
                      //height: 88,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            AppStyles.radiusElement,
                          ),
                        ),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const WarningContainer(),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ошибка',
                                  style: AppStyles.bodyBold.copyWith(
                                    color: AppColors.dark,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  (state.error as StateError).message,
                                  style: AppStyles.footnote,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          BlocListener<CreateOrderStateCubit, CreateOrderState>(
            listenWhen: (previousState, currentState) {
              if (previousState.delivery != currentState.delivery ||
                  currentState.paymentMethodIndex !=
                      currentState.paymentMethodIndex) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              //_requestGifts(context);
            },
          ),
        ],
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: const OrderAppBar(),
            body: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    BasketBloc basketBloc = context.watch<BasketBloc>();
    return SafeArea(
      child: Stack(
        children: [
          SlidingSheet(
            controller: sheetController,
            backdropColor: const Color(0xFF101010).withOpacity(.2),
            closeOnBackdropTap: true,
            elevation: 1,
            shadowColor: AppColors.lightDarkGray.withOpacity(.15),
            cornerRadius: AppStyles.radiusBlock,
            snapSpec: SnapSpec(
              // Enable snapping. This is true by default.
              snap: true,
              // Set custom snapping points.
              //snappings: [194 / 314, 1.0],
              snappings: [
                (Platform.isIOS ? 0.72 : 0.65),
                (Platform.isIOS ? 1 : 1.0)
              ],
              // Define to what the snappings relate to. In this case,
              // the total available space that the sheet can expand to.
              //positioning: SnapPositioning.relativeToAvailableSpace,
              positioning: SnapPositioning.relativeToSheetHeight,
            ),
            listener: (state) {
              if (state.isCollapsed !=
                  getIt<CreateOrderStateCubit>().state.itogoIsCollapsed) {
                getIt<CreateOrderStateCubit>().changeItogoIsCollapsed();
              }
            },
            builder: (context, state) =>
                Itogo(sheetController: sheetController),
            body: SlidingSheetBody(
              cashPropouseTextController: cashPropouseTextController,
              promoTextController: promoTextController,
              commentController: promoTextController,
            ),
          ),
          BottomButtonSheet(
            commentController: commentController,
            basketBloc: basketBloc,
          ),
        ],
      ),
    );
  }
}
