import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../address_setup/domain/entities/address_entity.dart';
import '../../../../more/domain/entities/shop_entity.dart';
import '../../../domain/entities/delivery_entity.dart';
import '../../models/create_order_state.dart';

class CreateOrderStateCubit extends Cubit<CreateOrderState> {
  CreateOrderStateCubit()
      : super(
          CreateOrderState(
            deliveryDate: DateTime.now(),
            deliveryTime: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                DateTime.now().hour,
                [15, 30, 45, 60][((DateTime.now().minute) / 15).floor()]),
          ),
        );

  void setDeliveryAddress(AddressEntity deliveryAddress) {
    emit(
      state.copyWith(
        deliveryAddress: deliveryAddress,
      ),
    );
  }

  void setDeliveryDeliveryTime(String deliveryTime) {
    var parts = deliveryTime.split(':');
    emit(
      state.copyWith(
        deliveryTime: DateTime(
          state.deliveryDate!.year,
          state.deliveryDate!.month,
          state.deliveryDate!.day,
          int.parse(parts[0]),
          int.parse(parts[1]),
        ),
      ),
    );
  }

  void setDeliveryDate(DateTime deliveryDate) {
    emit(
      state.copyWith(
        deliveryDate: deliveryDate,
      ),
    );
  }

  void setDeliveryShop(ShopEntity shop) {
    emit(
      state.copyWith(
        deliveryShop: shop,
      ),
    );
  }

  void setDeliveryTime(DateTime deliveryTime) {
    emit(
      state.copyWith(
        deliveryTime: deliveryTime,
      ),
    );
  }

  void setDelivery(DeliveryEntity delivery) {
    emit(
      state.copyWith(
        delivery: delivery,
      ),
    );
  }

  void setDeliveryTimeTypeIndex(int deliveryTimeTypeIndex) {
    emit(
      state.copyWith(
        deliveryTimeTypeIndex: deliveryTimeTypeIndex,
      ),
    );
  }

  void setPaymentMethodIndex(int paymentMethodIndex) {
    emit(
      state.copyWith(
        paymentMethodIndex: paymentMethodIndex,
      ),
    );
  }

  void setUseBonuses(bool use) {
    emit(
      state.copyWith(
        useBonuses: use,
      ),
    );
  }

  void setMakeCall(bool makeCall) {
    emit(
      state.copyWith(
        makeCall: makeCall,
      ),
    );
  }

  void changeItogoIsCollapsed() {
    emit(
      state.copyWith(
        itogoIsCollapsed: !state.itogoIsCollapsed,
      ),
    );
  }

  void setStayNearDoor(bool stayNearDoor) {
    emit(
      state.copyWith(
        stayNearDoor: stayNearDoor,
      ),
    );
  }

  List<String> get deliveryTimes => _deliveryTimes(
        startTime: '00:00',
        endTime: '23:00',
      );

  List<String> _deliveryTimes({
    required String startTime,
    required String endTime,
    int step = 15,
  }) {
    final List<String> deliveryTimes = [];

    final currentTime = DateTime.now();

    final DateTime deliveryDate =
        state.deliveryDate == null ? currentTime : state.deliveryDate!;

    deliveryDate.copyWith(
      hour: currentTime.hour,
      minute: currentTime.minute,
    );

    deliveryDate.add(Duration(
      minutes: step,
    ));

    final startDateTime = DateTime(
        deliveryDate.year,
        deliveryDate.month,
        deliveryDate.day,
        deliveryDate.year,
        int.parse(startTime.split(':')[0]),
        int.parse(startTime.split(':')[1]));
    final endDateTime = DateTime(
        deliveryDate.year,
        deliveryDate.month,
        deliveryDate.day,
        deliveryDate.year,
        int.parse(endTime.split(':')[0]),
        int.parse(endTime.split(':')[1]));

    if (deliveryDate.compareTo(endDateTime) > 0) {
      return deliveryTimes;
    }

    final nearestTime = DateTime(
        deliveryDate.year,
        deliveryDate.month,
        deliveryDate.day,
        deliveryDate.hour,
        [15, 30, 45, 60][(deliveryDate.minute / 15).floor()]);

    final counterDate = (startDateTime.compareTo(nearestTime) > 0)
        ? startDateTime
        : nearestTime;

    while (counterDate.compareTo(endDateTime) < 0) {
      deliveryTimes.add(DateFormat.Hm().format(counterDate));

      counterDate.add(Duration(minutes: step));
    }

    return deliveryTimes;
  }

  bool isAllowToCreate() {
    bool isAllow = true;

    if ((state.delivery?.type == 'delivery' && state.deliveryAddress == null) ||
        (state.delivery?.type == 'pickup' && state.deliveryShop == null)) {
      isAllow = false;
    }

    return isAllow;
  }
}
