import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/profile/presentation/bloc/my_address/my_address_cubit.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/your_address_item.dart';
import '../../../../injection_container.dart';
import '../../../address_setup/domain/entities/address_entity.dart';
import '../../../address_setup/presentation/bloc/create_address/create_address_bloc.dart';
import '../../../address_setup/presentation/bloc/user_address/user_address_bloc.dart';

class MyAddressList extends StatelessWidget {
  const MyAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AddressEntity> addresses = [];

    return BlocProvider(
      create: (context) => MyAddressCubit(),
      child: BlocListener<CreateAddressBloc, CreateAddressState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (address) => getIt<UserAddressBloc>().add(
              const UserAddressEvent.getAddresses(),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserAddressBloc, UserAddressState>(
              builder: (context, state) {
                state.maybeMap(
                  success: (value) {
                    addresses.clear();
                    addresses.addAll(value.addresses.take(10));
                  },
                  orElse: () => null,
                );
                // return state.maybeMap(
                //   success: (value) => ListView.builder(
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: value.addresses.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       final address = value.addresses[index];
                //       return Padding(
                //         padding: EdgeInsets.only(bottom: 20),
                //         child: YourAddressItem(
                //           val: address.title,
                //           isActive: index == 0,
                //           onTap: () {},
                //         ),
                //       );
                //     },
                //   ),
                //   orElse: () => Container(),
                // );

                if (addresses.isNotEmpty) {
                  context
                      .read<MyAddressCubit>()
                      .setCuttentAddress(addresses[0]);
                }
                return BlocBuilder<MyAddressCubit, MyAddressState>(
                  builder: (context, state) {
                    return ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (BuildContext context, int index) {
                        final address = addresses[index];
                        return Column(
                          children: [
                            if (index == 0)
                              GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    EditAddressRoute(
                                        address: state.cuttentAddress!),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 12,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Указать полностью',
                                        style: AppStyles.subheadBold.copyWith(
                                          color: AppColors.darkGray,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 7,
                                          top: 5,
                                          right: 6.78,
                                          bottom: 4.25,
                                        ),
                                        width: 20,
                                        height: 20,
                                        child: SvgPicture.asset(
                                          'assets/icons/arrow_right.svg',
                                          color: AppColors.dark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: YourAddressItem(
                                      val: address.address,
                                      isActive: state.cuttentAddress == address,
                                      onTap: () {
                                        context
                                            .read<MyAddressCubit>()
                                            .setCuttentAddress(address);
                                      },
                                    ),
                                  ),
                                  if (state.cuttentAddress == address)
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () => context.router.push(
                                        EditAddressRoute(
                                            address: state.cuttentAddress!),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/pencil_underscore.svg',
                                        ),
                                      ),
                                    ),
                                  if (state.cuttentAddress == address)
                                    const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
            GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              onTap: () {
                context.navigateTo(
                  AddressMapRoute(
                    pageRoute: MyAddressesRoute.page,
                    mode: 'back',
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Text(
                            '+',
                            style: AppStyles.subheadBold.copyWith(
                              color: AppColors.dark,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Добавить новый',
                        style: AppStyles.subheadBold.copyWith(
                          color: AppColors.dark,
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
          ],
        ),
      ),
    );
  }
}
