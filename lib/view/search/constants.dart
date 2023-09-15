import 'package:chdata/models/item/constants.dart';
import 'package:chdata/models/item/enum/equipment_slot.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

const widthSB = 8.0;
const textStyleField = TextStyle(
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.underline,
);
const dividerThickness = 1.5;

final emptyValues = [
  emptyValueDouble.toString(),
  emptyValueInt.toString(),
  emptyValueText,
  'None',
  'False',
  EquipmentSlot.unequipable.name.capitalize
];

const imagesAssetsDir = kIsWeb ? 'images/zones' : 'assets/images/zones';
