class Spawn {
  final String zoneKey;
  final int minSpawnSecs;
  final int maxSpawnSecs;

  const Spawn(
      {required this.zoneKey,
      required this.minSpawnSecs,
      required this.maxSpawnSecs});

  Spawn.fromJson(Map<String, dynamic> json)
      : zoneKey = json[spawnZoneKeyField] as String,
        minSpawnSecs = json[spawnMinSpawnSecsField] as int,
        maxSpawnSecs = json[spawnMaxSpawnSecsField] as int;

  Map<String, dynamic> toJson() => {
        spawnZoneKeyField: zoneKey,
        spawnMinSpawnSecsField: minSpawnSecs,
        spawnMaxSpawnSecsField: maxSpawnSecs
      };
}

const spawnZoneKeyField = 'zoneKey';
const spawnMinSpawnSecsField = 'minSpawnSecs';
const spawnMaxSpawnSecsField = 'maxSpawnSecs';
