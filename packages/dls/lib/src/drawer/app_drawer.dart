// import 'package:dls/dls.dart';
// import 'package:dls/src/navbar/nav_item.dart';
// import 'package:dls/src/spaces/spaces.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';

// class AppDrawer extends StatefulWidget {
//   const AppDrawer(
//       {required this.menuList,
//       required this.selectedItemRouteName,
//       required this.controller,
//       required this.buildNav,
//       this.color,
//       this.width,
//       this.onClose,
//       this.leftWidget});

//   final String selectedItemRouteName;
//   final List<NavItemData> menuList;
//   final Color? color;
//   final AnimationController controller;
//   final double? width;
//   final GestureTapCallback? onClose;
//   final Widget? leftWidget;
//   final List<Widget> buildNav;

//   @override
//   _AppDrawerState createState() => _AppDrawerState();
// }

// class _AppDrawerState extends State<AppDrawer>
//     with SingleTickerProviderStateMixin {
//   static const Duration _initialDelayTime = Duration(milliseconds: 50);
//   static const Duration _itemSlideTime = Duration(milliseconds: 400);
//   static const Duration _staggerTime = Duration(milliseconds: 50);
//   static const Duration _buttonDelayTime = Duration(milliseconds: 100);
//   static const Duration _buttonTime = Duration(milliseconds: 400);
//   late Duration _animationDuration;

//   late AnimationController _staggeredController;
//   final List<Interval> _itemSlideIntervals = [];

//   @override
//   void initState() {
//     _animationDuration = _initialDelayTime +
//         (_staggerTime * widget.menuList.length) +
//         _buttonDelayTime +
//         _buttonTime;
//     _createAnimationIntervals();

//     _staggeredController = AnimationController(
//       vsync: this,
//       duration: _animationDuration,
//     )..forward();
//     super.initState();
//   }

//   void _createAnimationIntervals() {
//     for (var i = 0; i < widget.menuList.length; ++i) {
//       final startTime = _initialDelayTime + (_staggerTime * i);
//       final endTime = startTime + _itemSlideTime;
//       _itemSlideIntervals.add(
//         Interval(
//           startTime.inMilliseconds / _animationDuration.inMilliseconds,
//           endTime.inMilliseconds / _animationDuration.inMilliseconds,
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _staggeredController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     TextStyle? style = textTheme.bodyText1?.copyWith(
//       color: AppColorTheme.blueGray,
//       fontSize: 10,
//     );
//     return SizedBox(
//       width: widget.width ?? widthOfScreen(context),
//       height: heightOfScreen(context),
//       child: Drawer(
//         child: Container(
//           color: widget.color ?? AppColorTheme.secondary,
//           width: widget.width ?? widthOfScreen(context),
//           height: heightOfScreen(context),
//           child: Stack(
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(24),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         AppLogo(
//                           fontSize: 40,
//                           titleColor: AppColorTheme.secondary,
//                         ),
//                         const Spacer(),
//                         InkWell(
//                           onTap: widget.onClose ??
//                               () {
//                                 Navigator.pop(context);
//                               },
//                           child: Icon(
//                             FeatherIcons.x,
//                             size: 30,
//                             color: AppColorTheme.secondary,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const Spacer(flex: 2),
//                         ...widget.buildNav,
//                         const Spacer(flex: 2),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     "Copyright",
//                     style: style,
//                   ),
//                   SpaceH20(),
//                 ],
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: Container(
//                   margin: EdgeInsets.only(
//                     left: 24,
//                     bottom: assignHeight(context, 0.1),
//                   ),
//                   child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: widget.leftWidget),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// }


// /*

//   List<Widget> _buildMenuList({
//     required BuildContext context,
//     required List<NavItemData> menuList,
//   }) {
//     List<Widget> menuItems = [];
//     for (var index = 0; index < menuList.length; index++) {
//       menuItems.add(
//         AnimatedBuilder(
//           animation: _staggeredController,
//           builder: (context, child) {
//             final animationPercent = Curves.easeOut.transform(
//               _itemSlideIntervals[index].transform(_staggeredController.value),
//             );
//             final opacity = animationPercent;
//             final slideDistance = (1.0 - animationPercent) * 150;

//             return Opacity(
//               opacity: opacity,
//               child: Transform.translate(
//                 offset: Offset(slideDistance, 0),
//                 child: child,
//               ),
//             );
//           },
//           child: NavItem(
//             controller: widget.controller,
//             onTap: () {
//               if (menuList[index].route == HomePage.homePageRoute) {
//                 Navigator.of(context).pushNamed(
//                   menuList[index].route,
//                   arguments: NavigationArguments(
//                     showUnVeilPageAnimation: true,
//                   ),
//                 );
//               } else {
//                 Navigator.of(context).pushNamed(menuList[index].route);
//               }
//             },
//             index: index + 1,
//             route: menuList[index].route,
//             title: menuList[index].name,
//             isMobile: true,
//             isSelected: widget.selectedItemRouteName == menuList[index].route
//                 ? true
//                 : false,
//           ),
//         ),
//       );
//     }
//     return menuItems;
//   }
// */