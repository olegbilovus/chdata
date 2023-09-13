import 'dart:developer' as dev;

import 'package:chdata/extensions/buildcontext/loc.dart';
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
import 'constants.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        state as SearchStateShowingData<Item>;
        final data = state.data;
        dev.log('ItemView: ${data.key}');
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
                    createHeader(context.loc.item_description),
                    createData({'': data.data!.description}),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.item_baseStats),
                    createData({
                      context.loc.item_slot:
                          data.data!.equipmentSlot.name.capitalize,
                      context.loc.item_subType:
                          data.data!.subType.name.capitalize,
                      context.loc.item_class: data.data!.clasz.name.capitalize,
                      context.loc.item_noTrade:
                          data.data!.noTrade.toString().capitalize,
                      context.loc.item_stackable:
                          data.data!.stackable.toString().capitalize,
                      context.loc.item_weight: data.data!.weight.toString(),
                      context.loc.item_buy: data.data!.buy.toString(),
                      context.loc.item_sell: data.data!.sell.toString()
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.mob_damage),
                    createData({
                      context.loc.item_attackSpeed:
                          numFormatter(data.data!.attackSpeed),
                      context.loc.mob_pierce:
                          numFormatter(data.data!.damage.pierce),
                      context.loc.mob_slash:
                          numFormatter(data.data!.damage.slash),
                      context.loc.mob_crush:
                          numFormatter(data.data!.damage.crush),
                      context.loc.mob_poison:
                          numFormatter(data.data!.damage.poison),
                      context.loc.mob_true:
                          numFormatter(data.data!.damage.truee),
                      context.loc.mob_heat:
                          numFormatter(data.data!.damage.heat),
                      context.loc.mob_cold:
                          numFormatter(data.data!.damage.cold),
                      context.loc.mob_magic:
                          numFormatter(data.data!.damage.magic),
                      context.loc.mob_divine:
                          numFormatter(data.data!.damage.divine),
                      context.loc.mob_chaos:
                          numFormatter(data.data!.damage.chaos),
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.mob_resistance),
                    createData({
                      context.loc.item_armor: numFormatter(data.data!.armor),
                      context.loc.mob_pierce:
                          numFormatter(data.data!.bonusStats.pierce),
                      context.loc.mob_slash:
                          numFormatter(data.data!.bonusStats.slash),
                      context.loc.mob_crush:
                          numFormatter(data.data!.bonusStats.crush),
                      context.loc.mob_poison:
                          numFormatter(data.data!.bonusStats.poison),
                      context.loc.mob_true:
                          numFormatter(data.data!.bonusStats.truee),
                      context.loc.mob_heat:
                          numFormatter(data.data!.bonusStats.heat),
                      context.loc.mob_cold:
                          numFormatter(data.data!.bonusStats.cold),
                      context.loc.mob_magic:
                          numFormatter(data.data!.bonusStats.magic),
                      context.loc.mob_divine:
                          numFormatter(data.data!.bonusStats.divine),
                      context.loc.mob_chaos:
                          numFormatter(data.data!.bonusStats.chaos),
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.item_bonus),
                    createData({
                      context.loc.mob_attack:
                          numFormatter(data.data!.bonusStats.attack),
                      context.loc.mob_defence:
                          numFormatter(data.data!.bonusStats.defence),
                      context.loc.mob_health:
                          numFormatter(data.data!.bonusStats.health),
                      context.loc.mob_energy:
                          numFormatter(data.data!.bonusStats.energy),
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.item_requirement),
                    createData({
                      _getLvlType(data.data!.subType):
                          numFormatter(data.data!.requirements.level),
                      context.loc.item_strength:
                          numFormatter(data.data!.requirements.strength),
                      context.loc.item_dexterity:
                          numFormatter(data.data!.requirements.dexterity),
                      context.loc.item_focus:
                          numFormatter(data.data!.requirements.focus),
                      context.loc.item_vitality:
                          numFormatter(data.data!.requirements.vitality),
                      context.loc.item_maleOnly: data
                          .data!.requirements.maleOnly
                          .toString()
                          .capitalize,
                    }),
                    const Divider(thickness: dividerThickness),
                    createHeader(context.loc.mob_fishing),
                    createData({
                      context.loc.mob_fishingDamage:
                          numFormatter(data.data!.fishingDamage),
                      context.loc.item_fishingResist:
                          numFormatter(data.data!.bonusStats.fishingResist),
                      context.loc.item_fishingConcentration:
                          numFormatter(data.data!.bonusStats.concentration),
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
        database: itemListField,
        contains: SearchBloc.prefs.getBool(searchContainsField) ?? false));
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
}
