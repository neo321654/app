import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';
import '../../config/themes/styles.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.focusNode,
    this.fillColor,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.keyboardType,
    this.style,
    this.hintStyle,
    this.readOnly = false,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.onSubmitted,
    this.contentPadding,
    this.scrollPadding,
    this.height,
    this.disableFocusBorder = false,
    this.minLines,
    this.maxLines,
  });

  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final void Function(String)? onSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsets? scrollPadding;
  final double? height;
  final bool disableFocusBorder;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label?.isNotEmpty == true)
          Text(
            label!,
            style: AppStyles.footnoteBold.copyWith(
              color: AppColors.darkGray,
            ),
          ),
        if (label?.isNotEmpty == true) AppStyles.xSsmallVGap,
        Container(
          height: height, // will be null (auto) if not provided
          constraints: height == null
              ? const BoxConstraints(minHeight: 48)
              : null, // keep old min height when auto
          child: TextField(
            scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
            onSubmitted: onSubmitted,
            autofocus: autofocus,
            focusNode: focusNode,
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType,
            readOnly: readOnly,
            onTap: onTap,
            textCapitalization: textCapitalization,
            minLines: minLines ?? 1,
            maxLines: maxLines ?? 1, // null → unlimited
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: prefixIcon,
              prefixIconConstraints: prefixIconConstraints,
              suffixIcon: suffixIcon,
              suffixIconConstraints: suffixIconConstraints,
              hintText: hintText ?? '',
              hintStyle: hintStyle ??
                  AppStyles.body.copyWith(
                    color: AppColors.gray,
                  ),
              filled: true,
              fillColor: fillColor ?? AppColors.superLight,
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
              focusedBorder: disableFocusBorder
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.darkPrimary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          AppStyles.btnRadius,
                        ),
                      ),
                    ),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
            ),
            style: style ??
                AppStyles.body.copyWith(
                  color: AppColors.black,
                ),
          ),
        ),
      ],
    );
  }
}
