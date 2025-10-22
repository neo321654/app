import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/styles.dart';
import '../../../../../home/presentation/bloc/settings/settings_bloc.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  void _showContactOptions(BuildContext context, SettingsState state) {
    final List<BottomSheetAction> actions = [];
    state.maybeWhen(
      success: (settings) {
        _addContactAction(
          actions: actions,
          title: 'Вызов +${settings.feedback?.phone ?? ""}',
          url: settings.feedback?.phone != null
              ? 'tel:${settings.feedback!.phone!}'
              : null,
        );
        _addContactAction(
          actions: actions,
          title: 'Написать в BK',
          url: settings.feedback?.vk,
        );
        _addContactAction(
          actions: actions,
          title: 'Написать в WhatsApp',
          url: settings.feedback?.wa,
        );
        _addContactAction(
          actions: actions,
          title: 'Написать в Telegram',
          url: settings.feedback?.tg,
        );
      },
      orElse: () {},
    );

    if (actions.isEmpty) return;

    showAdaptiveActionSheet(
      context: context,
      androidBorderRadius: 30,
      actions: actions,
      cancelAction: CancelAction(
        title: Text('Отмена', style: AppStyles.bodyRegular),
      ),
    );
  }

  void _addContactAction({
    required List<BottomSheetAction> actions,
    required String title,
    required String? url,
  }) {
    if (url == null || url.isEmpty) return;

    actions.add(
      BottomSheetAction(
        title: Text(
          title,
          style: AppStyles.bodyRegular.copyWith(
            color: !Platform.isIOS ? AppColors.black : const Color(0xFF007AFF),
          ),
        ),
        onPressed: (context) async {
          var urlString = url;
          if (!urlString.startsWith('tel:')) {
            if (Uri.tryParse(urlString)?.hasScheme == false) {
              urlString = 'https://$urlString';
            }
          }

          final uri = Uri.parse(urlString);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ElevatedButton(
            style: AppStyles.greyElevatedButtonOpacity,
            onPressed: () => _showContactOptions(context, state),
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
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 3.23,
                      top: 4.41,
                      right: 3.53,
                      bottom: 5.25,
                    ),
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/icons/svyaz.svg'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
