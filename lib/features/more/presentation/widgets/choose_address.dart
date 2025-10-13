import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/features/home/domain/entities/city_entity.dart';
import 'package:monobox/features/home/presentation/bloc/filials/filials_bloc.dart';
import 'package:monobox/features/more/presentation/bloc/cubit/shop_location_state_cubit.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../injection_container.dart';
import '../../../address_setup/domain/entities/geo_suggestion_entity.dart';
import '../../../address_setup/presentation/bloc/address_setup_state_cubit/address_setup_state_cubit.dart';
import '../../../address_setup/presentation/bloc/geo_suggestion/geo_suggestion_cubit.dart';
import '../../../address_setup/presentation/bloc/geolocate_address/geolocate_address_bloc.dart';
import '../../../address_setup/presentation/models/address_setup_state.dart';

class ChooseAddress extends StatefulWidget {
  const ChooseAddress({
    super.key,
    required this.mapControllerCompleter,
  });

  final Completer<YandexMapController> mapControllerCompleter;

  @override
  State<ChooseAddress> createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {
  late SuggestionsController<GeoSuggestionEntity> suggestionsController;
  late TextEditingController searchController;
  late LocationPermission permission;

  @override
  void initState() {
    suggestionsController = SuggestionsController();
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    suggestionsController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GeoSuggestionCubit, GeoSuggestionState>(
      listener: (context, state) {
        suggestionsController.suggestions = state.suggestions;
      },
      child: RoundedContainer(
        child: Column(
          children: [
            Text(
              'Выберите свой адрес и мы покажем самые близкие к вам заведения',
              style: AppStyles.callout,
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () async {
                //context.read<GeolocateAddressBloc>().add(ResetGeolocateAddress());
                final city = await AutoRouter.of(context).push(
                  CityManualyRoute(mode: 'city'),
                );
                if (city != null) {
                  context
                      .read<ShopLocationStateCubit>()
                      .setCity(city as CityEntity);
                }
              },
              child: Container(
                height: 48,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 12,
                  bottom: 10,
                  left: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppStyles.radiusElement,
                    ),
                  ),
                  color: AppColors.lightScaffoldBackground,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<ShopLocationStateCubit,
                          ShopLocationStateState>(
                        builder: (context, shopLocationState) {
                          return BlocBuilder<GeolocateAddressBloc,
                              GeolocateAddressState>(
                            builder: (context, geolocateState) {
                              return BlocBuilder<AddressSetupStateCubit,
                                  AddressSetupState>(
                                builder: (context, state) {
                                  return Expanded(
                                    child: Text(
                                      shopLocationState.city?.name ??
                                          geolocateState
                                              .geolocateAddress?.city ??
                                          state.address?.city?.name ??
                                          'Город',
                                      style: AppStyles.subheadBold.copyWith(
                                        color: AppColors.gray,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.46,
                          vertical: 10.21,
                        ),
                        width: 28,
                        height: 28,
                        child: SvgPicture.asset(
                          'assets/icons/arrow_down.svg',
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TypeAheadField<GeoSuggestionEntity>(
                    controller: searchController,
                    suggestionsController: suggestionsController,
                    itemBuilder:
                        (BuildContext context, GeoSuggestionEntity suggestion) {
                      return SizedBox(
                        height: 40,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Text(
                              suggestion.value ?? '',
                              style: AppStyles.subhead.copyWith(
                                color: AppColors.darkGray,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    onSelected: (GeoSuggestionEntity value) async {
                      FocusManager.instance.primaryFocus?.unfocus();

                      if (value.street?.isNotEmpty == true) {
                        searchController.text = value.value!;
                        if (value.geoLat?.isNotEmpty == true &&
                            value.geoLon?.isNotEmpty == true) {
                          getIt<FilialsBloc>().add(FilialsEvent.searchFilials(
                            lat: double.parse(value.geoLat!),
                            lon: double.parse(value.geoLon!),
                          ));
                          context
                              .read<ShopLocationStateCubit>()
                              .setGeoSuggestion(value);
                          if (context
                                  .read<ShopLocationStateCubit>()
                                  .state
                                  .showMode ==
                              'map') {
                            (await widget.mapControllerCompleter.future)
                                .moveCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: Point(
                                    latitude: double.parse(value.geoLat!),
                                    longitude: double.parse(value.geoLon!),
                                  ),
                                  zoom: 9,
                                ),
                              ),
                              animation: const MapAnimation(
                                type: MapAnimationType.smooth,
                                duration: 0.5,
                              ),
                            );
                          }
                        }
                      }
                    },
                    suggestionsCallback: (String street) async {
                      if (street.length < 2) return [];
                      final city = context
                              .read<ShopLocationStateCubit>()
                              .state
                              .city
                              ?.name ??
                          '';
                      if (city.isEmpty) {
                        return [];
                      }
                      context.read<GeoSuggestionCubit>().search(city, street);
                      return context
                          .read<GeoSuggestionCubit>()
                          .state
                          .suggestions;
                    },
                    builder: (context, controller, focusNode) {
                      return BlocBuilder<AddressSetupStateCubit,
                          AddressSetupState>(
                        builder: (context, state) {
                          return InputText(
                            autofocus: false,
                            focusNode: focusNode,
                            controller: controller,
                            hintText: 'Улица',
                            hintStyle: AppStyles.subhead.copyWith(
                              color: AppColors.gray,
                            ),
                            /*readOnly: state.address?.city?.name?.isNotEmpty == true ? false : true,*/
                            //onSubmitted: (text) => _makeSearch(text),
                          );
                        },
                      );
                    },
                    decorationBuilder: (context, child) {
                      return Material(
                        type: MaterialType.card,
                        elevation: 0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            AppStyles.btnRadius,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        color: AppColors.lightGray,
                        child: child,
                      );
                    },
                    hideOnEmpty: true,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    var userPosition = await _determinePosition();
                    if (userPosition != null) {
                      getIt<FilialsBloc>().add(FilialsEvent.searchFilials(
                        lat: userPosition.latitude,
                        lon: userPosition.longitude,
                      ));

                      // ignore: use_build_context_synchronously
                      if (context
                              .read<ShopLocationStateCubit>()
                              .state
                              .showMode ==
                          'map') {
                        (await widget.mapControllerCompleter.future).moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: Point(
                                latitude: userPosition.latitude,
                                longitude: userPosition.longitude,
                              ),
                              zoom: 10,
                            ),
                          ),
                          animation: const MapAnimation(
                            type: MapAnimationType.smooth,
                            duration: 0.5,
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    height: 46,
                    width: 46,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          AppStyles.radiusElement,
                        ),
                      ),
                      color: AppColors.superLight,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.25,
                        vertical: 3.25,
                      ),
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/icons/nav_top.svg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
}
