import 'dart:io';

import 'package:chdata/models/advance_stats.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:hive/hive.dart';

import '../../models/mob/constants.dart';
import '../../models/mob/enum/mob_opinion.dart';
import '../../models/mob/mob.dart';
import 'constants.dart';

void main() async {
  // filePath declared in ./constants.dart which is git ignored to avoid
  // exporting it
  final data = File(mobFilePath);

  Hive.init(assetsDir);
  for (final registerAdapter in assetsBoxes[mobListField]!) {
    registerAdapter(true);
  }
  final box = await Hive.openBox(mobListField);
  await box.clear();

  final mobsStr = data.readAsLinesSync().map((e) => e.trim()).toList();
  for (final mobStr in mobsStr) {
    final values = mobStr.split(separator).map((e) {
      var str = e;
      if (e.startsWith("'")) {
        str = e.substring(1);
      }
      if (e.endsWith("'")) {
        str = str.substring(0, str.length - 1);
      }
      return str.trim();
    }).toList();
    final mob = parseValues(values);
    box.put('${mob.name}$separator${mob.id}', mob);
  }

  await box.close();
}

Mob parseValues(List<String> values) {
  final goldData = values[7].split('-').map((e) => int.parse(e.trim()));

  return Mob(
      id: parseInt(values[0]),
      name: values[1],
      range: parseDouble(values[2]),
      followRange: parseInt(values[3]),
      opinion: getOpinion(values[4]),
      level: parseInt(values[5]),
      health: parseInt(values[6]),
      goldMin: goldData.first,
      goldMax: goldData.last,
      attack: parseInt(values[8]),
      defence: parseInt(values[9]),
      attackSpeed: parseInt(values[10]),
      energy: parseInt(values[11]),
      damage: AdvanceStats(
          pierce: parseInt(values[12]),
          slash: parseInt(values[13]),
          crush: parseInt(values[14]),
          heat: parseInt(values[15]),
          cold: parseInt(values[16]),
          magic: parseInt(values[17]),
          poison: parseInt(values[18]),
          divine: parseInt(values[19]),
          chaos: parseInt(values[20]),
          truee: parseInt(values[21])),
      fishingDamage: parseInt(values[22]),
      resist: AdvanceStats(
          pierce: parseResist(values[23]),
          slash: parseResist(values[24]),
          crush: parseResist(values[25]),
          heat: parseResist(values[26]),
          cold: parseResist(values[27]),
          magic: parseResist(values[28]),
          poison: parseResist(values[29]),
          divine: parseResist(values[30]),
          chaos: parseResist(values[31]),
          truee: parseResist(values[32])),
      stars: parseInt(values[33]),
      attackRange: parseDouble(values[34]),
      missileSpeed: parseInt(values[35]),
      xp: parseInt(values[36]),
      physicalEvade: parseInt(values[37]),
      spellEvade: parseInt(values[38]),
      moveEvade: parseInt(values[39]),
      woundEvade: parseInt(values[40]),
      weakEvade: parseInt(values[41]),
      mentalEvade: parseInt(values[42]));
}

MobOpinion getOpinion(String opinion) {
  return switch (opinion) {
    friendlyText => MobOpinion.friendly,
    hostileText => MobOpinion.hostile,
    passiveText => MobOpinion.passive,
    _ => MobOpinion.none
  };
}

// Using a function for it in case the parsing changes,
// this will avoid to refactor a lot of code
int parseInt(String value) {
  if (value.contains('+')) {
    final newValue = value.split('+')[0].trim();
    return int.parse(newValue);
  }
  return int.parse(value);
}

double parseDouble(String value) {
  return double.parse(value);
}

int parseResist(String value) {
  if (value == immuneText) {
    return immuneValue;
  }
  return parseInt(value);
}
