import 'package:flutter_test/flutter_test.dart';
import 'package:onnxruntime_dart/onnxruntime_dart.dart';
import 'package:onnxruntime_dart/onnxruntime_dart_platform_interface.dart';
import 'package:onnxruntime_dart/onnxruntime_dart_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOnnxruntimeDartPlatform
    with MockPlatformInterfaceMixin
    implements OnnxruntimeDartPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OnnxruntimeDartPlatform initialPlatform = OnnxruntimeDartPlatform.instance;

  test('$MethodChannelOnnxruntimeDart is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOnnxruntimeDart>());
  });

  test('getPlatformVersion', () async {
    OnnxruntimeDart onnxruntimeDartPlugin = OnnxruntimeDart();
    MockOnnxruntimeDartPlatform fakePlatform = MockOnnxruntimeDartPlatform();
    OnnxruntimeDartPlatform.instance = fakePlatform;

    expect(await onnxruntimeDartPlugin.getPlatformVersion(), '42');
  });
}
