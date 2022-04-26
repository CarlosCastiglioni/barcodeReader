import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCodeController extends ChangeNotifier {
  List<String> tickets = [];

  void readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    if (!tickets.contains(code.toString()) && code != '-1') {
      tickets.add(code.toString());
      BotToast.showText(text: "Code added successfully!!");
      if (code.contains("http") || code.contains("https")) {
        String url = code.toString();
        await launchUrl(Uri.parse(url));
      }
    }
    notifyListeners();
  }

  void readBarCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
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
    }
    notifyListeners();
  }

  void ticketExclude(index) async {
    tickets.remove(index);
    BotToast.showText(text: "Code excluded successfully!!");
    notifyListeners();
  }
}
