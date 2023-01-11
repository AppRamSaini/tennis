import 'package:get_it/get_it.dart';
import 'package:tennis/providers/addplayer_provider.dart';
import 'package:tennis/providers/allmatchs_provider.dart';
import 'package:tennis/providers/createleagues_provider.dart';
import 'package:tennis/providers/editprofile_provider.dart';
import 'package:tennis/providers/home_provider.dart';
import 'package:tennis/providers/login_provider.dart';
import 'package:tennis/providers/mychallenge_provider.dart';
import 'package:tennis/providers/myleagues_provider.dart';
import 'package:tennis/providers/myresult_provider.dart';
import 'package:tennis/providers/news_provider.dart';
import 'package:tennis/providers/otp_provider.dart';
import 'package:tennis/providers/ranking_challenge_provider.dart';
import 'package:tennis/providers/reports_provider.dart';
import 'package:tennis/providers/score_card_provider.dart';
/// Locators to get instances of classes mostly singletons
GetIt locator = GetIt.I;

/// needs to be called at in the main
/// it creates the instances of services
void setupLocators() {
  locator.registerLazySingleton<LoginProvider>(
        () => LoginProvider(),
  );
  locator.registerLazySingleton<OtpProvider>(
        () => OtpProvider(),
  );
  locator.registerLazySingleton<ScoreCardProvider>(
        () => ScoreCardProvider(),
  );
  locator.registerLazySingleton<HomeProvider>(
        () => HomeProvider(),
  );
  locator.registerLazySingleton<NewsProvider>(
        () => NewsProvider(),
  );
  locator.registerLazySingleton<CreateLeaguesProvider>(
        () => CreateLeaguesProvider(),
  );
  locator.registerLazySingleton<EditProfileProvider>(
        () => EditProfileProvider(),
  );
  locator.registerLazySingleton<MyLeaguesProvider>(
        () => MyLeaguesProvider(),
  );
  locator.registerLazySingleton<AddPlayerProvider>(
        () => AddPlayerProvider(),
  );
  locator.registerLazySingleton<RankingChallengeProvider>(
        () => RankingChallengeProvider(),
  );
  locator.registerLazySingleton<MychallengeProvider>(
        () => MychallengeProvider(),
  );
  locator.registerLazySingleton<MyResultProvider>(
        () => MyResultProvider(),
  );
  locator.registerLazySingleton<AllMatchsProvider>(
        () => AllMatchsProvider(),
  );
  locator.registerLazySingleton<ReportsProvider>(
        () => ReportsProvider(),
  );
}