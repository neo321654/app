import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../domain/entities/product_entity.dart';
import 'product_badge.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageWidth = screenSize.width - (16 * 2);
    final imageHeight = imageWidth;

    return Stack(
      children: [
        Hero(
          tag: 'product_img_${product.id}',
          child: CachedNetworkImage(
            imageUrl: product.image ??
                'https://admin.monobox.app/storage/images/cb13ef1316d2a915ac4b04dbfa101cca.webp',
            imageBuilder: (context, imageProvider) => Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyles.btnRadius,
                  ),
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyles.btnRadius,
                  ),
                ),
                color: AppColors.shimmer,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                color: AppColors.shimmer,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyles.btnRadius,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (product.tags.isNotEmpty)
          for (int index = 0; index < product.tags.length; index++)
            Positioned(
              left: 4,
              bottom: ((18 + 4) * index) / 1 + 8,
              child: ProductBadge(tag: product.tags[index]),
            ),
      ],
    );
  }
}
