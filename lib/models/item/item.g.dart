// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 2;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      stackable: fields[3] as bool,
      armor: fields[4] as int,
      equipmentSlot: fields[5] as EquipmentSlot,
      buy: fields[6] as int,
      sell: fields[7] as int,
      weight: fields[8] as int,
      attackSpeed: fields[9] as int,
      subType: fields[10] as SubType,
      noTrade: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.stackable)
      ..writeByte(4)
      ..write(obj.armor)
      ..writeByte(5)
      ..write(obj.equipmentSlot)
      ..writeByte(6)
      ..write(obj.buy)
      ..writeByte(7)
      ..write(obj.sell)
      ..writeByte(8)
      ..write(obj.weight)
      ..writeByte(9)
      ..write(obj.attackSpeed)
      ..writeByte(10)
      ..write(obj.subType)
      ..writeByte(11)
      ..write(obj.noTrade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
