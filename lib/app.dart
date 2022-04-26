import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'modules/qr_code_list/qrcode_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      title: 'QRCode',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.tealAccent,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
            onPrimary: Colors.black,
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const QRCodePage(),
    );
  }
}
