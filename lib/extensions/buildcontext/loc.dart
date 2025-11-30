import 'package:flutter/material.dart' show BuildContext;
import 'package:chdata/l10n/app_localizations.dart'
    show AppLocalizations;

extension Localization on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
