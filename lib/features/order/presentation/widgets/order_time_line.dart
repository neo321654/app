import 'package:flutter/material.dart';

import 'package:timeline_tile/timeline_tile.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class OrderTimeLine extends StatelessWidget {
  const OrderTimeLine({
    super.key,
    required this.orderTimeLineItems,
  });

  final List<OrderTimeLineItem> orderTimeLineItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orderTimeLineItems.length,
      itemBuilder: (BuildContext context, int index) {
        final item = orderTimeLineItems[index];
        return TimelineTile(
          lineXY: .3,
          isFirst: index == 0,
          isLast: (index + 1) == orderTimeLineItems.length,
          alignment: TimelineAlign.manual,
          endChild: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              height: 54,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: AppStyles.subheadBold.copyWith(
                        color:
                            !item.isInactive ? AppColors.black : AppColors.gray,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      item.subTitle ?? '',
                      style: AppStyles.footnote,
                    ),
                  ],
                ),
              ),
            ),
          ),
          startChild: SizedBox(
            height: 54,
            width: 95,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.time,
                style: AppStyles.footnote,
              ),
            ),
          ),
          beforeLineStyle: LineStyle(
            color: item.isInactive ? AppColors.lightGray : AppColors.positive,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: item.isInactive ? AppColors.lightGray : AppColors.positive,
            thickness: 2,
          ),
          indicatorStyle: IndicatorStyle(
            width: 8,
            color: item.isInactive ? AppColors.lightGray : AppColors.positive,
          ),
        );
      },
    );
  }
}

class OrderTimeLineItem {
  final String time;
  final String title;
  final String? subTitle;
  final bool isInactive;

  OrderTimeLineItem({
    required this.time,
    required this.title,
    this.subTitle,
    this.isInactive = false,
  });
}
