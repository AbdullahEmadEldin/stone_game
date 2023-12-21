import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stone_game/core/localization/localization_manager.dart';
import 'package:stone_game/core/locator.dart';
import 'package:stone_game/core/theme/theme_manager.dart';
import 'package:stone_game/generated/l10n.dart';
import 'package:stone_game/view/widgets/option_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          OptionTile(
            leadingIcon: Icons.sunny,
            title: Text(S.of(context).appTheme),
            trailing: _switchTheme(),
          ),
          _buildDivider(),
          OptionTile(
            leadingIcon: Icons.language,
            title: Text(S.of(context).language),
            trailing: const Padding(
              padding: EdgeInsets.only(top: 12, right: 16),
              child: Icon(Icons.arrow_drop_down),
            ),
            onTap: () {
              changeLanguage(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 1,
      indent: 8,
      endIndent: 8,
    );
  }

  Widget _switchTheme() {
    return Switch(
      value: locator.get<ThemeManager>().themeMode == ThemeMode.dark,
      onChanged: (value) {
        locator.get<ThemeManager>().toggleTheme(value);
      },
    );
  }

  changeLanguage(BuildContext context) {
    final List<String> languages = [
      S.of(context).English,
      S.of(context).Arabic
    ];
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(24),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Column(
                children: languages
                    .map(
                      (language) => InkWell(
                        onTap: () {
                          if (language == S.of(context).English) {
                            locator
                                .get<LocalizationManager>()
                                .changeLanguage('en');
                            context.pop();
                          }
                          if (language == S.of(context).Arabic) {
                            locator
                                .get<LocalizationManager>()
                                .changeLanguage('ar');
                            context.pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            language,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        });
  }
}
