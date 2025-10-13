import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:monobox/injection_container.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../config/themes/colors.dart';
import '../../../address_setup/presentation/widgets/current_location_button.dart';
import '../../../address_setup/presentation/widgets/minus_button.dart';
import '../../../address_setup/presentation/widgets/plus_button.dart';
import '../../domain/entities/shop_entity.dart';
import '../bloc/cubit/shop_location_state_cubit.dart';
import 'shop_card.dart';

class ShopsMap extends StatefulWidget {
  const ShopsMap({
    super.key,
    required this.shops,
    required this.mapControllerCompleter,
  });

  final List<ShopEntity> shops;
  final Completer<YandexMapController> mapControllerCompleter;

  @override
  State<ShopsMap> createState() => _ShopsMapState();
}

class _ShopsMapState extends State<ShopsMap> {
  late YandexMapController yandexMapController;
  late LocationPermission permission;
  Position? _userPosition;
  final List<MapObject> mapObjects = [];
  final animation = const MapAnimation(
    type: MapAnimationType.smooth,
    duration: 0.5,
  );

  ShopEntity? selectedShop;

  final key1 = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreate(YandexMapController controller) async {
    widget.mapControllerCompleter.complete(controller);
    yandexMapController = controller;
    await asyncInit();

    //await _moveToCurrentLocation();
  }

  Future<void> _moveToCurrentLocation() async {
    await yandexMapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: _userPosition!.latitude,
            longitude: _userPosition!.longitude,
          ),
          zoom: 16,
        ),
      ),
      animation: animation,
    );
  }

  Future<void> _moveToPoint(Point point) async {
    await yandexMapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: point,
          zoom: 9,
        ),
      ),
      animation: animation,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShopLocationStateCubit>();

    if (selectedShop != null) {
      cubit.showShopMap(selectedShop!);
    } else {
      if (widget.shops.isNotEmpty) {
        cubit.showShopMap(widget.shops[0]);
      }

      //_moveToPoint(Point(latitude: widget.shops[0].lat, longitude: widget.shops[0].lon));
    }

    return BlocListener<ShopLocationStateCubit, ShopLocationStateState>(
      listener: (context, state) async {
        if (state.shops.isNotEmpty) {
          await _moveToPoint(
            Point(
              latitude: state.shops[0].lat,
              longitude: state.shops[0].lon,
            ),
          );
        }

        // state.shops.map((shop) {
        //   mapObjects.clear();
        //   mapObjects.add(PlacemarkMapObject(
        //     mapId: MapObjectId('shop_icon${shop.id}'),
        //     point: Point(
        //       latitude: shop.lat,
        //       longitude: shop.lon,
        //     ),
        //     onTap: (PlacemarkMapObject self, Point point) {
        //       setState(() {
        //         selectedShop = shop;
        //       });

        //       Future.delayed(
        //         const Duration(milliseconds: 100),
        //         () {
        //           Scrollable.ensureVisible(
        //             key1.currentContext!,
        //             duration: const Duration(
        //               milliseconds: 1500,
        //             ),
        //           );
        //         },
        //       );
        //     },
        //     opacity: 1,
        //     //isDraggable: true,
        //     // onDragStart: (_) => print('Drag start'),
        //     // onDrag: (_, Point point) => print('Drag at point $point'),
        //     // onDragEnd: (_) => print('Drag end'),
        //     icon: PlacemarkIcon.single(
        //       PlacemarkIconStyle(
        //         image: BitmapDescriptor.fromAssetImage('assets/images/shop_icon5.png'),
        //         rotationType: RotationType.rotate,
        //         scale: .05,
        //         anchor: const Offset(.5, 1),
        //       ),
        //     ),
        //     // text: const PlacemarkText(
        //     //   text: 'Point',
        //     //   style: PlacemarkTextStyle(
        //     //       placement: TextStylePlacement.top,
        //     //       color: Colors.amber,
        //     //       outlineColor: Colors.black),
        //     // ),
        //   ));
        // }).toList();
      },
      listenWhen: (previous, current) => previous.shops != current.shops,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 362,
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
                  BlocBuilder<ShopLocationStateCubit, ShopLocationStateState>(
                    builder: (context, state) {
                      return YandexMap(
                        mapObjects: mapObjects,
                        onMapCreated: _onMapCreate,
                        gestureRecognizers: {
                          Factory<OneSequenceGestureRecognizer>(
                            () => EagerGestureRecognizer(),
                          )
                        },
                      );
                    },
                  ),
                  Positioned(
                    right: 12,
                    top: (362) / 2 - (42 * 2),
                    child: Column(
                      children: [
                        PlusButton(
                          onPressed: () async {
                            await yandexMapController.moveCamera(
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
                            await yandexMapController.moveCamera(
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
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ShopLocationStateCubit, ShopLocationStateState>(
            builder: (context, state) {
              if (state.showShopMap != null) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightScaffoldBackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppStyles.radiusElement),
                    ),
                  ),
                  child: ShopCard(key: key1, shop: state.showShopMap!),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (!serviceEnabled) return null;
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        return null;
      }
    }
    try {
      final currentPosition = await Geolocator.getCurrentPosition();
      // getIt<GeolocateAddressBloc>().add(GetGeolocateAddress(
      //   lat: currentPosition.latitude,
      //   lon: currentPosition.longitude,
      // ));
      return currentPosition;
    } catch (_) {
      return Position(
        longitude: 37.620393,
        latitude: 55.75396,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      );
    }
  }

  Future<void> asyncInit() async {
    Point? userPoint;
    if (context.read<ShopLocationStateCubit>().state.geoSuggestion != null) {
      userPoint = Point(
        latitude: double.parse(context
            .read<ShopLocationStateCubit>()
            .state
            .geoSuggestion!
            .geoLat!),
        longitude: double.parse(context
            .read<ShopLocationStateCubit>()
            .state
            .geoSuggestion!
            .geoLon!),
      );

      await _moveToPoint(userPoint);
    } else if (widget.shops.isNotEmpty) {
      final shop = (getIt<AuthBloc>().store.cityId != null)
          ? widget.shops.firstWhere(
              (element) => element.cityId == getIt<AuthBloc>().store.cityId,
            )
          : widget.shops[0];
      await _moveToPoint(
        Point(
          latitude: shop.lat,
          longitude: shop.lon,
        ),
      );
    } else {
      _userPosition = await _determinePosition();
      if (_userPosition != null) {
        await _moveToPoint(Point(
            latitude: _userPosition!.latitude,
            longitude: _userPosition!.longitude));

        final mapObject = PlacemarkMapObject(
          mapId: const MapObjectId('user_icon'),
          point: userPoint ??
              Point(
                latitude: _userPosition!.latitude,
                longitude: _userPosition!.longitude,
              ),
          onTap: (PlacemarkMapObject self, Point point) =>
              print('Tapped me at $point'),
          opacity: 1,
          //isDraggable: true,
          onDragStart: (_) => print('Drag start'),
          onDrag: (_, Point point) => print('Drag at point $point'),
          onDragEnd: (_) => print('Drag end'),
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image:
                  BitmapDescriptor.fromAssetImage('assets/images/Location.png'),
              rotationType: RotationType.rotate,
              scale: 2,
              anchor: const Offset(.5, 1),
            ),
          ),
          // text: const PlacemarkText(
          //   text: 'Point',
          //   style: PlacemarkTextStyle(
          //       placement: TextStylePlacement.top,
          //       color: Colors.amber,
          //       outlineColor: Colors.black),
          // ),
        );

        mapObjects.add(mapObject);
      }
    }

    widget.shops.map((shop) {
      mapObjects.add(PlacemarkMapObject(
        mapId: MapObjectId('shop_icon${shop.id}'),
        point: Point(
          latitude: shop.lat,
          longitude: shop.lon,
        ),
        onTap: (PlacemarkMapObject self, Point point) {
          setState(() {
            selectedShop = shop;
          });

          Future.delayed(
            const Duration(milliseconds: 100),
            () {
              Scrollable.ensureVisible(
                key1.currentContext!,
                duration: const Duration(
                  milliseconds: 1500,
                ),
              );
            },
          );
        },
        opacity: 1,
        //isDraggable: true,
        // onDragStart: (_) => print('Drag start'),
        // onDrag: (_, Point point) => print('Drag at point $point'),
        // onDragEnd: (_) => print('Drag end'),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image:
                BitmapDescriptor.fromAssetImage('assets/images/shop_icon5.png'),
            rotationType: RotationType.rotate,
            scale: .05,
            anchor: const Offset(.5, 1),
          ),
        ),
        // text: const PlacemarkText(
        //   text: 'Point',
        //   style: PlacemarkTextStyle(
        //       placement: TextStylePlacement.top,
        //       color: Colors.amber,
        //       outlineColor: Colors.black),
        // ),
      ));
    }).toList();

    setState(() {});
  }
}
