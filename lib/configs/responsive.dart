import 'package:flutter/material.dart';

double widthP(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightP(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double sizeText(BuildContext context, double size) {
  return MediaQuery.of(context).size.width / 100 * (size / 3);
}

double sizePersen(BuildContext context, double size) {
  return (MediaQuery.of(context).size.width / 100) * size;
}

double widgetHeight(context, Widget widget) {
  double size = 0.0;
  return size;
}
