import 'package:flutter/material.dart';

import '../../../order/domain/entities/order_entity.dart';
import 'profile_order_item.dart';

class ProfileOrders extends StatelessWidget {
  const ProfileOrders({
    super.key,
    required this.orders,
  });

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 214,
      child: ListView.builder(
        itemCount: orders.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              if (index == 0)
                const SizedBox(
                  width: 16,
                ),
              ProfileOrderItem(
                order: orders[index],
              ),
              if ((index + 1) != orders.length)
                const SizedBox(
                  width: 12,
                ),
              if ((index + 1) == orders.length)
                const SizedBox(
                  width: 16,
                ),
            ],
          );
        },
      ),
    );
  }
}
