import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../injection_container.dart';
import '../../../address_setup/domain/entities/geo_suggestion_entity.dart';
import '../../../address_setup/presentation/bloc/address_setup_state_cubit/address_setup_state_cubit.dart';
import '../../../address_setup/presentation/bloc/geo_suggestion/geo_suggestion_cubit.dart';
import '../../../address_setup/presentation/models/address_setup_state.dart';
import '../bloc/delivery_zones/delivery_zones_bloc.dart';
import '../widgets/delivery_legend.dart';
import '../widgets/delivery_map.dart';

@RoutePage()
class AboutDeliveryPage extends StatefulWidget {
  const AboutDeliveryPage({super.key});

  @override
  State<AboutDeliveryPage> createState() => _AboutDeliveryPageState();
}

class _AboutDeliveryPageState extends State<AboutDeliveryPage> {
  late SuggestionsController<GeoSuggestionEntity> suggestionsController;
  late TextEditingController searchController;
  final mapControllerCompleter = Completer<YandexMapController>();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<DeliveryZonesBloc>()
            ..add(const DeliveryZonesEvent.getZones()),
        ),
        BlocProvider.value(
          value: getIt<AddressSetupStateCubit>(),
        ),
        BlocProvider.value(
          value: getIt<GeoSuggestionCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.white.withOpacity(.05),
              blurRadius: 8.0,
              offset: const Offset(
                0.0,
                4.0,
              ),
            )
          ],
        ),
        child: AppBar(
          elevation: 0.0,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          titleSpacing: 0,
          leadingWidth: (32 + 16),
          leading: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => context.popRoute(),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 17.33,
                      height: 12.67,
                      child: SvgPicture.asset(
                        'assets/icons/arrow_back_android.svg',
                        width: 17.33,
                        height: 5,
                        colorFilter: const ColorFilter.mode(
                          AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'О доставке',
                  style: AppStyles.headline.copyWith(height: 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return BlocListener<GeoSuggestionCubit, GeoSuggestionState>(
      listener: (context, state) {
        suggestionsController.suggestions = state.suggestions;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            RoundedContainer(
              header: Text(
                'Доставка в Москве',
                style: AppStyles.headline,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Оформить заказ можно через приложение Мексиканская бабушка, наш сайт mexiba.ru и по номеру +7 495 990-48-65',
                    style: AppStyles.body.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 38,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: AppColors.superLight,
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Время и стоимость доставки',
                          style: AppStyles.headline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Время доставки может изменяться в зависимости от нагруженности кухни и вашего адреса, среднее время ожидания - 30-40 минут.',
                    style: AppStyles.body.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Город разбит на цветные сектора, стоимость доставки зависит от сектора.',
                    style: AppStyles.body.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            RoundedContainer(
              header: Text(
                'Стоимость доставки',
                style: AppStyles.headline,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const DeliveryLegend(),
                  const SizedBox(
                    height: 20,
                  ),
                  DeliveryMap(
                    mapControllerCompleter: mapControllerCompleter,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Можете ввести свой адрес вручную',
                    style: AppStyles.callout.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () => AutoRouter.of(context).push(
                      CityManualyRoute(mode: 'module'),
                    ),
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
                            BlocBuilder<AddressSetupStateCubit,
                                AddressSetupState>(
                              builder: (context, state) {
                                return Text(
                                  state.address?.city?.name ?? 'Город',
                                  style: AppStyles.subheadBold.copyWith(
                                    color: AppColors.gray,
                                  ),
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
                  TypeAheadField<GeoSuggestionEntity>(
                    direction: VerticalDirection.up,
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
                      if (value.street?.isNotEmpty == true) {
                        searchController.text = value.value!;
                      }

                      if (value.geoLat?.isNotEmpty == true &&
                          value.geoLon?.isNotEmpty == true) {
                        (await mapControllerCompleter.future).moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: Point(
                                latitude: double.parse(value.geoLat!),
                                longitude: double.parse(value.geoLon!),
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
                    },
                    suggestionsCallback: (String search) async {
                      if (search.length < 2) {
                        return [];
                      }
                      final String city = getIt<AddressSetupStateCubit>()
                              .state
                              .address
                              ?.city
                              ?.name ??
                          '';

                      getIt<GeoSuggestionCubit>().search(city, search);
                      return getIt<GeoSuggestionCubit>().state.suggestions;
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
                            readOnly:
                                state.address?.city?.name?.isNotEmpty == true
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
