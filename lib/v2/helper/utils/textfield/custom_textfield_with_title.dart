import 'package:flutter/material.dart';

import '../colors.dart';

class CustomTextfieldWithTitle extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool readOnly;
  const CustomTextfieldWithTitle({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
    this.maxLines,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          readOnly: readOnly,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              focusedBorder: _border(indent: 2),
              enabledBorder: _border(),
              errorBorder: _border(
                indent: 1,
                color: Colors.red,
              ),
              focusedErrorBorder: _border(
                indent: 2,
                color: primaryColor,
              )),
        )
      ],
    );
  }
}

OutlineInputBorder _border({final double? indent, final Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      width: indent ?? 1,
      color: color ?? primaryColor,
    ),
  );
}
