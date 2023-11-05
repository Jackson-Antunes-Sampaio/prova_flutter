import 'package:flutter/material.dart';
import 'package:prova_flutter/core/helpers/webview/url_launche.dart';
import 'package:prova_flutter/core/helpers/webview/webview.dart';
import 'package:prova_flutter/core/utils/constants.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget({super.key, required this.child}) {
    web = UrlLaunchAdapter();
  }
  final Widget child;
  late final WebViwe web;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorBackgroundBlue,
            colorBackgroundGreen,
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(child: child),
            TextButton(
              onPressed: () async => web.openUrl(privatePolicy),
              child: const Text("Política de Privacidade"),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
