import 'package:flutter/widgets.dart';

import 'package:monobox/config/themes/colors.dart';

import '../../../../config/themes/styles.dart';
import '../../domain/entities/order_product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final OrderProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.image != null)
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.image!),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppStyles.radiusElement,
                ),
              ),
            ),
          ),
        if (product.image == null)
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0XFFF0F0F0),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppStyles.radiusElement,
                ),
              ),
            ),
          ),
        const SizedBox(
          width: 12,
        ),
        Text(
          '${product.qnt} x',
          style: AppStyles.footnote,
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: Text(
            product.title,
            style: AppStyles.subheadBold.copyWith(
              color: AppColors.dark,
            ),
          ),
        ),
        Text(
          '${product.price} ₽',
          style: AppStyles.subheadBold.copyWith(
            color: AppColors.dark,
          ),
        ),
      ],
    );
  }
}
