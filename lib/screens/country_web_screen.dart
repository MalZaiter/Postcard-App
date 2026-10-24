import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CountryWebScreen extends StatefulWidget {
  final String country;

  const CountryWebScreen({super.key, required this.country});

  @override
  State<CountryWebScreen> createState() => _CountryWebScreenState();
}

class _CountryWebScreenState extends State<CountryWebScreen> {
  late final WebViewController _controller;
  int loadingProgress = 0;

  @override
  void initState() {
    super.initState();

    final wikiTitle = widget.country.replaceAll(' ', '_');

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (!mounted) return;

            setState(() {
              loadingProgress = progress;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://en.wikipedia.org/wiki/${Uri.encodeComponent(wikiTitle)}',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.country),
        backgroundColor: const Color(0xFF790D16),
        foregroundColor: const Color(0xFFFFF5E0),
      ),
      body: Column(
        children: [
          if (loadingProgress < 100)
            LinearProgressIndicator(
              value: loadingProgress / 100,
              color: const Color(0xFF790D16),
            ),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}
