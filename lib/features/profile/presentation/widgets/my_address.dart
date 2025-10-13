import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/features/address_setup/presentation/bloc/user_address/user_address_bloc.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const MyAddressesRoute());
        // showModalBottomSheet(
        //   isScrollControlled: true,
        //   backgroundColor: AppColors.white,
        //   useRootNavigator: true,
        //   context: context,
        //   clipBehavior: Clip.antiAliasWithSaveLayer,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       top: Radius.circular(
        //         AppStyles.radiusBlock,
        //       ),
        //     ),
        //   ),
        //   builder: (BuildContext context) {
        //     return BottomSheetContainer(
        //       header: Text(
        //         'Мои адреса',
        //         style: AppStyles.title3,
        //       ),
        //       child: Column(
        //         children: [
        //           SizedBox(
        //             height: 24,
        //           ),
        //           Padding(
        //             padding: EdgeInsets.symmetric(
        //               horizontal: 16,
        //             ),
        //             child: const MyAddressList(),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        height: 104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppStyles.radiusElement,
            ),
          ),
          color: AppColors.superLight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Мои адреса',
              style: AppStyles.headline,
            ),
            Text(
              'Сохранён ${context.watch<UserAddressBloc>().state.maybeMap(
                    success: (value) => '${value.addresses.length}',
                    orElse: () => '0',
                  )}',
              style: AppStyles.subhead.copyWith(color: AppColors.darkGray),
            ),
          ],
        ),
      ),
    );
  }
}
