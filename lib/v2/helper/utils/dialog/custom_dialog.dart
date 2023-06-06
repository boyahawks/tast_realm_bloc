import 'package:flutter/material.dart';

import '../colors.dart';

class CustomDialog {
  static showLoading(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 15,
              ),
              Text(
                "Mohon tunggu...",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static hideLoading(BuildContext context) {
    return Navigator.pop(context);
  }

  static showAlert(String title, String message, BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            height: message.length >= 30 ? 100.0 : 50.0,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListBody(
                children: <Widget>[
                  Text(message),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  static void confirmation({
    required void Function() onPressed,
    Color? color,
    String? message,
    required final BuildContext context,
  }) async {
    bool confirm = false;
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message ?? 'Apakah anda yakin ?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tidak"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              onPressed: () {
                confirm = true;
                Navigator.pop(context);
              },
              child: const Text("Iya"),
            ),
          ],
        );
      },
    );

    if (confirm) {
      onPressed();
    }
  }
}
