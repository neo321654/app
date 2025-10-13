import 'package:flutter/cupertino.dart';
import '../../../../config/themes/colors.dart';

class NotificationSwitcher extends StatefulWidget {
  const NotificationSwitcher(
      {super.key, required this.status, required this.onChanged});

  final bool status;
  final ValueChanged<bool> onChanged;

  @override
  State<NotificationSwitcher> createState() => _NotificationSwitcherState();
}

class _NotificationSwitcherState extends State<NotificationSwitcher> {
  late bool newStatus;

  @override
  void initState() {
    newStatus = widget.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeTrackColor: AppColors.lightPrimary,
      value: newStatus,
      onChanged: (value) {
        widget.onChanged(value);
        setState(() {
          newStatus = value;
        });
      },
    );
  }
}
