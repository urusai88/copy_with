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
  @CopyWithField(ignore: true)
  final int i;

  GenericObject({
    required this.id,
    required this.data,
    this.nullableId,
    required this.i,
  });

  GenericObject.poof({
    required this.id,
    required this.data,
    required this.nullableId,
    required this.i,
  });
}

void main() {
  final c = GenericObject(id: 1, data: 'data', i: 5);
}
