import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/core/resources/store.dart';
import 'package:monobox/core/widgets/warning_container.dart';
import 'package:monobox/features/address_setup/domain/repository/geo_repository.dart';
import 'package:monobox/features/address_setup/presentation/bloc/geo_available/geo_available_bloc.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../core/widgets/text_area.dart';
import '../../../../injection_container.dart';
import '../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../../domain/entities/address_create_entity.dart';
import '../../domain/entities/geo_suggestion_entity.dart';
import '../bloc/address_setup_state_cubit/address_setup_state_cubit.dart';
import '../bloc/cities_bloc/cities_bloc.dart';
import '../bloc/create_address/create_address_bloc.dart';
import '../bloc/geo_suggestion/geo_suggestion_cubit.dart';
import '../models/address_setup_state.dart';
import '../widgets/back_button.dart';
import '../widgets/skip_button.dart';

@RoutePage()
class AddressManualyPage extends StatefulWidget {
  const AddressManualyPage({
    super.key,
    this.mode = '',
  });

  final String mode;

  @override
  State<AddressManualyPage> createState() => _AddressManualyPageState();
}

class _AddressManualyPageState extends State<AddressManualyPage> {
  late TextEditingController streetTextController;
  late TextEditingController houseTextController;
  late TextEditingController flatTextController;
  late TextEditingController floorTextController;
  late TextEditingController entryTextController;
  late TextEditingController domofonTextController;
  late TextEditingController commentTextController;
  late SuggestionsController<GeoSuggestionEntity> suggestionsController;

  @override
  void initState() {
    final state = getIt<AddressSetupStateCubit>().state;
    streetTextController = TextEditingController()
      ..text = state.address?.street ?? ''
      ..addListener(_addressControllerListener);
    houseTextController = TextEditingController()
      ..text = state.address?.house ?? ''
      ..addListener(_addressControllerListener);
    flatTextController = TextEditingController()
      ..text = state.address?.flat ?? ''
      ..addListener(_addressControllerListener);
    floorTextController = TextEditingController()
      ..text = state.address?.floor ?? ''
      ..addListener(_addressControllerListener);
    entryTextController = TextEditingController()
      ..text = state.address?.entry ?? ''
      ..addListener(_addressControllerListener);
    domofonTextController = TextEditingController()
      ..text = state.address?.domofon ?? ''
      ..addListener(_addressControllerListener);
    commentTextController = TextEditingController()
      ..text = state.address?.comment ?? ''
      ..addListener(_addressControllerListener);
    super.initState();
    suggestionsController = SuggestionsController();
  }

  @override
  void dispose() {
    streetTextController.removeListener(_addressControllerListener);
    streetTextController.dispose();
    houseTextController.removeListener(_addressControllerListener);
    houseTextController.dispose();
    flatTextController.removeListener(_addressControllerListener);
    flatTextController.dispose();
    floorTextController.removeListener(_addressControllerListener);
    floorTextController.dispose();
    entryTextController.removeListener(_addressControllerListener);
    entryTextController.dispose();
    domofonTextController.removeListener(_addressControllerListener);
    domofonTextController.dispose();
    commentTextController.removeListener(_addressControllerListener);
    commentTextController.dispose();
    suggestionsController.dispose();

    super.dispose();
  }

  void _addressControllerListener() {
    final cubit = getIt<AddressSetupStateCubit>();
    cubit.setStreet(streetTextController.text);
    cubit.setHouse(houseTextController.text);
    cubit.setFlat(flatTextController.text);
    cubit.setFloor(floorTextController.text);
    cubit.setEntry(entryTextController.text);
    cubit.setDomofon(domofonTextController.text);
    cubit.setComment(commentTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CitiesBloc>()..add(const GetCities()),
        ),
        BlocProvider.value(
          value: getIt<AddressSetupStateCubit>(),
        ),
        BlocProvider.value(
          value: getIt<GeoAvailableBloc>(),
        ),
        BlocProvider.value(
          value: getIt<GeoSuggestionCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.lightPrimary,
          appBar: _buildAppBar(),
          body: _buildBody(context),
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context) {
    final AddressSetupStateCubit addressCubit =
        context.watch<AddressSetupStateCubit>();
    return BlocListener<GeoAvailableBloc, GeoAvailableState>(
      listener: (context, state) {
        if (state is Success) {
          if (state.geoAvailable.status == 'success' ||
              state.geoAvailable.filial?.cityId != null) {
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
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * .65,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppStyles.mediumRadius),
              topRight: Radius.circular(AppStyles.mediumRadius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppStyles.smallVGap,
                  Text(
                    'Введите свой адрес',
                    style: AppStyles.title3,
                    textAlign: TextAlign.center,
                  ),
                  AppStyles.xsmallVGap,
                  Text(
                    addressCubit.state.address?.city?.name ?? '',
                    style: AppStyles.callout.copyWith(color: AppColors.gray),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: [
                      AppStyles.xxsmall20VGap,
                      BlocBuilder<GeoSuggestionCubit, GeoSuggestionState>(
                        builder: (context, state) {
                          return TypeAheadField<GeoSuggestionEntity>(
                            debounceDuration: const Duration(milliseconds: 300),
                            controller: streetTextController,
                            suggestionsController: suggestionsController,
                            itemBuilder: (BuildContext context,
                                GeoSuggestionEntity suggestion) {
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
                            onSelected: (GeoSuggestionEntity value) {
                              if (value.street?.isNotEmpty == true) {
                                //streetTextController.text = value.value!;
                                streetTextController.text =
                                    (value.streetType?.isNotEmpty == true
                                            ? '${value.streetType} '
                                            : '') +
                                        value.street!;
                              }

                              if (value.house?.isNotEmpty == true) {
                                houseTextController.text = value.house!;
                              }

                              if (value.geoLat?.isNotEmpty == true) {
                                getIt<GeoAvailableBloc>().add(
                                  GeoAvailableEvent.getAvailable(
                                    double.parse(value.geoLat!),
                                    double.parse(value.geoLon!),
                                  ),
                                );
                              }
                            },
                            suggestionsCallback: (String search) async {
                              if (search.length < 2) {
                                return [];
                              }
                              final String city =
                                  getIt<AddressSetupStateCubit>()
                                          .state
                                          .address
                                          ?.city
                                          ?.name ??
                                      '';

                              final GeoRepository repository =
                                  getIt<GeoRepository>();

                              final DataState<List<GeoSuggestionEntity>>
                                  result =
                                  await repository.geoSuggestion(city, search);

                              //getIt<GeoSuggestionCubit>().search(city, search);
                              //return getIt<GeoSuggestionCubit>().state.suggestions;

                              return result.data!;
                            },
                            builder: (context, controller, focusNode) {
                              return BlocBuilder<AddressSetupStateCubit,
                                  AddressSetupState>(
                                builder: (context, state) {
                                  return InputText(
                                    autofocus: false,
                                    focusNode: focusNode,
                                    controller: streetTextController,
                                    label: 'Улица*',
                                    hintStyle: AppStyles.subhead.copyWith(
                                      color: AppColors.gray,
                                    ),
                                    readOnly:
                                        state.address?.city?.name?.isNotEmpty ==
                                                true
                                            ? false
                                            : true,
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
                          );
                        },
                      ),
                      // InputText(
                      //   label: 'Улица*',
                      //   controller: streetTextController,
                      // ),
                      AppStyles.xsmall12VGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InputText(
                              label: 'Дом*',
                              controller: houseTextController,
                            ),
                          ),
                          AppStyles.xxsmall12HGap,
                          Expanded(
                            child: InputText(
                              label: 'Квартира',
                              controller: flatTextController,
                            ),
                          ),
                        ],
                      ),
                      AppStyles.xsmall12VGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InputText(
                              label: 'Этаж',
                              controller: floorTextController,
                            ),
                          ),
                          AppStyles.xxsmall12HGap,
                          Expanded(
                            child: InputText(
                              label: 'Подъезд',
                              controller: entryTextController,
                            ),
                          ),
                          AppStyles.xxsmall12HGap,
                          Expanded(
                            child: InputText(
                              label: 'Домофон',
                              controller: domofonTextController,
                            ),
                          ),
                        ],
                      ),
                      AppStyles.xxsmall20VGap,
                      BlocBuilder<AddressSetupStateCubit, AddressSetupState>(
                        builder: (context, state) {
                          return Visibility(
                            visible:
                                getIt<AddressSetupStateCubit>().allowToSave(),
                            child: TextArea(
                              maxLength: 70,
                              maxLines: 3,
                              controller: commentTextController,
                            ),
                          );
                        },
                      ),
                      AppStyles.small28VGap,
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 46,
                              child: ElevatedButton(
                                onPressed: () {
                                  AutoRouter.of(context).push(
                                    AddressMapRoute(),
                                  );
                                },
                                style: AppStyles.greyElevatedButton,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Найти на карте',
                                      style: AppStyles.footnoteBold.copyWith(
                                        color: AppColors.darkPrimary,
                                      ),
                                    ),
                                    AppStyles.xxsmallHGap,
                                    SvgPicture.asset(
                                      'assets/icons/nav_top.svg',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AppStyles.xxsmall12HGap,
                          Expanded(
                            child: SizedBox(
                              height: 46,
                              child: BlocBuilder<AddressSetupStateCubit,
                                  AddressSetupState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: getIt<AddressSetupStateCubit>()
                                            .allowToSave()
                                        ? () {
                                            if (getIt<AuthBloc>().state ==
                                                const AuthState
                                                    .authenticated()) {
                                              getIt<CreateAddressBloc>().add(
                                                CreateAddressEvent.addAddress(
                                                    AddressCreateEntity(
                                                  city: addressCubit
                                                          .state
                                                          .address
                                                          ?.city
                                                          ?.name ??
                                                      '',
                                                  title:
                                                      streetTextController.text,
                                                  street:
                                                      streetTextController.text,
                                                  house:
                                                      houseTextController.text,
                                                  appartment:
                                                      flatTextController.text,
                                                  floor:
                                                      floorTextController.text,
                                                  entrance:
                                                      entryTextController.text,
                                                  domofon: domofonTextController
                                                      .text,
                                                  latitude: context
                                                      .read<
                                                          AddressSetupStateCubit>()
                                                      .state
                                                      .address!
                                                      .lat,
                                                  longitude: context
                                                      .read<
                                                          AddressSetupStateCubit>()
                                                      .state
                                                      .address!
                                                      .lon,
                                                  cityId: getIt<Store>().cityId,
                                                  comment: commentTextController
                                                      .text,
                                                )),
                                              );
                                            }

                                            if (widget.mode == 'back') {
                                              AutoRouter.of(context).replaceAll(
                                                  [const MyAddressesRoute()]);
                                              getIt<AddressSetupStateCubit>()
                                                  .clear();
                                            } else if (widget.mode == 'order') {
                                              AutoRouter.of(context)
                                                  .replaceAll([
                                                CreateOrderRoute(
                                                  basket: (context
                                                          .read<BasketBloc>()
                                                          .state as BasketLoaded)
                                                      .basket,
                                                )
                                              ]);
                                              getIt<AddressSetupStateCubit>()
                                                  .clear();
                                            } else {
                                              AutoRouter.of(context).replaceAll(
                                                  [const HomeRoute()]);
                                            }
                                          }
                                        : null,
                                    //style: AppStyles.greyElevatedButton,
                                    child: Center(
                                      child: Text(
                                        'Ввести',
                                        style: AppStyles.footnoteBold
                                            .copyWith(color: AppColors.white),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppStyles.small28VGap,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackButton(),
          SkipButton(),
        ],
      ),
    );
  }
}
