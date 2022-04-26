import 'package:bar_code_reader/modules/qr_code_list/qrcode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = QRCodeController();
  WidgetsFlutterBinding.ensureInitialized();

  test("Must read and add a BarCode or QRCode text to a list", () {
    controller.readCode();
    expect(controller.addCount, 1);
  });
  test("Must excluded a BarCode or QRCode text from the list", () {
    controller.tickets.add("test");
    controller.ticketExclude(controller.tickets.first);
    expect(controller.excludeCount, 1);
  });
}
