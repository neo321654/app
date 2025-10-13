import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monobox/features/home/domain/entities/modifier_entity.dart';
import 'package:monobox/features/home/domain/entities/option_entity.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../basket/domain/entities/basket_offer_entity.dart';
import '../../../domain/entities/modifier_item_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../../basket/presentation/bloc/basket/basket_bloc.dart';

part 'product_card_state_state.dart';
part 'product_card_state_cubit.freezed.dart';

class ProductCardStateCubit extends Cubit<ProductCardStateState> {
  final _updateBasketController = PublishSubject<BasketOfferEntity>();

  ProductCardStateCubit(
    this.product, {
    Map<int, int>? initialQuantities,
    this.basketBloc,
  }) : super(ProductCardStateState(
          product: product,
          selectedQuantities: initialQuantities ?? {},
        )) {
    // Настройка debouncing для обновления корзины
    _updateBasketController
        .debounceTime(const Duration(milliseconds: 300))
        .listen((offer) {
      basketBloc?.add(UpdateOffer(offer));
    });
  }

  final ProductEntity product;
  final BasketBloc? basketBloc;

  @override
  Future<void> close() {
    _updateBasketController.close();
    return super.close();
  }

  void _updateBasket() {
    if (basketBloc == null) return;
    final offer = basketBloc!.getProductOffer(product);
    if (offer != null) {
      final updatedOffer = offer.copyWith(
        addOptions: getSelectedOptions(),
      );
      print('Updating basket with offer: $updatedOffer');
      _updateBasketController
          .add(updatedOffer); // Добавляем в поток с debouncing
    }
  }

  void setInitialModifierQuantities(List<ProductOptionEntity> addOptions) {
    final newQuantities = <int, int>{};
    for (var option in addOptions) {
      if (option.id != null) {
        newQuantities[option.id!] = option.quantity;
      }
    }
    emit(state.copyWith(selectedQuantities: newQuantities));
  }

  void incrementModifier(ModifierItemEntity item) {
    final current = state.selectedQuantities[item.id] ?? 0;
    final max = item.maxQuantity ?? 1;
    if (current < max) {
      final newQuantities = Map<int, int>.from(state.selectedQuantities);
      newQuantities[item.id] = current + 1;
      emit(state.copyWith(selectedQuantities: newQuantities));
      _updateBasket();
    }
  }

  void decrementModifier(ModifierItemEntity item) {
    final current = state.selectedQuantities[item.id] ?? 0;
    final min = item.minQuantity ?? 0;
    if (current > min) {
      final newQuantities = Map<int, int>.from(state.selectedQuantities);
      if (current > 1) {
        newQuantities[item.id] = current - 1;
      } else {
        newQuantities.remove(item.id);
      }
      emit(state.copyWith(selectedQuantities: newQuantities));
      _updateBasket();
    }
  }

  void addModifier(ModifierItemEntity item) {
    final current = state.selectedQuantities[item.id] ?? 0;
    final max = item.maxQuantity ?? 1;
    if (current < max) {
      final newQuantities = Map<int, int>.from(state.selectedQuantities);
      newQuantities[item.id] = current + 1;
      emit(state.copyWith(selectedQuantities: newQuantities));
      _updateBasket();
    }
  }

  void setModifierQuantity(ModifierItemEntity item, int quantity) {
    final newQuantities = Map<int, int>.from(state.selectedQuantities);
    newQuantities[item.id] = quantity.clamp(0, item.maxQuantity ?? 10);
    emit(state.copyWith(selectedQuantities: newQuantities));
    print(
        'Set modifier ${item.id} to quantity $quantity, new quantities: $newQuantities');
    _updateBasket();
  }

  void addUniqModifier(
      ModifierItemEntity item, List<ModifierItemEntity> modifierItems) {
    final newQuantities = Map<int, int>.from(state.selectedQuantities);
    for (var modItem in modifierItems) {
      newQuantities.remove(modItem.id);
    }
    final max = item.maxQuantity ?? 1;
    if ((newQuantities[item.id] ?? 0) < max) {
      newQuantities[item.id] = 1;
    }
    emit(state.copyWith(selectedQuantities: newQuantities));
    _updateBasket();
  }

  void deleteModifier(ModifierItemEntity item) {
    final newQuantities = Map<int, int>.from(state.selectedQuantities);
    newQuantities.remove(item.id);
    emit(state.copyWith(selectedQuantities: newQuantities));
    _updateBasket();
  }

  Decimal _getProductPrice() {
    return state.product.price;
  }

  Decimal _getModifiresTotalPrice() {
    Decimal price = Decimal.zero;
    state.selectedQuantities.forEach((id, quantity) {
      final item = product.modifiers
          .expand((m) => m.items)
          .firstWhere((i) => i.id == id);
      price += (item.price ?? Decimal.zero) * Decimal.fromInt(quantity);
    });
    return price;
  }

  Decimal get productTotalPrice =>
      _getProductPrice() + _getModifiresTotalPrice();

  Decimal get productTotalWeight {
    Decimal val = Decimal.parse('0.0');
    state.selectedQuantities.forEach((id, quantity) {
      final item = product.modifiers
          .expand((m) => m.items)
          .firstWhere((i) => i.id == id);
      val += Decimal.parse(item.weight ?? '0') * Decimal.fromInt(quantity);
    });
    return val;
  }

  String get productName {
    String name = '';
    for (var i = 0; i < 2 && i < pizzaHalfMod().length; i++) {
      name = name +
          pizzaHalfMod()[i].title +
          ((i + 1) < 2 && i + 1 < pizzaHalfMod().length ? ' + ' : '');
    }
    return name.trim();
  }

  List<ModifierItemEntity> pizzaHalfMod() {
    return product.modifiers
        .where((m) => m.type == 'is_half_pizza')
        .expand((m) => m.items)
        .where((item) => (state.selectedQuantities[item.id] ?? 0) > 0)
        .toList();
  }

  List<ModifierItemEntity> selectedModifiersByParent(ModifierEntity modifier) {
    return product.modifiers
        .firstWhere((element) => element == modifier)
        .items
        .where((item) =>
            state.selectedQuantities.containsKey(item.id) &&
            state.selectedQuantities[item.id]! > 0)
        .toList();
  }

  List<ProductOptionEntity> getSelectedOptions() {
    final List<ProductOptionEntity> selectedOptions = [];
    state.selectedQuantities.forEach((id, quantity) {
      final item = product.modifiers
          .expand((m) => m.items)
          .firstWhere((i) => i.id == id);
      selectedOptions.add(ProductOptionEntity(
        id: item.id,
        name: item.title,
        price: item.price,
        unit: item.weight,
        quantity: quantity,
      ));
    });
    return selectedOptions;
  }
}
