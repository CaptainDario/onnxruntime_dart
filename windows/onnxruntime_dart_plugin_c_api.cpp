#include "include/onnxruntime_dart/onnxruntime_dart_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "onnxruntime_dart_plugin.h"

void OnnxruntimeDartPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  onnxruntime_dart::OnnxruntimeDartPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
