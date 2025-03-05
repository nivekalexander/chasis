import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
    if (!kIsWeb) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.microName)),
      body: kIsWeb
          ? Center(
              child: HtmlElementView(viewType: widget.url), // Usa iframe en Web
            )
          : WebViewWidget(
              controller: _controller), // Usa WebView en móvil/desktop
    );
  }
}
