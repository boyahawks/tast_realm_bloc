import "package:flutter/material.dart";

class Get {
  static to({required final BuildContext context, required Widget page}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static off({required final BuildContext context, required Widget page}) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static back(final BuildContext context) {
    Navigator.pop(context);
  }

  static offAll(
      {required final BuildContext context, required final Widget page}) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
        (route) => false);
  }

  static double width(final BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(final BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
