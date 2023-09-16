import 'dart:developer' as dev;

import 'package:chdata/extensions/buildcontext/loc.dart';
import 'package:chdata/extensions/buildcontext/snackbar.dart';
import 'package:chdata/models/mob/mob.dart';
import 'package:chdata/service/search/bloc/search_bloc.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/view/search/utility.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/search/bloc/constants.dart';
import 'constants.dart';

class MobView extends StatefulWidget {
  const MobView({super.key});

  @override
  State<MobView> createState() => _MobViewState();
}

class _MobViewState extends State<MobView> {
  late bool _showAll;

  @override
  void initState() {
    _showAll = SearchBloc.prefs.getBool(showAllField) ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        state as SearchStateShowingData<Mob>;
        final data = state.data;
        dev.log('MobView: ${data.key}');
        return WillPopScope(
          onWillPop: () {
            state.back(context);
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                  data.data!.name + (_showAll ? ' [${data.data!.id}]' : '')),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => state.back(context),
              ),
              actions: [
                Checkbox(
                  value: _showAll,
                  onChanged: (value) {
                    if (value ?? false) {
                      context.snack(Text(context.loc.data_showAll));
                    } else {
                      context.snack(Text(context.loc.data_not_showAll));
                    }
                    setState(() {
                      _showAll = value!;
                    });
                    _refresh(context, data.key, state.back);
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: _createColumnChildren(data.data!, state.back),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _refresh(BuildContext context, String key, Back back) {
    SearchBloc.prefs.setBool(showAllField, _showAll);
    context
        .read<SearchBloc>()
        .add(SearchEventShowData(key: key, database: mobListField, back: back));
  }

  List<Widget> _createColumnChildren(Mob data, Back back) {
    final children = <Widget>[];

    children.addAll(createSection(
        context.loc.mob_baseStats,
        {
          context.loc.mob_level: data.level.toString(),
          context.loc.mob_mobOpinion: data.opinion.name.capitalize,
          context.loc.mob_stars: data.stars.toString(),
          context.loc.mob_health: numFormatter(data.health),
          context.loc.mob_energy: numFormatter(data.energy),
          context.loc.mob_attack: numFormatter(data.attack),
          context.loc.mob_defence: numFormatter(data.defence),
          context.loc.mob_xp: numFormatter(data.xp),
          context.loc.mob_aggroRange: numFormatter(data.range),
          context.loc.mob_followRange: numFormatter(data.followRange),
          context.loc.mob_AttackRange: numFormatter(data.attackRange),
          context.loc.mob_attackSpeed: numFormatter(data.attackSpeed),
          context.loc.mob_missileSpeed: numFormatter(data.missileSpeed),
          context.loc.mob_goldMin: numFormatter(data.goldMin),
          context.loc.mob_goldMax: numFormatter(data.goldMax)
        },
        showAll: _showAll));
    if (data.spawns.isNotEmpty) {
      children.add(createHeader('Spawns'));
      children.add(const SizedBox(height: 10));
      children.add(
        SizedBox(
          height: MediaQuery.of(context).size.height / 7,
          child: Center(
            child: ListView.builder(
              itemCount: data.spawns.length,
              itemBuilder: (context, index) {
                final spawn = data.spawns.elementAt(index);
                return ListTile(
                  title: Text(spawn.zoneKey.split(separator)[0],
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center),
                  subtitle: Text(
                      '${getTimeFromSeconds(spawn.minSpawnSecs)} - ${getTimeFromSeconds(spawn.maxSpawnSecs)}',
                      textAlign: TextAlign.center),
                  trailing: const Icon(Icons.map),
                  onTap: () {
                    dev.log('ShowMap: ${spawn.zoneKey}');
                    context.read<SearchBloc>().add(
                          SearchEventShowData(
                            key: spawn.zoneKey,
                            database: zoneMapListField,
                            back: (context) {
                              context.read<SearchBloc>().add(
                                    SearchEventShowData(
                                        key: '${data.name}$separator${data.id}',
                                        database: mobListField,
                                        back: back),
                                  );
                            },
                          ),
                        );
                  },
                );
              },
            ),
          ),
        ),
      );
      children.add(const Divider(thickness: dividerThickness));
    }
    children.addAll(createSection(
        context.loc.mob_damage,
        {
          context.loc.mob_pierce: numFormatter(data.damage.pierce),
          context.loc.mob_slash: numFormatter(data.damage.slash),
          context.loc.mob_crush: numFormatter(data.damage.crush),
          context.loc.mob_poison: numFormatter(data.damage.poison),
          context.loc.mob_true: numFormatter(data.damage.truee),
          context.loc.mob_heat: numFormatter(data.damage.heat),
          context.loc.mob_cold: numFormatter(data.damage.cold),
          context.loc.mob_magic: numFormatter(data.damage.magic),
          context.loc.mob_divine: numFormatter(data.damage.divine),
          context.loc.mob_chaos: numFormatter(data.damage.chaos)
        },
        showAll: _showAll));
    children.addAll(createSection(
        context.loc.mob_resistance,
        {
          context.loc.mob_pierce: numFormatter(data.resist.pierce),
          context.loc.mob_slash: numFormatter(data.resist.slash),
          context.loc.mob_crush: numFormatter(data.resist.crush),
          context.loc.mob_poison: numFormatter(data.resist.poison),
          context.loc.mob_true: numFormatter(data.resist.truee),
          context.loc.mob_heat: numFormatter(data.resist.heat),
          context.loc.mob_cold: numFormatter(data.resist.cold),
          context.loc.mob_magic: numFormatter(data.resist.magic),
          context.loc.mob_divine: numFormatter(data.resist.divine),
          context.loc.mob_chaos: numFormatter(data.resist.chaos)
        },
        showAll: _showAll));
    children.addAll(createSection(
        context.loc.mob_evasion,
        {
          context.loc.mob_physical: numFormatter(data.physicalEvade),
          context.loc.mob_spell: numFormatter(data.spellEvade),
          context.loc.mob_movement: numFormatter(data.moveEvade),
          context.loc.mob_wounding: numFormatter(data.woundEvade),
          context.loc.mob_weakening: numFormatter(data.weakEvade),
          context.loc.mob_mental: numFormatter(data.mentalEvade),
        },
        showAll: _showAll));
    children.addAll(createSection(
        context.loc.mob_fishing,
        {
          context.loc.mob_fishingDamage: numFormatter(data.fishingDamage),
        },
        showAll: _showAll));

    children.removeLast();

    return children;
  }
}
