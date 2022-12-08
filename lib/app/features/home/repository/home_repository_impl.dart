import 'package:hilmi_berkay_ozdemir/app/features/home/repository/home_repository.dart';
import 'package:hilmi_berkay_ozdemir/di/dependency_injection.dart';
import 'package:network/network.dart';

class HomeRepositoryImpl implements HomeRepository {
  final AppHttpApiClient api = getIt<AppHttpApiClient>();

  @override
  Future<Type> getMediumStories(Type x) {
    return api.getMediumStories(x: Type);
  }
}
