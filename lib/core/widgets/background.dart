import 'package:flutter/material.dart';
import 'package:prova_flutter/core/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;

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
              onPressed: () async {
                var url = Uri.parse(privatePolicy);
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text("Política de Privacidade"),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
