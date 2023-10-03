// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  static const String route = '/qr_view_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
//tulisan scan code
                  if (result != null)
                    Text(
                      'Source: ${result!.code}',
                      style: TextStyle(color: Color.fromARGB(255, 255, 111, 0)),
                    )
                  else
                    const Text(
                      'Scan barcode',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 111, 0)),
                    ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     // children: <Widget>[
// //                     //   // Container(
// //                     //   //   margin: const EdgeInsets.all(8),
// //                     //   //   child: ElevatedButton(
// //                     //   //       onPressed: () async {
// //                     //   //         await controller?.toggleFlash();
// //                     //   //         setState(() {});
// //                     //   //       },
// //                     //   //       child: FutureBuilder(
// //                     //   //         future: controller?.getFlashStatus(),
// //                     //   //         builder: (context, snapshot) {
// //                     //   //           return Text('Flash');
// //                     //   //         },
// //                     //   //       )),
// //                     //   // ),
// //                     //   // Container(
// //                     //   //   margin: const EdgeInsets.all(8),
// //                     //   // )
// //                     // ],
// //                   ),
// //                   // Row(
// //                   //   mainAxisAlignment: MainAxisAlignment.center,
// //                   //   crossAxisAlignment: CrossAxisAlignment.center,
// //                   //   children: <Widget>[
// //                   //     Container(
// //                   //       margin: const EdgeInsets.all(8),
// //                   //       child: ElevatedButton(
// //                   //         onPressed: () async {
// //                   //           await controller?.pauseCamera();
// //                   //         },
// //                   //         child: const Text('Pause',
// //                   //             style: TextStyle(fontSize: 15)),
// //                   //       ),
// //                   //     ),
// //                   //     Container(
// //                   //       margin: const EdgeInsets.all(8),
// //                   //       child: ElevatedButton(
// //                   //         onPressed: () async {
// //                   //           await controller?.resumeCamera();
// //                   //         },
// //                   //         child: const Text('Resume',
// //                   //             style: TextStyle(fontSize: 15)),
// //                   //       ),
// //                   //     )
// //                   //   ],
// //                   // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Color.fromARGB(255, 255, 122, 0),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
