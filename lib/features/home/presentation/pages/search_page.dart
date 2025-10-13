import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:monobox/features/home/presentation/widgets/catalog_item.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/filter_entity.dart';
import '../../domain/entities/filter_tag_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_request_entity.dart';
import '../bloc/categories/categories_bloc.dart';
import '../bloc/cubit/search_cubit.dart';
import '../bloc/products/products_bloc.dart';
import '../widgets/basket_badge.dart';
import '../widgets/product_card.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    this.startSearch = false,
  });

  final bool startSearch;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController controller;
  late SuggestionsController<ProductEntity> suggestionsController;
  final List<ProductEntity> products = [];
  bool isShowSuggestions = false;

  @override
  void initState() {
    if (widget.startSearch) {
      _makeSearch('');
    }
    controller = TextEditingController();
    suggestionsController = SuggestionsController()
      ..addListener(suggestionsControllerListener);
    super.initState();
  }

  void suggestionsControllerListener() {
    if (suggestionsController.isOpen &&
        !isShowSuggestions &&
        suggestionsController.suggestions?.isNotEmpty == true) {
      setState(() {
        isShowSuggestions = true;
      });
      // Future.delayed(Duration(
      //         milliseconds:
      //             (suggestionsController.suggestions?.isNotEmpty == true
      //                 ? 800
      //                 : 150)))
      //     .then((val) {
      //   setState(() {
      //     isShowSuggestions = true;
      //   });
      // });
    }

    if (suggestionsController.isOpen &&
        isShowSuggestions &&
        suggestionsController.suggestions?.isEmpty == true) {
      setState(() {
        isShowSuggestions = false;
      });
      // Future.delayed(const Duration(milliseconds: 200)).then((val) {
      //   setState(() {
      //     isShowSuggestions = false;
      //   });
      // });
    }

    if (!suggestionsController.isOpen &&
        isShowSuggestions &&
        suggestionsController.suggestions?.isEmpty == false) {
      setState(() {
        isShowSuggestions = false;
      });
      // Future.delayed(const Duration(milliseconds: 200)).then((val) {
      //   setState(() {
      //     isShowSuggestions = false;
      //   });
      // });
    }
  }

  @override
  void dispose() {
    suggestionsController.removeListener(suggestionsControllerListener);
    suggestionsController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (getIt<CategoriesBloc>().state is CategoriesDone) {
      getIt<CategoriesBloc>()
          .state
          .categories
          ?.map((category) => category.products
              ?.map((product) => products.add(product))
              .toList())
          .toList();
    }

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      //preferredSize: Size.fromHeight(129 - 32),
      preferredSize: const Size.fromHeight(60),
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
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          titleSpacing: 0,
          //leadingWidth: 32 + 16,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => context.navigateTo(const FiltersRoute()),
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: 34,
                      height: double.infinity,
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                      ),
                    ),
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state.selectedTags.isEmpty) {
                        return Container();
                      }
                      return Positioned(
                        right: 0,
                        top: 5,
                        child: BasketBadge(
                          counter: state.selectedTags.length,
                          active: true,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(
              top: 4,
              right: 6,
            ),
            child: TypeAheadField<ProductEntity>(
              animationDuration: const Duration(milliseconds: 0),
              controller: controller,
              suggestionsController: suggestionsController,
              suggestionsCallback: (search) async {
                if (search.length < 2) {
                  return [];
                }
                await Future.delayed(const Duration(milliseconds: 10));
                final names = products.map((e) => e.name).toSet();

                final filteredProducts = products;
                filteredProducts.retainWhere((x) => names.remove(x.name));

                return filteredProducts
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(search.toLowerCase()))
                    .toList();
              },
              builder: (context, controller, focusNode) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -2,
                      child: Visibility(
                        visible: isShowSuggestions,
                        child: Container(
                          height: 47,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                AppStyles.btnRadius,
                              ),
                              topRight: Radius.circular(
                                AppStyles.btnRadius,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InputText(
                      autofocus: controller.text.isEmpty && !widget.startSearch
                          ? true
                          : false,
                      focusNode: focusNode,
                      controller: controller,
                      disableFocusBorder: true,
                      hintText: 'Найти',
                      prefixIcon: SizedBox(
                        width: 17.4,
                        height: 17.4,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/search.svg',
                          ),
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => controller.clear(),
                        child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(7.4),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/cross.svg',
                              color: AppColors.dark,
                            ),
                          ),
                        ),
                      ),
                      onSubmitted: (text) => _makeSearch(text),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                  ],
                );
              },
              itemBuilder: (context, product) {
                return SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        padding: const EdgeInsets.all(2.71),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/clock.svg',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          product.name,
                          style: AppStyles.subhead.copyWith(
                            color: AppColors.darkGray,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              onSelected: (product) {
                controller.text = product.name;
                _makeSearch(controller.text);
                // context.read<ProductsBloc>().add(ProductsEvent.getProducts(
                //       ProductRequestEntity(
                //         search: controller.text,
                //         filters: [
                //           FilterEntity(
                //               tags: context
                //                   .read<AppliedFilterStateCubit>()
                //                   .state
                //                   .selectedTags
                //                   .map((t) => FilterTagEntity(id: t.id))
                //                   .toList()),
                //         ],
                //       ),
                //     ),);
              },
              decorationBuilder: (context, child) {
                return Material(
                  type: MaterialType.card,
                  elevation: 0,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      AppStyles.btnRadius,
                    ),
                    bottomRight: Radius.circular(
                      AppStyles.btnRadius,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  color: AppColors.lightGray,
                  child: child,
                );
              },
              offset: const Offset(0, 0),
              listBuilder: (context, children) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => Container(
                      height: 1,
                      width: double.infinity,
                      color: const Color(0xFFc9c9c9),
                    ),
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int index) {
                      return children[index];
                    },
                  ),
                );
              },
              // listBuilder: (context, children) => GridView.builder(
              //   padding: const EdgeInsets.all(8),
              //   itemCount: children.length,
              //   shrinkWrap: true,
              //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //     maxCrossAxisExtent: 400,
              //     mainAxisExtent: 58,
              //     crossAxisSpacing: 8,
              //     mainAxisSpacing: 8,
              //   ),
              //   itemBuilder: (context, index) => children[index],
              // ),
              transitionBuilder: (context, animation, child) {
                return FadeTransition(
                  opacity: CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn),
                  child: child,
                );
              },
              hideOnEmpty: true,
              //constraints: BoxConstraints(maxHeight: 500),
            ),
          ),
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => context.popRoute(),
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              width: 32,
              height: 40,
              child: Center(
                child: Row(
                  children: [
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
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        _makeSearch(controller.text);
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 28,
                ),
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (products) => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 16.0,
                          //childAspectRatio: 158 / (imageWidth + (12 * 3) + 24 + 16 + 46),
                          //childAspectRatio: (1 / 1.75),
                          //childAspectRatio: (158 / 308),
                          //childAspectRatio: 158 / ((308 - 24 + 8 + 4)),
                          height: 328,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final ProductEntity product = products[index];
                          return ProductCard(product: product);
                        },
                      ),
                      orElse: () => Container(),
                    );
                  },
                ),
                Container(
                  height: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _makeSearch(String searchText) {
    if (searchText.isEmpty &&
        context.read<SearchCubit>().state.selectedTags.isEmpty) {
      context.read<ProductsBloc>().add(const ProductsEvent.clear());
    } else {
      context.read<ProductsBloc>().add(
            ProductsEvent.getProducts(
              ProductRequestEntity(
                search: searchText,
                filters: FilterEntity(
                    tags: context
                        .read<SearchCubit>()
                        .state
                        .selectedTags
                        .map((t) => FilterTagEntity(id: t.id))
                        .toList()),
              ),
            ),
          );
    }
  }
}
