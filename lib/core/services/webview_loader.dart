import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoader extends StatefulWidget {
  final String url;

  const WebViewLoader({required this.url, Key? key}) : super(key: key);

  @override
  _WebViewLoaderState createState() => _WebViewLoaderState();
}

class _WebViewLoaderState extends State<WebViewLoader> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Habilitar JavaScript
      ..loadRequest(Uri.parse(widget.url)); // Cargar la URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Microfrontend")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
