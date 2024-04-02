import 'package:get_it/get_it.dart';
import 'package:social_app/feature/auth/data/data_source/base_data_source.dart';
import 'package:social_app/feature/auth/data/data_source/data_source.dart';
import 'package:social_app/feature/auth/presentation/business_logic/login_bloc/login_bloc.dart';
import '../../feature/auth/data/repository/auth_repository.dart';
import '../../feature/auth/domain/base_repository/base_auth_repository.dart';
import '../../feature/auth/domain/use_cases/login_use_case.dart';

final sl = GetIt.instance;
class ServiceLocator{

  static void get setUp {

    // bloc
    sl.registerLazySingleton(() => LoginBloc(sl()));

    //use cases
    sl.registerLazySingleton(() => LoginWithEmailAndPasswordUseCase(sl()));

    // auth repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    // auth datasource
    sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource());
  }
}