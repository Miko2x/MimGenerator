import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mim_generator/core/theme/palette.dart';

class MimTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? format;
  final String hint;
  const MimTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.hint = '',
    this.format,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.multiline,
        inputFormatters: format,
        maxLines: 3,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          fillColor: Palette.n20,
          filled: true,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Palette.n40,
          ),
          hintText: hint,
        ),
      ),
    );
  }
}