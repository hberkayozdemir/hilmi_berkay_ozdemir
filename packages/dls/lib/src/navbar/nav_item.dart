import 'package:dls/dls.dart';
import 'package:flutter/material.dart';

const double indicatorWidth = 60;

class NavItemData {
  final String name;
  final String route;

  NavItemData({
    required this.name,
    required this.route,
  });
}

class NavItem extends StatefulWidget {
  const NavItem({
    required this.title,
    required this.route,
    required this.index,
    required this.controller,
    this.titleColor,
    this.selectedColor,
    this.isSelected = false,
    this.isMobile = false,
    this.titleStyle,
    this.onTap,
  });

  final String title;
  // final AnimationController controller;
  final int index;
  final String route;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final Color? selectedColor;
  final bool isSelected;
  final bool isMobile;
  final AnimationController controller;
  final GestureTapCallback? onTap;

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hovering = false;
  bool _hoveringUnselectedNavItemMobile = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: _buildNavItem(),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }

  void _onMouseEnterUnselectedNavItemMobile(bool hovering) {
    setState(() {
      _hoveringUnselectedNavItemMobile = hovering;
    });
  }

  Widget _buildNavItem() {
    return widget.isMobile ? mobileText() : desktopText();
  }

  Widget mobileText() {
    TextTheme textTheme = Theme.of(context).textTheme;
    double indexTextSize = 80;
    double selectedTextSize = 36;
    double unselectedTextSize = 36;
    return widget.isSelected
        ? Stack(
            children: [
              _buildNavItemIndex(
                index: widget.index,
                indexTextSize: indexTextSize,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: (indexTextSize - selectedTextSize) / 3),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title.toLowerCase(),
                    style: widget.titleStyle ??
                        widget.titleStyle ??
                        textTheme.headline6?.copyWith(
                          fontSize: selectedTextSize,
                          color: AppColorTheme.primaryDark,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ),
            ],
          )
        : MouseRegion(
            onEnter: (e) => _onMouseEnterUnselectedNavItemMobile(true),
            onExit: (e) => _onMouseEnterUnselectedNavItemMobile(false),
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: _hoveringUnselectedNavItemMobile ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                  child: _buildNavItemIndex(
                    index: widget.index,
                    indexTextSize: indexTextSize,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: (indexTextSize - selectedTextSize) / 3),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.title.toLowerCase(),
                      style: widget.titleStyle ??
                          textTheme.bodyText1?.copyWith(
                            fontSize: unselectedTextSize,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget desktopText() {
    TextTheme textTheme = Theme.of(context).textTheme;

    double textSize = 18;
    TextStyle? defaultSelectedItemStyle = textTheme.bodyText1?.copyWith(
      fontSize: textSize,
      color: widget.selectedColor ?? AppColorTheme.pureBlack,
      fontWeight: FontWeight.w400,
    );
    TextStyle? defaultUnselectedItemStyle = textTheme.bodyText1?.copyWith(
      fontSize: textSize,
      color: widget.titleColor ?? AppColorTheme.blueGray,
    );

    return !widget.isSelected
        ? Text(
            widget.title,
            style: widget.titleStyle ??
                defaultSelectedItemStyle!
                    .copyWith(color: AppColorTheme.pureWhite),
          )
        : DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: AppColorTheme.secondary),
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  widget.title,
                  style: defaultSelectedItemStyle!.copyWith(
                      color: AppColorTheme.primary,
                      fontWeight: FontWeight.bold),
                )),
          );
  }

  Widget _buildNavItemIndex({required int index, double? indexTextSize}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.center,
      child: Text(
        '0$index',
        style: widget.titleStyle ??
            textTheme.headline2?.copyWith(
              fontSize: indexTextSize,
              color: AppColorTheme.secondary,
              // fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
