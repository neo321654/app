import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/features/basket/presentation/bloc/basket/basket_bloc.dart';
import 'package:monobox/features/home/presentation/bloc/gifts_scale/gifts_scale_bloc.dart';
import 'package:monobox/features/home/presentation/widgets/custom_bottom_sheet.dart';
import 'package:monobox/features/home/presentation/widgets/gift_item.dart';
import 'package:monobox/features/home/presentation/widgets/gift_scale_item.dart';
import 'package:monobox/features/order/domain/entities/gifts_scale_entity.dart';

class GiftScale extends StatelessWidget {
  const GiftScale({
    super.key,
    this.disableBox = false,
    required this.pad,
  });

  final bool disableBox;
  final int pad;

  @override
  Widget build(BuildContext context) {
    BasketBloc basketBloc = context.watch<BasketBloc>();

    final GlobalKey bottomSheetKey = GlobalKey();

    return Container(
      padding: disableBox
          ? const EdgeInsets.symmetric(vertical: 12)
          : const EdgeInsets.all(12),
      width: double.infinity,
      height: 60,
      decoration: disableBox
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppStyles.radiusBlock,
                ),
              ),
              color: AppColors.white,
              boxShadow: disableBox
                  ? null
                  : [
                      BoxShadow(
                        color: const Color(0XFFC6C6C6).withOpacity(.15),
                        blurRadius: 4.0,
                        offset: const Offset(
                          0.0,
                          4.0,
                        ),
                      )
                    ],
            ),
      child: Row(
        children: [
          BlocBuilder<GiftsScaleBloc, GiftsScaleState>(
            builder: (context, state) {
              List<GiftsScaleEntity> loyalties = [];
              state.maybeWhen(
                success: (giftsScale) {
                  loyalties.addAll(giftsScale);
                },
                orElse: () {},
              );
              if (loyalties.isEmpty) {
                // Если подарков нет, ничего не показываем
                return const SizedBox.shrink();
              }
              return Row(
                children: [
                  SizedBox(
                    width: 99,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {
                        _showBottomSheet(context, bottomSheetKey);
                        // showFlexibleBottomSheet(
                        //   minHeight: 0,
                        //   initHeight: 0.8,
                        //   maxHeight: 0.8,
                        //   context: context,
                        //   builder: _buildBottomSheet,
                        //   isExpand: true,
                        //   bottomSheetBorderRadius: const BorderRadius.only(
                        //     topLeft: Radius.circular(32),
                        //     topRight: Radius.circular(32),
                        //   ),
                        // );
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
                        //     return GiftSelector(
                        //       bottomSheetKey: _bottomSheetKey,
                        //     );
                        //   },
                        // );
                      },
                      style: AppStyles.greyElevatedButtonOpacity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1, right: 7),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2.44),
                                width: 18,
                                height: 18,
                                child: SvgPicture.asset(
                                  'assets/icons/present.svg',
                                  color: AppColors.black,
                                ),
                              ),
                              // const SizedBox(
                              //   width: 6,
                              // ),
                              Text(
                                'Подарок',
                                style: AppStyles.subhead.copyWith(
                                  height: 1,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: BlocBuilder<GiftsScaleBloc, GiftsScaleState>(
                      builder: (context, state) {
                        var itemsCount = 0;
                        var activePercent = 0;

                        List<GiftsScaleEntity> loyalties = [];

                        state.maybeWhen(
                          success: (giftsScale) {
                            //_loyalties = loyalties;
                            itemsCount = giftsScale.length;
                            loyalties.addAll(giftsScale);
                            // loyalties.map((l) {
                            //   activePercent++;
                            //   if (l.active) {
                            //     return;
                            //   }
                            // }).toList();
                          },
                          orElse: () {},
                        );

                        double shkalaWidth = 0;
                        double basketTotal = basketBloc.subtotal.toDouble();

                        double oneScaleWith = 100 / (itemsCount + 1) / 100;

                        if (basketTotal > 0) {
                          for (var i = 0; i < (itemsCount); i++) {
                            double currentPrice =
                                double.parse(loyalties[i].price ?? '0');
                            if (basketTotal >= currentPrice) {
                              // double prev = (i == 0 ? 0 : double.parse(_loyalties[i - 1].price ?? '0'));
                              // double current = (double.parse(_loyalties[i].price ?? '0') - prev);
                              // shkalaWidth += (basketTotal / (current * (i + 1))) / (itemsCount + 2);
                              // print('currentPrice = ${currentPrice} shkalaWidth = ${shkalaWidth}');
                              shkalaWidth += oneScaleWith;

                              print(
                                  'currentPrice = $itemsCount shkalaWidth = $shkalaWidth');
                              if ((i + 1) == itemsCount) {
                                double startPrice = currentPrice;
                                //double endPrice = (i + 1) >= itemsCount ? (currentPrice + 1000) : double.parse(_loyalties[i + 1].price ?? '0');
                                double endPrice = currentPrice + 1000;
                                print(
                                    'startPrice = $startPrice endPrice = $endPrice ${(((100 * (basketTotal - startPrice)) / (endPrice - startPrice)) / 100) * oneScaleWith}');

                                shkalaWidth +=
                                    (((100 * (basketTotal - startPrice)) /
                                                (endPrice - startPrice)) /
                                            100) *
                                        oneScaleWith;
                                break;
                              }
                            } else {
                              double startPrice = i == 0
                                  ? 0
                                  : double.parse(loyalties[i - 1].price ?? '0');
                              //double endPrice = (i + 1) >= itemsCount ? (currentPrice + 1000) : double.parse(_loyalties[i + 1].price ?? '0');
                              double endPrice = currentPrice;
                              print(
                                  'startPrice = $startPrice endPrice = $endPrice');

                              shkalaWidth +=
                                  (((100 * (basketTotal - startPrice)) /
                                              (endPrice - startPrice)) /
                                          100) *
                                      oneScaleWith;
                              break;
                            }

                            // else if ((basketTotal > (i == 0 ? 0 : double.parse(_loyalties[i - 1].price ?? '0')) && basketTotal < double.parse(_loyalties[i].price ?? '0'))) {
                            //   double prev = (i == 0 ? 0 : double.parse(_loyalties[i - 1].price ?? '0'));
                            //   shkalaWidth += ((basketTotal - prev) / double.parse(_loyalties[i].price ?? '0')) / (itemsCount + 2);
                            // }
                          }
                        }
                        return Stack(
                          children: [
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Container(
                                  width: constraints.maxWidth,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2.0,
                                      color: AppColors.superLight,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        AppStyles.btnRadius,
                                      ),
                                    ),
                                    color: AppColors.white,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      //width: itemsCount > 0 ? (constraints.maxWidth * ((itemsCount - 1) / activePercent)) : 0,
                                      //width: itemsCount > 0 ? (constraints.maxWidth * (basketBloc.subtotal.toDouble() / ((itemsCount + 2) * 1000))) : 0,
                                      width: itemsCount > 0 &&
                                              basketBloc.subtotal.toDouble() > 0
                                          ? (constraints.maxWidth *
                                                  shkalaWidth) -
                                              2
                                          : 0,
                                      decoration: const BoxDecoration(
                                        color: AppColors.lightSeedColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 36,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: AppColors.superLight,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    AppStyles.btnRadius,
                                  ),
                                ),
                              ),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  for (int i = 0; i < loyalties.length; i++)
                                    Expanded(
                                      child: GiftScaleItem(
                                        //value: (int.parse(_loyalties[i].price ?? '0')).toString(),
                                        //isActive: (i < (activePercent - 2)),
                                        isActive:
                                            (basketBloc.subtotal.toDouble()) >=
                                                double.parse(
                                                    loyalties[i].price ?? '0'),
                                      ),
                                    ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 16,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 36,
                                width: double.infinity,
                                child: Stack(
                                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    for (int i = 0; i < loyalties.length; i++)
                                      Positioned(
                                        top: 0,
                                        //left: ((((MediaQuery.of(context).size.width - 145) / (_loyalties.length + 1))) * (i)) + 1,
                                        //left: (1 + constraints.maxWidth * (100 / (_loyalties.length + 1) / 100)) + 150,
                                        left: ((((MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        135 +
                                                        pad) /
                                                    (loyalties.length + 1)) *
                                                ((i + 1) * .98)) -
                                            (50)),
                                        child: GiftScaleItem(
                                          //width: ((MediaQuery.of(context).size.width - 146) / (_loyalties.length + 1)) + 10,
                                          width: 100,
                                          value: (int.parse(
                                                  loyalties[i].price ?? '0'))
                                              .toString(),
                                          isActive: (basketBloc.subtotal
                                                  .toDouble()) >=
                                              double.parse(
                                                  loyalties[i].price ?? '0'),
                                        ),
                                      ),
                                    // Expanded(
                                    //   child: Container(),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: SingleChildScrollView(
        controller: scrollController,
        child: ListView(
          //controller: scrollController,
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppStyles.radiusElement),
                  ),
                  color: AppColors.lightGray,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Подарки!',
                    style: AppStyles.title3,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    alignment: Alignment.center,
                    height: 34,
                    width: 66,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.lightGray,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.75,
                          vertical: 10.75,
                        ),
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          'assets/icons/close.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Title',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 300.0),
            Container(
              // Replace this Container with your dynamic content
              child: const Text(
                'Content',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const Text(
              'Title',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 300.0),
            Container(
              // Replace this Container with your dynamic content
              child: const Text(
                'Content',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, GlobalKey bottomSheetKey) {
    showModalBottomSheet<void>(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            AppStyles.radiusBlock,
          ),
        ),
      ),
      builder: (BuildContext context) {
        return CustomBottomSheet(
          header: Text(
            'Подарки!',
            style: AppStyles.title3,
          ),
          //child: Text('sdf'),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                'Получайте подарочные блюда в зависимости от суммы заказа. Только в приложении!',
                style: AppStyles.subhead.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<GiftsScaleBloc, GiftsScaleState>(
                builder: (context, state) {
                  return state.maybeMap(
                    success: (value) {
                      return Column(
                        children: [
                          ...value.giftsScale.map(
                            (giftsScale) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: GiftItem(
                                product: giftsScale.product,
                                title: giftsScale.title,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      );
                    },
                    orElse: () => Container(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
