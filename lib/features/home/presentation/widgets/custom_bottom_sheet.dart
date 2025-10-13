import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/config/themes/styles.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
    this.header,
    required this.child,
  });

  final Widget? header;
  final Widget child;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final GlobalKey _rowKey = GlobalKey();

  bool useHeightFactor = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //=> _rowHeight.value = _rowKey.currentContext.size.height
      if (_rowKey.currentContext!.size!.height >
          (MediaQuery.of(context).size.height * .9)) {
        setState(() {
          useHeightFactor = true;
        });
      }
      print('height =${_rowKey.currentContext!.size!.height}');
      print('height = 2 ${MediaQuery.of(context).size.width * .8}');
      print('height = useHeightFactor $useHeightFactor');
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: useHeightFactor ? 0.9 : null,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppStyles.btnRadius),
            topRight: Radius.circular(AppStyles.btnRadius),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: widget.header != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (widget.header != null) widget.header!,
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.lightGray,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.75,
                          vertical: 10.75,
                        ),
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          'assets/icons/close.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (useHeightFactor)
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    key: _rowKey,
                    child: widget.child,
                  ),
                ),
              ),
            if (!useHeightFactor)
              SingleChildScrollView(
                child: Container(
                  key: _rowKey,
                  child: widget.child,
                ),
              ),
          ],
        ),
        // child: Column(
        //   children: [
        //     Text('asdf'),
        //     if (useHeightFactor)
        //       Expanded(
        //         child: SingleChildScrollView(
        //           child: Column(
        //             children: [
        //               Center(
        //                 child: Container(
        //                   width: 60,
        //                   height: 5,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(AppStyles.radiusElement),
        //                     ),
        //                     color: AppColors.lightGray,
        //                   ),
        //                 ),
        //               ),
        //               Row(
        //                 mainAxisAlignment: widget.header != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
        //                 children: [
        //                   if (widget.header != null) widget.header!,
        //                   GestureDetector(
        //                     onTap: () => Navigator.pop(context),
        //                     behavior: HitTestBehavior.translucent,
        //                     child: Container(
        //                       alignment: Alignment.center,
        //                       height: 34,
        //                       width: 66,
        //                       child: Align(
        //                         alignment: Alignment.center,
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(30),
        //                             color: AppColors.lightGray,
        //                           ),
        //                           padding: const EdgeInsets.symmetric(
        //                             horizontal: 10.75,
        //                             vertical: 10.75,
        //                           ),
        //                           width: 30,
        //                           height: 30,
        //                           child: SvgPicture.asset(
        //                             'assets/icons/close.svg',
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               Container(
        //                 key: _rowKey,
        //                 child: widget.child,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     if (!useHeightFactor)
        //       SingleChildScrollView(
        //         child: Column(
        //           children: [
        //             Center(
        //               child: Container(
        //                 width: 60,
        //                 height: 5,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(AppStyles.radiusElement),
        //                   ),
        //                   color: AppColors.lightGray,
        //                 ),
        //               ),
        //             ),
        //             Row(
        //               mainAxisAlignment: widget.header != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
        //               children: [
        //                 if (widget.header != null) widget.header!,
        //                 GestureDetector(
        //                   onTap: () => Navigator.pop(context),
        //                   behavior: HitTestBehavior.translucent,
        //                   child: Container(
        //                     alignment: Alignment.center,
        //                     height: 34,
        //                     width: 66,
        //                     child: Align(
        //                       alignment: Alignment.center,
        //                       child: Container(
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(30),
        //                           color: AppColors.lightGray,
        //                         ),
        //                         padding: const EdgeInsets.symmetric(
        //                           horizontal: 10.75,
        //                           vertical: 10.75,
        //                         ),
        //                         width: 30,
        //                         height: 30,
        //                         child: SvgPicture.asset(
        //                           'assets/icons/close.svg',
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             Container(
        //               key: _rowKey,
        //               child: widget.child,
        //             ),
        //           ],
        //         ),
        //       ),
        //   ],
        // ),
      ),
    );

    return FractionallySizedBox(
      heightFactor: useHeightFactor ? 0.8 : null,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppStyles.btnRadius),
            topRight: Radius.circular(AppStyles.btnRadius),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppStyles.radiusElement),
                  ),
                  color: AppColors.lightGray,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: widget.header != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (widget.header != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: widget.header!,
                  ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    alignment: Alignment.center,
                    height: 34,
                    width: 66,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.lightGray,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.75,
                          vertical: 10.75,
                        ),
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          'assets/icons/close.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  key: _rowKey,
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
