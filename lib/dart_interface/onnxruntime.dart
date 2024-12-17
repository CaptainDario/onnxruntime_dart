import 'package:onnxruntime_dart/bindings/onnxruntime_dart_bindings_generated.dart';



import 'dart:ffi';
import 'package:ffi/ffi.dart';

final DynamicLibrary onnxRuntime = DynamicLibrary.open('onnxruntime.dll'); // or .so on Linux/macOS

// Access the ONNX Runtime API base
final _OrtGetApiBase = onnxRuntime
    .lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('OrtGetApiBase');

final _GetApi = onnxRuntime
    .lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('OrtGetApi');

final _CreateEnv = onnxRuntime
    .lookupFunction<Int32 Function(Int32, Pointer<Utf8>, Pointer<Pointer<Void>>), int Function(int, Pointer<Utf8>, Pointer<Pointer<Void>>)>('OrtCreateEnv');

final _CreateSessionOptions = onnxRuntime
    .lookupFunction<Int32 Function(Pointer<Pointer<Void>>), int Function(Pointer<Pointer<Void>>)>('OrtCreateSessionOptions');

final _CreateSession = onnxRuntime
    .lookupFunction<Int32 Function(Pointer<Void>, Pointer<Utf8>, Pointer<Void>, Pointer<Pointer<Void>>), int Function(Pointer<Void>, Pointer<Utf8>, Pointer<Void>, Pointer<Pointer<Void>>)>('OrtCreateSession');

// Dart wrappers for calling C API
Pointer<Void> ortApiBase = _OrtGetApiBase();
Pointer<Void> ortApi = _GetApi(ortApiBase, 1); // ORT_API_VERSION = 1

Pointer<Void> createEnvironment(String name) {
  final Pointer<Pointer<Void>> env = calloc();
  final Pointer<Utf8> envName = name.toNativeUtf8();
  final result = _CreateEnv(2 /* ORT_LOGGING_LEVEL_WARNING */, envName, env);
  if (result != 0) throw Exception('Failed to create environment');
  calloc.free(envName);
  return env.value;
}

Pointer<Void> createSessionOptions() {
  final Pointer<Pointer<Void>> options = calloc();
  final result = _CreateSessionOptions(options);
  if (result != 0) throw Exception('Failed to create session options');
  return options.value;
}

Pointer<Void> createSession(Pointer<Void> env, String modelPath, Pointer<Void> options) {
  final Pointer<Pointer<Void>> session = calloc();
  final Pointer<Utf8> model = modelPath.toNativeUtf8();
  final result = _CreateSession(env, model, options, session);
  if (result != 0) throw Exception('Failed to create session');
  calloc.free(model);
  return session.value;
}

void main() {
  // Create environment
  final env = createEnvironment("test");

  // Create session options
  final sessionOptions = createSessionOptions();

  // Load ONNX model
  final session = createSession(env, "model.onnx", sessionOptions);

  print('Session created successfully');

  // Free resources (use proper C API bindings to release them)
}