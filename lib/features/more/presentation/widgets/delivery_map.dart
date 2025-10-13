import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/core/extensions/color.dart';
import 'package:php_serializer/php_serializer.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../config/themes/colors.dart';
import '../../../address_setup/presentation/widgets/current_location_button.dart';
import '../../../address_setup/presentation/widgets/minus_button.dart';
import '../../../address_setup/presentation/widgets/plus_button.dart';
import '../bloc/delivery_zones/delivery_zones_bloc.dart';

class DeliveryMap extends StatefulWidget {
  const DeliveryMap({
    super.key,
    required this.mapControllerCompleter,
  });

  final Completer<YandexMapController> mapControllerCompleter;

  @override
  State<DeliveryMap> createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  late YandexMapController _yandexMapController;
  late LocationPermission permission;
  final List<MapObject> mapObjects = [];
  final List<dynamic> polygons = [];
  final animation = const MapAnimation(
    type: MapAnimationType.smooth,
    duration: 0.5,
  );

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreate(YandexMapController controller) async {
    _yandexMapController = controller;
    widget.mapControllerCompleter.complete(controller);
    await _moveToCurrentLocation();
  }

  Future<void> _moveToCurrentLocation() async {
    await _yandexMapController.moveCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: Point(
            latitude: 55.7254,
            longitude: 52.4112,
          ),
          zoom: 10,
        ),
      ),
      animation: animation,
    );
  }

  Future<void> _moveToPoint(Point point) async {
    await _yandexMapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: point,
          zoom: 10,
        ),
      ),
      animation: animation,
    );
  }

  Future<void> _moveToPointBoundingBox(BoundingBox boundingBox) async {
    await _yandexMapController.moveCamera(
      CameraUpdate.newGeometry(Geometry.fromBoundingBox(boundingBox)),
      animation: animation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeliveryZonesBloc, DeliveryZonesState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (zones) {
            final List<MapObject> mapObjects = [];

            final List<Point> allPoints = [];

            Point point = const Point(latitude: 0, longitude: 0);

            zones.map((zone) {
              var polygons = phpDeserialize(zone.polygon);

              polygons.map((polygon) {
                List<Point> points = [];
                polygon.map((p1) {
                  point = Point(latitude: p1[1], longitude: p1[0]);
                  allPoints.add(point);
                  points.add(point);
                }).toList();

                mapObjects.add(
                  _getPolygonMapObject(
                    context,
                    points: points,
                    strokeColor: HexColor(zone.stroke),
                    fillColor: HexColor(zone.stroke)
                        .withOpacity(double.parse(zone.fillOpacity)),
                  ),
                );
              }).toList();
            }).toList();

            setState(() {
              mapObjects.addAll(mapObjects);
            });

            if (allPoints.isNotEmpty) {
              _moveToPointBoundingBox(getBounds(allPoints));
            }
          },
        );
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 367,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppStyles.radiusElement),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppStyles.radiusElement,
              ),
              child: Stack(
                children: [
                  YandexMap(
                    mapObjects: mapObjects,
                    onMapCreated: _onMapCreate,
                    gestureRecognizers: {
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      )
                    },
                  ),
                  Positioned(
                    right: 12,
                    top: (362) / 2 - (42 * 2),
                    child: Column(
                      children: [
                        PlusButton(
                          onPressed: () async {
                            await _yandexMapController.moveCamera(
                              CameraUpdate.zoomIn(),
                              animation: animation,
                            );
                          },
                        ),
                        Container(
                          width: 44,
                          height: 1,
                          color: AppColors.superLight,
                        ),
                        MinusButton(
                          onPressed: () async {
                            await _yandexMapController.moveCamera(
                              CameraUpdate.zoomOut(),
                              animation: animation,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 12,
                    child: CurrentLocationButton(
                      onPressed: () async {
                        await _moveToCurrentLocation();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PolygonMapObject _getPolygonMapObject(
    BuildContext context, {
    required List<Point> points,
    required Color strokeColor,
    required Color fillColor,
  }) {
    return PolygonMapObject(
      mapId: MapObjectId('${Random().nextInt(100000)}'),
      polygon: Polygon(
        // внешняя линия зоны
        outerRing: LinearRing(
          points: points,
        ),
        // внутренняя линия зоны, которая формирует пропуски в полигоне
        innerRings: const [],
      ),
      strokeColor: strokeColor,
      strokeWidth: 3.0,
      fillColor: fillColor,
    );
  }

  BoundingBox getBounds(List<Point> points) {
    final lngs = points.map<double>((m) => m.longitude).toList();
    final lats = points.map<double>((m) => m.latitude).toList();

    final highestLat = lats.reduce(max);
    final highestLng = lngs.reduce(max);
    final lowestLat = lats.reduce(min);
    final lowestLng = lngs.reduce(min);

    return BoundingBox(
      northEast: Point(latitude: highestLat, longitude: highestLng),
      southWest: Point(latitude: lowestLat, longitude: lowestLng),
    );
  }
}
