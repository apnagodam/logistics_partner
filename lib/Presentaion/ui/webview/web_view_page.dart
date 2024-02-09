import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebviewPage extends ConsumerWidget {
  const WebviewPage({super.key, required this.url});

  final String? url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: SafeArea(
          child:Container()),

        // InAppWebView(
        //   initialUrlRequest: URLRequest(url: Uri.parse(url ?? "")),
        // )
    );
  }
}
