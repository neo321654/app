import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../config/themes/colors.dart';
import '../../config/themes/styles.dart';

class TextArea extends StatefulWidget {
  const TextArea({
    super.key,
    this.label,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.hintText,
    this.controller,
    this.scrollPadding,
  });

  final String? label;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? hintText;
  final TextEditingController? controller;
  final EdgeInsets? scrollPadding;

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  var textlength = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label?.isNotEmpty == true)
          Text(
            widget.label!,
            style: AppStyles.footnoteBold.copyWith(color: AppColors.darkGray),
          ),
        if (widget.label?.isNotEmpty == true) AppStyles.xSsmallVGap,
        Stack(
          children: [
            TextField(
              scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
              controller: widget.controller,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: widget.hintText ?? '',
                filled: true,
                hintStyle: AppStyles.subhead.copyWith(color: AppColors.gray),
                fillColor: AppColors.superLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppStyles.btnRadius,
                    ),
                  ),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.darkPrimary, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppStyles.btnRadius,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 12,
                  top: 12,
                  right: 12,
                  bottom: 36,
                ),
                counterText: "",
              ),
              maxLength: widget.maxLength,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              onChanged: (value) {
                setState(() {
                  textlength = value.length;
                });
              },
              style: AppStyles.subhead.copyWith(
                color: AppColors.black,
              ),
            ),
            Positioned(
              bottom: 12,
              right: 12,
              child: Row(
                children: [
                  Text(
                    '${(widget.maxLength! - textlength)}/${widget.maxLength}',
                    style: AppStyles.subhead.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                  AppStyles.xSsmallHGap,
                  SvgPicture.asset(
                    'assets/icons/pencil_underscore.svg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
