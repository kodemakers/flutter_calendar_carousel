import 'package:flutter/material.dart';

import 'default_styles.dart' show defaultHeaderTextStyle;

class CalendarHeader extends StatelessWidget {
  /// Passing in values for [leftButtonIcon] or [rightButtonIcon] will override [headerIconColor]
  CalendarHeader({
    required this.headerTitle,
    this.headerMargin,
    required this.showHeader,
    this.headerTextStyle,
    this.showHeaderButtons = true,
    this.headerIconColor,
    this.rightDisabled = false,
    this.leftButtonIcon,
    this.rightButtonIcon,
    required this.onLeftButtonPressed,
    required this.onRightButtonPressed,
    this.onHeaderTitlePressed,
  }) : isTitleTouchable = onHeaderTitlePressed != null;

  final String headerTitle;
  final EdgeInsetsGeometry? headerMargin;
  final bool showHeader;
  final TextStyle? headerTextStyle;
  final bool showHeaderButtons;
  final Color? headerIconColor;
  final Widget? leftButtonIcon;
  final Widget? rightButtonIcon;
  final bool rightDisabled;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool isTitleTouchable;
  final VoidCallback? onHeaderTitlePressed;

  TextStyle get getTextStyle => headerTextStyle ?? defaultHeaderTextStyle;

  Widget _leftButton() => IconButton(
        onPressed: onLeftButtonPressed,
        icon: leftButtonIcon ?? Icon(Icons.chevron_left, color: headerIconColor),
      );

  Widget _rightButton() => IconButton(
        onPressed: rightDisabled ? null : onRightButtonPressed,
        icon: rightButtonIcon ?? Icon(Icons.chevron_right, color: rightDisabled ? null : headerIconColor),
      );

  Widget _headerTouchable() => TextButton(
        onPressed: onHeaderTitlePressed,
        child: Text(
          headerTitle,
          semanticsLabel: headerTitle,
          style: getTextStyle,
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (!showHeader) return SizedBox();
    return Container(
      margin: headerMargin,
      decoration: BoxDecoration(
        color: const Color(0xff4B3788),
        borderRadius: BorderRadius.circular(18),
      ),
      child: DefaultTextStyle(
        style: getTextStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (showHeaderButtons) _leftButton(),
            isTitleTouchable ? _headerTouchable() : Text(headerTitle, style: getTextStyle),
            if (showHeaderButtons) _rightButton(),
          ],
        ),
      ),
    );
  }
}
