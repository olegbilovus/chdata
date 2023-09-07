import 'dart:developer' as dev;

import 'package:chdata/extensions/buildcontext/loc.dart';
import 'package:chdata/models/mob/constants.dart';
import 'package:chdata/models/mob/mob.dart';
import 'package:chdata/service/search/bloc/search_bloc.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/view/search/constants.dart';
import 'package:chdata/view/search/utility.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MobView extends StatefulWidget {
  const MobView({super.key});

  @override
  State<MobView> createState() => _MobViewState();
}

class _MobViewState extends State<MobView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        state as SearchStateShowingData<Mob>;
        final data = state.data;
        dev.log('MobView: ${data.key}');
        return WillPopScope(
          onWillPop: () {
            _back(context);
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
                title: Text(data.data!.name),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _back(context),
                )),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    createHeader(context.loc.mob_baseStats),
                    createData({
                      context.loc.mob_level: data.data!.level.toString(),
                      context.loc.mob_mobOpinion:
                          data.data!.opinion.name.capitalize,
                      context.loc.mob_stars: data.data!.stars.toString(),
                      context.loc.mob_health: _numFormatter(data.data!.health),
                      context.loc.mob_energy: _numFormatter(data.data!.energy),
                      context.loc.mob_attack: _numFormatter(data.data!.attack),
                      context.loc.mob_defence:
                          _numFormatter(data.data!.defence),
                      context.loc.mob_xp: _numFormatter(data.data!.xp),
                      context.loc.mob_aggroRange:
                          _numFormatter(data.data!.range),
                      context.loc.mob_followRange:
                          _numFormatter(data.data!.followRange),
                      context.loc.mob_AttackRange:
                          _numFormatter(data.data!.attackRange),
                      context.loc.mob_attackSpeed:
                          _numFormatter(data.data!.attackSpeed),
                      context.loc.mob_missileSpeed:
                          _numFormatter(data.data!.missileSpeed),
                      context.loc.mob_goldMin:
                          _numFormatter(data.data!.goldMin),
                      context.loc.mob_goldMax: _numFormatter(data.data!.goldMax)
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.mob_damage),
                    createData({
                      context.loc.mob_pierce:
                          _numFormatter(data.data!.damage.pierce),
                      context.loc.mob_slash:
                          _numFormatter(data.data!.damage.slash),
                      context.loc.mob_crush:
                          _numFormatter(data.data!.damage.crush),
                      context.loc.mob_poison:
                          _numFormatter(data.data!.damage.poison),
                      context.loc.mob_true:
                          _numFormatter(data.data!.damage.truee),
                      context.loc.mob_heat:
                          _numFormatter(data.data!.damage.heat),
                      context.loc.mob_cold:
                          _numFormatter(data.data!.damage.cold),
                      context.loc.mob_magic:
                          _numFormatter(data.data!.damage.magic),
                      context.loc.mob_divine:
                          _numFormatter(data.data!.damage.divine),
                      context.loc.mob_chaos:
                          _numFormatter(data.data!.damage.chaos)
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.mob_resistance),
                    createData({
                      context.loc.mob_pierce:
                          _numFormatter(data.data!.resist.pierce),
                      context.loc.mob_slash:
                          _numFormatter(data.data!.resist.slash),
                      context.loc.mob_crush:
                          _numFormatter(data.data!.resist.crush),
                      context.loc.mob_poison:
                          _numFormatter(data.data!.resist.poison),
                      context.loc.mob_true:
                          _numFormatter(data.data!.resist.truee),
                      context.loc.mob_heat:
                          _numFormatter(data.data!.resist.heat),
                      context.loc.mob_cold:
                          _numFormatter(data.data!.resist.cold),
                      context.loc.mob_magic:
                          _numFormatter(data.data!.resist.magic),
                      context.loc.mob_divine:
                          _numFormatter(data.data!.resist.divine),
                      context.loc.mob_chaos:
                          _numFormatter(data.data!.resist.chaos)
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader('Evasion'),
                    createData({
                      context.loc.mob_physical:
                          _numFormatter(data.data!.physicalEvade),
                      context.loc.mob_spell:
                          _numFormatter(data.data!.spellEvade),
                      context.loc.mob_movement:
                          _numFormatter(data.data!.moveEvade),
                      context.loc.mob_wounding:
                          _numFormatter(data.data!.woundEvade),
                      context.loc.mob_weakening:
                          _numFormatter(data.data!.weakEvade),
                      context.loc.mob_mental:
                          _numFormatter(data.data!.mentalEvade),
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.mob_fishing),
                    createData({
                      context.loc.mob_fishingDamage:
                          _numFormatter(data.data!.fishingDamage),
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _back(BuildContext context) {
    context.read<SearchBloc>().add(SearchEventSearch(
        key: SearchBloc.prefs.getString(searchPatternField) ?? '',
        database: mobListField,
        contains: SearchBloc.prefs.getBool(searchContainsField) ?? false));
  }

  String _numFormatter(dynamic number) {
    if (number == immuneValue) {
      return immuneText;
    }
    return NumberFormat.decimalPattern().format(number);
  }
}
