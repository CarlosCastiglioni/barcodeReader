import 'package:bar_code_reader/modules/qr_code_list/qrcode_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => QRCodeController()),
    ],
    child: const App(),
  ));
}
