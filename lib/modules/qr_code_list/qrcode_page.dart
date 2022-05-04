import 'package:bar_code_reader/modules/qr_code_list/qrcode_controller.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QRCodeController>(context);
    final ticket = controller.tickets;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Codes List"),
        centerTitle: true,
      ),
      body: Consumer<QRCodeController>(
          builder: (BuildContext context, value, Widget? child) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int tick) {
                  return ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    title: Text(ticket[tick]),
                    leading: ElevatedButton(
                        onPressed: () {
                          controller.ticketExclude(ticket[tick]);
                          BotToast.showText(
                              text: "Code excluded successfully!!");
                        },
                        child: const Icon(Icons.delete)),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: controller.tickets.length));
      }),
      floatingActionButton: ElevatedButton.icon(
        onPressed: controller.readCode,
        label: const Text("Read Code"),
        icon: const Icon(Icons.qr_code),
      ),
    );
  }
}
