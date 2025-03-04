import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MicrofrontendLoader extends StatefulWidget {
  final String url;
  final String microName;

  const MicrofrontendLoader(
      {Key? key, required this.url, required this.microName})
      : super(key: key);

  @override
  _MicrofrontendLoaderState createState() => _MicrofrontendLoaderState();
}

class _MicrofrontendLoaderState extends State<MicrofrontendLoader> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.microName)),
      body: WebViewWidget(controller: _controller),
    );
  }
}
