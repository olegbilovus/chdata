// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_opinion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MobOpinionAdapter extends TypeAdapter<MobOpinion> {
  @override
  final int typeId = 1;

  @override
  MobOpinion read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MobOpinion.friendly;
      case 1:
        return MobOpinion.hostile;
      case 2:
        return MobOpinion.passive;
      case 3:
        return MobOpinion.none;
      default:
        return MobOpinion.friendly;
    }
  }

  @override
  void write(BinaryWriter writer, MobOpinion obj) {
    switch (obj) {
      case MobOpinion.friendly:
        writer.writeByte(0);
        break;
      case MobOpinion.hostile:
        writer.writeByte(1);
        break;
      case MobOpinion.passive:
        writer.writeByte(2);
        break;
      case MobOpinion.none:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MobOpinionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
