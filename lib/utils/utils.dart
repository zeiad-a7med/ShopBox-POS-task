import 'dart:developer';

import 'package:flutter/material.dart';

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
}
