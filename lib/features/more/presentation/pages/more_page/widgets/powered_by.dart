import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../config/themes/styles.dart';
import '../../../../../home/presentation/bloc/settings/settings_bloc.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({super.key});

  Future<void> _launchMonoboxUrl(BuildContext context) async {
    final settingsState = context.read<SettingsBloc>().state;
    if (settingsState is Success) {
      final link = settingsState.settings.monobox?.link;
      if (link != null && link.isNotEmpty) {
        var urlString = link;
        if (Uri.tryParse(urlString)?.hasScheme == false) {
          urlString = 'https://$urlString';
        }
        final url = Uri.parse(urlString);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchMonoboxUrl(context),
      child: Center(
        child: SizedBox(
          height: 150.79,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Работает на платформе',
                style: AppStyles.bodyBold.copyWith(color: AppColors.dark),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: SvgPicture.asset('assets/icons/monobox_logo.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
