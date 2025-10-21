import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../home/presentation/bloc/settings/settings_bloc.dart';
import '../../../profile/presentation/widgets/profile_item.dart';
import '../widgets/social_networks.dart';

import 'package:monobox/features/more/presentation/bloc/menu_bloc.dart';

@RoutePage()
class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  void initState() {
    super.initState();
    context.read<MenuBloc>().add(const GetMenu());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      //backgroundColor: AppColors.white,
      //titleSpacing: 0,
      title: Text(
        'Ещё',
        style: AppStyles.title2,
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          RoundedContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<MenuBloc, MenuState>(
                  builder: (context, state) {
                    if (state is MenuLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is MenuError) {
                      return const Center(child: Text('Error'));
                    }
                    if (state is MenuDone && state.menuResponse?.mobile?.isNotEmpty == true) {
                      final menuItems = state.menuResponse!.mobile!.first.links;
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ProfileItem(
                            icon: menuItems[index].icon ?? '',
                            text: menuItems[index].title,
                            onTap: (BuildContext context) {
                              final path = menuItems[index].link;
                              if (path == '/shops') {
                                context.navigateTo(const ShopsRoute());
                              } else if (path == '/about-delivery') {
                                context.navigateTo(const AboutDeliveryRoute());
                              } else if (path == '/about-payments') {
                                context.navigateTo(const AboutPaymentsRoute());
                              } else if (path == '/notifications') {
                                context.navigateTo(
                                    const NotificationsSettingsRoute());
                              } else if (path == '/about-politics') {
                                context.navigateTo(const AboutPoliticsRoute());
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 20,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: Color(0xFFE0E0E0),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: menuItems.length,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 56,
                  child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: AppStyles.greyElevatedButtonOpacity,
                        onPressed: () {
                          final List<BottomSheetAction> actions = [];
                          state.maybeWhen(
                            success: (settings) async {
                              if (settings.feedback?.phone != null) {
                                actions.add(BottomSheetAction(
                                  title: Text(
                                    'Вызов +${(settings.feedback?.phone ?? "")}',
                                    style: AppStyles.bodyRegular.copyWith(
                                      color: !Platform.isIOS
                                          ? AppColors.black
                                          : const Color(0xFF007AFF),
                                    ),
                                  ),
                                  onPressed: (context) async {
                                    Uri phoneno = Uri(
                                        scheme: 'tel',
                                        path:
                                            '+${(settings.feedback?.phone ?? "")}');

                                    if (await canLaunchUrl(phoneno)) {
                                      await launchUrl(phoneno);
                                    }
                                  },
                                ));
                              }

                              if (settings.feedback?.vk != null) {
                                actions.add(BottomSheetAction(
                                  title: Text(
                                    'Написать в BK',
                                    style: AppStyles.bodyRegular.copyWith(
                                      color: !Platform.isIOS
                                          ? AppColors.black
                                          : const Color(0xFF007AFF),
                                    ),
                                  ),
                                  onPressed: (context) async {
                                    String urlString =
                                        settings.feedback?.vk ?? '';
                                    if (Uri.tryParse(urlString)
                                            ?.scheme
                                            .isEmpty ??
                                        true) {
                                      urlString = 'https://$urlString';
                                    }
                                    Uri link = Uri.parse(urlString);
                                    if (await canLaunchUrl(link)) {
                                      await launchUrl(link);
                                    }
                                  },
                                ));
                              }

                              if (settings.feedback?.wa != null) {
                                actions.add(BottomSheetAction(
                                  title: Text(
                                    'Написать в WhatsApp',
                                    style: AppStyles.bodyRegular.copyWith(
                                      color: !Platform.isIOS
                                          ? AppColors.black
                                          : const Color(0xFF007AFF),
                                    ),
                                  ),
                                  onPressed: (context) async {
                                    String urlString =
                                        settings.feedback?.wa ?? '';
                                    if (Uri.tryParse(urlString)
                                            ?.scheme
                                            .isEmpty ??
                                        true) {
                                      urlString = 'https://$urlString';
                                    }
                                    Uri link = Uri.parse(urlString);
                                    if (await canLaunchUrl(link)) {
                                      await launchUrl(link);
                                    }
                                  },
                                ));
                              }

                              if (settings.feedback?.tg != null) {
                                actions.add(BottomSheetAction(
                                  title: Text(
                                    'Написать в Telegram',
                                    style: AppStyles.bodyRegular.copyWith(
                                      color: !Platform.isIOS
                                          ? AppColors.black
                                          : const Color(0xFF007AFF),
                                    ),
                                  ),
                                  onPressed: (context) async {
                                    String urlString =
                                        settings.feedback?.tg ?? '';
                                    if (Uri.tryParse(urlString)
                                            ?.scheme
                                            .isEmpty ??
                                        true) {
                                      urlString = 'https://$urlString';
                                    }
                                    Uri link = Uri.parse(urlString);
                                    if (await canLaunchUrl(link)) {
                                      await launchUrl(link);
                                    }
                                  },
                                ));
                              }
                            },
                            orElse: () => null,
                          );

                          showAdaptiveActionSheet(
                            context: context,
                            androidBorderRadius: 30,
                            actions: actions,
                            cancelAction: CancelAction(
                              title: Text(
                                'Отмена',
                                style: AppStyles.bodyRegular,
                              ),
                            ),
                          );
                          // state.maybeWhen(
                          //   success: (settings) async {
                          //     Uri phoneno = Uri(
                          //         scheme: 'tel',
                          //         path: '+${(settings.feedback?.phone ?? "")}');

                          //     if (await canLaunchUrl(phoneno)) {
                          //       await launchUrl(phoneno);
                          //     }
                          //   },
                          //   orElse: () => null,
                          // );
                        },
                        child: SizedBox(
                          height: 24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Связаться',
                                style: AppStyles.callout.copyWith(
                                  color: AppColors.darkPrimary,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 3.23,
                                  top: 4.41,
                                  right: 3.53,
                                  bottom: 5.25,
                                ),
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/icons/svyaz.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Соцсети',
                  style: AppStyles.headline,
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SocialNetworks(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              final settingsState = context.read<SettingsBloc>();
              if (settingsState.state is Success) {
                String linkString =
                    (settingsState.state as Success).settings.monobox!.link!;
                Uri url = Uri.parse(linkString);
                if (url.scheme.isEmpty) {
                  linkString = 'https://$linkString';
                  url = Uri.parse(linkString);
                }
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              }
            },
            child: Center(
              child: SizedBox(
                height: 150.79,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Работает на платформе',
                        style: AppStyles.bodyBold.copyWith(
                          color: AppColors.dark,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: SvgPicture.asset(
                          'assets/icons/monobox_logo.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 51,
          ),
        ],
      ),
    );
  }
}
