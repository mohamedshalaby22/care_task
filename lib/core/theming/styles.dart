import 'package:care_task/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle font20WhiteSemiBold = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16BlackMedium = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16WhiteMedium = const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );
}
