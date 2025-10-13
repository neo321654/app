import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/features/address_setup/presentation/widgets/skip_button.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/styles.dart';
import '../../../../injection_container.dart';
import '../../../home/domain/entities/city_entity.dart';
import '../../domain/entities/city_entity.dart' as address_city;
import '../../../home/presentation/bloc/cities/cities_bloc.dart';
import '../bloc/address_setup_state_cubit/address_setup_state_cubit.dart';

import '../widgets/back_button.dart';

@RoutePage()
class CityManualyPage extends StatelessWidget {
  const CityManualyPage({
    super.key,
    this.mode = '',
  });

  final String mode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CitiesBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.lightPrimary,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                //if (mode != 'module') const SkipButton(height: 44),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: AppStyles.mediumSize),
              child: Container(
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
                  child: Column(
                    children: [
                      AppStyles.smallVGap,
                      Text(
                        'В каком городе\nзакажете?',
                        style: AppStyles.title3,
                        textAlign: TextAlign.center,
                      ),
                      AppStyles.mediumVGap,
                      Expanded(
                        child: SingleChildScrollView(
                          child: BlocBuilder<CitiesBloc, CitiesState>(
                            builder: (context, state) {
                              return state.maybeMap(
                                success: (success) {
                                  List<CityEntity> cities = success.cities;
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: cities.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final CityEntity city = cities[index];
                                      return ListTile(
                                        title: Text(
                                          city.name,
                                          style: AppStyles.callout.copyWith(
                                            color: AppColors.dark,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.all(0),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.gray,
                                          size: 14,
                                        ),
                                        onTap: () {
                                          if (mode == 'city') {
                                            AutoRouter.of(context).pop(city);
                                          } else {
                                            getIt<AddressSetupStateCubit>()
                                                .setCity(
                                                    address_city.CityEntity(
                                                        name: city.name));
                                            getIt<AuthBloc>()
                                                .store
                                                .setCityId(city.id);

                                            if (mode == 'module') {
                                              AutoRouter.of(context).pop();
                                            } else {
                                              AutoRouter.of(context).push(
                                                AddressManualyRoute(
                                                  mode: mode,
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Container(
                                        height: 1,
                                        color: AppColors.lightTertiary,
                                      );
                                    },
                                  );
                                },
                                loading: (value) =>
                                    const CircularProgressIndicator(),
                                orElse: () => Container(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
          SkipButton(height: 40),
        ],
      ),
    );
  }
}
