// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtype.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubTypeAdapter extends TypeAdapter<SubType> {
  @override
  final int typeId = 4;

  @override
  SubType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SubType.none;
      case 1:
        return SubType.sword;
      case 2:
        return SubType.axe;
      case 3:
        return SubType.blunt;
      case 4:
        return SubType.cloth;
      case 5:
        return SubType.leather;
      case 6:
        return SubType.chain;
      case 7:
        return SubType.plate;
      case 8:
        return SubType.staff;
      case 9:
        return SubType.dagger;
      case 10:
        return SubType.wand;
      case 11:
        return SubType.bow;
      case 12:
        return SubType.shield;
      case 13:
        return SubType.twoHSword;
      case 14:
        return SubType.twoHAxe;
      case 15:
        return SubType.twoHBlunt;
      case 16:
        return SubType.quiver;
      case 17:
        return SubType.offhandDagger;
      case 18:
        return SubType.offhandSword;
      case 19:
        return SubType.spear;
      case 20:
        return SubType.totem;
      case 21:
        return SubType.broom;
      case 22:
        return SubType.sled;
      case 23:
        return SubType.handToHand;
      case 24:
        return SubType.fashion;
      case 25:
        return SubType.jewelry;
      case 26:
        return SubType.carpet;
      case 27:
        return SubType.noveltyBroom;
      case 28:
        return SubType.noveltyWand;
      case 29:
        return SubType.lute;
      case 30:
        return SubType.dragonStaff;
      case 31:
        return SubType.flute;
      case 32:
        return SubType.harp;
      case 33:
        return SubType.twoHNovelty;
      case 34:
        return SubType.noveltyStaffMount;
      case 35:
        return SubType.horn;
      case 36:
        return SubType.noveltyBlunt;
      case 37:
        return SubType.batMount;
      case 38:
        return SubType.wings;
      case 39:
        return SubType.drum;
      case 40:
        return SubType.bagpipes;
      case 41:
        return SubType.eagleMount;
      case 42:
        return SubType.test;
      case 43:
        return SubType.crow;
      case 44:
        return SubType.sparrow;
      case 45:
        return SubType.sparrowhawk;
      case 46:
        return SubType.cape;
      case 47:
        return SubType.horse;
      case 48:
        return SubType.bansheeBlade;
      case 49:
        return SubType.samhainCrow;
      case 50:
        return SubType.samhainWings;
      case 51:
        return SubType.playDead;
      case 52:
        return SubType.banner;
      case 53:
        return SubType.boar;
      case 54:
        return SubType.fishingRod;
      case 55:
        return SubType.longTotem;
      case 56:
        return SubType.offhandBook;
      case 57:
        return SubType.twoHSpear;
      case 58:
        return SubType.petFood;
      case 59:
        return SubType.fishingItem;
      case 60:
        return SubType.token;
      case 61:
        return SubType.consumable;
      case 62:
        return SubType.battleMount;
      case 63:
        return SubType.battleMountWand;
      case 64:
        return SubType.battleMountBow;
      case 65:
        return SubType.battleMountUnarmed;
      case 66:
        return SubType.cooking;
      default:
        return SubType.none;
    }
  }

  @override
  void write(BinaryWriter writer, SubType obj) {
    switch (obj) {
      case SubType.none:
        writer.writeByte(0);
        break;
      case SubType.sword:
        writer.writeByte(1);
        break;
      case SubType.axe:
        writer.writeByte(2);
        break;
      case SubType.blunt:
        writer.writeByte(3);
        break;
      case SubType.cloth:
        writer.writeByte(4);
        break;
      case SubType.leather:
        writer.writeByte(5);
        break;
      case SubType.chain:
        writer.writeByte(6);
        break;
      case SubType.plate:
        writer.writeByte(7);
        break;
      case SubType.staff:
        writer.writeByte(8);
        break;
      case SubType.dagger:
        writer.writeByte(9);
        break;
      case SubType.wand:
        writer.writeByte(10);
        break;
      case SubType.bow:
        writer.writeByte(11);
        break;
      case SubType.shield:
        writer.writeByte(12);
        break;
      case SubType.twoHSword:
        writer.writeByte(13);
        break;
      case SubType.twoHAxe:
        writer.writeByte(14);
        break;
      case SubType.twoHBlunt:
        writer.writeByte(15);
        break;
      case SubType.quiver:
        writer.writeByte(16);
        break;
      case SubType.offhandDagger:
        writer.writeByte(17);
        break;
      case SubType.offhandSword:
        writer.writeByte(18);
        break;
      case SubType.spear:
        writer.writeByte(19);
        break;
      case SubType.totem:
        writer.writeByte(20);
        break;
      case SubType.broom:
        writer.writeByte(21);
        break;
      case SubType.sled:
        writer.writeByte(22);
        break;
      case SubType.handToHand:
        writer.writeByte(23);
        break;
      case SubType.fashion:
        writer.writeByte(24);
        break;
      case SubType.jewelry:
        writer.writeByte(25);
        break;
      case SubType.carpet:
        writer.writeByte(26);
        break;
      case SubType.noveltyBroom:
        writer.writeByte(27);
        break;
      case SubType.noveltyWand:
        writer.writeByte(28);
        break;
      case SubType.lute:
        writer.writeByte(29);
        break;
      case SubType.dragonStaff:
        writer.writeByte(30);
        break;
      case SubType.flute:
        writer.writeByte(31);
        break;
      case SubType.harp:
        writer.writeByte(32);
        break;
      case SubType.twoHNovelty:
        writer.writeByte(33);
        break;
      case SubType.noveltyStaffMount:
        writer.writeByte(34);
        break;
      case SubType.horn:
        writer.writeByte(35);
        break;
      case SubType.noveltyBlunt:
        writer.writeByte(36);
        break;
      case SubType.batMount:
        writer.writeByte(37);
        break;
      case SubType.wings:
        writer.writeByte(38);
        break;
      case SubType.drum:
        writer.writeByte(39);
        break;
      case SubType.bagpipes:
        writer.writeByte(40);
        break;
      case SubType.eagleMount:
        writer.writeByte(41);
        break;
      case SubType.test:
        writer.writeByte(42);
        break;
      case SubType.crow:
        writer.writeByte(43);
        break;
      case SubType.sparrow:
        writer.writeByte(44);
        break;
      case SubType.sparrowhawk:
        writer.writeByte(45);
        break;
      case SubType.cape:
        writer.writeByte(46);
        break;
      case SubType.horse:
        writer.writeByte(47);
        break;
      case SubType.bansheeBlade:
        writer.writeByte(48);
        break;
      case SubType.samhainCrow:
        writer.writeByte(49);
        break;
      case SubType.samhainWings:
        writer.writeByte(50);
        break;
      case SubType.playDead:
        writer.writeByte(51);
        break;
      case SubType.banner:
        writer.writeByte(52);
        break;
      case SubType.boar:
        writer.writeByte(53);
        break;
      case SubType.fishingRod:
        writer.writeByte(54);
        break;
      case SubType.longTotem:
        writer.writeByte(55);
        break;
      case SubType.offhandBook:
        writer.writeByte(56);
        break;
      case SubType.twoHSpear:
        writer.writeByte(57);
        break;
      case SubType.petFood:
        writer.writeByte(58);
        break;
      case SubType.fishingItem:
        writer.writeByte(59);
        break;
      case SubType.token:
        writer.writeByte(60);
        break;
      case SubType.consumable:
        writer.writeByte(61);
        break;
      case SubType.battleMount:
        writer.writeByte(62);
        break;
      case SubType.battleMountWand:
        writer.writeByte(63);
        break;
      case SubType.battleMountBow:
        writer.writeByte(64);
        break;
      case SubType.battleMountUnarmed:
        writer.writeByte(65);
        break;
      case SubType.cooking:
        writer.writeByte(66);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
