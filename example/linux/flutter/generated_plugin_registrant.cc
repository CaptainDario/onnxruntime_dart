//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <onnxruntime_dart/onnxruntime_dart_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) onnxruntime_dart_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "OnnxruntimeDartPlugin");
  onnxruntime_dart_plugin_register_with_registrar(onnxruntime_dart_registrar);
}
