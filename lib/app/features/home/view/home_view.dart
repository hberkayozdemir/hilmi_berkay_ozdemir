import 'package:dls/dls.dart';
import 'package:flutter/material.dart';
import 'package:hilmi_berkay_ozdemir/app/features/home/view/widgets/home_view_header.dart';
import 'package:hilmi_berkay_ozdemir/app/features/home/view_model/home_view_model.dart';
import 'package:my_mvvm/my_mvvm.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? textButtonStyle = context.appTextTheme.button?.copyWith(
      color: AppColorTheme.pureBlack,
      // fontSize: responsiveSize(context, 30, 40, md: 36, sm: 32),
      height: 2.0,
    );
    GlobalKey key = GlobalKey();
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) => WebLayout(
              items: [
                HomeViewHeader(
                  scrollToWorksKey: key,
                ),
              ],
              controller: viewModel.scrollController,
            ));
  }
}
