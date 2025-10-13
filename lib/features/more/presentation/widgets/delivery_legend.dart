import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monobox/core/extensions/color.dart';

import '../../domain/entities/delivery_zone_entity.dart';
import '../bloc/delivery_zones/delivery_zones_bloc.dart';
import 'delivery_badge.dart';

class DeliveryLegend extends StatefulWidget {
  const DeliveryLegend({super.key});

  @override
  State<DeliveryLegend> createState() => _DeliveryLegendState();
}

class _DeliveryLegendState extends State<DeliveryLegend> {
  final List<DeliveryZoneEntity> zones = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeliveryZonesBloc, DeliveryZonesState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (resut) {
            setState(() {
              zones.addAll(resut);
            });
          },
        );
      },
      child: Wrap(
        runSpacing: 8,
        children: [
          ...zones.map(
            (zone) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: DeliveryBadge(
                color: HexColor(zone.fill),
                text:
                    zone.title + (zone.price != null ? ' ${zone.price}₽' : ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
