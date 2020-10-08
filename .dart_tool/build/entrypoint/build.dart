// ignore_for_file: directives_ordering

import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:mobx_codegen/builder.dart' as _i2;
import 'package:mockito/src/builder.dart' as _i3;
import 'package:modular_codegen/builder.dart' as _i4;
import 'package:source_gen/builder.dart' as _i5;
import 'package:build_config/build_config.dart' as _i6;
import 'dart:isolate' as _i7;
import 'package:build_runner/build_runner.dart' as _i8;
import 'dart:io' as _i9;

final _builders = <_i1.BuilderApplication>[
  _i1.apply('mobx_codegen:mobx_generator', [_i2.storeGenerator],
      _i1.toDependentsOf('mobx_codegen'),
      hideOutput: true, appliesBuilders: ['source_gen:combining_builder']),
  _i1.apply('mockito:mockBuilder', [_i3.buildMocks], _i1.toNoneByDefault(),
      hideOutput: false),
  _i1.apply('modular_codegen:modular_generator', [_i4.injection],
      _i1.toDependentsOf('modular_codegen'),
      hideOutput: true, appliesBuilders: ['source_gen:combining_builder']),
  _i1.apply('source_gen:combining_builder', [_i5.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: ['source_gen:part_cleanup']),
  _i1.applyPostProcess('source_gen:part_cleanup', _i5.partCleanup,
      defaultGenerateFor: const _i6.InputSet())
];
void main(List<String> args, [_i7.SendPort sendPort]) async {
  var result = await _i8.run(args, _builders);
  sendPort?.send(result);
  _i9.exitCode = result;
}
