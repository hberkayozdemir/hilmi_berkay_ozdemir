import 'package:dls/dls.dart' hide Adapti;
import 'package:flutter/material.dart';
import 'package:hilmi_berkay_ozdemir/app/core/constants/image_paths.dart';
import 'package:hilmi_berkay_ozdemir/app/core/data.dart';
import 'package:hilmi_berkay_ozdemir/app/core/functions/functions.dart';
import 'package:hilmi_berkay_ozdemir/app/core/strings.dart';
import 'package:hilmi_berkay_ozdemir/app/features/home/view/widgets/socials/socials.dart';
import 'package:responsive_builder/responsive_builder.dart';

const kDuration = Duration(milliseconds: 600);

class HomeViewHeader extends StatefulWidget {
  const HomeViewHeader({
    Key? key,
    required this.scrollToWorksKey,
  }) : super(key: key);

  final GlobalKey scrollToWorksKey;
  @override
  _HomeViewHeaderState createState() => _HomeViewHeaderState();
}

class _HomeViewHeaderState extends State<HomeViewHeader>
    with TickerProviderStateMixin {
  late AnimationController rotationController;
  late AnimationController scrollDownButtonController;
  late Animation<Offset> animation;
  late Animation<Offset> scrollDownBtnAnimation;

  @override
  void initState() {
    scrollDownButtonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    rotationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.reset();
        rotationController.forward();
        // rotationController.reverse();
      }
    });
    rotationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    scrollDownButtonController.dispose();
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    const EdgeInsets textMargin = EdgeInsets.only(
      left: 20,
      top: 60,
      bottom: 40,
    );
    final EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.1,
      vertical: screenHeight * 0.1,
    );
    final EdgeInsets imageMargin = EdgeInsets.only(
      right: 20,
      top: screenHeight * 0.25,
      bottom: 40,
    );

    return Container(
      width: screenWidth,
      color: AppColorTheme.primary,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 10),
            child: AppLogo(),
          ),
          ResponsiveBuilder(builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < const RefinedBreakpoints().tabletNormal) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: padding,
                    child: Image.asset(
                      ImagePaths.developer,
                      width: screenWidth,
                    ),
                  ),
                  Container(
                    height: screenHeight,
                    padding: padding.copyWith(top: 0),
                    child: SizedBox(
                      width: screenWidth,
                      child: AboutDev(
                        width: screenWidth,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: textMargin,
                    child: SizedBox(
                      width: screenWidth * 0.40,
                      child: AboutDev(
                        width: screenWidth * 0.40,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Container(
                    margin: imageMargin,
                    child: Image.asset(
                      ImagePaths.developer,
                      width: screenWidth * 0.35,
                    ),
                  ),
                ],
              );
            }
          }),
          Positioned(
            right: 0,
            bottom: 0,
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth < const RefinedBreakpoints().tabletNormal) {
                  return Container();
                } else {
                  return InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      Scrollable.ensureVisible(
                        widget.scrollToWorksKey.currentContext!,
                        duration: kDuration,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 24, bottom: 40),
                      child: MouseRegion(
                        onEnter: (e) => scrollDownButtonController.forward(),
                        onExit: (e) => scrollDownButtonController.reverse(),
                        child: AnimatedSlideTranstion(
                          controller: scrollDownButtonController,
                          beginOffset: const Offset(0, 0),
                          targetOffset: const Offset(0, 0.1),
                          child: const ScrollDownButton(),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AboutDev extends StatefulWidget {
  const AboutDev({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  _AboutDevState createState() => _AboutDevState();
}

class _AboutDevState extends State<AboutDev> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    EdgeInsetsGeometry margin = const EdgeInsets.only(left: 16);

    double headerFontSize = 36;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceH96(),
        Container(
          margin: margin,
          child: Text(
            StringConst.HI,
            maxLines: 3,
            style: context.appTextTheme.body?.copyWith(
              color: AppColorTheme.secondary,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: Text(
            StringConst.DEV_INTRO,
            maxLines: 3,
            style: context.appTextTheme.h2?.copyWith(
              color: AppColorTheme.secondary,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: Text(
            StringConst.DEV_TITLE,
            maxLines: 3,
            style: context.appTextTheme.h2?.copyWith(
              color: AppColorTheme.pureWhite,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH30(),
        Container(
          margin: margin,
          child: Text(
            StringConst.DEV_DESC,
            maxLines: 3,
            style: context.appTextTheme.body?.copyWith(
              fontSize: 18,
              height: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SpaceH30(),
        SpaceH40(),
        Container(
          margin: margin,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _buildSocials(
              context: context,
              data: Data.socialData1,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildSocials({
    required BuildContext context,
    required List<SocialData> data,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style =
        textTheme.bodyText1?.copyWith(color: AppColorTheme.blueGray);
    TextStyle? slashStyle = textTheme.bodyText1?.copyWith(
      color: AppColorTheme.blueGray,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        InkWell(
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          child: Text(
            data[index].name,
            style: style,
          ),
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}
