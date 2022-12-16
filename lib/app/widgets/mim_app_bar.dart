import 'package:flutter/material.dart';
import 'package:mim_generator/app/widgets/mim_text.dart';
import 'package:mim_generator/core/strings/words.dart';

class MimAppBar extends PreferredSize {
  final Widget? leading, title;
  final bool? showLeading;
  final List<Widget>? actions;

  MimAppBar({
    super.key,
    this.leading,
    this.title,
    this.showLeading = true,
    this.actions,
  }) : super(
    preferredSize: AppBar().preferredSize,
    child: AppBar(
      leading: showLeading! ? (leading ?? const BackButton()) : null,
      title: title ?? MimText(
        MimWords.mimGenerator,
      ),
      centerTitle: true,
      actions: actions ?? [],
    )
  );
}