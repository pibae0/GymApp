import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/utils/app_style.dart';

class CustomTextField extends StatefulWidget {
  final int maxLength;
  final int? maxLines;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffix;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.maxLength,
    required this.hintText,
    required this.controller,
    this.maxLines,
    this.suffix,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? get _focusNode => widget.focusNode;

  // @override
  // void dipose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      focusNode: _focusNode,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      controller: widget.controller,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.multiline,
      cursorColor: Colors.orange,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      validator: widget.validator,
      decoration: InputDecoration(
        hintStyle: AppTheme.hintStyle,
        hintText: widget.hintText,
        suffixIcon: widget.suffix,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.accent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.medium),
        ),
      ),
    );
  }
}
