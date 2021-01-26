// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_with.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension SimpleObjectCopyWithExtension on SimpleObject {
  SimpleObject copyWith({
    int? id,
  }) {
    return SimpleObject(
      id: id ?? this.id,
    );
  }
}

extension GenericObjectCopyWithExtension<T> on GenericObject<T> {
  GenericObject copyWith({
    int? id,
    T? data,
    int? nullableId,
    int? i,
  }) {
    return GenericObject(
      id: id ?? this.id,
      data: data ?? this.data,
      nullableId: nullableId ?? this.nullableId,
      i: i ?? this.i,
    );
  }

  GenericObject copyWithNull({
    bool nullableId = false,
  }) {
    return GenericObject(
      id: this.id,
      data: this.data,
      nullableId: nullableId ? null : this.nullableId,
      i: this.i,
    );
  }
}
