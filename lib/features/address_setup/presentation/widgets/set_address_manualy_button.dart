import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class SetAddressManualyButton extends StatelessWidget {
  const SetAddressManualyButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 170,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppStyles.whiteElevatedButton.copyWith(
          padding: WidgetStateProperty.resolveWith(
            (states) => const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
        ),
        child: Center(
          child: Text(
            'Указать вручную',
            style: AppStyles.callout.copyWith(
              color: AppColors.darkGray,
            ),
          ),
        ),
      ),
    );
  }
}
