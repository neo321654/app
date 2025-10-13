import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/address_setup/presentation/bloc/address_setup_state_cubit/address_setup_state_cubit.dart';
import 'package:monobox/features/home/presentation/bloc/gifts_scale/gifts_scale_bloc.dart';
import 'package:monobox/features/home/presentation/widgets/gift_scale.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../address_setup/presentation/bloc/user_address/user_address_bloc.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../../../profile/presentation/bloc/profile/profile_cubit.dart';
import '../../domain/entities/category_entity.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../injection_container.dart';
import '../bloc/banners/banners_bloc.dart';
import '../bloc/categories/categories_bloc.dart';
import '../bloc/collections/collections_bloc.dart';
import '../bloc/settings/settings_bloc.dart';
import '../widgets/banners.dart';
import '../widgets/category_placeholder.dart';
import '../widgets/collections.dart';
import '../widgets/filter_button.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<BannersBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CategoriesBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CollectionsBloc>(),
        ),
        BlocProvider.value(
          value: getIt<AddressSetupStateCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      state.maybeWhen(
                        success: (settings) async {
                          Uri phoneno = Uri(
                              scheme: 'tel',
                              path: '+${(settings.feedback?.phone ?? "")}');

                          if (await canLaunchUrl(phoneno)) {
                            await launchUrl(phoneno);
                          }
                        },
                        orElse: () => null,
                      );
                    },
                    child: SizedBox(
                      width: 29,
                      height: 29,
                      child: SvgPicture.asset(
                        'assets/icons/phone.svg',
                      ),
                    ),
                  );
                },
              ),
              AppStyles.xsmallHGap,
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    context.router.push(
                      const MyAddressesRoute(),
                    );
                    // context.router
                    //     .parent<TabsRouter>()
                    //     ?.navigate(const MyAddressesRoute())
                    //     .then((value) {
                    //   // context.router.push(
                    //   //   MyAddressesRoute(),
                    //   // );
                    // });

                    //context.router.push(const ProfileRoute());
                    // context.router.pushAll([
                    //   ProfileRoute(),
                    //   MyAddressesRoute(),
                    // ]);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Доставим на',
                        style: AppStyles.footnote,
                      ),
                      Row(
                        children: [
                          if (getIt<AuthBloc>().state !=
                              const AuthState.authenticated())
                            Expanded(
                              child: Text(
                                getIt<AddressSetupStateCubit>()
                                        .state
                                        .address!
                                        .street ??
                                    'Укажите адрес',
                                style: AppStyles.bodyBold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          if (getIt<AuthBloc>().state ==
                              const AuthState.authenticated())
                            BlocBuilder<UserAddressBloc, UserAddressState>(
                              builder: (context, state) {
                                return Expanded(
                                  child: Text(
                                    state.maybeMap(
                                      success: (value) =>
                                          value.addresses.isNotEmpty
                                              ? value.addresses[0].address
                                              : 'Укажите адрес',
                                      orElse: () => 'Укажите адрес',
                                    ),
                                    style: AppStyles.bodyBold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              },
                            ),
                          AppStyles.xSsmallHGap,
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              'assets/icons/pencil_underscore.svg',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppStyles.smallHGap,
              if (context.watch<AuthBloc>().state ==
                      const AuthState.authenticated() &&
                  context.watch<ProfileCubit>().state.maybeWhen(
                        done: (profile) => true,
                        orElse: () => false,
                      ) &&
                  context.watch<SettingsBloc>().state.maybeWhen(
                        success: (success) => success.loyalty,
                        orElse: () => false,
                      ))
                SizedBox(
                  //width: 101,
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.parent<TabsRouter>()?.navigate(
                            const LoyaltyRoute(),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                        top: 6,
                        right: 8,
                        bottom: 6,
                        left: 12,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      children: [
                        if (context.watch<AuthBloc>().state !=
                            const AuthState.authenticated())
                          Text(
                            'Бонусы',
                            style: AppStyles.subheadBold.copyWith(
                              height: 1,
                            ),
                          ),
                        if (context.watch<AuthBloc>().state ==
                            const AuthState.authenticated())
                          context.watch<ProfileCubit>().state.maybeMap(
                                done: (value) => value.profile.bonus!.available
                                    ? Text(
                                        '${value.profile.bonus!.count}',
                                        style: AppStyles.subheadBold,
                                      )
                                    : Text(
                                        'Бонусы',
                                        style: AppStyles.subheadBold.copyWith(
                                          height: 1,
                                        ),
                                      ),
                                orElse: () => Text(
                                  'Бонусы',
                                  style: AppStyles.subheadBold.copyWith(
                                    height: 1,
                                  ),
                                ),
                              ),
                        AppStyles.xxsmall6HGap,
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: SvgPicture.asset(
                            'assets/icons/bonus_icn.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (getIt<BannersBloc>().state is BannersInitial) {
      getIt<BannersBloc>().add(const GetBanners());
    }

    if (getIt<CategoriesBloc>().state is CategoriesInitial) {
      getIt<CategoriesBloc>().add(const GetCategories());
    }

    if (getIt<CollectionsBloc>().state is CollectionsInitial) {
      getIt<CollectionsBloc>().add(const GetCollections());
    }

    return Stack(
      children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 16,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       BlocBuilder<SettingsBloc, SettingsState>(
                //         builder: (context, state) {
                //           return GestureDetector(
                //             onTap: () {
                //               state.maybeWhen(
                //                 success: (settings) async {
                //                   Uri phoneno = Uri(scheme: 'tel', path: '+${(settings.feedback?.phone ?? "")}');

                //                   if (await canLaunchUrl(phoneno)) {
                //                     await launchUrl(phoneno);
                //                   }
                //                 },
                //                 orElse: () => null,
                //               );
                //             },
                //             child: SizedBox(
                //               width: 29,
                //               height: 29,
                //               child: SvgPicture.asset(
                //                 'assets/icons/phone.svg',
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //       AppStyles.xsmallHGap,
                //       Expanded(
                //         child: GestureDetector(
                //           behavior: HitTestBehavior.translucent,
                //           onTap: () async {
                //             context.router.push(
                //               const MyAddressesRoute(),
                //             );
                //             // context.router
                //             //     .parent<TabsRouter>()
                //             //     ?.navigate(const MyAddressesRoute())
                //             //     .then((value) {
                //             //   // context.router.push(
                //             //   //   MyAddressesRoute(),
                //             //   // );
                //             // });

                //             //context.router.push(const ProfileRoute());
                //             // context.router.pushAll([
                //             //   ProfileRoute(),
                //             //   MyAddressesRoute(),
                //             // ]);
                //           },
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Доставим на',
                //                 style: AppStyles.footnote,
                //               ),
                //               Row(
                //                 children: [
                //                   if (getIt<AuthBloc>().state != const AuthState.authenticated())
                //                     Expanded(
                //                       child: Text(
                //                         getIt<AddressSetupStateCubit>().state.address!.street ?? 'Укажите адрес',
                //                         style: AppStyles.bodyBold,
                //                         overflow: TextOverflow.ellipsis,
                //                       ),
                //                     ),
                //                   if (getIt<AuthBloc>().state == const AuthState.authenticated())
                //                     BlocBuilder<UserAddressBloc, UserAddressState>(
                //                       builder: (context, state) {
                //                         return Expanded(
                //                           child: Text(
                //                             state.maybeMap(
                //                               success: (value) => value.addresses.isNotEmpty ? value.addresses[0].address : 'Укажите адрес',
                //                               orElse: () => 'Укажите адрес',
                //                             ),
                //                             style: AppStyles.bodyBold,
                //                             overflow: TextOverflow.ellipsis,
                //                           ),
                //                         );
                //                       },
                //                     ),
                //                   AppStyles.xSsmallHGap,
                //                   SizedBox(
                //                     width: 20,
                //                     height: 20,
                //                     child: SvgPicture.asset(
                //                       'assets/icons/pencil_underscore.svg',
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       AppStyles.smallHGap,
                //       SizedBox(
                //         //width: 101,
                //         height: 32,
                //         child: ElevatedButton(
                //           onPressed: () {
                //             context.router.parent<TabsRouter>()?.navigate(
                //                   const LoyaltyRoute(),
                //                 );
                //           },
                //           style: ElevatedButton.styleFrom(
                //             padding: const EdgeInsets.only(
                //               top: 6,
                //               right: 8,
                //               bottom: 6,
                //               left: 12,
                //             ),
                //             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //           ),
                //           child: Row(
                //             children: [
                //               if (context.watch<AuthBloc>().state != const AuthState.authenticated())
                //                 Text(
                //                   'Бонусы',
                //                   style: AppStyles.subheadBold.copyWith(
                //                     height: 1,
                //                   ),
                //                 ),
                //               if (context.watch<AuthBloc>().state == const AuthState.authenticated())
                //                 context.watch<ProfileCubit>().state.maybeMap(
                //                       done: (value) => Text(
                //                         '${value.profile.bonus.count}',
                //                         style: AppStyles.subheadBold,
                //                       ),
                //                       orElse: () => Text(
                //                         'Бонусы',
                //                         style: AppStyles.subheadBold.copyWith(
                //                           height: 1,
                //                         ),
                //                       ),
                //                     ),
                //               AppStyles.xxsmall6HGap,
                //               SizedBox(
                //                 width: 20,
                //                 height: 20,
                //                 child: SvgPicture.asset(
                //                   'assets/icons/bonus_icn.svg',
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                AppStyles.smallVGap,
                const SizedBox(
                  width: double.infinity,
                  child: Banners(),
                ),
                AppStyles.xxsmall20VGap,
                BlocBuilder<CollectionsBloc, CollectionsState>(
                  builder: (context, state) {
                    if (state is CollectionsDone &&
                        state.collections?.isEmpty == true) {
                      return Container();
                    }
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Collections(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            context.navigateTo(SearchRoute());
                          },
                          child: IgnorePointer(
                            child: InputText(
                              readOnly: true,
                              hintText: 'Найти',
                              fillColor: AppColors.white,
                              prefixIcon: SizedBox(
                                width: 17.4,
                                height: 17.4,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/search.svg',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AppStyles.xxsmall12HGap,
                      const FilterButton(),
                    ],
                  ),
                ),
                AppStyles.smallVGap,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 28,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppStyles.mediumRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray.withOpacity(.1),
                        blurRadius: 8.0,
                        offset: const Offset(
                          0.0,
                          12.0,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Категории',
                        style: AppStyles.title2,
                      ),
                      AppStyles.xxsmallVGap,
                      BlocBuilder<CategoriesBloc, CategoriesState>(
                        builder: (context, state) {
                          final double imageWidth =
                              (MediaQuery.of(context).size.width -
                                      (2 * 16) -
                                      12) /
                                  2;
                          if (state is CategoriesDone) {
                            final List<CategoryEntity> categories = state
                                    .categories
                                    ?.where((element) =>
                                        element.isCollection == false)
                                    .toList() ??
                                [];

                            return GridView.builder(
                              itemCount: categories.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 20.0,
                                childAspectRatio:
                                    imageWidth / ((imageWidth + 24 + 8)),
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                final CategoryEntity category =
                                    categories[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.pushRoute(CatalogRoute(
                                      selectedCategoryId: category.id,
                                    ));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            AppStyles.btnRadius),
                                        child: FastCachedImage(
                                          width: imageWidth,
                                          height: imageWidth,
                                          url: category.picture ??
                                              'https://admin.monobox.app/storage/images/cb13ef1316d2a915ac4b04dbfa101cca.webp',
                                          fit: BoxFit.cover,
                                          fadeInDuration:
                                              const Duration(seconds: 0),
                                          errorBuilder:
                                              (context, exception, stacktrace) {
                                            return Container();
                                          },
                                          loadingBuilder: (p0, p1) => Container(
                                            width: imageWidth,
                                            height: imageWidth,
                                            decoration: BoxDecoration(
                                              color: AppColors.shimmer,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    AppStyles.btnRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // CachedNetworkImage(
                                      //   imageUrl: category.picture ?? 'https://admin.monobox.app/storage/images/cb13ef1316d2a915ac4b04dbfa101cca.webp',
                                      //   imageBuilder: (context, imageProvider) => Container(
                                      //     width: imageWidth,
                                      //     height: imageWidth,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.all(
                                      //         Radius.circular(
                                      //           AppStyles.productPicRadius,
                                      //         ),
                                      //       ),
                                      //       image: DecorationImage(
                                      //         image: imageProvider,
                                      //         fit: BoxFit.cover,
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   placeholder: (context, url) => Container(
                                      //     width: imageWidth,
                                      //     height: imageWidth,
                                      //     decoration: BoxDecoration(
                                      //       color: AppColors.shimmer,
                                      //       borderRadius: BorderRadius.all(
                                      //         Radius.circular(AppStyles.btnRadius),
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   errorWidget: (context, url, error) => Container(
                                      //     width: imageWidth,
                                      //     height: imageWidth,
                                      //     decoration: BoxDecoration(
                                      //       color: AppColors.shimmer,
                                      //       borderRadius: BorderRadius.all(
                                      //         Radius.circular(AppStyles.btnRadius),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      AppStyles.xsmallVGap,
                                      SizedBox(
                                        height: 24,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                            child: Text(
                                              category.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyles.callout
                                                  .copyWith(height: 1),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                          return GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 20.0,
                              childAspectRatio:
                                  imageWidth / ((imageWidth + 24 + 8)),
                            ),
                            children: [
                              CategoryPlaceHolder(imageWidth: imageWidth),
                              CategoryPlaceHolder(imageWidth: imageWidth),
                              CategoryPlaceHolder(imageWidth: imageWidth),
                              CategoryPlaceHolder(imageWidth: imageWidth),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: Platform.isAndroid ? 75 : 65,
                ),
                // const GiftScale(),
                // AppStyles.smallVGap,
              ],
            ),
          ),
        ),
        BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (settings) => settings.loyalty &&
                      context.watch<GiftsScaleBloc>().state.maybeWhen(
                            success: (giftsScale) => giftsScale.isNotEmpty,
                            orElse: () => false,
                          )
                  ? const Positioned(
                      bottom: 3,
                      left: 0,
                      right: 0,
                      child: GiftScale(
                        pad: 6,
                      ),
                    )
                  : Container(),
              orElse: () => Container(),
            );
          },
        ),
      ],
    );
  }
}
