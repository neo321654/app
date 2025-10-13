import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/address_setup/presentation/models/address_setup_state.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../injection_container.dart';
import '../../../address_setup/presentation/bloc/address_setup_state_cubit/address_setup_state_cubit.dart';
import '../../../address_setup/presentation/bloc/geo_suggestion/geo_suggestion_cubit.dart';
import '../bloc/cubit/shop_location_state_cubit.dart';
import '../widgets/choose_address.dart';
import '../widgets/shops.dart';

@RoutePage()
class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
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
                  'Где рестораны?',
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
    final mapControllerCompleter = Completer<YandexMapController>();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<AddressSetupStateCubit>(),
        ),
        BlocProvider.value(
          value: getIt<GeoSuggestionCubit>(),
        ),
        BlocProvider(
          create: (context) => ShopLocationStateCubit(),
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            ChooseAddress(
              mapControllerCompleter: mapControllerCompleter,
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<AddressSetupStateCubit, AddressSetupState>(
              builder: (context, state) {
                return Shops(
                  mapControllerCompleter: mapControllerCompleter,
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
