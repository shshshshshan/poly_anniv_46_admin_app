import 'package:anniv_46_admin_app/features/main/models/registrants/registrant.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsheets/gsheets.dart';

class RegistrantsSheetsApi {
  static final spreadSheetId = dotenv.get(MainTexts.registrantSpreadsheetId);
  static final credentials = dotenv.get(MainTexts.credentials);
  static final googleSheets = GSheets(credentials);

  static Worksheet? registrantSheet;

  static Future<void> init() async {
    final spreadsheet = await googleSheets.spreadsheet(spreadSheetId);
    registrantSheet = getRegistrantSheet(spreadsheet,
        title: dotenv.get(MainTexts.registrantWorksheetName));
  }

  static Worksheet? getRegistrantSheet(Spreadsheet spreadsheet,
      {required String title}) {
    try {
      return spreadsheet.worksheetByTitle(title)!;
    } catch (e) {
      if (kDebugMode) print('Something went wrong with getting the registrant sheets. $e');
      throw 'Something went wrong';
    }
  }

  static Future<List<String>?> getLastRow() async {
    if (registrantSheet == null) return null;

    final lastRow = await registrantSheet!.values.lastRow();
    return lastRow;
  }

  static Future<List<Registrant?>> getAllRegistrants() async {
    if (registrantSheet == null) return [];

    final rows = await registrantSheet!.values.allRows();
    if (rows.isEmpty) return [];

    List<Registrant?> registrants = [];
    for (var row in rows.skip(1)) {
      registrants.add(Registrant.fromList(row));
    }

    return registrants;
  }

  static Future<List<String>?> getRowByEmail(String email) async {
    if (registrantSheet == null) return null;

    final rows = await registrantSheet!.values.allRows();
    if (rows.isEmpty) return null;

    final headers = rows.first;
    final columnIndex = headers.indexOf(MainTexts.email);
    if (columnIndex == -1) {
      if (kDebugMode) print('Column "${MainTexts.email}" not found');
      throw 'Column not found';
    }

    for (var row in rows.skip(1)) {
      if (row[columnIndex] == email) {
        return row;
      }
    }

    return null;
  }


  static Future<int> getRowIndexByEmail(String email) async {

    final rows = await registrantSheet!.values.allRows();
    if (rows.isEmpty) return -2;

    final headers = rows.first;
    final columnIndex = headers.indexOf(MainTexts.email) + 1;
    if (columnIndex == -1) {
      if (kDebugMode) print('Column "${MainTexts.email}" not found');
      throw 'Column not found';
    }

    return registrantSheet!.values.rowIndexOf(email, inColumn: columnIndex);
  }

  static Future<Registrant?> getRegistrantByEmail(String email) async {
    return Registrant.fromList(await getRowByEmail(email));
  }

  static Future<bool> updateRegistrant(Registrant registrant) async {
    if (registrantSheet == null) return false;

    return registrantSheet!.values.insertRow(await getRowIndexByEmail(registrant.email), registrant.toList());
  }
}
