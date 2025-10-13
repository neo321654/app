import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/core/widgets/rounded_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../injection_container.dart';
import '../../../profile/presentation/bloc/profile/profile_cubit.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../models/create_order_state.dart';

class Bonuses extends StatelessWidget {
  const Bonuses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CreateOrderStateCubit>()..setUseBonuses(false),
      child: RoundedContainer(
        header: Text(
          'Списать бонусы',
          style: AppStyles.headline,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.lightScaffoldBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyles.radiusElement,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.watch<ProfileCubit>().state.maybeMap(
                              done: (value) =>
                                  'У вас ${value.profile.bonus!.count} бонусов',
                              orElse: () => '',
                            ),
                        style: AppStyles.footnote,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
                            builder: (context, state) {
                              return Text(
                                context.watch<ProfileCubit>().state.maybeMap(
                                      done: (value) => (state.useBonuses ??
                                              false)
                                          ? 'Спишем ${value.profile.bonus!.count}'
                                          : 'Можете списать ${value.profile.bonus!.count}',
                                      orElse: () => '',
                                    ),
                                style: AppStyles.callout,
                              );
                            },
                          ),
                          AppStyles.xSsmallHGap,
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: SvgPicture.asset(
                              'assets/icons/bonus_icn.svg',
                              color: AppColors.lightPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 31,
                        width: 55,
                        child: CupertinoSwitch(
                          activeTrackColor: AppColors.lightPrimary,
                          onChanged: (bool value) {
                            context
                                .read<CreateOrderStateCubit>()
                                .setUseBonuses(value);
                          },
                          value: state.useBonuses ?? false,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
