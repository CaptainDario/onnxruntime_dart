// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:universal_ffi/ffi_helper.dart';
import 'package:universal_io/io.dart';
import 'package:path/path.dart' as p;



/// Loads the onnx-library and returns it
Future<FfiHelper> loadOnnxRuntimeDartLib () async {

  FfiHelper ffiHelper;

  if (kIsWeb) {
    ffiHelper = (await FfiHelper.load("assets/blobs/libmecab.js"));
  }
  else if(Platform.isAndroid){
    throw PlatformException(code: "Android lib loading not yet implemented!");
    // 'lib' is automatically added to the library name
    ffiHelper = (await FfiHelper.load("mecab_dart.so", options: {LoadOption.isFfiPlugin}));
  }
  
  else if(Platform.isWindows) {
    throw PlatformException(code: "Windows lib loading not yet implemented!");
    ffiHelper = (await FfiHelper.load(
      p.joinAll([
        Directory(Platform.resolvedExecutable).parent.path, "blobs", "libmecab.dll"
      ]),
    ));
  }
  else if(Platform.isMacOS) {

    print(Directory.current.path);
    print(Directory("test").listSync());
    print(File("test/blobs/libonnxruntime.dylib").existsSync());
    ffiHelper = (await FfiHelper.load("test/onnxruntime.dylib"));
  }
  else {
    throw PlatformException(code: "Running on unsupported platform!");
  }

  return ffiHelper;

}


