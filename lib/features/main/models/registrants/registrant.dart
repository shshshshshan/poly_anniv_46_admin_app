import 'package:anniv_46_admin_app/utils/constants/enums.dart';
import 'package:anniv_46_admin_app/utils/formatters/formatter.dart';
import 'package:anniv_46_admin_app/utils/helpers/convert_serial_date.dart';

class Registrant {
  const Registrant( {
    required this.timestamp,
    required this.name,
    required this.email,
    required this.gender,
    required this.nickname,
    required this.batchYear,
    required this.modeOfPayment,
    required this.gcashName,
    required this.gcashRefId,
    required this.isPartialPayment,
    required this.paymentStatus
  });

  final String timestamp;
  final String name;
  final String email;
  final Gender gender;
  final String nickname;
  final String batchYear;
  final ModeOfPayment modeOfPayment;
  final String gcashName;
  final String gcashRefId;
  final String isPartialPayment;
  final PaymentStatus paymentStatus;

  // List comes from Sheets API
  // Sheets structure => [Timestamp, Full Name, Email, Sex, Nickname, Batch Year, Mode of Payment, G-Cash Account Name, Transaction Reference ID, Partial Payment, Payment Status]
  static Registrant fromList(List<String> data) => Registrant(
      timestamp: MainFormatter.formatDateTime(ConvertSerialDate.convert(double.tryParse(data[0]) ?? 0)),
      name: data[1],
      email: data[2],
      gender: Gender.fromString(data[3].toLowerCase().trim()),
      nickname: data[4],
      batchYear: data[5],
      modeOfPayment: ModeOfPayment.fromString(data[6].toLowerCase().trim()),
      gcashName: data[7],
      gcashRefId: data[8],
      isPartialPayment: data[9],
      paymentStatus: PaymentStatus.fromString(data[10].toLowerCase().trim()));
}
