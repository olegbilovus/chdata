import 'dart:developer' as dev;

import 'package:chdata/service/search/bloc/search_bloc.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/hive_provider.dart';
import 'package:chdata/view/loading/loading_view.dart';
import 'package:chdata/view/search/item_view.dart';
import 'package:chdata/view/search/mob_view.dart';
import 'package:chdata/view/search/search_view.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    debugShowCheckedModeBanner: false,
    title: 'CH DATA',
    theme: FlexThemeData.light(scheme: FlexScheme.cyanM3),
    darkTheme:
        FlexThemeData.dark(scheme: FlexScheme.cyanM3, darkIsTrueBlack: true),
    home: BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(HiveProvider()),
        child: const HomePage()),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SearchBloc>().add(const SearchEventInit());
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        dev.log(state.runtimeType.toString());
        if (state is SearchStateSearching) {
          return const SearchView();
        }
        if (state is SearchStateShowingData) {
          switch (state.database) {
            case mobListField:
              return const MobView();
            case itemListField:
              return const ItemView();
          }
        }
        return const LoadingView();
      },
    );
  }
}
