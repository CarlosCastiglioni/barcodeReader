import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCodeController extends ChangeNotifier {
  List<String> tickets = [];
  int addCount = 0;
  int excludeCount = 0;

  void readCode() async {
    try {
      addCount++;
      String code = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF",
        "Cancel",
        false,
        ScanMode.BARCODE,
      );
      if (!tickets.contains(code.toString()) && code != '-1') {
        tickets.add(code.toString());
        BotToast.showText(text: "Code added successfully!!");
        if (code.contains("http") || code.contains("https")) {
          String url = code.toString();
          await launchUrl(Uri.parse(url));
        }
      } else if (tickets.contains(code.toString())) {
        BotToast.showText(text: "Code already existis!!");
      }
      notifyListeners();
    } catch (e) {
      BotToast.showText(text: "Error");
    }
  }

  void ticketExclude(index) async {
    excludeCount++;
    tickets.remove(index);
    notifyListeners();
  }
}
