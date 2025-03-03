import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../core/utils/device_detector.dart';

class MicrofrontendLoader extends StatefulWidget {
  final String url;
  MicrofrontendLoader({required this.url});

  @override
  _MicrofrontendLoaderState createState() => _MicrofrontendLoaderState();
}

class _MicrofrontendLoaderState extends State<MicrofrontendLoader> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    if (DeviceDetector.getDeviceType() == "web") {
      return Scaffold(
        body: HtmlWidget(
          '''
          <iframe src="${widget.url}" width="100%" height="100%" 
          onload="window.addEventListener('message', (event) => {
              if (event.data === 'goToMicro3') {
                  window.location.href = 'https://chasis-service.aws.com/api/micro3';
              } else if (event.data === 'goToMicro2') {
                  window.location.href = 'https://chasis-service.aws.com/api/micro2';
              }
          });"></iframe>
          ''',
        ),
      );
    } else {
      return Scaffold(
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavaScriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
            _controller.runJavaScript("""
              window.addEventListener('message', (event) => {
                  if (event.data === 'goToMicro3') {
                      window.location.href = 'https://chasis-service.aws.com/api/micro3';
                  } else if (event.data === 'goToMicro2') {
                      window.location.href = 'https://chasis-service.aws.com/api/micro2';
                  }
              });
            """);
          },
        ),
      );
    }
  }
}
