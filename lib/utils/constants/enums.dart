// LIST OF ENUMS

import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

enum TextSizes { small, medium, large }

enum Gender {
  male, female;

  static Gender fromString(String gender) {

    final selectedGender = {
      'male': Gender.male,
      'female': Gender.female
    }[gender];

    if (selectedGender == null) throw 'Got unexpected gender.';
    return selectedGender;
  }
}

extension GenderExtension on Gender {
  String get titleName {
    return ["Male", "Female"][index];
  }

  Color get color {
    return [MainColors.primary, Colors.pink][index];
  }

  IconData get iconData {
    return [Icons.boy, Icons.girl][index];
  }
}

enum PaymentStatus {
  pending,
  successful,
  failed;

  static PaymentStatus fromString(String status) {

    final paymentStatus = {
      'pending': PaymentStatus.pending,
      'successful': PaymentStatus.successful,
      'failed': PaymentStatus.failed
    }[status];

    if (paymentStatus == null) throw 'Got unexpected status.';
    return paymentStatus;
  }
}

extension PaymentStatusExtension on PaymentStatus {
  String get name {
    return ["Pending", "Successful", "Failed"][index];
  }

  Color get color {
    return [MainColors.accent, Colors.green, Colors.red][index];
  }
}

enum ModeOfPayment {
  gcash,
  uponArrival;

  static ModeOfPayment fromString(String mode) {

    final modeOfPayment = {
      'g-cash': ModeOfPayment.gcash,
      'pay upon arrival': ModeOfPayment.uponArrival
    }[mode];

    if (modeOfPayment == null) throw 'Got unexpected mode of payment.';
    return modeOfPayment;
  }
}

extension ModeOfPaymentExtension on ModeOfPayment {
  String get name {
    return ["G-Cash", "Pay Upon Arrival"][index];
  }
}
