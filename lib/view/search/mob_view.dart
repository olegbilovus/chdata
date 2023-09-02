import 'dart:developer' as dev;

import 'package:chdata/extensions/buildcontext/loc.dart';
import 'package:chdata/models/constants.dart';
import 'package:chdata/models/mob.dart';
import 'package:chdata/service/search/bloc/search_bloc.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/view/search/constants.dart';
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
                title: Text(data.key.split(separator)[0]),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _back(context),
                )),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _createHeader(context.loc.mob_baseStats),
                    const Divider(thickness: 2),
                    _createData({
                      context.loc.mob_level: data.data!.level.toString(),
                      context.loc.mob_mobOpinion: data.data!.opinion.name,
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
                    const Divider(thickness: 2),
                    _createHeader(context.loc.mob_damage),
                    _createData({
                      context.loc.mob_pierce:
                          _numFormatter(data.data!.pierceDamage),
                      context.loc.mob_slash:
                          _numFormatter(data.data!.slashDamage),
                      context.loc.mob_crush:
                          _numFormatter(data.data!.crushDamage),
                      context.loc.mob_poison:
                          _numFormatter(data.data!.poisonDamage),
                      context.loc.mob_true:
                          _numFormatter(data.data!.trueDamage),
                      context.loc.mob_heat:
                          _numFormatter(data.data!.heatDamage),
                      context.loc.mob_cold:
                          _numFormatter(data.data!.coldDamage),
                      context.loc.mob_magic:
                          _numFormatter(data.data!.magicDamage),
                      context.loc.mob_divine:
                          _numFormatter(data.data!.divineDamage),
                      context.loc.mob_chaos:
                          _numFormatter(data.data!.chaosDamage)
                    }),
                    const Divider(thickness: 2),
                    _createHeader(context.loc.mob_resistance),
                    _createData({
                      context.loc.mob_pierce:
                          _numFormatter(data.data!.pierceResist),
                      context.loc.mob_slash:
                          _numFormatter(data.data!.slashResist),
                      context.loc.mob_crush:
                          _numFormatter(data.data!.crushResist),
                      context.loc.mob_poison:
                          _numFormatter(data.data!.poisonResist),
                      context.loc.mob_true:
                          _numFormatter(data.data!.trueResist),
                      context.loc.mob_heat:
                          _numFormatter(data.data!.heatResist),
                      context.loc.mob_cold:
                          _numFormatter(data.data!.coldResist),
                      context.loc.mob_magic:
                          _numFormatter(data.data!.magicResist),
                      context.loc.mob_divine:
                          _numFormatter(data.data!.divineResist),
                      context.loc.mob_chaos:
                          _numFormatter(data.data!.chaosResist)
                    }),
                    const Divider(thickness: 2),
                    _createHeader(context.loc.mob_fishing),
                    _createData({
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

  Widget _createHeader(String text) {
    return Text(
      text,
      textScaleFactor: 1.5,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _createData(Map<String, String> data) {
    final List<Widget> children = [];
    data.forEach((key, value) {
      children.add(Wrap(
        spacing: widthSB,
        children: [
          Text('$key:', style: textStyleField),
          Text(value),
        ],
      ));
    });

    return Column(
      children: children,
    );
  }
}
