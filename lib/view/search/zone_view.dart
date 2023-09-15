import 'dart:developer' as dev;

import 'package:chdata/view/search/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../models/zone_map/zone_map.dart';
import '../../service/search/bloc/search_bloc.dart';
import '../../service/search/bloc/search_state.dart';

class ZoneView extends StatefulWidget {
  const ZoneView({super.key});

  @override
  State<ZoneView> createState() => _ZoneViewState();
}

class _ZoneViewState extends State<ZoneView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        state as SearchStateShowingData<ZoneMap>;
        final data = state.data;
        dev.log('ZoneView: ${data.key}');
        return WillPopScope(
          onWillPop: () {
            state.back(context);
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(data.data!.name),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => state.back(context),
              ),
            ),
            body: PhotoView(
              filterQuality: FilterQuality.high,
              imageProvider:
                  AssetImage('$imagesAssetsDir/${data.data!.assetName}'),
            ),
          ),
        );
      },
    );
  }
}
