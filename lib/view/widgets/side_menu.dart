import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stone_game/core/locator.dart';
import 'package:stone_game/core/navigation/routes.dart';
import 'package:stone_game/core/theme/app_theme.dart';
import 'package:stone_game/view/widgets/option_tile.dart';
import 'package:stone_game/generated/l10n.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            _buildInfoHeader(context, size),
            OptionTile(
              leadingIcon: Icons.history,
              title: Text(S.of(context).playHistory),
              onTap: () => context.goNamed(AppRoutes.historyScreen),
            ),
            _buildDivider(),
            OptionTile(
              leadingIcon: Icons.settings,
              title: Text(S.of(context).Settings),
              onTap: () => context.goNamed(AppRoutes.settingsScreen),
            ),
            _buildDivider(),
            OptionTile(
                leadingIcon: Icons.help, title: Text(S.of(context).help)),
            _buildDivider(),
            OptionTile(
              leadingIcon: Icons.logout_rounded,
              iconColor: Colors.red,
              title: Text(S.of(context).logOut),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoHeader(BuildContext context, Size size) {
    return Container(
      color: locator.get<ThemeData>() == AppThemes.lightAppTheme
          ? kLightColorScheme.primary
          : Colors.red,
      padding: EdgeInsets.zero,
      height: size.height * 0.23,
      width: double.infinity,
      child: Card(
        shape: const ContinuousRectangleBorder(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CircleAvatar(
                radius: size.width * 0.1,
                backgroundImage:
                    const AssetImage('assets/images/Anonymous-Profile-pic.jpg'),
              ),
            ),
            Text(
              //TODO: store user name and profile image locally related to user.uid of firebase object
              'Abdullah Emad',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '010082233760',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 1,
      indent: 4,
      endIndent: 4,
    );
  }
}
