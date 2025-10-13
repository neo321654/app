import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/home/presentation/widgets/product_half_image.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../basket/domain/entities/basket_offer_entity.dart';
import '../../../basket/presentation/bloc/basket/basket_bloc.dart';
import '../../domain/entities/product_entity.dart';
import '../bloc/product_card_state/product_card_state_cubit.dart';
import '../widgets/product_image.dart';
import '../widgets/product_modifier.dart';
import '../widgets/triangle_painter.dart';

@RoutePage()
class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.product,
    this.productCardState,
  });

  final ProductEntity product;
  final ProductCardStateCubit? productCardState;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late bool showInfo;

  @override
  void initState() {
    showInfo = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BasketBloc basketBloc = context.watch<BasketBloc>();
    final BasketOfferEntity? offer = basketBloc.getProductOffer(widget.product);
    final bloc = widget.productCardState ??
        ProductCardStateCubit(
          widget.product,
          initialQuantities: offer != null && offer.addOptions != null
              ? {
                  for (var option in offer.addOptions!)
                    if (option.id != null) option.id!: option.quantity
                }
              : {},
          basketBloc: basketBloc,
        );
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.product.isHalfPizza
                            ? ProductHalfImage(
                                product: widget.product,
                                image1: bloc.pizzaHalfMod()[0].image ?? '',
                                image2: bloc.pizzaHalfMod()[1].image ?? '',
                              )
                            : ProductImage(product: widget.product),
                        if (widget.product.kbzhu.isNotEmpty)
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const SizedBox(
                                height: 24,
                                width: double.infinity,
                              ),
                              Visibility(
                                visible: showInfo,
                                child: Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.lightScaffoldBackground,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                AppStyles.radiusElement),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'КБЖУ на 100 г.',
                                              style: AppStyles.footnoteBold,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Wrap(
                                              runSpacing: 13,
                                              spacing: 13,
                                              children: [
                                                ...widget.product.kbzhu
                                                    .map((kbzhu) => Text(
                                                          kbzhu.text,
                                                          style: AppStyles
                                                              .subhead
                                                              .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .gray),
                                                        ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CustomPaint(
                                          painter: TrianglePainter(
                                            strokeColor: AppColors
                                                .lightScaffoldBackground,
                                            strokeWidth: 10,
                                            paintingStyle: PaintingStyle.fill,
                                          ),
                                          child: const SizedBox(
                                            height: 10,
                                            width: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                bloc.product.isHalfPizza
                                    ? bloc.productName
                                    : widget.product.name,
                                style: AppStyles.title3,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (widget.product.kbzhu.isNotEmpty)
                              const SizedBox(
                                width: 8,
                              ),
                            if (widget.product.kbzhu.isNotEmpty)
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  setState(() {
                                    showInfo = !showInfo;
                                  });
                                },
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2.98,
                                    vertical: 2.98,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/info.svg',
                                  ),
                                ),
                              ),
                          ],
                        ),
                        AppStyles.xsmall12VGap,
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.superLight,
                        ),
                        AppStyles.xsmall12VGap,
                        if (widget.product.description?.isNotEmpty == true)
                          Text(
                            widget.product.description!,
                            style: AppStyles.subhead.copyWith(
                              color: AppColors.dark,
                            ),
                          ),
                        if (widget.product.description?.isNotEmpty == true)
                          AppStyles.smallVGap,
                        // const TextSwitcher(
                        //   items: [
                        //     '22 см',
                        //     '30 см',
                        //   ],
                        // ),
                        // AppStyles.xsmall12VGap,
                        // const TextSwitcher(
                        //   items: [
                        //     'Тонкое тесто',
                        //     'Традиционное тесто',
                        //   ],
                        // ),
                        AppStyles.smallVGap,
                        ProductModifier(
                          product: widget.product,
                        ),
                        AppStyles.small28VGap,
                        const SizedBox(
                          height: 72,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: 72,
                  padding: const EdgeInsets.only(
                    top: 12,
                    right: 16,
                    bottom: 8,
                    left: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        AppStyles.mediumRadius,
                      ),
                      topRight: Radius.circular(
                        AppStyles.mediumRadius,
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
                  child: SizedBox(
                    height: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 44,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BlocBuilder<ProductCardStateCubit,
                                    ProductCardStateState>(
                                  builder: (context, state) {
                                    final basketBloc =
                                        context.watch<BasketBloc>();
                                    final offer = basketBloc
                                        .getProductOffer(widget.product);
                                    final totalPrice = offer != null &&
                                            offer.quantity != null
                                        ? context
                                                .read<ProductCardStateCubit>()
                                                .productTotalPrice *
                                            Decimal.fromInt(offer.quantity!)
                                        : context
                                            .read<ProductCardStateCubit>()
                                            .productTotalPrice;

                                    print(
                                        'Price BlocBuilder rebuilt with totalPrice: $totalPrice, quantity: ${offer?.quantity ?? 1}');
                                    return Text(
                                      '$totalPrice ₽',
                                      style: AppStyles.bodyBold
                                          .copyWith(color: AppColors.black),
                                    );
                                  },
                                ),
                                AppStyles.xSsmallVGap,
                                Text(
                                  widget.product.weightText ?? "",
                                  style: AppStyles.caption1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppStyles.small28HGap,
                        !basketBloc.isInBasket(widget.product)
                            ? Expanded(
                                child: SizedBox(
                                  height: 52,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      basketBloc.add(AddOffer(
                                        BasketOfferEntity(
                                            id: const Uuid().v4(),
                                            product: widget.product,
                                            quantity: 1,
                                            addOptions:
                                                bloc.getSelectedOptions()),
                                      ));
                                      //await AutoRouter.of(context).pop();
                                      // context.navigateTo(
                                      //   HomeNavigationRoute(children: [CatalogRoute()]),
                                      // );
                                      // await AutoRouter.of(context).pop();
                                      // await AutoRouter.of(context).pop();
                                    },
                                    child: Text(
                                      'Добавить',
                                      style: AppStyles.headline.copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 52,
                                width: 152,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      AppStyles.radiusElement,
                                    ),
                                  ),
                                  color: AppColors.superLight,
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () => offer!.quantity! > 1
                                          ? basketBloc
                                              .add(AddQtyOffer(offer, -1))
                                          : basketBloc.add(
                                              RemoveOffer(offer),
                                            ),
                                      child: const SizedBox(
                                        height: double.infinity,
                                        width: 61,
                                        child: Icon(
                                          Icons.remove,
                                          size: 18,
                                        ),
                                        // child: Text(
                                        //   '-',
                                        //   style: AppStyles.subhead.copyWith(
                                        //     color: AppColors.gray,
                                        //     fontSize: 16,
                                        //     height: 1,
                                        //   ),
                                        //   textAlign: TextAlign.right,
                                        // ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '${offer!.quantity!}',
                                          style: AppStyles.footnote.copyWith(
                                            color: AppColors.dark,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () =>
                                          basketBloc.add(AddQtyOffer(offer, 1)),
                                      child: const SizedBox(
                                        width: 61,
                                        height: double.infinity,
                                        child: Icon(
                                          Icons.add,
                                          size: 22,
                                        ),
                                        // child: Text(
                                        //   '+',
                                        //   style: AppStyles.subhead.copyWith(
                                        //     color: AppColors.gray,
                                        //     fontSize: 16,
                                        //     height: 1,
                                        //   ),
                                        //   textAlign: TextAlign.left,
                                        // ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
