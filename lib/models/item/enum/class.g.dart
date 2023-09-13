// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClassAdapter extends TypeAdapter<Class> {
  @override
  final int typeId = 8;

  @override
  Class read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Class.warrior;
      case 1:
        return Class.druid;
      case 2:
        return Class.mage;
      case 3:
        return Class.ranger;
      case 4:
        return Class.rogue;
      case 5:
        return Class.none;
      default:
        return Class.warrior;
    }
  }

  @override
  void write(BinaryWriter writer, Class obj) {
    switch (obj) {
      case Class.warrior:
        writer.writeByte(0);
        break;
      case Class.druid:
        writer.writeByte(1);
        break;
      case Class.mage:
        writer.writeByte(2);
        break;
      case Class.ranger:
        writer.writeByte(3);
        break;
      case Class.rogue:
        writer.writeByte(4);
        break;
      case Class.none:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
