class Requirements {
  final int strength;
  final int dexterity;
  final int focus;
  final int vitality;
  final bool maleOnly;
  final int level;

  const Requirements(
      {required this.strength,
      required this.dexterity,
      required this.focus,
      required this.vitality,
      required this.maleOnly,
      required this.level});

  Requirements.fromJson(Map<String, dynamic> json)
      : strength = json[requirementsStrengthField] as int,
        dexterity = json[requirementsDexterityField] as int,
        focus = json[requirementsFocusField] as int,
        vitality = json[requirementsVitalityField] as int,
        maleOnly = json[requirementsMaleOnlyField] as bool,
        level = json[requirementsLevelField] as int;

  Map<String, dynamic> toJson() => {
        requirementsStrengthField: strength,
        requirementsDexterityField: dexterity,
        requirementsFocusField: focus,
        requirementsVitalityField: vitality,
        requirementsMaleOnlyField: maleOnly,
        requirementsLevelField: level,
      };
}

const requirementsStrengthField = 'strength';
const requirementsDexterityField = 'dexterity';
const requirementsFocusField = 'focus';
const requirementsVitalityField = 'vitality';
const requirementsMaleOnlyField = 'maleOnly';
const requirementsLevelField = 'level';
