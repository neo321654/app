part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadBasket extends BasketEvent {}

class AddOffer extends BasketEvent {
  final BasketOfferEntity offer;

  const AddOffer(this.offer);

  @override
  List<Object> get props => <Object>[
        offer,
      ];
}

class AddGift extends BasketEvent {
  final ProductEntity gift;

  const AddGift(this.gift);

  @override
  List<Object> get props => <Object>[
        gift,
      ];
}

class RemoveGift extends BasketEvent {
  final ProductEntity gift;

  const RemoveGift(this.gift);

  @override
  List<Object> get props => <Object>[
        gift,
      ];
}

class AddQtyOffer extends BasketEvent {
  final BasketOfferEntity offer;
  final int qty;

  const AddQtyOffer(this.offer, this.qty);

  @override
  List<Object> get props => <Object>[
        offer,
        qty,
      ];
}

class RemoveOffer extends BasketEvent {
  final BasketOfferEntity offer;

  const RemoveOffer(this.offer);

  @override
  List<Object> get props => <Object>[
        offer,
      ];
}

final class RemoveAllOffers extends BasketEvent {
  const RemoveAllOffers();

  @override
  List<Object> get props => <Object>[];
}

final class ConfirmOrder extends BasketEvent {
  @override
  List<Object> get props => <Object>[];
}

final class SetMoneyChange extends BasketEvent {
  final String? moneyChange;

  const SetMoneyChange({this.moneyChange});

  @override
  List<Object> get props => <Object>[];
}

final class SetPromo extends BasketEvent {
  final String? promo;

  const SetPromo({this.promo});

  @override
  List<Object> get props => <Object>[];
}

class UpdateOffer extends BasketEvent {
  final BasketOfferEntity offer;

  const UpdateOffer(this.offer);

  @override
  List<Object> get props => <Object>[
        offer,
      ];
}
