import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/features/home/domain/entities/product_entity.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/basket_entity.dart';
import '../../../domain/entities/basket_offer_entity.dart';
import '../../../domain/usecases/add_basket_item_usecase.dart';
import '../../../domain/usecases/get_basket_cart_items_usecase.dart';
import '../../../domain/usecases/remove_all_basket_tems_usecase.dart';
import '../../../domain/usecases/remove_basket_item_usecase.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final GetAllBasketItemsUseCase _getAllBasketItemsUseCase;
  final AddBasketItemUseCase _addBasketItemUseCase;
  final RemoveBasketItemUseCase _removeBasketItemUseCase;
  final RemoveAllBasketItemsUseCase _removeAllBasketItemsUseCase;
  // final SaveUserOrderUseCase _saveUserOrderUseCase;
  // final SaveOrderRemoteUseCase _saveOrderRemoteUseCase;

  Timer? deleteOferTimer;

  BasketBloc({
    required GetAllBasketItemsUseCase getAllBasketItemsUseCase,
    required AddBasketItemUseCase addBasketItemUseCase,
    //required SaveUserOrderUseCase saveUserOrderUseCase,
    required RemoveBasketItemUseCase removeBasketItemUseCase,
    required RemoveAllBasketItemsUseCase removeAllBasketItemsUseCase,
    //required SaveOrderRemoteUseCase saveOrderRemoteUseCase,
  })  : _getAllBasketItemsUseCase = getAllBasketItemsUseCase,
        //_saveOrderRemoteUseCase = saveOrderRemoteUseCase,
        _addBasketItemUseCase = addBasketItemUseCase,
        //_saveUserOrderUseCase = saveUserOrderUseCase,
        _removeBasketItemUseCase = removeBasketItemUseCase,
        _removeAllBasketItemsUseCase = removeAllBasketItemsUseCase,
        super(BasketLoading()) {
    on<LoadBasket>(_onLoadBasket);
    on<AddOffer>(_onAddOffer);
    on<AddGift>(_onAddGift);
    on<RemoveGift>(_onRemoveGift);
    on<RemoveOffer>(_onRemoveOffer);
    on<RemoveAllOffers>(_onRemoveAllOffers);
    on<AddQtyOffer>(_onAddQtyOffer);
    on<SetPromo>(_onSetPromo);
    on<SetMoneyChange>(_onSetMoneyChange);
    on<UpdateOffer>(_onUpdateOffer);
    // on<ConfirmOrder>(_onConfirmOrder);
  }

  void _onLoadBasket(
    LoadBasket event,
    Emitter<BasketState> emit,
  ) async {
    emit(BasketLoading());
    try {
      final dataState = await _getAllBasketItemsUseCase();

      if (dataState is DataSuccess && dataState.data != null) {
        emit(
          BasketLoaded(
            basket: BasketEntity(
              offers: dataState.data!,
            ),
          ),
        );
      }

      if (dataState is DataFailed) {
        emit(const BasketFailure(message: ''));
      }
    } catch (message) {
      emit(
        BasketFailure(message: message.toString()),
      );
    }
  }

  void _onAddOffer(
    AddOffer event,
    Emitter<BasketState> emit,
  ) {
    if (state is BasketLoaded) {
      try {
        _addBasketItemUseCase(params: event.offer);

        final BasketEntity basket = (state as BasketLoaded).basket;

        basket.offers.map((e) => null).toList();

        final offers = List<BasketOfferEntity>.from(basket.offers);

        bool needAdd = true;

        for (int i = 0; i < offers.length; i++) {
          if (offers[i].product.id == event.offer.product.id) {
            offers[i] = offers[i].copyWith(quantity: (offers[i].quantity! + 1));
            needAdd = false;
          }
        }

        if (needAdd) {
          offers.add(event.offer);
        }

        emit(
          BasketLoaded(
            basket: basket.copyWith(
              offers: offers,
            ),
          ),
        );
      } catch (message) {
        emit(
          BasketFailure(message: message.toString()),
        );
      }
    }
  }

  void _onAddGift(
    AddGift event,
    Emitter<BasketState> emit,
  ) {
    if (state is BasketLoaded) {
      try {
        final BasketEntity basket = (state as BasketLoaded).basket;

        final gifts = List<ProductEntity>.from(basket.gifts);

        gifts.add(event.gift);

        emit(
          BasketLoaded(
            basket: basket.copyWith(
              gifts: gifts,
            ),
          ),
        );
      } catch (message) {
        emit(
          BasketFailure(message: message.toString()),
        );
      }
    }
  }

  void _onRemoveOffer(
    RemoveOffer event,
    Emitter<BasketState> emit,
  ) {
    if (state is BasketLoaded) {
      try {
        _removeBasketItemUseCase(params: event.offer);

        final BasketEntity basket = (state as BasketLoaded).basket;

        basket.offers.map((e) => null).toList();

        emit(
          BasketLoaded(
            basket: basket.copyWith(
              offers: List<BasketOfferEntity>.from(basket.offers)
                ..removeWhere((offer) => event.offer.id == offer.id),
            ),
          ),
        );
      } catch (message) {
        emit(
          BasketFailure(
            message: message.toString(),
          ),
        );
      }
    }
  }

  void _onRemoveGift(
    RemoveGift event,
    Emitter<BasketState> emit,
  ) {
    if (state is BasketLoaded) {
      try {
        final BasketEntity basket = (state as BasketLoaded).basket;

        emit(
          BasketLoaded(
            basket: basket.copyWith(
              gifts: List<ProductEntity>.from(basket.gifts)
                ..removeWhere((gift) => event.gift.id == gift.id),
            ),
          ),
        );
      } catch (message) {
        emit(
          BasketFailure(message: message.toString()),
        );
      }
    }
  }

  Future<void> _onRemoveAllOffers(
    RemoveAllOffers event,
    Emitter<BasketState> emit,
  ) async {
    if (state is BasketLoaded) {
      print('BASKET - REMOVING ALL OFFERS');
      deleteOferTimer?.cancel();
      await _removeAllBasketItemsUseCase();

      final BasketEntity basket = (state as BasketLoaded).basket;

      basket.offers.map((e) => null).toList();

      emit(
        BasketLoaded(
          basket: basket.copyWith(
            offers: List<BasketOfferEntity>.from(basket.offers)..clear(),
            promocode: '',
            gifts: [],
            moneyChange: '',
          ),
        ),
      );
      print('BASKET - ALL OFFERS REMOVED SUCCESSFULLY');
    } else {
      print('BASKET - CANNOT REMOVE OFFERS: state is not BasketLoaded');
    }
  }

  void _onAddQtyOffer(
    AddQtyOffer event,
    Emitter<BasketState> emit,
  ) {
    if (state is BasketLoaded) {
      try {
        deleteOferTimer?.cancel();
        final int newQty = event.offer.quantity! + event.qty;
        _addBasketItemUseCase(
          params: event.offer.copyWith(
            quantity: newQty,
          ),
        );

        final BasketEntity basket = (state as BasketLoaded).basket;

        basket.offers.map((e) => null).toList();

        emit(
          BasketLoaded(
            basket: basket.copyWith(
              offers: List<BasketOfferEntity>.from(basket.offers.map((offer) {
                if (event.offer == offer) {
                  return offer = offer.copyWith(quantity: newQty);
                }

                return offer;
              }).toList()),
            ),
          ),
        );

        if (newQty == 0) {
          deleteOferTimer = Timer(const Duration(seconds: 2), () async {
            add(RemoveOffer(event.offer));
          });
        }
      } catch (message) {
        emit(
          BasketFailure(message: message.toString()),
        );
      }
    }
  }

  int? get productsCount {
    if (state is BasketLoaded) {
      int count = -1;

      (state as BasketLoaded).basket.offers.map((offer) {
        if (count == -1) {
          count = 0;
        }

        count += offer.quantity!;
      }).toList();

      return count;

      // return (state as BasketLoaded).basket.offers.fold(
      //     0,
      //     (previousValue, element) =>
      //         (previousValue ?? 0) + (element.quantity ?? 0));
    }
    return null;
  }

  bool get isEmpty => !(productsCount != null && productsCount! >= 0);

  double total(subtotal, deliveryFee, serviceFee) {
    return subtotal + deliveryFee(subtotal) + serviceFee;
  }

  Decimal get subtotal => (state as BasketLoaded).basket.offers.fold(
        Decimal.fromInt(0),
        (Decimal previousValue, BasketOfferEntity element) =>
            previousValue +
            (element.product.price * Decimal.fromInt(element.quantity!)),
      );

  bool isInBasket(ProductEntity product) {
    return (state as BasketLoaded)
        .basket
        .offers
        .any((offer) => offer.product.id == product.id);
  }

  bool giftIsInBasket(ProductEntity product) {
    return (state as BasketLoaded)
        .basket
        .gifts
        .any((gifts) => gifts.id == product.id);
  }

  void chooseGift(ProductEntity? product) {
    if ((state as BasketLoaded).basket.gifts.isNotEmpty) {
      (state as BasketLoaded)
          .basket
          .gifts
          .map((gift) => add(RemoveGift(gift)))
          .toList();
    }

    if (product != null) {
      add(AddGift(product));
    }
  }

  BasketOfferEntity? getProductOffer(ProductEntity product) {
    BasketOfferEntity? offer;
    for (var element in (state as BasketLoaded).basket.offers) {
      if (element.product.id == product.id) {
        offer = element;
      }
    }
    return offer;
  }

  // double get subtotal => (state as CartLoaded).cart.cartItems.fold(
  //       0,
  //       (double previousValue, Product element) =>
  //           previousValue + element.price,
  //     );

  // String get getSubtotalString => subtotal.toStringAsFixed(2);

  // double deliveryFee(subtotal) {
  //   if (subtotal >= 2000) {
  //     return 0;
  //   } else {
  //     return 200;
  //   }
  // }

  // double total(subtotal, deliveryFee, serviceFee) {
  //   return subtotal + deliveryFee(subtotal) + serviceFee;
  // }

  // double get totalPrice =>
  //     total(subtotal, deliveryFee, (state as CartLoaded).serviceFee);

  // String get totalString =>
  //     total(subtotal, deliveryFee, (state as CartLoaded).serviceFee)
  //         .toStringAsFixed(2);

  // String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  // String get date => DateTime.now().toString().substring(0, 10);

  // Future<void> _onConfirmOrder(
  //   ConfirmOrder event,
  //   Emitter<CartState> emit,
  // ) async {
  //   try {
  //     final List<Product> cart = (state as CartLoaded).cart.cartItems;
  //     _saveOrderRemoteUseCase(
  //       order: UserOrder(
  //         id: const Uuid().v4(),
  //         dateTime: DateTime.now().toString().substring(0, 10),
  //         products: cart
  //             .map((Product e) => Product(
  //                 name: e.name,
  //                 description: e.description,
  //                 image: e.image,
  //                 price: e.price,
  //                 ml: e.ml,
  //                 id: e.id,
  //                 bigDescription: e.bigDescription,
  //                 rate: e.rate))
  //             .toList(),
  //         price: totalPrice,
  //       ),
  //     );
  //   } catch (message) {
  //     emit(CartFailure(message: message.toString()));
  //   }
  // }

  void _onSetPromo(
    SetPromo event,
    Emitter<BasketState> emit,
  ) {
    if (state is BasketLoaded) {
      final BasketEntity basket = (state as BasketLoaded).basket;

      emit(
        BasketLoaded(
          basket: basket.copyWith(
            promocode: event.promo,
          ),
        ),
      );
    }
  }

  void _onSetMoneyChange(
    SetMoneyChange event,
    Emitter<BasketState> emit,
  ) {
    if (state is BasketLoaded) {
      final BasketEntity basket = (state as BasketLoaded).basket;

      emit(
        BasketLoaded(
          basket: basket.copyWith(
            moneyChange: event.moneyChange,
          ),
        ),
      );
    }
  }

  void _onUpdateOffer(UpdateOffer event, Emitter<BasketState> emit) {
    if (state is BasketLoaded) {
      try {
        _addBasketItemUseCase(params: event.offer);
        final BasketEntity basket = (state as BasketLoaded).basket;
        final offers = List<BasketOfferEntity>.from(basket.offers);

        for (int i = 0; i < offers.length; i++) {
          if (offers[i].id == event.offer.id) {
            offers[i] = event.offer;
            break;
          }
        }

        emit(BasketLoaded(basket: basket.copyWith(offers: offers)));
      } catch (message) {
        emit(BasketFailure(message: message.toString()));
      }
    }
  }
}
