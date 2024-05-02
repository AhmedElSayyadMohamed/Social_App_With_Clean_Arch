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
import 'package:social_app/feature/feeds/domain/use_cases/add_post_usecase.dart';
import 'package:social_app/feature/feeds/domain/use_cases/get_all_posts.dart';
import 'package:social_app/feature/feeds/domain/use_cases/get_my_posts_by_id_usecase.dart';
import 'package:social_app/feature/feeds/domain/use_cases/like_post_usecase.dart';
import 'package:social_app/feature/profile/domain/use_cases/follow_user_use_case.dart';
import 'package:social_app/feature/profile/domain/use_cases/get_followers_data.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import '../../feature/auth/data/repository/auth_repository.dart';
import '../../feature/auth/domain/base_repository/base_auth_repository.dart';
import '../../feature/auth/domain/use_cases/login_use_case.dart';
import '../../feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';
import '../../feature/layout/presentation/bussiness_logic/social_bloc.dart';
import '../../feature/profile/data/data_source/base_data_source.dart';
import '../../feature/profile/data/data_source/data_source.dart';
import '../../feature/profile/data/repository/profile_repository.dart';
import '../../feature/profile/domain/base_repository/base_profile_repository.dart';
import '../../feature/profile/domain/use_cases/get_following_data.dart';
import '../../feature/profile/domain/use_cases/get_user_data.dart';

final sl = GetIt.instance;
class ServiceLocator{
  factory ServiceLocator() => singletonInstance;
  static ServiceLocator singletonInstance =  ServiceLocator._internal();
  ServiceLocator._internal();


  Future<void> get setUp async {
    _setUpBlocs;
    _useCases;
    _repositories;
    _dataSources;
  }

  get _setUpBlocs{

    sl.registerLazySingleton(() => SocialBloc());
    sl.registerLazySingleton(() => LoginBloc(sl()));
    sl.registerLazySingleton(() => RegisterBloc(sl()));
    sl.registerFactory(() => ProfileBloc(sl(),sl(),sl(),sl()));
    sl.registerFactory(() => FeedsBloc(sl(),sl(),sl(),sl()));

  }
  get _useCases{
    sl.registerLazySingleton(() => LoginWithEmailAndPasswordUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton(() => GetUserDataUseCase(sl()));
    sl.registerLazySingleton(() => GetFollowersDataUseCase(sl()));
    sl.registerLazySingleton(() => GetFollowingDataUseCase(sl()));
    sl.registerLazySingleton(() => FollowUserUseCase(sl()));
    sl.registerLazySingleton(() => AddPostUseCase(sl()));
    sl.registerLazySingleton(() => LikePostUseCase(sl()));
    sl.registerLazySingleton(() => GetMyPostsByIdUseCase(sl()));
    sl.registerLazySingleton(() => GetTimeLinePostsUseCase(sl()));

  }
  get _repositories{
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton<BaseProfileRepository>(() => ProfileRepository(sl()));
    sl.registerLazySingleton<BaseFeedRepository>(() => FeedRepository(sl()));
  }
  get _dataSources{
    sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource());
    sl.registerLazySingleton<BaseProfileRemoteDataSource>(() => ProfileRemoteDataSource());
    sl.registerLazySingleton<BaseFeedRemoteDataSource>(() => FeedsRemoteDataSource());
  }
}