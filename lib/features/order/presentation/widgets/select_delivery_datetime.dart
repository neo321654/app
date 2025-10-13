import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../bloc/create_order_state_cubit/create_order_state_cubit.dart';
import '../models/create_order_state.dart';

class SelectDeliveryDateTime extends StatefulWidget {
  const SelectDeliveryDateTime({super.key});

  @override
  State<SelectDeliveryDateTime> createState() => _SelectDeliveryDateTimeState();
}

class _SelectDeliveryDateTimeState extends State<SelectDeliveryDateTime> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateOrderStateCubit>();

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                locale: const Locale("ru"),
                context: context,
                initialDate: DateTime.now(),
                firstDate: cubit.state
                    .deliveryDate!, //DateTime.now() - not to allow to choose before today.
                lastDate:
                    cubit.state.deliveryDate!.add(const Duration(days: 30)),
              );

              if (pickedDate != null) {
                setState(() {
                  cubit.setDeliveryDate(pickedDate);
                });
              } else {
                //print("Date is not selected");
              }
            },
            child: Container(
              height: 48,
              padding: const EdgeInsets.only(
                left: 16,
                top: 10,
                right: 12,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.superLight,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyles.radiusElement,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('d MMMM', 'Ru_ru')
                          .format(cubit.state.deliveryDate!),
                      style: AppStyles.subheadBold.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: Center(
                        child: SizedBox(
                          width: 11.08,
                          height: 6.42,
                          child: SvgPicture.asset(
                            'assets/icons/arrow_down.svg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () => showModalBottomSheet(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  AppStyles.radiusBlock,
                ),
              ),
            ),
            context: context,
            builder: (_) => Container(
              color: AppColors.white,
              width: double.infinity,
              height: 250,
              child: Column(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      backgroundColor: AppColors.white,
                      scrollController: FixedExtentScrollController(
                        initialItem: _deliveryTimes
                            .indexOf(cubit.state.deliveryTimeValue),
                      ),
                      onSelectedItemChanged: (int value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      itemExtent: 40,
                      children: [
                        ..._deliveryTimes.map(
                          (t) => Align(
                            alignment: Alignment.center,
                            child: Text(
                              t,
                              style: AppStyles.subheadBold.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: SizedBox(
                      height: 46,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedValue != null) {
                            cubit.setDeliveryDeliveryTime(
                              _deliveryTimes[selectedValue!],
                            );
                          }

                          AutoRouter.of(context).pop();
                        },
                        child: Text(
                          'Выбрать',
                          style: AppStyles.headline.copyWith(
                            color: AppColors.white,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          child: Container(
            height: 48,
            padding: const EdgeInsets.only(
              left: 16,
              top: 10,
              right: 12,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.superLight,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppStyles.radiusElement,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<CreateOrderStateCubit, CreateOrderState>(
                    builder: (context, state) {
                      return Text(
                        state.deliveryTimeValue,
                        style: AppStyles.subheadBold.copyWith(
                          color: AppColors.dark,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: Center(
                      child: SizedBox(
                        width: 11.08,
                        height: 6.42,
                        child: SvgPicture.asset(
                          'assets/icons/arrow_down.svg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  final List<String> _deliveryTimes = [
    '10:00',
    '10:15',
    '10:30',
    '10:45',
    '11:00',
    '11:15',
    '11:30',
    '11:45',
    '12:00',
    '12:15',
    '12:30',
    '12:45',
    '13:00',
    '13:15',
    '13:30',
    '13:45',
    '14:00',
    '14:15',
    '14:30',
    '14:45',
    '15:00',
    '15:15',
    '15:30',
    '15:45',
    '16:00',
    '16:15',
    '16:30',
    '16:45',
    '17:00',
    '17:15',
    '17:30',
    '17:45',
    '18:00',
    '18:15',
    '18:30',
    '18:45',
    '19:00',
    '19:15',
    '19:30',
    '19:45',
    '20:00',
    '20:15',
    '20:30',
    '20:45',
    '21:00',
    '21:15',
    '21:30',
    '21:45',
  ];
}
