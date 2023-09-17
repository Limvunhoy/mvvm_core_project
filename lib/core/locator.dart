import 'package:get_it/get_it.dart';
import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/repository/auth/login_repository_imp.dart';
import 'package:mvvm_core_project/data/repository/user/user_repository_imp.dart';
import 'package:mvvm_core_project/data/service/auth/login_service.dart';
import 'package:mvvm_core_project/data/service/user/user_service.dart';
import 'package:mvvm_core_project/domain/repository/auth/login_repository.dart';
import 'package:mvvm_core_project/domain/repository/user/user_repository.dart';
import 'package:mvvm_core_project/presentation/viewmodel/login_viewmodel.dart';
import 'package:mvvm_core_project/presentation/viewmodel/user_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton(() => DioClient());
  // locator.registerLazySingleton(() => BaseService(api: locator<DioClient>()));
  locator.registerLazySingleton(() => UserService(api: locator<DioClient>()));
  locator.registerLazySingleton(() => LoginService(api: locator<DioClient>()));

  // MARK: Register Repository
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImp(userService: locator<UserService>()));
  locator.registerLazySingleton<ILoginRepository>(() => LoginRepositoryImp(locator<LoginService>()));

  // MARK: Register ViewModel
  locator.registerFactory(() => UserViewModel(locator<UserRepository>()));
  locator.registerFactory(() => LoginViewModel(locator<ILoginRepository>()));
}
