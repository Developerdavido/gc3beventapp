import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CaptureQRCode extends StatefulWidget {
  final void Function(BarcodeCapture)? onDetect;
  final MobileScannerController? mobileScannerController;
  const CaptureQRCode({Key? key, this.onDetect, this.mobileScannerController}) : super(key: key);

  @override
  State<CaptureQRCode> createState() => _CaptureQRCodeState();
}

class _CaptureQRCodeState extends State<CaptureQRCode> {
  bool screenOpened = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: MobileScanner(
                controller: widget.mobileScannerController,
                onDetect: widget.onDetect!
            ),
          ),
        ],
      ),
    );
  }
}
