import 'package:flutter/material.dart';
import 'package:mim_generator/app/data/models/mim_model.dart';
import 'package:mim_generator/core/theme/palette.dart';

class MimWidget extends Container {
  final Meme meme;
  final Function(Meme meme) onTap;
  MimWidget({
    super.key,
    required this.meme,
    required this.onTap
  }) : super(
    color: Palette.primary,
    child: InkWell(
      onTap: () => onTap(meme),
      child: Image.network(
        meme.url,
      ),
    )
  );
  
}