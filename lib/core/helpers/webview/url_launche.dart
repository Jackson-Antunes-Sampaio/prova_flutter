import 'package:prova_flutter/core/helpers/webview/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunchAdapter implements WebViwe {
  @override
  Future<void> openUrl(String urlString) async {
    var url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
