import 'package:flutter/material.dart';
import 'package:mim_generator/core/theme/palette.dart';
import 'package:mim_generator/core/extension/color_brightness.dart';

class MimButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool loading;
  final bool disabled;
  final bool usePopupMenu;
  final String? label;
  final Color? color;
  final Color? highlightColor;
  final Color? loadingColor;
  final Color? borderColor;
  final Color labelColor;
  final double? loadingSize;
  final EdgeInsets? padding;
  final BorderRadius? customBorderRadius;
  final Widget? customLabel;

  const MimButton({
    Key? key,
    required this.onPressed,
    this.color,
    this.highlightColor,
    this.loadingColor,
    this.borderColor,
    this.labelColor = Colors.white,
    this.label,
    this.loading = false,
    this.disabled = false,
    this.usePopupMenu = false,
    this.loadingSize,
    this.padding,
    this.customBorderRadius,
    this.customLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: customBorderRadius ?? BorderRadius.circular(8.0),
          side: BorderSide(
            color: disabled ? Palette.n30 : borderColor ?? Colors.transparent
          )
        ),
        backgroundColor: disabled
          ? Palette.n30
          : loading ? Colors.transparent : color,
        foregroundColor: highlightColor != null
          ? highlightColor!.lighten()
          : color != null
            ? color!.lighten()
            : Palette.n30.lighten(),
        padding: padding ?? const EdgeInsets.all(16.0),
      ),
      onPressed: loading || disabled ? null : onPressed,
      child: loading
        ? SizedBox(
            width: loadingSize ?? 20.0,
            height: loadingSize ?? 20.0,
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(loadingColor ?? color ?? Palette.n30),
            ),
          )
          : customLabel ?? Text(
            label ?? 'label',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: disabled
              ? Palette.n60
              : labelColor
            ),
          )
    );
  }
}