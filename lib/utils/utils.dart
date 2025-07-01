import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void handlePagination({
    required ScrollController controller,
    required Function call,
    Function? backwardCall,
    Function? extraCallBack,
  }) {
    double previousScrollPosition = 0.0;

    controller.addListener(() {
      try {
        extraCallBack?.call();

        // Get the current scroll position
        final currentScrollPosition = controller.position.pixels;
        // nextPageTrigger will have a value equivalent to 80% of the list size.
        final nextPageTrigger = 0.8 * controller.position.maxScrollExtent;

        // Action when user scrolls down
        if (currentScrollPosition > previousScrollPosition) {
          if (currentScrollPosition > nextPageTrigger) {
            call(); // Trigger call when scrolled down
          }
        } else {
          backwardCall?.call(); // Trigger backwardCall when scrolled up
        }

        // Update the previous scroll position
        previousScrollPosition = currentScrollPosition;
      } catch (e, stackTrace) {
        log('$e\n$stackTrace');
      }
    });
  }
  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }
   static Future<bool?> showToast(String text,
          {Color? backgroundColor, int? timeInSec, Color? textColor}) =>
      Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_SHORT,
          textColor: textColor,
          //Not working Android
          gravity: ToastGravity.CENTER,
          backgroundColor: backgroundColor ?? Colors.black,
          timeInSecForIosWeb: timeInSec ?? 3,
          fontSize: 18.0);
}
