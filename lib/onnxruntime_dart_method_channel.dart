import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'onnxruntime_dart_platform_interface.dart';

/// An implementation of [OnnxruntimeDartPlatform] that uses method channels.
class MethodChannelOnnxruntimeDart extends OnnxruntimeDartPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('onnxruntime_dart');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
