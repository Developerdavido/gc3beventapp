import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/hotel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HotelWebView extends StatefulWidget {
  final Hotel? hotel;
  const HotelWebView({Key? key, this.hotel}) : super(key: key);

  @override
  State<HotelWebView> createState() => _HotelWebViewState();
}

class _HotelWebViewState extends State<HotelWebView> {
  WebViewController? controller;


  int loadingProgress = 0;
  initWebViewController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            setState(() {
              loadingProgress = progress;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              loadingProgress = 0;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loadingProgress = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.hotel!.bookingUrl!));
  }


  @override
  void initState() {
    // TODO: implement initState
    initWebViewController();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 29.h),
              child: const  TopScreen(
                isBackIconVisible: true,
              ),
            ),
            LinearProgressIndicator(
              value: loadingProgress / 100,
              backgroundColor: AppColors.lightBlue,
              color: AppColors.primaryColor,
            ),
            Expanded(child: WebViewWidget(controller: controller!)),
          ],
        ),
      ),
    );
  }
}
