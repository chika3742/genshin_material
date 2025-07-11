import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

Widget createScreenWithApp(Widget child) {
  return MaterialApp(
    home: child,
  );
}

Matcher closeToDateTime(DateTime dateTime, Duration delta) {
  return predicate<DateTime>((d) {
    final difference = d.difference(dateTime);
    return difference.abs() <= delta;
  }, "is close to $dateTime");
}
