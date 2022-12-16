import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mim_generator/app/widgets/mim_button.dart';
import 'package:mim_generator/app/widgets/mim_text.dart';
import 'package:mim_generator/app/widgets/mim_textfield.dart';
import 'package:mim_generator/core/strings/sentences.dart';
import 'package:mim_generator/core/strings/words.dart';
import 'package:mim_generator/core/theme/palette.dart';

final List<Color> listColor = [
  Colors.white,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.black,
];

class ModalAddText extends AlertDialog {
  final TextEditingController controller;
  final Color selectedColor;
  final Function? onSetColor, onClear, onAdd;
  ModalAddText({
    super.key,
    required this.controller,
    required this.selectedColor,
    required this.onSetColor,
    this.onClear,
    this.onAdd,
  }) : super(
    contentPadding: EdgeInsets.zero,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: MimText(
            MimSentences.addMimText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: MimTextField(
            controller: controller,
            hint: 'Ex: Kamu nanyea?!..',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          width: Get.width,
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listColor.length,
            itemBuilder: (context, index) {
              Color color = listColor[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () => onSetColor!(color),
                  customBorder: const CircleBorder(),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: selectedColor == color ? 3.0 : 1.0,
                        color: Palette.primary,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: MimButton(
                  label: MimWords.clear,
                  labelColor: Palette.r50,
                  color: Colors.white,
                  borderColor: Palette.r50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: () => onClear!() ?? () {
                    controller.clear();
                    Get.back();
                  },
                ),
              ),
              MimButton(
                label: MimWords.add,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                onPressed: () => onAdd!() ?? () => Get.back(),
              ),
            ],
          ),
        ),
      ],
    )
  );
}