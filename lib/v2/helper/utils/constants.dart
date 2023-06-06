import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'colors.dart';

hideKeyboard(final BuildContext context) {
  return FocusScope.of(context).unfocus();
}

OutlineInputBorder customBorder({final Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: color ?? primaryColor),
    borderRadius: BorderRadius.circular(50),
  );
}

Future<String?> getFromCamera() async {
  ImagePicker imagePicker = ImagePicker();

  XFile? image =
      await imagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);

  if (image != null) {
    final bytes = File(image.path).readAsBytesSync();
    String base64Image = base64Encode(bytes);
    _deleteImageFile(path: image.path);
    return base64Image;
  }
  return null;
}

void _deleteImageFile({required String path}) {
  File(path).deleteSync();
}
