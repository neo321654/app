import 'dart:io';
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/features/basket/presentation/widgets/upsales.dart';
import 'package:monobox/features/order/presentation/bloc/promocode/promocode_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import 'package:monobox/features/basket/domain/entities/basket_entity.dart';
import 'package:monobox/features/basket/domain/entities/basket_info_request_entity.dart';
import 'package:monobox/features/basket/domain/entities/basket_modifire_entity.dart';
import 'package:monobox/features/basket/presentation/bloc/basket/basket_bloc.dart';
import 'package:monobox/features/basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import 'package:monobox/features/basket/presentation/bloc/basket/gifts/gifts_bloc.dart';
import 'package:monobox/features/basket/presentation/bloc/basket/upsales/upsales_bloc.dart';
import 'package:monobox/features/basket/presentation/widgets/basket_action_button.dart';
import 'package:monobox/features/basket/presentation/widgets/basket_item.dart';
import 'package:monobox/features/basket/presentation/widgets/choose_gifts.dart';
import 'package:monobox/features/basket/presentation/widgets/choose_upsales.dart';
import 'package:monobox/features/basket/presentation/widgets/itogo.dart';
import 'package:monobox/features/basket/presentation/widgets/offers.dart';
import 'package:monobox/features/order/domain/entities/order_create_entity.dart';
import 'package:monobox/features/order/domain/entities/ordered_position_entity.dart';
import 'package:monobox/features/order/domain/entities/upsale_request_entity.dart';
import 'package:monobox/features/order/presentation/bloc/create_order_state_cubit/create_order_state_cubit.dart';
import 'package:monobox/features/order/presentation/bloc/deliveries/deliveries_bloc.dart';
import 'package:monobox/features/order/presentation/models/create_order_state.dart';
import 'package:monobox/features/order/presentation/widgets/promocode.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/text_switcher.dart';

@RoutePage()
class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late TextEditingController promoTextController;
  Timer? _debounceTimer;

  @override
  void initState() {
    promoTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    promoTextController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    BasketBloc basketBloc = context.read<BasketBloc>();
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Корзина',
            style: AppStyles.title2,
          )
        ],
      ),
      actions: [
        BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            if (context.read<BasketBloc>().isEmpty) return Container();
            return Row(
              children: [
                BasketActionButton(
                  asset: 'assets/icons/trash.svg',
                  onPressed: () async {
                    final bool? result = await showDialog<bool?>(
                        context: context,
                        builder: (BuildContext context) {
                          return _clearBasketDialog(context);
                        });

                    if (result != null && result) {
                      getIt<PromocodeBloc>().emit(const PromocodeState.initial());
                      basketBloc.add(const RemoveAllOffers());
                    }
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                if (!context.watch<BasketBloc>().isEmpty)
                  BasketActionButton(
                    asset: 'assets/icons/share.svg',
                    onPressed: () {
                      final List<String> products = [];
                      (context.read<BasketBloc>().state as BasketLoaded).basket.offers.map((offer) => products.add('${offer.product.name} - ${offer.quantity} шт')).toList();
                      Share.share(products.join('\n'));
                    },
                  ),
                const SizedBox(
                  width: 16,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _emptyBasket(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 47,
          child: Column(
            children: [
              Text(
                'В корзине пусто, посмотрите меню',
                style: AppStyles.subhead.copyWith(
                  color: AppColors.gray,
                ),
                textAlign: TextAlign.center,
              ),
              AppStyles.smallVGap,
              SizedBox(
                //height: 52,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppStyles.btnRadius),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkPrimary.withOpacity(.1),
                          blurRadius: 6.0,
                          offset: const Offset(
                            0.0,
                            4.0,
                          ),
                        )
                      ],
                    ),
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () async {
                          context.navigateTo(
                            HomeNavigationRoute(children: [CatalogRoute()]),
                          );
                          //context.navigateTo(CatalogRoute());
                          //context.navigateTo(const CreateOrderRoute());
                          //context.navigateNamedTo('/home');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 24,
                              alignment: Alignment.center,
                              child: Text(
                                'Смотреть меню',
                                style: AppStyles.headline.copyWith(
                                  color: AppColors.white,
                                  height: 1,
                                ),
                              ),
                            ),
                            AppStyles.xSsmallHGap,
                            Container(
                              height: 24,
                              alignment: Alignment.center,
                              child: SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/arrow_right.svg',
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    //BasketBloc basketBloc = context.read<BasketBloc>();

    //final bool isEmptyBasket = basketBloc.isEmpty;

    //final BasketEntity basket = (basketBloc.state as BasketLoaded).basket;

    // if (isEmptyBasket) {
    //   return _emptyBasket(context);
    // }

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<GiftsBloc>(),
        ),
        BlocProvider.value(
          value: getIt<DeliveryBloc>()..add(const GetDeliveries()),
        ),
        BlocProvider.value(
          value: getIt<CreateOrderStateCubit>(),
        ),
        BlocProvider.value(
          value: getIt<UpsalesBloc>()
            ..add(const UpsalesEvent.getUpsales(
              UpsaleRequestEntity(types: ['dop', 'forget']),
            )),
        ),
      ],
      child: BlocConsumer<BasketBloc, BasketState>(
        listener: (context, state) {
          if (!context.read<BasketBloc>().isEmpty && context.read<GiftsBloc>().state is Initial) {
            context.read<GiftsBloc>().add(
                  GiftsEvent.getGifts(
                    OrderCreateEntity(
                      deliveryId: 1,
                      paymentId: 1,
                      orderedPositions: (getIt<BasketBloc>().state as BasketLoaded)
                          .basket
                          .offers
                          .map((offer) => OrderedPositionEntity(
                                productId: offer.product.id!,
                                quantity: offer.quantity!,
                              modifiers: offer.addOptions,
                      ))
                          .toList(),
                    ),
                  ),
                );
          }
        },
        builder: (context, state) {
          if (context.read<BasketBloc>().isEmpty) {
            return _emptyBasket(context);
          } else {
            if (context.read<GiftsBloc>().state is Initial) {
              context.read<GiftsBloc>().add(
                    GiftsEvent.getGifts(
                      OrderCreateEntity(
                        deliveryId: 1,
                        paymentId: 1,
                        orderedPositions: (getIt<BasketBloc>().state as BasketLoaded)
                            .basket
                            .offers
                            .map((offer) => OrderedPositionEntity(
                                  productId: offer.product.id!,
                                  quantity: offer.quantity!,
                                  modifiers: offer.addOptions,
                        ))
                            .toList(),
                      ),
                    ),
                  );
            }
          }
          return MultiBlocListener(
            listeners: [
              BlocListener<DeliveryBloc, DeliveriesState>(
                listener: (context, state) {
                  if (state is DeliveriesDone && state.deliveries?.isNotEmpty == true) {
                    // Автоматически выбираем доставку (не самовывоз)
                    final deliveryOption = state.deliveries!.firstWhere(
                      (delivery) => delivery.type == 'delivery',
                      orElse: () => state.deliveries![0],
                    );
                    context.read<CreateOrderStateCubit>().setDelivery(deliveryOption);
                    
                    // ПЕРЕСЧЕТ КОРЗИНЫ ТЕПЕРЬ ДЕЛАЕТСЯ В MAIN.DART ПОСЛЕ УСТАНОВКИ АДРЕСА
                    // Не вызываем здесь BasketInfoBloc, чтобы избежать дублирования
                  }
                },
              ),
            ],
            child: CustomScrollView(
              key: const PageStorageKey<String>('basket'),
              //physics: const PositionRetainedScrollPhysics(),
              //reverse: true,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
                          builder: (context, state) {
                            return BlocBuilder<DeliveryBloc, DeliveriesState>(
                              builder: (context, deliveriesState) {
                                if (deliveriesState is DeliveriesDone) {
                                  // Автоматически выбираем доставку (не самовывоз), если ничего не выбрано
                                  if (state.delivery == null && deliveriesState.deliveries!.isNotEmpty) {
                                    // Ищем доставку (не pickup)
                                    final deliveryOption = deliveriesState.deliveries!.firstWhere(
                                      (delivery) => delivery.type == 'delivery',
                                      orElse: () => deliveriesState.deliveries![0], // если нет доставки, берем первую
                                    );
                                    
                                    print('BASKET - AUTO SELECTING DELIVERY: ${deliveryOption.name} (ID: ${deliveryOption.id}, TYPE: ${deliveryOption.type})');
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      context.read<CreateOrderStateCubit>().setDelivery(deliveryOption);
                                    });
                                  }
                                  
                                  return TextSwitcher(
                                    items: (deliveriesState.deliveries ?? []).map((e) => e.name).toList(),
                                    selectedIndex: state.delivery == null ? 0 : deliveriesState.deliveries!.indexOf(state.delivery!),
                                    onTap: (int itemIndex) {
                                      final selectedDelivery = deliveriesState.deliveries![itemIndex];
                                      context.read<CreateOrderStateCubit>().setDelivery(selectedDelivery);
                                      
                                      // Отменяем предыдущий таймер, если он есть
                                      _debounceTimer?.cancel();
                                      
                                      // Устанавливаем новый таймер для debounce
                                      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
                                        // Обновляем корзину с новым типом доставки только если адрес уже установлен
                                        if (context.read<BasketBloc>().state is BasketLoaded && 
                                            context.read<CreateOrderStateCubit>().state.deliveryAddress != null) {
                                          final basket = (context.read<BasketBloc>().state as BasketLoaded).basket;
                                          print('BASKET - DELIVERY CHANGED, RECALCULATING with deliveryId: ${selectedDelivery.id} and addressId: ${context.read<CreateOrderStateCubit>().state.deliveryAddress?.id}');
                                          context.read<BasketInfoBloc>().add(
                                            BasketInfoEvent.getBasketInfo(
                                              basket.offers.map((offer) => BasketInfoRequestEntity(
                                                id: offer.product.id ?? 0,
                                                qnt: offer.quantity ?? 1,
                                                modifiers: offer.addOptions != null
                                                    ? offer.addOptions!
                                                        .where((modifier) => modifier.id != null)
                                                        .map((modifier) => BasketModifireEntity(
                                                              id: modifier.id!,
                                                              qnt: modifier.quantity,
                                                            ))
                                                        .toList()
                                                    : [],
                                              )).toList(),
                                              deliveryId: selectedDelivery.id,
                                            ),
                                          );
                                        } else {
                                          print('BASKET - DELIVERY CHANGED, SKIPPING RECALCULATION: address not set yet');
                                        }
                                      });
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
                      const SizedBox(height: 28),
                      const BasketOffers(),
                      const Upsales(),
                      const SizedBox(height: 28),
                      Promocode(
                        controller: promoTextController,
                      ),
                      BlocBuilder<GiftsBloc, GiftsState>(
                        builder: (context, state) {
                          return state.maybeMap(
                            success: (value) => Column(
                              children: [
                                const SizedBox(height: 28),
                                ChooseGifts(
                                  products: value.gifts,
                                ),
                              ],
                            ),
                            orElse: () => Container(),
                          );
                        },
                      ),
                      BlocBuilder<UpsalesBloc, UpsalesState>(
                        builder: (context, state) {
                          return state.maybeMap(
                            success: (value) {
                              if (value.upsales.length > 1) {
                                return ChooseUpsales(
                                  upsale: value.upsales[1],
                                );
                              } else if (value.upsales.isNotEmpty) {
                                return ChooseUpsales(
                                  upsale: value.upsales.first,
                                );
                              } else {
                                return Container();
                              }
                              return Container();
                            },
                            orElse: () => Container(),
                          );
                        },
                      ),
                      const Expanded(child: SizedBox(height: 28)),
                      const Itogo(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _clearBasketDialog(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        //backgroundColor: Color(0xFFECE6F0),
        title: const Text("Очистить корзину?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "Отмена",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Очистить",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ],
        content: const Text(
          "Восстановить содержимое корзины не получится",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: .25,
            color: Color(0xFF000000),
          ),
        ),
      );
    }

    return AlertDialog(
      //backgroundColor: Color(0xFFECE6F0),
      title: const Text("Очистить корзину?"),
      titleTextStyle: AppStyles.title2.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      actionsOverflowButtonSpacing: 20,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            "Отмена",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            "Очистить",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
      ],
      content: const Text(
        "Восстановить содержимое корзины не получится",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: .25,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
