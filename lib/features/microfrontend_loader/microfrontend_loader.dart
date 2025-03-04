import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as webview;

class MicrofrontendLoader extends StatelessWidget {
  final String url;
  final String microName;

  const MicrofrontendLoader({
    super.key,
    required this.url,
    required this.microName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(microName)),
      body: WebViewWidget(url: url),
    );
  }
}

class WebViewWidget extends StatefulWidget {
  final String url;

  const WebViewWidget({super.key, required this.url});

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late final webview.WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = webview.WebViewController()
      ..setJavaScriptMode(webview.JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return webview.WebViewWidget(controller: _controller);
  }
}
