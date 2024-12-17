import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'package:onnxruntime_dart/bindings/onnxruntime_dart_bindings_generated.dart';
import 'package:onnxruntime_dart/dart_interface/onnxruntime_lib.dart';
import 'package:universal_ffi/ffi_helper.dart';



class Onnxruntime {

  /// FFI loaded lybrary
  late FfiHelper _onnxruntimeHelper;

  late OnnxruntimeDartBindings _onnxruntimeDartBindings;


  Onnxruntime();

  /// Initializes this instance
  /// 
  /// Warning: this needs to be called before calling any other method!
  Future init() async {

    _onnxruntimeHelper = await loadOnnxRuntimeDartLib();

    _onnxruntimeDartBindings = OnnxruntimeDartBindings(_onnxruntimeHelper.library as DynamicLibrary);

  }

  /// Get the ORT_RUNTIME_VERSION
  String version(){
    
    final apiBase = _onnxruntimeDartBindings.OrtGetApiBase();

    final version = apiBase.ref.GetVersionString
      .asFunction<Pointer<Char> Function()>()();

    return version.cast<Utf8>().toDartString();
  }

}