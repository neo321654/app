import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:monobox/features/home/domain/entities/product_entity.dart';
import 'package:monobox/features/home/presentation/bloc/product_card_state/product_card_state_cubit.dart';
import 'package:monobox/features/home/presentation/widgets/half_pizza_card.dart';

@RoutePage()
class HalfPizzaPage extends StatelessWidget {
  const HalfPizzaPage({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
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
                  'Пицца из половинок',
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
    return BlocProvider(
      create: (context) => ProductCardStateCubit(product),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<ProductCardStateCubit, ProductCardStateState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: 251,
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                    'assets/icons/half_1.png',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    'assets/icons/half_2.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (context
                              .read<ProductCardStateCubit>()
                              .pizzaHalfMod()
                              .isNotEmpty &&
                          context
                                  .read<ProductCardStateCubit>()
                                  .pizzaHalfMod()[0]
                                  .image
                                  ?.isNotEmpty ==
                              true)
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 251,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Stack(
                            //clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                //right: -(MediaQuery.of(context).size.width / 4) * 1.5,
                                right: -(((MediaQuery.of(context).size.width /
                                            4) *
                                        (251 /
                                            (MediaQuery.of(context).size.width /
                                                4))) /
                                    2),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fitHeight,
                                  height: 251,
                                  imageUrl: context
                                      .read<ProductCardStateCubit>()
                                      .pizzaHalfMod()[0]
                                      .image!,
                                ),
                                // child: Image.network(
                                //   context.read<ProductCardStateCubit>().pizzaHalfMod()[0].image!,
                                //   height: 251,
                                //   fit: BoxFit.fitHeight,
                                //   //alignment: Alignment.centerLeft,
                                // ),
                              ),
                            ],
                          ),
                        ),
                      if (context
                                  .read<ProductCardStateCubit>()
                                  .pizzaHalfMod()
                                  .length ==
                              2 &&
                          context
                                  .read<ProductCardStateCubit>()
                                  .pizzaHalfMod()[1]
                                  .image
                                  ?.isNotEmpty ==
                              true)
                        Positioned(
                          right: 0,
                          child: Container(
                            height: 251,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: const BoxDecoration(
                                //color: Colors.red,
                                // image: DecorationImage(
                                //   alignment: FractionalOffset.centerRight,
                                //   fit: BoxFit.fitHeight,
                                //   image: NetworkImage(
                                //     state.selectedModifiers[0].image!,
                                //   ),
                                // ),
                                ),
                            child: Stack(
                              children: [
                                Positioned(
                                  //left: -(MediaQuery.of(context).size.width / 4) * 1.4,
                                  left: -(((MediaQuery.of(context).size.width /
                                              4) *
                                          (251 /
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4))) /
                                      2),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fitHeight,
                                    height: 251,
                                    imageUrl: context
                                        .read<ProductCardStateCubit>()
                                        .pizzaHalfMod()[1]
                                        .image!,
                                  ),
                                  // child: Image.network(
                                  //   context.read<ProductCardStateCubit>().pizzaHalfMod()[1].image!,
                                  //   height: 251,
                                  //   fit: BoxFit.fitHeight,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<ProductCardStateCubit, ProductCardStateState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 16 : 0,
                            right: product.modifiers
                                        .firstWhere((element) =>
                                            element.type == 'is_half_pizza')
                                        .items
                                        .length ==
                                    (index + 1)
                                ? 16
                                : 0,
                          ),
                          child: HalfPizzaCard(
                            product: product.modifiers
                                .firstWhere((element) =>
                                    element.type == 'is_half_pizza')
                                .items[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 3,
                        );
                      },
                      itemCount: product.modifiers
                          .firstWhere(
                              (element) => element.type == 'is_half_pizza')
                          .items
                          .length,
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
                top: 12,
              ),
              width: double.infinity,
              height: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    AppStyles.radiusBlock,
                  ),
                  topRight: Radius.circular(
                    AppStyles.radiusBlock,
                  ),
                ),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF434343).withOpacity(.05),
                    blurRadius: 12.0,
                    offset: const Offset(
                      0.0,
                      -4.0,
                    ),
                  )
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 52,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<ProductCardStateCubit,
                                  ProductCardStateState>(
                                builder: (context, state) {
                                  return Text(
                                    '${context.read<ProductCardStateCubit>().productTotalPrice} ₽',
                                    style: AppStyles.bodyBold.copyWith(
                                      color: AppColors.black,
                                    ),
                                  );
                                },
                              ),
                              // Text(
                              //   '${basketBloc.subtotal} ₽',
                              //   style: AppStyles.bodyBold.copyWith(
                              //     color: AppColors.black,
                              //   ),
                              // ),
                              const SizedBox(
                                height: 4,
                              ),
                              BlocBuilder<ProductCardStateCubit,
                                  ProductCardStateState>(
                                builder: (context, state) {
                                  return Text(
                                    '${context.read<ProductCardStateCubit>().productTotalWeight} г',
                                    style: AppStyles.caption1,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 52,
                            child: BlocBuilder<ProductCardStateCubit,
                                ProductCardStateState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: context
                                              .read<ProductCardStateCubit>()
                                              .pizzaHalfMod()
                                              .length >=
                                          2
                                      ? () {
                                          context.router.push(
                                            ProductRoute(
                                              product: product,
                                              productCardState: context.read<
                                                  ProductCardStateCubit>(),
                                            ),
                                          );
                                        }
                                      : null,
                                  child: Text(
                                    context
                                                .read<ProductCardStateCubit>()
                                                .pizzaHalfMod()
                                                .length >=
                                            2
                                        ? 'Далее'
                                        : 'Выберите половинку',
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
