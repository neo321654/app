import 'package:flutter/material.dart';

import '../../../../../../config/themes/styles.dart';
import '../../../widgets/social_networks.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Соцсети',
          style: AppStyles.headline,
        ),
        const SizedBox(height: 12),
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
        const SizedBox(height: 20),
        const SocialNetworks(),
      ],
    );
  }
}
