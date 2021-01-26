import 'package:copy_with/copy_with.dart';

part 'copy_with.g.dart';

@CopyWith()
class SimpleObject {
  final int id;

  SimpleObject({required this.id});
}

@CopyWith()
class GenericObject<T> {
  final int id;
  final T data;
  final int? nullableId;

  GenericObject({required this.id, required this.data, this.nullableId});
}

void main() {
  final c = GenericObject(id: 1, data: 'data');
}