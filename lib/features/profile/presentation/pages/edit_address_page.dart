import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/core/widgets/input_text.dart';
import 'package:monobox/core/widgets/rounded_container.dart';
import 'package:monobox/core/widgets/text_area.dart';
import 'package:monobox/features/address_setup/domain/entities/address_entity.dart';
import 'package:monobox/features/address_setup/domain/entities/geo_suggestion_entity.dart';
import 'package:monobox/features/address_setup/domain/repository/geo_repository.dart';
import 'package:monobox/features/address_setup/presentation/bloc/create_address/create_address_bloc.dart';
import 'package:monobox/features/address_setup/presentation/bloc/geo_suggestion/geo_suggestion_cubit.dart';
import 'package:monobox/features/address_setup/presentation/bloc/user_address/user_address_bloc.dart';
import 'package:monobox/features/profile/presentation/bloc/edit_address_cubit/edit_address_cubit.dart';
import 'package:monobox/injection_container.dart';

@RoutePage()
class EditAddressPage extends StatefulWidget {
  const EditAddressPage({
    super.key,
    required this.address,
  });

  final AddressEntity address;

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  late TextEditingController streetTextController;
  late TextEditingController houseTextController;
  late TextEditingController flatTextController;
  late TextEditingController floorTextController;
  late TextEditingController entryTextController;
  late TextEditingController domofonTextController;
  late TextEditingController commentTextController;
  late SuggestionsController<GeoSuggestionEntity> suggestionsController;
  late EditAddressCubit editAddressCubit;

  @override
  void initState() {
    editAddressCubit = EditAddressCubit(address: widget.address);
    final state = editAddressCubit.state;

    streetTextController = TextEditingController()
      ..text = state.address.title
      ..addListener(_addressControllerListener);
    houseTextController = TextEditingController()
      ..text = state.address.house ?? ''
      ..addListener(_addressControllerListener);
    flatTextController = TextEditingController()
      ..text = state.address.appartment ?? ''
      ..addListener(_addressControllerListener);
    floorTextController = TextEditingController()
      ..text = state.address.floor ?? ''
      ..addListener(_addressControllerListener);
    entryTextController = TextEditingController()
      ..text = state.address.entrance ?? ''
      ..addListener(_addressControllerListener);
    domofonTextController = TextEditingController()
      ..text = state.address.domofon ?? ''
      ..addListener(_addressControllerListener);
    commentTextController = TextEditingController()
      ..text = state.address.comment ?? ''
      ..addListener(_addressControllerListener);
    suggestionsController = SuggestionsController();
    super.initState();
  }

  void _addressControllerListener() {
    editAddressCubit.setStreet(streetTextController.text);
    editAddressCubit.setHouse(houseTextController.text);
    editAddressCubit.setFlat(flatTextController.text);
    editAddressCubit.setFloor(floorTextController.text);
    editAddressCubit.setEntry(entryTextController.text);
    editAddressCubit.setDomofon(domofonTextController.text);
    editAddressCubit.setComment(commentTextController.text);
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<GeoSuggestionCubit>(),
        ),
        BlocProvider.value(
          value: editAddressCubit,
        ),
        BlocProvider.value(
          value: getIt<CreateAddressBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CreateAddressBloc, CreateAddressState>(
            listener: (context, state) {
              state.maybeWhen(
                deleted: () {
                  getIt<UserAddressBloc>().add(
                    const UserAddressEvent.getAddresses(),
                  );
                  context.router.pop();
                },
                orElse: () => null,
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        ),
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
                  'Адрес',
                  style: AppStyles.headline.copyWith(height: 1),
                )
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                getIt<CreateAddressBloc>()
                    .add(CreateAddressEvent.deleteAddress(widget.address.id));
              },
              child: Row(
                children: [
                  Text(
                    'Удалить',
                    style: AppStyles.subhead
                        .copyWith(color: AppColors.destructive),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 1.5),
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      'assets/icons/trash.svg',
                      color: AppColors.destructive,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          RoundedContainer(
            header: Text(
              widget.address.city ?? '',
              style: AppStyles.headline,
            ),
            child: Column(
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

                        // if (value.geoLat?.isNotEmpty == true) {
                        //   getIt<GeoAvailableBloc>().add(
                        //     GeoAvailableEvent.getAvailable(
                        //       double.parse(value.geoLat!),
                        //       double.parse(value.geoLon!),
                        //     ),
                        //   );
                        // }
                      },
                      suggestionsCallback: (String search) async {
                        if (search.length < 2) {
                          return [];
                        }
                        final String city = widget.address.city ?? '';

                        final GeoRepository repository = getIt<GeoRepository>();

                        final DataState<List<GeoSuggestionEntity>> result =
                            await repository.geoSuggestion(city, search);

                        //getIt<GeoSuggestionCubit>().search(city, search);
                        //return getIt<GeoSuggestionCubit>().state.suggestions;

                        return result.data!;
                      },
                      builder: (context, controller, focusNode) {
                        return InputText(
                          autofocus: false,
                          focusNode: focusNode,
                          controller: streetTextController,
                          label: 'Улица*',
                          hintStyle: AppStyles.subhead.copyWith(
                            color: AppColors.gray,
                          ),
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
                TextArea(
                  maxLength: 70,
                  maxLines: 3,
                  controller: commentTextController,
                  hintText: 'Напишите пожелания или пояснения к вашему заказу',
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
                              AddressMapRoute(
                                  //address: (widget.address.city ?? '') + ' ' + widget.address.address,
                                  ),
                            );
                          },
                          style: AppStyles.greyElevatedButton,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Найти на карте',
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
                        child: BlocBuilder<EditAddressCubit, EditAddressState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: editAddressCubit.allowToSave()
                                  ? () {
                                      getIt<CreateAddressBloc>().add(
                                        CreateAddressEvent.editAddress(
                                            AddressEntity(
                                          id: widget.address.id,
                                          city: widget.address.city ?? '',
                                          title: streetTextController.text,
                                          house: houseTextController.text,
                                          appartment: flatTextController.text,
                                          floor: floorTextController.text,
                                          entrance: entryTextController.text,
                                          domofon: domofonTextController.text,
                                          comment: commentTextController.text,
                                        )),
                                      );

                                      AutoRouter.of(context).pop();
                                    }
                                  : null,
                              //style: AppStyles.greyElevatedButton,
                              child: Center(
                                child: Text(
                                  'Сохранить',
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
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
