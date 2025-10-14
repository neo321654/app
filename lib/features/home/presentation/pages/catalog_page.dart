import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/basket/presentation/bloc/basket/basket_bloc.dart';
import 'package:monobox/features/basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import 'package:monobox/features/home/presentation/widgets/gift_scale.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/category_entity.dart';
import '../bloc/categories/categories_bloc.dart';
import '../bloc/cubit/categories_state_cubit.dart';
import '../bloc/cubit/search_cubit.dart';
import '../widgets/basket_badge.dart';
import '../widgets/catalog_item.dart';
import '../widgets/filter_list_container.dart';
import 'package:monobox/features/home/presentation/bloc/gifts_scale/gifts_scale_bloc.dart';
import 'package:monobox/features/order/presentation/bloc/create_order_state_cubit/create_order_state_cubit.dart';

@RoutePage()
class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
    @PathParam('categoryId') this.selectedCategoryId,
  });

  final int? selectedCategoryId;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late ItemScrollController itemScrollController;
  late ItemScrollController itemScrollControllerMenu;
  late ItemPositionsListener itemPositionsListener;
  final List<CategoryEntity> categories =
      getIt<CategoriesBloc>().state.categories ?? [];

  late CategoriesStateCubit satetCubit;

  bool listeMenu = true;
  final List<GlobalKey> menuKeys = [];
  Timer? _debounce;

  @override
  void initState() {
    satetCubit = CategoriesStateCubit();
    itemScrollController = ItemScrollController();
    itemScrollControllerMenu = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();

    itemPositionsListener.itemPositions.addListener(categoryScrollListener);

    if (widget.selectedCategoryId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        var slelectedCat = categories
            .firstWhere((element) => element.id == widget.selectedCategoryId);
        itemScrollController.jumpTo(index: categories.indexOf(slelectedCat));
        itemScrollControllerMenu.jumpTo(
            index: categories.indexOf(slelectedCat));
        listeMenu = false;
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            listeMenu = true;
          });
        });
      });
    }

    super.initState();
  }

  void categoryScrollListener() {
    var selectedIndex = 0;

    selectedIndex = itemPositionsListener.itemPositions.value
        .where((ItemPosition position) => position.itemTrailingEdge > 0)
        .reduce((ItemPosition min, ItemPosition position) =>
            (position.itemTrailingEdge) < (min.itemTrailingEdge)
                ? position
                : min)
        .index;

    if (satetCubit.state != categories[selectedIndex].id) {
      //satetCubit.setSelectedCategoryId(categories[selectedIndex].id);
      if (listeMenu) {
        itemScrollControllerMenu.jumpTo(index: selectedIndex, alignment: .41);
        satetCubit.setSelectedCategoryId(
          categories[selectedIndex].id,
        );
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 100), () {
          // do something with query

          /*
          itemScrollControllerMenu
              .scrollTo(
            index: selectedIndex,
            duration: const Duration(
              milliseconds: 500,
            ),
            alignment: .25,
          )
              .then((value) {
            // satetCubit.setSelectedCategoryId(
            //   categories[selectedIndex].id,
            // );
          });
          */
          // satetCubit.setSelectedCategoryId(
          //   categories[selectedIndex].id,
          // );
        });
      }
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CategoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => satetCubit
            ..setSelectedCategoryId(
              widget.selectedCategoryId,
            ),
        ),
      ],
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(129 - 32),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightDarkGray.withOpacity(.05),
              blurRadius: 8.0,
              offset: const Offset(
                0.0,
                4.0,
              ),
            )
          ],
        ),
        child: AppBar(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 129 - 32,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          titleSpacing: 0,
          //leadingWidth: 32 + 16,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => context.popRoute(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: SizedBox(
                          width: 17.33,
                          height: 12.67,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/arrow_left.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppStyles.xxsmall12HGap,
                  Expanded(
                    child: Text(
                      'Меню',
                      style: AppStyles.headline,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.navigateTo(SearchRoute()),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: SizedBox(
                          width: 21.75,
                          height: 21.75,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color: AppColors.dark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppStyles.xsmall12VGap,
              SizedBox(
                width: double.infinity,
                height: 34,
                child: BlocBuilder<CategoriesStateCubit, int?>(
                  builder: (context, state) {
                    menuKeys.clear();
                    categories.map((e) {
                      GlobalKey key = GlobalKey();

                      menuKeys.add(key);
                    }).toList();
                    return ScrollablePositionedList.builder(
                      itemScrollController: itemScrollControllerMenu,
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        var category = categories[index];
                        var isFirstCollection = false;
                        if (index > 0) {
                          isFirstCollection =
                              !categories[index - 1].isCollection &&
                                  category.isCollection;
                        }
                        return Row(
                          children: [
                            if (index == 0) AppStyles.xsmallHGap,
                            if (index == 0)
                              FilterListContainer(
                                isFirstCollection: false,
                                onTap: () =>
                                    context.router.push(const FiltersRoute()),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 2.71,
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/icons/filter.svg',
                                          ),
                                        ),
                                        BlocBuilder<SearchCubit, SearchState>(
                                          builder: (context, state) {
                                            if (state.selectedTags.isEmpty) {
                                              return Container();
                                            }

                                            return Positioned(
                                              right: -5,
                                              top: 0,
                                              child: BasketBadge(
                                                counter:
                                                    state.selectedTags.length,
                                                active: true,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    AppStyles.xSsmallHGap,
                                    Text(
                                      'Фильтры',
                                      style: AppStyles.footnote.copyWith(
                                        color: AppColors.dark,
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            AppStyles.xxsmallHGap,
                            FilterListContainer(
                              key: menuKeys[index],
                              isFirstCollection: isFirstCollection,
                              onTap: () {
                                // context
                                //     .read<CategoriesStateCubit>()
                                //     .setSelectedCategoryId(c.id);
                                // itemScrollControllerMenu.scrollTo(
                                //   index: categories.indexOf(category),
                                //   duration: const Duration(
                                //     milliseconds: 500,
                                //   ),
                                //   alignment: .25,
                                // );

                                print('click');

                                setState(() {
                                  listeMenu = false;
                                });
                                itemScrollControllerMenu.scrollTo(
                                  index: categories.indexOf(category),
                                  duration: const Duration(
                                    milliseconds: 300,
                                  ),
                                  alignment: .5 -
                                      ((menuKeys[categories.indexOf(category)]
                                                      .currentContext!
                                                      .size!
                                                      .width +
                                                  8) /
                                              2) /
                                          (MediaQuery.of(context).size.width),
                                );
                                satetCubit.setSelectedCategoryId(category.id);
                                itemScrollController
                                    .scrollTo(
                                  index: categories.indexOf(category),
                                  duration: const Duration(
                                    milliseconds: 100,
                                  ),
                                  alignment: -.05,
                                )
                                    .then((value) {
                                  Future.delayed(
                                      const Duration(milliseconds: 600), () {
                                    setState(() {
                                      listeMenu = true;
                                    });
                                  });
                                });
                              },
                              isActive: state == category.id,
                              color: category.color,
                              child: Text(
                                category.title,
                                style: AppStyles.footnote.copyWith(
                                  color: state == category.id
                                      ? AppColors.dark
                                      : category.color == null
                                          ? AppColors.gray
                                          : AppColors.white,
                                  height: 1,
                                ),
                              ),
                            ),
                            if (index == categories.length - 1)
                              AppStyles.xsmallHGap,
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    BasketBloc basketBloc = context.watch<BasketBloc>();
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesDone) {
          categories.addAll(getIt<CategoriesBloc>().state.categories ?? []);
        }
      },
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
        return SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: (basketBloc.productsCount != null &&
                          basketBloc.productsCount! > 0)
                      ? 145
                      : 0,
                ),
                child: RefreshIndicator(
                  onRefresh: () async {
                    categories.clear();
                    getIt<CategoriesBloc>().add(const GetCategories());
                  },
                  child: ScrollablePositionedList.builder(
                    itemCount: categories.length,
                    itemScrollController: itemScrollController,
                    itemPositionsListener: itemPositionsListener,
                    itemBuilder: (BuildContext context, int index) {
                      return CatalogItem(
                        catalog: categories[index],
                        isLast: categories.length == (index + 1),
                      );
                    },
                  ),
                ),
              ),
              if (basketBloc.productsCount != null &&
                  basketBloc.productsCount! > 0)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                    ),
                    width: double.infinity,
                    //height: 144,
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
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<GiftsScaleBloc, GiftsScaleState>(
                          builder: (context, state) {
                            final gifts = state.maybeWhen(
                              success: (giftsScale) => giftsScale,
                              orElse: () => [],
                            );
                            if (gifts.isEmpty) {
                              return const SizedBox(height: 24);
                            }
                            return const Column(
                              children: [
                                GiftScale(
                                  pad: -1,
                                  disableBox: true,
                                ),
                                SizedBox(height: 12),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 52,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BlocBuilder<BasketInfoBloc,
                                        BasketInfoState>(
                                      builder: (context, state) {
                                        state.maybeWhen(
                                          loading: () => print(
                                              "BasketInfoBloc: loading state"),
                                          success: (basketInfo, timeDelay) => print(
                                              "BasketInfoBloc: success, total = ${basketInfo.totalInfo.total}"),
                                          error: (message) => print(
                                              "BasketInfoBloc: error, message = $message"),
                                          orElse: () => print(
                                              "BasketInfoBloc: other state"),
                                        );

                                        return state.maybeWhen(
                                          orElse: () => Text(
                                            '...',
                                            style: AppStyles.bodyBold.copyWith(
                                              color: AppColors.black,
                                            ),
                                          ),
                                          success: (basketInfo, timeDelay) {
                                            // Получаем тип доставки
                                            final deliveryType =
                                                getIt<CreateOrderStateCubit>()
                                                    .state
                                                    .delivery
                                                    ?.type;
                                            int totalWithDelivery =
                                                basketInfo.totalInfo.total;

                                            // Добавляем стоимость доставки только если это не самовывоз
                                            if (deliveryType != 'pickup') {
                                              // Ищем строку с доставкой в pretotalInfo
                                              for (var pretotalItem
                                                  in basketInfo.pretotalInfo) {
                                                // Проверяем, что это строка с адресом (содержит адрес и стоимость)
                                                if (pretotalItem.title
                                                        .contains('ул') ||
                                                    pretotalItem.title
                                                        .contains('д') ||
                                                    pretotalItem.title
                                                        .contains('г')) {
                                                  // Извлекаем стоимость доставки из строки "500 ₽"
                                                  String deliveryValue =
                                                      pretotalItem.value;
                                                  if (deliveryValue
                                                      .contains('₽')) {
                                                    // Убираем " ₽" и парсим число
                                                    String deliveryPriceStr =
                                                        deliveryValue
                                                            .replaceAll(
                                                                ' ₽', '')
                                                            .trim();
                                                    try {
                                                      int deliveryPrice =
                                                          int.parse(
                                                              deliveryPriceStr);
                                                      totalWithDelivery +=
                                                          deliveryPrice;
                                                      print(
                                                          'CATALOG - DELIVERY COST FOUND: $deliveryPrice ₽');
                                                      print(
                                                          'CATALOG - TOTAL WITH DELIVERY: $totalWithDelivery ₽');
                                                      break; // Нашли доставку, выходим из цикла
                                                    } catch (e) {
                                                      print(
                                                          'CATALOG - ERROR PARSING DELIVERY PRICE: $deliveryPriceStr');
                                                    }
                                                  }
                                                }
                                              }
                                            } else {
                                              print(
                                                  'CATALOG - PICKUP SELECTED, NOT ADDING DELIVERY COST');
                                            }

                                            return Text(
                                              '$totalWithDelivery ₽',
                                              style:
                                                  AppStyles.bodyBold.copyWith(
                                                color: AppColors.black,
                                              ),
                                            );
                                          },
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
                                    Text(
                                      '',
                                      style: AppStyles.caption1,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 52,
                                  child: BlocBuilder<BasketInfoBloc,
                                      BasketInfoState>(
                                    builder: (context, state) {
                                      return ElevatedButton(
                                        onPressed: state.maybeWhen(
                                          orElse: () => null,
                                          success: (basketInfo, timeDelay) =>
                                              () {
                                            context.router
                                                .parent<TabsRouter>()
                                                ?.navigate(const BasketRoute());
                                          },
                                        ),
                                        child: Text(
                                          state.maybeWhen(
                                            orElse: () => 'В корзину',
                                            success: (basketInfo, timeDelay) =>
                                                basketInfo.warnings.isEmpty
                                                    ? 'В корзину'
                                                    : basketInfo.warnings[0],
                                          ),
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
      },
    );
  }
}
