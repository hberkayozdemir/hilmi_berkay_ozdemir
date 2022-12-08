// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dls/dls.dart';
import 'package:flutter/material.dart';

class WebLayout extends StatelessWidget {
  ScrollController? controller;
  List<Widget>? items;
  WebLayout({
    Key? key,
    this.controller,
    required this.items,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.cuteWhite,
      body: ListView(
          padding: EdgeInsets.zero,
          controller: controller,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: items ?? []),
    );
  }
}
