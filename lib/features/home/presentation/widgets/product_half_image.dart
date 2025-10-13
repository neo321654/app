import 'package:flutter/material.dart';

import '../../../../config/themes/styles.dart';
import '../../domain/entities/product_entity.dart';
import 'product_badge.dart';

class ProductHalfImage extends StatelessWidget {
  const ProductHalfImage({
    super.key,
    required this.product,
    required this.image1,
    required this.image2,
  });

  final String image1;
  final String image2;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageWidth = screenSize.width - (16 * 2);
    final imageHeight = imageWidth;

    return Stack(
      children: [
        Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppStyles.btnRadius,
              ),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                height: imageHeight,
                width: imageWidth / 2,
                child: Stack(
                  children: [
                    Positioned(
                      //right: -(MediaQuery.of(context).size.width / 4) * 1.5,
                      right: -(imageWidth / 2),
                      child: Image.network(
                        image1,
                        height: imageHeight,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: imageHeight,
                width: imageWidth / 2,
                child: Stack(
                  children: [
                    Positioned(
                      //right: -(MediaQuery.of(context).size.width / 4) * 1.5,
                      left: -(imageWidth / 2),
                      child: Image.network(
                        image2,
                        height: imageHeight,
                      ),
                      // child: CachedNetworkImage(
                      //   key: Key(product.image ?? 'https://placehold.co/96x96'),
                      //   imageUrl: product.image ?? 'https://placehold.co/96x96',
                      //   // imageBuilder: (context, imageProvider) => Container(
                      //   //   decoration: BoxDecoration(
                      //   //     borderRadius: const BorderRadius.all(
                      //   //       Radius.circular(16),
                      //   //     ),
                      //   //     image: DecorationImage(
                      //   //       image: imageProvider,
                      //   //       fit: BoxFit.cover,
                      //   //     ),
                      //   //   ),
                      //   // ),
                      //   // placeholder: (context, url) => _paceholder(),
                      //   // errorWidget: (context, url, error) => _paceholder(),
                      // ),
                    ),
                  ],
                ),
              ),
            ],
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
