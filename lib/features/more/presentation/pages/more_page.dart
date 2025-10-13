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
import '../../../profile/presentation/models/profile_item.dart'
    as profile_item_model;
import '../../../profile/presentation/widgets/profile_item.dart';
import '../widgets/social_networks.dart';

@RoutePage()
class MorePage extends StatelessWidget {
  MorePage({super.key});

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
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ProfileItem(
                      icon: _prfileItems[index].icon,
                      text: _prfileItems[index].text,
                      onTap: (BuildContext context) =>
                          _prfileItems[index].onTap != null
                              ? _prfileItems[index].onTap!(context)
                              : null,
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
                  itemCount: _prfileItems.length,
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

  final List<profile_item_model.ProfileItem> _prfileItems = [
    profile_item_model.ProfileItem(
      icon: 'assets/icons/compas.svg',
      text: 'Где рестораны?',
      onTap: (BuildContext context) {
        context.navigateTo(const ShopsRoute());
      },
    ),
    profile_item_model.ProfileItem(
      icon: 'assets/icons/beg.svg',
      text: 'О доставке',
      onTap: (BuildContext context) {
        context.navigateTo(const AboutDeliveryRoute());
      },
    ),
    profile_item_model.ProfileItem(
      icon: 'assets/icons/bank.svg',
      text: 'Об оплате',
      onTap: (BuildContext context) {
        context.navigateTo(const AboutPaymentsRoute());
      },
    ),
    profile_item_model.ProfileItem(
      icon: 'assets/icons/ring.svg',
      text: 'Уведомления',
      onTap: (BuildContext context) {
        context.navigateTo(const NotificationsSettingsRoute());
      },
    ),
    profile_item_model.ProfileItem(
      icon: 'assets/icons/beg2.svg',
      text: 'Политика и соглашения',
      onTap: (BuildContext context) {
        context.navigateTo(const AboutPoliticsRoute());
      },
    ),
  ];
}
