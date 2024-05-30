import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kliq_news_app/core/global/constants/app_sizes.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

class AppTextField extends StatelessWidget {
  final bool? isDone;
  final bool autoFocus;
  final bool readOnly;
  final String hintText;
  final String label;
  final bool? isObscure;
  final int? maxLength;
  final TextInputType? inputType;
  final Icon? icon;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? hidePadding;
  final TextEditingController? controller;

  const AppTextField(
      {super.key,
      this.isDone = false,
      this.readOnly = false,
      required this.hintText,
      required this.label,
      this.controller,
      this.isObscure,
      this.icon,
      this.hidePadding = false,
      this.inputType,
      this.validator,
      this.maxLength,
      this.autoFocus = false,
      this.onChanged,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hidePadding ?? false
          ? const EdgeInsets.all(0)
          : const EdgeInsets.symmetric(
              horizontal: AppPadding.padding16, vertical: AppPadding.padding8),
      child: TextFormField(
        autofocus: autoFocus,
        onChanged: onChanged,
        maxLength: maxLength,
        readOnly: readOnly,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: isDone! ? TextInputAction.done : TextInputAction.next,
        controller: controller,
        expands: false,
        keyboardType: inputType,
        validator: validator,
        inputFormatters: inputFormatters,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.primaryColor, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.primaryColor, width: 2.0),
          ),
          prefixIcon: icon,
          hintText: hintText,
          suffixIcon: readOnly
              ? IconButton(
                  onPressed: readOnly ? () => controller!.clear() : null,
                  icon: const Icon(Icons.clear))
              : null,
          label: Text(label),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
