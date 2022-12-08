import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:hilmi_berkay_ozdemir/di/init_adapter.dart';
import 'package:network/network.dart';

final getIt = GetIt.instance;

class DependencyInjection implements InitializationAdapter {
  const DependencyInjection._();
  static DependencyInjection shared = const DependencyInjection._();

  @override
  FutureOr<void> initialize() async {
    await _configureInjection(isTesting: isTestingSingleton);
    await _configureViewModels(isTesting: isTestingSingleton);
  }

  Future<void> _configureInjection({
    bool isTesting = false,
  }) async {
    late AppHttpApiClient appHttpApiClient;
    if (isTesting) {
      appHttpApiClient = AppHttpApiClientMock();
    } else {
      appHttpApiClient =
          AppHttpApiClientImpl(endPoint: "https://api.medium.com/v1/me");
    }
  }

  Future<void> _configureViewModels({bool isTesting = false}) async {
    // getIt..registerLazySingleton(view models);
    // getIt..registerLazySingleton(view models(isTesting:isTesting));
    //...
  }
}

bool isTestingSingleton = false;
