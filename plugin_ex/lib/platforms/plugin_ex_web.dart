// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/src/services/platform_channel.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'cal_platform_interface.dart';

/// A web implementation of the PluginExPlatform of the PluginEx plugin.
class PluginExWeb extends CalPlatform {
  /// Constructs a PluginExWeb
  PluginExWeb();

  static void registerWith(Registrar registrar) {
    CalPlatform.instance = PluginExWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  // TODO: implement methodChannel
  MethodChannel get methodChannel => throw UnimplementedError();
}
