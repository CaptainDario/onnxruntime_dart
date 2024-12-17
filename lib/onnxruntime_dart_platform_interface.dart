import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'onnxruntime_dart_method_channel.dart';

abstract class OnnxruntimeDartPlatform extends PlatformInterface {
  /// Constructs a OnnxruntimeDartPlatform.
  OnnxruntimeDartPlatform() : super(token: _token);

  static final Object _token = Object();

  static OnnxruntimeDartPlatform _instance = MethodChannelOnnxruntimeDart();

  /// The default instance of [OnnxruntimeDartPlatform] to use.
  ///
  /// Defaults to [MethodChannelOnnxruntimeDart].
  static OnnxruntimeDartPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OnnxruntimeDartPlatform] when
  /// they register themselves.
  static set instance(OnnxruntimeDartPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
