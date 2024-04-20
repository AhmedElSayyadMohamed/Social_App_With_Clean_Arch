import 'package:get_it/get_it.dart';
import 'package:social_app/feature/auth/data/data_source/base_data_source.dart';
import 'package:social_app/feature/auth/data/data_source/data_source.dart';
import 'package:social_app/feature/auth/domain/use_cases/register_use_case.dart';
import 'package:social_app/feature/auth/presentation/business_logic/login_bloc/login_bloc.dart';
import 'package:social_app/feature/auth/presentation/business_logic/register_bloc/register_bloc.dart';
import 'package:social_app/feature/feeds/data/remote_data_source/base_remote_data_source.dart';
import 'package:social_app/feature/feeds/data/remote_data_source/remote_data_source.dart';
import 'package:social_app/feature/feeds/data/repository/feed_repository.dart';
import 'package:social_app/feature/feeds/domain/base_repository/base_feed_repository.dart';
import 'package:social_app/feature/feeds/domain/use_cases/create_post_with_image.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import '../../feature/auth/data/repository/auth_repository.dart';
import '../../feature/auth/domain/base_repository/base_auth_repository.dart';
import '../../feature/auth/domain/use_cases/login_use_case.dart';
import '../../feature/feeds/domain/use_cases/upload_post_image_to_fie_stroage.dart';
import '../../feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';
import '../../feature/layout/presentation/bussiness_logic/social_bloc.dart';
import '../../feature/profile/data/data_source/base_data_source.dart';
import '../../feature/profile/data/data_source/data_source.dart';
import '../../feature/profile/data/repository/profile_repository.dart';
import '../../feature/profile/domain/base_repository/base_profile_repository.dart';
import '../../feature/profile/domain/use_cases/get_user_data.dart';

final sl = GetIt.instance;
class ServiceLocator{

  static Future<void> get setUp async {

    // bloc
    sl.registerLazySingleton(() => SocialBloc());
    sl.registerLazySingleton(() => LoginBloc(sl()));
    sl.registerLazySingleton(() => RegisterBloc(sl()));
    sl.registerFactory(() => ProfileBloc(sl()));
    sl.registerFactory(() => FeedsBloc(sl(),sl()));

    //use cases
    sl.registerLazySingleton(() => LoginWithEmailAndPasswordUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton(() => GetUserDataUseCase(sl()));
    sl.registerLazySingleton(() => UploadImageToFireStorageUseCase(sl()));
    sl.registerLazySingleton(() => CreatePostWithImageUseCase(sl()));

    // auth repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton<BaseProfileRepository>(() => ProfileRepository(sl()));
    sl.registerLazySingleton<BaseFeedRepository>(() => FeedRepository(sl()));

    // auth datasource
    sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource());
    sl.registerLazySingleton<BaseProfileRemoteDataSource>(() => ProfileRemoteDataSource());
    sl.registerLazySingleton<BaseFeedRemoteDataSource>(() => FeedsRemoteDataSource());
  }
}