import 'package:flutter/material.dart';
import 'package:hilmi_berkay_ozdemir/app/features/home/repository/home_repository_impl.dart';
import 'package:my_mvvm/my_mvvm.dart';

class HomeViewModel extends BaseViewModel  {
  HomeRepositoryImpl implementation = HomeRepositoryImpl();
  Future<void> fetchApi() async {
    final response = await implementation.getMediumStories(Type);
  }

  final ScrollController _controller = ScrollController();
  get scrollController => _controller;


  @override
  void dispose() {
    _controller.dispose();
  }
}
