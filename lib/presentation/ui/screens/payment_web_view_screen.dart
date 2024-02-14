import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewScreen extends StatefulWidget {
  final String url;
  const PaymentWebViewScreen({super.key, required this.url});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late WebViewController _webViewController;
  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.endsWith('=success')) {
              Get.back();
              Get.defaultDialog(
                  title: "Success!", middleText: "Your order confirmed", onConfirm: () => Get.back());
              return NavigationDecision.prevent;
            } else if (request.url.endsWith('=Failed')) {
              Get.back();
              Get.defaultDialog(
                  title: "Failed!", middleText: "Something went wrong", onConfirm: () => Get.back());
              return NavigationDecision.prevent;
            } else if (request.url.endsWith('=1')) {
              Get.back();
              Get.defaultDialog(
                  title: "Success with risk!", middleText: "Order confirmed", onConfirm: () => Get.back());
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
