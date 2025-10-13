import 'package:flutter/material.dart';

import '../../../../core/widgets/rounded_container.dart';

class ProfileOrdersPreloader extends StatelessWidget {
  const ProfileOrdersPreloader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 214,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 16,
          ),
          _preloaderContainer(),
          const SizedBox(
            width: 12,
          ),
          _preloaderContainer(),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  Widget _preloaderContainer() {
    return SizedBox(
      width: 310,
      child: RoundedContainer(
        height: 214,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Container(),
      ),
    );
  }
}
