import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:monobox/injection_container.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../core/widgets/rounded_container.dart';
import '../../../../core/widgets/text_switcher.dart';
import '../../../home/presentation/bloc/filials/filials_bloc.dart';
import '../../domain/entities/shop_entity.dart';
import '../bloc/cubit/shop_location_state_cubit.dart';
import 'shops_list.dart';
import 'shops_map.dart';

class Shops extends StatelessWidget {
  const Shops({
    super.key,
    required this.mapControllerCompleter,
  });

  final Completer<YandexMapController> mapControllerCompleter;

  @override
  Widget build(BuildContext context) {
    final List<ShopEntity> shops = [];
    final List<ShopEntity> shopsAll = [];

    final bloc = context.watch<FilialsBloc>();
    context.watch<ShopLocationStateCubit>();

    bloc.state.mapOrNull(
      success: (value) {
        if (context.read<ShopLocationStateCubit>().state.city != null) {
          shops.addAll(value.shops.where((shop) =>
              shop.cityId ==
              context.read<ShopLocationStateCubit>().state.city!.id));

          shopsAll.addAll(value.shops);

          shopsAll.sort((a, b) {
            if (a.cityId ==
                context.read<ShopLocationStateCubit>().state.city!.id) {
              return 0;
            } else {
              return 1;
            }
          });
        } else {
          if (getIt<AuthBloc>().store.cityId != null) {
            shops.addAll(value.shops.where(
                (shop) => shop.cityId == getIt<AuthBloc>().store.cityId));
          } else {
            shops.addAll(value.shops);
          }

          shopsAll.addAll(value.shops);

          shopsAll.sort((a, b) {
            if (a.cityId == getIt<AuthBloc>().store.cityId) {
              return 0;
            } else {
              return 1;
            }
          });
        }

        context.read<ShopLocationStateCubit>().setShops(shopsAll);
      },
    );

    return RoundedContainer(
      child: Column(
        children: [
          BlocBuilder<ShopLocationStateCubit, ShopLocationStateState>(
            builder: (context, state) {
              return TextSwitcher(
                items: const ['Списком', 'На карте'],
                onTap: (itemIndex) => context
                    .read<ShopLocationStateCubit>()
                    .changeViewMode(itemIndex == 0 ? 'list' : 'map'),
                selectedIndex: state.showMode == 'list' ? 0 : 1,
              );
            },
          ),
          BlocBuilder<ShopLocationStateCubit, ShopLocationStateState>(
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    maintainState: true,
                    visible: state.showMode == 'list',
                    child: ShopsList(shops: shops),
                  ),
                  Visibility(
                    maintainState: true,
                    visible: state.showMode == 'map',
                    child: BlocBuilder<ShopLocationStateCubit,
                        ShopLocationStateState>(
                      builder: (context, state) {
                        return ShopsMap(
                          shops: shopsAll,
                          mapControllerCompleter: mapControllerCompleter,
                        );
                      },
                    ),
                  ),
                  // if (state.showMode == 'list') ShopsList(shops: _shops),
                  // if (state.showMode == 'map') ShopsMap(shops: _shops),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
