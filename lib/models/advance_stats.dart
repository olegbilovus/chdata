class AdvanceStats {
  final int pierce;
  final int slash;
  final int crush;
  final int heat;
  final int cold;
  final int magic;
  final int poison;
  final int divine;
  final int chaos;
  final int truee;

  const AdvanceStats(
      {required this.pierce,
      required this.slash,
      required this.crush,
      required this.heat,
      required this.cold,
      required this.magic,
      required this.poison,
      required this.divine,
      required this.chaos,
      required this.truee});

  AdvanceStats.fromJson(Map<String, dynamic> json)
      : pierce = json[advanceStatsPierce] as int,
        slash = json[advanceStatsSlash] as int,
        crush = json[advanceStatsCrush] as int,
        heat = json[advanceStatsHeat] as int,
        cold = json[advanceStatsCold] as int,
        magic = json[advanceStatsMagic] as int,
        poison = json[advanceStatsPoison] as int,
        divine = json[advanceStatsDivine] as int,
        chaos = json[advanceStatsChaos] as int,
        truee = json[advanceStatsTruee] as int;

  Map<String, dynamic> toJson() => {
        advanceStatsPierce: pierce,
        advanceStatsSlash: slash,
        advanceStatsCrush: crush,
        advanceStatsHeat: heat,
        advanceStatsCold: cold,
        advanceStatsMagic: magic,
        advanceStatsPoison: poison,
        advanceStatsDivine: divine,
        advanceStatsChaos: chaos,
        advanceStatsTruee: truee,
      };
}

const advanceStatsPierce = 'pierce';
const advanceStatsSlash = 'slash';
const advanceStatsCrush = 'crush';
const advanceStatsHeat = 'heat';
const advanceStatsCold = 'cold';
const advanceStatsMagic = 'magic';
const advanceStatsPoison = 'poison';
const advanceStatsDivine = 'divine';
const advanceStatsChaos = 'chaos';
const advanceStatsTruee = 'truee';
