import 'dart:developer' as dev;

import 'package:chdata/extensions/buildcontext/loc.dart';
import 'package:chdata/extensions/buildcontext/snackbar.dart';
import 'package:chdata/models/item/enum/subtype.dart';
import 'package:chdata/service/search/bloc/search_bloc.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/view/search/utility.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/item/item.dart';
import '../../service/search/bloc/constants.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
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
        state as SearchStateShowingData<Item>;
        final data = state.data;
        dev.log('ItemView: ${data.key}');
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

  String _getLvlType(SubType type) {
    return switch (type) {
      SubType.fishingRod ||
      SubType.fishingItem =>
        '${context.loc.mob_level} (${context.loc.mob_fishing})',
      SubType.cooking =>
        '${context.loc.mob_level} (${context.loc.item_cooking}))',
      _ => context.loc.mob_level
    };
  }

  void _refresh(BuildContext context, String key, Back back) {
    SearchBloc.prefs.setBool(showAllField, _showAll);
    context.read<SearchBloc>().add(
        SearchEventShowData(key: key, database: itemListField, back: back));
  }

  List<Widget> _createColumnChildren(Item data, Back back) {
    final children = <Widget>[];

    children.addAll(createSection(
        context.loc.item_description, {'': data.description},
        showAll: _showAll));
    children.addAll(createSection(
        context.loc.item_baseStats,
        {
          context.loc.item_slot: data.equipmentSlot.name.capitalize,
          context.loc.item_subType: data.subType.name.capitalize,
          context.loc.item_class: data.clasz.name.capitalize,
          context.loc.item_noTrade: data.noTrade.toString().capitalize,
          context.loc.item_stackable: data.stackable.toString().capitalize,
          context.loc.item_weight: data.weight.toString(),
          context.loc.item_buy: data.buy.toString(),
          context.loc.item_sell: data.sell.toString(),
        },
        showAll: _showAll));

    if (data.mobs.isNotEmpty) {
      final list =
          createList(context, 'Mobs', data.mobs, Icons.notes, (element) {
        dev.log('ShowMob: $element');
        context.read<SearchBloc>().add(
              SearchEventShowData(
                key: element,
                database: mobListField,
                back: (context) {
                  context.read<SearchBloc>().add(
                        SearchEventShowData(
                            key: '${data.name}$separator${data.id}',
                            database: itemListField,
                            back: back),
                      );
                },
              ),
            );
      }, getTitle: (element) => element.split(separator)[0]);
      children.addAll(list);
    }

    children.addAll(createSection(
        context.loc.mob_damage,
        {
          context.loc.item_attackSpeed: numFormatter(data.attackSpeed),
          context.loc.mob_pierce: numFormatter(data.damage.pierce),
          context.loc.mob_slash: numFormatter(data.damage.slash),
          context.loc.mob_crush: numFormatter(data.damage.crush),
          context.loc.mob_poison: numFormatter(data.damage.poison),
          context.loc.mob_true: numFormatter(data.damage.truee),
          context.loc.mob_heat: numFormatter(data.damage.heat),
          context.loc.mob_cold: numFormatter(data.damage.cold),
          context.loc.mob_magic: numFormatter(data.damage.magic),
          context.loc.mob_divine: numFormatter(data.damage.divine),
          context.loc.mob_chaos: numFormatter(data.damage.chaos),
        },
        showAll: _showAll));
    children.addAll(createSection(
        context.loc.mob_resistance,
        {
          context.loc.item_armor: numFormatter(data.armor),
          context.loc.mob_pierce: numFormatter(data.bonusStats.pierce),
          context.loc.mob_slash: numFormatter(data.bonusStats.slash),
          context.loc.mob_crush: numFormatter(data.bonusStats.crush),
          context.loc.mob_poison: numFormatter(data.bonusStats.poison),
          context.loc.mob_true: numFormatter(data.bonusStats.truee),
          context.loc.mob_heat: numFormatter(data.bonusStats.heat),
          context.loc.mob_cold: numFormatter(data.bonusStats.cold),
          context.loc.mob_magic: numFormatter(data.bonusStats.magic),
          context.loc.mob_divine: numFormatter(data.bonusStats.divine),
          context.loc.mob_chaos: numFormatter(data.bonusStats.chaos),
        },
        showAll: _showAll));
    children.addAll(createSection(
        context.loc.item_bonus,
        {
          context.loc.mob_attack: numFormatter(data.bonusStats.attack),
          context.loc.mob_defence: numFormatter(data.bonusStats.defence),
          context.loc.mob_health: numFormatter(data.bonusStats.health),
          context.loc.mob_energy: numFormatter(data.bonusStats.energy),
        },
        showAll: _showAll));
    children.addAll(createSection(
        context.loc.item_requirement,
        {
          _getLvlType(data.subType): numFormatter(data.requirements.level),
          context.loc.item_strength: numFormatter(data.requirements.strength),
          context.loc.item_dexterity: numFormatter(data.requirements.dexterity),
          context.loc.item_focus: numFormatter(data.requirements.focus),
          context.loc.item_vitality: numFormatter(data.requirements.vitality),
          context.loc.item_maleOnly:
              data.requirements.maleOnly.toString().capitalize,
        },
        showAll: _showAll));
    children.addAll(createSection(
        context.loc.mob_fishing,
        {
          context.loc.mob_fishingDamage: numFormatter(data.fishingDamage),
          context.loc.item_fishingResist:
              numFormatter(data.bonusStats.fishingResist),
          context.loc.item_fishingConcentration:
              numFormatter(data.bonusStats.concentration),
        },
        showAll: _showAll));

    children.removeLast();

    return children;
  }
}
