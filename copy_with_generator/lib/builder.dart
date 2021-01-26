library copy_with_generator.builder;

// ignore: import_of_legacy_library_into_null_safe
import 'package:build/build.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:source_gen/source_gen.dart';

import 'copy_with_generator.dart';

Builder copyWith(BuilderOptions _) =>
    SharedPartBuilder([CopyWithGenerator()], 'copyWith');
