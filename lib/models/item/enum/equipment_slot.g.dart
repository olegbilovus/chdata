// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_slot.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EquipmentSlotAdapter extends TypeAdapter<EquipmentSlot> {
  @override
  final int typeId = 3;

  @override
  EquipmentSlot read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EquipmentSlot.none;
      case 1:
        return EquipmentSlot.unequipable;
      case 2:
        return EquipmentSlot.mainHand;
      case 3:
        return EquipmentSlot.head;
      case 4:
        return EquipmentSlot.chest;
      case 5:
        return EquipmentSlot.leg;
      case 6:
        return EquipmentSlot.feet;
      case 7:
        return EquipmentSlot.offhand;
      case 8:
        return EquipmentSlot.hands;
      case 9:
        return EquipmentSlot.misc;
      case 10:
        return EquipmentSlot.ring;
      case 11:
        return EquipmentSlot.wrist;
      case 12:
        return EquipmentSlot.neck;
      case 13:
        return EquipmentSlot.hat;
      case 14:
        return EquipmentSlot.top;
      case 15:
        return EquipmentSlot.bottoms;
      case 16:
        return EquipmentSlot.shoes;
      case 17:
        return EquipmentSlot.gloves;
      case 18:
        return EquipmentSlot.companion;
      case 19:
        return EquipmentSlot.saddle;
      case 20:
        return EquipmentSlot.mount;
      default:
        return EquipmentSlot.none;
    }
  }

  @override
  void write(BinaryWriter writer, EquipmentSlot obj) {
    switch (obj) {
      case EquipmentSlot.none:
        writer.writeByte(0);
        break;
      case EquipmentSlot.unequipable:
        writer.writeByte(1);
        break;
      case EquipmentSlot.mainHand:
        writer.writeByte(2);
        break;
      case EquipmentSlot.head:
        writer.writeByte(3);
        break;
      case EquipmentSlot.chest:
        writer.writeByte(4);
        break;
      case EquipmentSlot.leg:
        writer.writeByte(5);
        break;
      case EquipmentSlot.feet:
        writer.writeByte(6);
        break;
      case EquipmentSlot.offhand:
        writer.writeByte(7);
        break;
      case EquipmentSlot.hands:
        writer.writeByte(8);
        break;
      case EquipmentSlot.misc:
        writer.writeByte(9);
        break;
      case EquipmentSlot.ring:
        writer.writeByte(10);
        break;
      case EquipmentSlot.wrist:
        writer.writeByte(11);
        break;
      case EquipmentSlot.neck:
        writer.writeByte(12);
        break;
      case EquipmentSlot.hat:
        writer.writeByte(13);
        break;
      case EquipmentSlot.top:
        writer.writeByte(14);
        break;
      case EquipmentSlot.bottoms:
        writer.writeByte(15);
        break;
      case EquipmentSlot.shoes:
        writer.writeByte(16);
        break;
      case EquipmentSlot.gloves:
        writer.writeByte(17);
        break;
      case EquipmentSlot.companion:
        writer.writeByte(18);
        break;
      case EquipmentSlot.saddle:
        writer.writeByte(19);
        break;
      case EquipmentSlot.mount:
        writer.writeByte(20);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EquipmentSlotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
