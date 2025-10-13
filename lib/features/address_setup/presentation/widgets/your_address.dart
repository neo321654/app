import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/core/resources/store.dart';
import 'package:monobox/features/address_setup/presentation/bloc/geo_available/geo_available_bloc.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:monobox/features/home/presentation/bloc/cities/cities_bloc.dart';

import '../../../../config/themes/colors.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/address_create_entity.dart';
import '../bloc/address_setup_state_cubit/address_setup_state_cubit.dart';
import '../bloc/create_address/create_address_bloc.dart';
import '../models/address_setup_state.dart';
import 'bottom_container.dart';
import 'set_address_manualy_button.dart';

class YourAddress extends StatefulWidget {
  const YourAddress({
    super.key,
    required this.inputDetails,
    required this.onPressed,
    required this.onPressedManualyButton,
    this.address,
  });

  final bool inputDetails;
  final String? address;
  final void Function() onPressed;
  final void Function() onPressedManualyButton;

  @override
  State<YourAddress> createState() => _YourAddressState();
}

class _YourAddressState extends State<YourAddress> {
  late TextEditingController appartmentController;
  late TextEditingController floorController;
  late TextEditingController entranceController;
  late TextEditingController domofonController;

  @override
  void initState() {
    appartmentController = TextEditingController();
    floorController = TextEditingController();
    entranceController = TextEditingController();
    domofonController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    appartmentController.dispose();
    floorController.dispose();
    entranceController.dispose();
    domofonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.inputDetails) {
      return TapRegion(
        onTapOutside: (tap) {
          context.read<AddressSetupStateCubit>().streetNotConfirm();
        },
        child: BottomContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Уточните адрес',
                      style: AppStyles.title3
                          .copyWith(letterSpacing: -.4, fontSize: 18),
                    ),
                  ),
                  AppStyles.xxsmallHGap,
                  Expanded(
                    child: Text(
                      context
                              .read<AddressSetupStateCubit>()
                              .state
                              .address!
                              .street ??
                          '',
                      style: AppStyles.footnote,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              AppStyles.xxsmall20VGap,
              InputText(
                label: 'Квартира',
                controller: appartmentController,
              ),
              AppStyles.xxsmallVGap,
              Row(
                children: [
                  Expanded(
                    child: InputText(
                      label: 'Этаж',
                      controller: floorController,
                    ),
                  ),
                  AppStyles.xxsmall12HGap,
                  Expanded(
                    child: InputText(
                      label: 'Подъезд',
                      controller: entranceController,
                    ),
                  ),
                  AppStyles.xxsmall12HGap,
                  Expanded(
                    child: InputText(
                      label: 'Домофон',
                      controller: domofonController,
                    ),
                  ),
                ],
              ),
              AppStyles.smallVGap,
              SizedBox(
                width: double.infinity,
                height: 52,
                child: BlocBuilder<CreateAddressBloc, CreateAddressState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.maybeWhen(
                        orElse: () => () {
                          if (getIt<AuthBloc>().state ==
                              const AuthState.authenticated()) {
                            int? cityId = getIt<Store>().cityId;
                            String cityName = '';
                            getIt<CitiesBloc>().state.maybeWhen(
                                  success: (cities) {
                                    cities.map((city) {
                                      if (city.name ==
                                          context
                                              .read<AddressSetupStateCubit>()
                                              .state
                                              .address
                                              ?.city
                                              ?.name) {
                                        cityId = city.id;
                                        cityName = city.name;
                                      }
                                    }).toList();
                                  },
                                  orElse: () => null,
                                );
                            getIt<CreateAddressBloc>().add(
                              CreateAddressEvent.addAddress(AddressCreateEntity(
                                title: context
                                        .read<AddressSetupStateCubit>()
                                        .state
                                        .address!
                                        .street ??
                                    '',
                                street: context
                                        .read<AddressSetupStateCubit>()
                                        .state
                                        .address!
                                        .street2 ??
                                    context
                                        .read<AddressSetupStateCubit>()
                                        .state
                                        .address!
                                        .street ??
                                    '',
                                house: context
                                    .read<AddressSetupStateCubit>()
                                    .state
                                    .address!
                                    .house,
                                appartment: appartmentController.text,
                                floor: floorController.text,
                                entrance: entranceController.text,
                                domofon: domofonController.text,
                                latitude: context
                                    .read<AddressSetupStateCubit>()
                                    .state
                                    .address!
                                    .lat,
                                longitude: context
                                    .read<AddressSetupStateCubit>()
                                    .state
                                    .address!
                                    .lon,
                                cityId: cityId,
                                city: cityName,
                              )),
                            );
                          }

                          widget.onPressed();
                        },
                        saving: () => null,
                      ),
                      child: state.maybeMap(
                        saving: (value) => const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 2,
                          ),
                        ),
                        orElse: () => const Text(
                          'Сохранить',
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SetAddressManualyButton(
          onPressed: widget.onPressedManualyButton,
        ),
        const SizedBox(
          height: 29,
        ),
        BottomContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ваш адрес',
                style: AppStyles.callout.copyWith(
                  color: AppColors.gray,
                ),
              ),
              BlocBuilder<AddressSetupStateCubit, AddressSetupState>(
                builder: (context, state) {
                  return Text(
                    state.address?.street?.isNotEmpty == true
                        ? state.address!.street!
                        : (widget.address ?? '…'),
                    style: AppStyles.title3,
                  );
                },
              ),
              AppStyles.xxsmallVGap,
              SizedBox(
                width: double.infinity,
                height: 52,
                child: BlocBuilder<GeoAvailableBloc, GeoAvailableState>(
                  builder: (context, geoAvailableState) {
                    return BlocBuilder<AddressSetupStateCubit,
                        AddressSetupState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed:
                              state.address?.street?.isNotEmpty == true &&
                                      (geoAvailableState is! Loading)
                                  ? () {
                                      //state.address?.street?.isNotEmpty == true ? () => context.read<AddressSetupStateCubit>().streetConfirm() : null;
                                      if (state.address?.lat != null) {
                                        getIt<GeoAvailableBloc>().add(
                                          GeoAvailableEvent.getAvailable(
                                            state.address!.lat!,
                                            state.address!.lon!,
                                          ),
                                        );
                                      } else {
                                        context
                                            .read<AddressSetupStateCubit>()
                                            .streetConfirm();
                                      }
                                    }
                                  : null,
                          child: const Text(
                            'Верно',
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
