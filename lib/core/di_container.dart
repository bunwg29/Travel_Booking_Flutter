import 'package:book_tour/core/util/UtilConst.dart';
import 'package:book_tour/data/domain/BaseUrl.dart';
import 'package:book_tour/data/repository/RepositoryAdminAddTour.dart';
import 'package:book_tour/data/repository/RepositoryAdminBookedDetail.dart';
import 'package:book_tour/data/repository/RepositoryAdminDetailTour.dart';
import 'package:book_tour/data/repository/RepositoryAdminHome.dart';
import 'package:book_tour/data/repository/RepositoryAuth.dart';
import 'package:book_tour/data/repository/RepositoryHome.dart';
import 'package:book_tour/data/repository/RepositoryProfileDetail.dart';
import 'package:book_tour/data/repository/RepositorySearch.dart';
import 'package:book_tour/data/repository/RepositorySignUp.dart';
import 'package:book_tour/data/repository/RepositoryUserBooked.dart';
import 'package:book_tour/data/repository/RepositoryUserDetailBooked.dart';
import 'package:book_tour/data/repository/RepositoryUserDetailTour.dart';
import 'package:book_tour/data/repository/RepositoryUserProfile.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  sl.registerLazySingleton<Dio>(() {
    Dio dio = Dio(BaseOptions(baseUrl: BaseUrl.baseUrl));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String? token = sl<SharedPreferences>().getString(UtilConst.token);
        if (token != null && token.isNotEmpty) {
          print(token);
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
    ));

    return dio;
  });

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  await sl.allReady();

  sl.registerLazySingleton(
    () => Repositoryauth(dio: sl(), sharedPreferences: sl()),
  );

  sl.registerLazySingleton(
    () => Repositorysignup(dio: sl(), sharedPreferences: sl()),
  );

  sl.registerLazySingleton(
    () => Repositoryadminaddtour(dio: sl()),
  );

  sl.registerLazySingleton(
    () => Repositoryadminhome(dio: sl()),
  );

  sl.registerLazySingleton(
    () => Repositoryadmindetailtour(dio: sl()),
  );

  sl.registerLazySingleton(
    () => Repositoryhome(dio: sl()),
  );

  sl.registerLazySingleton(
    () => Repositoryuserprofile(dio: sl()),
  );

  sl.registerLazySingleton(
    () => Repositoryprofiledetail(dio: sl()),
  );

  sl.registerLazySingleton(
    () => Repositoryuserdetailtour(dio: sl(), sharedPreferences: sl()),
  );
  sl.registerLazySingleton(
    () => Repositoryuserbooked(dio: sl(), sharedPreferences: sl()),
  );
  sl.registerLazySingleton(
    () => Repositoryuserdetailbooked(dio: sl(), sharedPreferences: sl()),
  );
  sl.registerLazySingleton(
    () => Repositoryadminbookeddetail(dio: sl()),
  );
  sl.registerLazySingleton(
    () => Repositorysearch(dio: sl()),
  );
}
