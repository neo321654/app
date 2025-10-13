import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:monobox/features/home/domain/entities/product_entity.dart';

import '../../../../config/themes/styles.dart';
import '../../domain/entities/category_entity.dart';
import 'product_card.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    super.key,
    required this.catalog,
    this.isLast = false,
  });

  final CategoryEntity catalog;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final List<ProductEntity> products = (catalog.products ?? []).toList();

    final double imageWidth =
        (MediaQuery.of(context).size.width - (2 * 16) - (5 * 12)) / 2;
    final double imageHeight = imageWidth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppStyles.mediumVGap,
        Text(
          catalog.title,
          style: AppStyles.title3,
        ),
        AppStyles.xxsmallVGap,
        // GridView.count(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   crossAxisCount: 2,
        //   crossAxisSpacing: 12.0,
        //   mainAxisSpacing: 16.0,
        //   children: [
        //     ...products.map((product) => ProductCard(
        //           product: product,
        //           height: 308,
        //         ))
        //   ],
        // ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 16.0,
            //childAspectRatio: 158 / (imageWidth + (12 * 3) + 24 + 16 + 46),
            //childAspectRatio: (1 / 1.75),
            //childAspectRatio: (158 / 308),
            //childAspectRatio: 158 / ((308 - 24 + 8 + 4)),
            height: 12 + imageHeight + 12 + 40 + 12 + 24 + 16 + 46 + 12,
          ),
          itemBuilder: (BuildContext context, int index) {
            final ProductEntity product = products[index];
            // return Container(
            //   color: Colors.red,
            // );
            return ProductCard(product: product);
          },
        ),
        if (isLast)
          const SizedBox(
            height: 16,
          )
      ],
    );
  }
}

class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight
    extends SliverGridDelegate {
  /// Creates a delegate that makes grid layouts with a fixed number of tiles in
  /// the cross axis.
  ///
  /// All of the arguments must not be null. The `mainAxisSpacing` and
  /// `crossAxisSpacing` arguments must not be negative. The `crossAxisCount`
  /// and `childAspectRatio` arguments must be greater than zero.
  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
    required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.height = 56.0,
  })  : assert(crossAxisCount > 0),
        assert(mainAxisSpacing >= 0),
        assert(crossAxisSpacing >= 0),
        assert(height > 0);

  /// The number of children in the cross axis.
  final int crossAxisCount;

  /// The number of logical pixels between each child along the main axis.
  final double mainAxisSpacing;

  /// The number of logical pixels between each child along the cross axis.
  final double crossAxisSpacing;

  /// The height of the crossAxis.
  final double height;

  bool _debugAssertIsValid() {
    assert(crossAxisCount > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(height > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final double usableCrossAxisExtent =
        constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = height;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(
      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight oldDelegate) {
    return oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.height != height;
  }
}
