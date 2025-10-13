import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/core/resources/store.dart';
import 'package:monobox/core/widgets/warning_container.dart';
import 'package:monobox/features/address_setup/domain/entities/city_entity.dart';
import 'package:monobox/features/address_setup/presentation/bloc/geo_available/geo_available_bloc.dart';
import 'package:monobox/features/address_setup/presentation/bloc/geo_suggestion/geo_suggestion_cubit.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../config/routes/app_router.dart';
import '../../../../../injection_container.dart';
import '../../bloc/address_setup_state_cubit/address_setup_state_cubit.dart';
import '../../bloc/create_address/create_address_bloc.dart';
import '../../bloc/geolocate_address/geolocate_address_bloc.dart';
import '../../models/address_setup_state.dart';
import '../../widgets/current_location_button.dart';
import '../../widgets/minus_button.dart';
import '../../widgets/plus_button.dart';
import '../../widgets/your_address.dart';

@RoutePage()
class AddressMapPage extends StatefulWidget {
  const AddressMapPage({
    super.key,
    this.pageRoute,
    this.mode = '',
    this.address,
  });

  final PageInfo<void>? pageRoute;
  final String mode;
  final String? address;

  @override
  State<AddressMapPage> createState() => _AddressMapPageState();
}

class _AddressMapPageState extends State<AddressMapPage> {
  late YandexMapController _yandexMapController;
  late LocationPermission permission;
  Position? _userPosition;
  final List<MapObject> mapObjects = [];
  final animation = const MapAnimation(
    type: MapAnimationType.smooth,
    duration: 1.5,
  );

  bool dragged = false;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreate(YandexMapController controller) async {
    _yandexMapController = controller;
    await _moveToCurrentLocation();
    // if (widget.address?.isEmpty == true) {
    //   await _moveToCurrentLocation();
    // } else {
    //   getIt<GeoSuggestionCubit>().search(
    //     '',
    //     widget.address!,
    //   );
    // }
  }

  Future<void> _moveToCurrentLocation() async {
    await asyncInit();

    await _yandexMapController.moveCamera(
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

  void _onCameraPositionChanged(
      CameraPosition cameraPosition, CameraUpdateReason reason, bool finished) {
    if (finished) {
      setState(() {
        dragged = false;
      });
      getIt<GeolocateAddressBloc>().add(ResetGeolocateAddress());
      getIt<GeolocateAddressBloc>().add(GetGeolocateAddress(
        lat: cameraPosition.target.latitude,
        lon: cameraPosition.target.longitude,
      ));
    } else {
      setState(() {
        dragged = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<AddressSetupStateCubit>(),
        ),
        BlocProvider.value(
          value: getIt<CreateAddressBloc>(),
        ),
        BlocProvider.value(
          value: getIt<GeoAvailableBloc>(),
        ),
        BlocProvider.value(
          value: getIt<GeoSuggestionCubit>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GeoSuggestionCubit, GeoSuggestionState>(
            listener: (context, state) async {
              if (state.suggestions.isNotEmpty) {
                final suggestions = state.suggestions[0];
                if (suggestions.geoLat?.isNotEmpty == true) {
                  await _yandexMapController.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: Point(
                          latitude: double.parse(suggestions.geoLat!),
                          longitude: double.parse(suggestions.geoLon!),
                        ),
                        zoom: 16,
                      ),
                    ),
                    animation: animation,
                  );
                }
              }
            },
          ),
          BlocListener<GeolocateAddressBloc, GeolocateAddressState>(
            listener: (context, state) {
              if (state is GeolocateAddressDone) {
                context.read<AddressSetupStateCubit>().setStreet(
                      state.geolocateAddress!.value ?? '',
                      street2: state.geolocateAddress!.street ?? '',
                      lat: state.geolocateAddress!.lat,
                      lon: state.geolocateAddress!.lon,
                    );

                context.read<AddressSetupStateCubit>().setHouse(
                      state.geolocateAddress!.house ?? '',
                    );

                if (state.geolocateAddress?.city?.isNotEmpty == true) {
                  context.read<AddressSetupStateCubit>().setCity(CityEntity(
                        name: state.geolocateAddress?.city,
                      ));
                }
              }

              if (state is GeolocateAddressInitial) {
                context.read<AddressSetupStateCubit>().setStreet('');
              }
            },
          ),
          BlocListener<GeoAvailableBloc, GeoAvailableState>(
            listener: (context, state) {
              if (state is Success) {
                if (state.geoAvailable.status == 'success' ||
                    state.geoAvailable.filial?.cityId != null) {
                  print('cityId = ${state.geoAvailable.filial!.cityId}');
                  getIt<Store>().setCityId(state.geoAvailable.filial!.cityId);
                  context.read<AddressSetupStateCubit>().streetConfirm();
                } else if (state.geoAvailable.status == 'error' ||
                    (state.geoAvailable.status == 'success' &&
                        state.geoAvailable.filial?.cityId == null)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: Container(
                        padding: const EdgeInsets.all(12),
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
                          children: [
                            const WarningContainer(),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    state.geoAvailable.message ?? '',
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
              }
              if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: Container(
                      padding: const EdgeInsets.all(12),
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
                        children: [
                          const WarningContainer(),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  state.message,
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
        ],
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Scaffold(
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(0.0),
            //   child: AppBar(
            //     systemOverlayStyle: SystemUiOverlayStyle(
            //       // Status bar color
            //       statusBarColor: Colors.transparent,

            //       // Status bar brightness (optional)
            //       statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            //       statusBarBrightness: Brightness.light, // For iOS (dark icons)
            //     ),
            //   ),
            // ),
            body: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        YandexMap(
          mapObjects: mapObjects,
          onMapCreated: _onMapCreate,
          onCameraPositionChanged: _onCameraPositionChanged,
        ),
        // SafeArea(
        //   child: Align(
        //     alignment: Alignment.topRight,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 16),
        //       child: SkipButton(
        //         onPressed: widget.mode == 'back'
        //             ? () {
        //                 getIt<AddressSetupStateCubit>().clear();
        //                 context.router.removeLast();
        //               }
        //             : null,
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - (56),
          left: 0,
          right: 0,
          child: AnimatedContainer(
            width: 56 * (dragged ? .8 : 1),
            height: 56 * (dragged ? .8 : 1),
            duration: const Duration(milliseconds: 300),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/location.svg',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              bottom: 20.0,
              left: 8.0,
            ),
            child: BlocBuilder<AddressSetupStateCubit, AddressSetupState>(
              builder: (context, state) {
                return YourAddress(
                  address: widget.address,
                  inputDetails: state.streetConfirm,
                  onPressed: () {
                    if (getIt<AuthBloc>().state ==
                        const AuthState.authenticated()) {
                      getIt<AddressSetupStateCubit>().clear();
                    }

                    if (widget.mode == 'back') {
                      context.router.removeLast();
                    } else {
                      AutoRouter.of(context).replace(const HomeRoute());
                    }
                  },
                  onPressedManualyButton: () {
                    getIt<GeolocateAddressBloc>().add(ResetGeolocateAddress());
                    AutoRouter.of(context).push(
                      CityManualyRoute(mode: widget.mode),
                    );
                  },
                );
              },
            ),
          ),
        ),
        BlocBuilder<AddressSetupStateCubit, AddressSetupState>(
          builder: (context, state) {
            if (state.streetConfirm) {
              return Container();
            }
            return Positioned(
              right: AppStyles.labelMediumSize,
              //top: MediaQuery.of(context).size.height / 2 - 42 * 2,
              bottom: 240 - 30,
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
                  AppStyles.mediumVGap,
                  CurrentLocationButton(
                    onPressed: () async {
                      await _moveToCurrentLocation();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
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
      getIt<GeolocateAddressBloc>().add(GetGeolocateAddress(
        lat: currentPosition.latitude,
        lon: currentPosition.longitude,
      ));
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
    _userPosition = await _determinePosition();
  }
}
