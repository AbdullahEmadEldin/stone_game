import 'package:flutter/material.dart';
import 'package:stone_game/core/theme/app_theme.dart';

class OptionTile extends StatelessWidget {
  final IconData leadingIcon;
  final Color? iconColor;
  final Widget title;
  final Widget? trailing;
  final Function()? onTap;
  const OptionTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.iconColor,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: iconColor ?? (kLightColorScheme.primary),
        ),
        title: title,
        trailing: trailing,
      ),
    );
  }
}
