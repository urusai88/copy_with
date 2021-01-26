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
  GenericObject<T> copyWith({
    int? id,
    T? data,
    int? nullableId,
  }) {
    return GenericObject(
      id: id ?? this.id,
      data: data ?? this.data,
      nullableId: nullableId ?? this.nullableId,
    );
  }

  GenericObject<T> copyWithNull({
    bool nullableId = false,
  }) {
    return GenericObject(
      id: this.id,
      data: this.data,
      nullableId: nullableId ? null : this.nullableId,
    );
  }
}
