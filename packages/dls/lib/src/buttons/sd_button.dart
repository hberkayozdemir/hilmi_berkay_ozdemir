import 'package:dls/dls.dart';
import 'package:dls/src/constants/icons_paths.dart';
import 'package:flutter/material.dart';

class ScrollDownButton extends StatelessWidget {
  const ScrollDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            DlsConstants.scrollDown.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 12,
                  letterSpacing: 1.7,
                  color: AppColorTheme.secondary,
                ),
          ),
        ),
        SpaceH16(),
        Image.asset(
          IconPaths.scrollDown,
          height: 24,
          color: AppColorTheme.secondary,
          package: DlsConstants.dlsPackageName,
        ),
      ],
    );
  }
}
