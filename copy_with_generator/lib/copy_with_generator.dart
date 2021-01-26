// ignore: import_of_legacy_library_into_null_safe
import 'package:analyzer/dart/element/element.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:analyzer/dart/element/nullability_suffix.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:build/build.dart';
import 'package:copy_with/copy_with.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:source_gen/source_gen.dart';

class CopyWithGenerator extends GeneratorForAnnotation<CopyWith> {
  late ClassElement _element;

  String get _typeName => _element.name;

  List<FieldElement> get _nullableProperties => _element.fields
      .where((e) => e.type.nullabilitySuffix == NullabilitySuffix.question)
      .toList();

  List<FieldElement> get _nonullableProperties => _element.fields
      .where((e) => e.type.nullabilitySuffix != NullabilitySuffix.question)
      .toList();

  bool get _hasNullable => _nullableProperties.isNotEmpty;

  bool isNullable(FieldElement field) =>
      field.type.nullabilitySuffix == NullabilitySuffix.question;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) throw '$element is not a ClassElement';

    _element = element;

    List<String> genericList =
        element.typeParameters.map((e) => e.name).toList();
    final generic = genericList.isNotEmpty ? '<${genericList.join(', ')}>' : '';
    final extensionName = '${element.name}CopyWithExtension';

    String copyWithDeclaration = _copyWith();
    String copyWithNullDeclaration = _hasNullable ? _copyWithNullable() : '';

    final result = '''
    extension $extensionName$generic on $_typeName$generic {
       $copyWithDeclaration
       
       $copyWithNullDeclaration
    }
    ''';

    return result;
  }

  String _copyWith() {
    String arguments = '';
    String construct = '';

    for (final field in _element.fields) {
      final argumentType = field.type.getDisplayString(withNullability: false);
      final argumentName = field.name;

      arguments += '$argumentType? $argumentName,\n';
    }

    for (final field in _element.fields) {
      final argumentName = field.name;

      construct += '$argumentName: $argumentName ?? this.$argumentName,\n';
    }

    return '''
       $_typeName copyWith({
          $arguments
       }) {
          return $_typeName($construct);
       }
    ''';
  }

  String _copyWithNullable() {
    var arguments = '';
    var construct = '';

    for (final field in _element.fields) {
      final argumentType = field.type.getDisplayString(withNullability: false);
      final argumentName = field.name;

      if (isNullable(field)) {
        arguments += 'bool $argumentName = false,\n';
        construct +=
            '$argumentName: $argumentName ? null : this.$argumentName,\n';
      } else {
        construct += '$argumentName: this.$argumentName,\n';
      }
    }

    return '''
      $_typeName copyWithNull({
        $arguments  
      }) {
        return $_typeName(
          $construct
        );
      }
      ''';
  }
}
