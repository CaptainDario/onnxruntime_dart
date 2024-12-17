#ifndef FLUTTER_PLUGIN_ONNXRUNTIME_DART_PLUGIN_H_
#define FLUTTER_PLUGIN_ONNXRUNTIME_DART_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace onnxruntime_dart {

class OnnxruntimeDartPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  OnnxruntimeDartPlugin();

  virtual ~OnnxruntimeDartPlugin();

  // Disallow copy and assign.
  OnnxruntimeDartPlugin(const OnnxruntimeDartPlugin&) = delete;
  OnnxruntimeDartPlugin& operator=(const OnnxruntimeDartPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace onnxruntime_dart

#endif  // FLUTTER_PLUGIN_ONNXRUNTIME_DART_PLUGIN_H_
