// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visited_page.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitedPageAdapter extends TypeAdapter<VisitedPage> {
  @override
  final int typeId = 0;

  @override
  VisitedPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitedPage(
      pageName: fields[0] as String,
      category: fields[1] as String,
      url: fields[2] as String,
      visitCount: fields[3] as int,
      lastVisited: fields[4] as DateTime?,
      totalTimeSpent: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, VisitedPage obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.pageName)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.visitCount)
      ..writeByte(4)
      ..write(obj.lastVisited)
      ..writeByte(5)
      ..write(obj.totalTimeSpent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitedPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
