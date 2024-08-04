// LIST OF ENUMS

import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

enum TextSizes { small, medium, large }

enum Gender { male, female }

extension GenderExtension on Gender {
  Color get color {
    return [MainColors.primary, Colors.pink][index];
  }

  IconData get iconData {
    return [Icons.boy, Icons.girl][index];
  }
}

enum PaymentStatus { pending, successful, failed; }

extension PaymentStatusExtension on PaymentStatus {
  String get name {
    return ["Pending", "Successful", "Failed"][index];
  }

  Color get color {
    return [MainColors.accent, Colors.green, Colors.red][index];
  }
}
