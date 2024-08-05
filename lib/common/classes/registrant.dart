import 'package:anniv_46_admin_app/utils/constants/enums.dart';

class Registrant {
  const Registrant({required this.gender, required this.paymentStatus, required this.name});

  final String name;
  final Gender gender;
  final PaymentStatus paymentStatus;
}
