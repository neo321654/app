import 'package:flutter/material.dart';
import 'package:monobox/features/basket/presentation/widgets/other_sous_selector.dart';
import 'package:monobox/features/home/domain/entities/product_entity.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class OtherSous extends StatelessWidget {
  const OtherSous({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          Container(
            width: 77,
            height: 44,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.all(
                Radius.circular(AppStyles.xsmallRadius),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Ещё',
                      style: AppStyles.callout.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Выберите нужный',
                  style: AppStyles.caption1.copyWith(
                    color: AppColors.gray,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 87,
            child: SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: false,
                    backgroundColor: AppColors.white,
                    useRootNavigator: true,
                    context: context,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          AppStyles.radiusBlock,
                        ),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return OtherSousSelector(
                        products: products,
                      );
                    },
                  );
                },
                style: AppStyles.greyElevatedButton.copyWith(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  'Выбрать',
                  style: AppStyles.footnote.copyWith(
                    color: AppColors.darkPrimary,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
