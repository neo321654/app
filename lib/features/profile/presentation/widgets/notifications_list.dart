import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';

import '../../domain/entities/notification_entity.dart';
import '../bloc/notification/notification_settings_bloc.dart';
import 'notification_switcher.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({
    super.key,
    required this.notifications,
  });

  final List<NotificationEntity> notifications;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...notifications.map(
          (notification) => Container(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: AppStyles.footnote,
                ),
                ...notification.items.map(
                  (item) => Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: notifications.last == notification &&
                              notifications.last.items.last == item
                          ? null
                          : const Border(
                              bottom: BorderSide(
                                color: AppColors.superLight,
                              ),
                            ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: AppStyles.subhead.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 55,
                          //   height: 31,
                          //   child: CupertinoSwitch(
                          //     activeColor: AppColors.lightPrimary,
                          //     value: item.status,
                          //     onChanged: (value) {
                          //       context.read<NotificationSettingsBloc>().add(
                          //             NotificationSettingsEvent
                          //                 .changeNotificationStatus(
                          //               item.id,
                          //               value,
                          //             ),
                          //           );
                          //     },
                          //   ),
                          // ),
                          SizedBox(
                            width: 55,
                            height: 31,
                            child: NotificationSwitcher(
                              status: item.status,
                              onChanged: (value) {
                                context.read<NotificationSettingsBloc>().add(
                                      NotificationSettingsEvent
                                          .changeNotificationStatus(
                                        item.id,
                                        value,
                                      ),
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
