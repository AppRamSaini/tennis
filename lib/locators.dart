import 'package:get_it/get_it.dart';
import 'package:tennis/providers/login_provider.dart';
import 'package:tennis/providers/otp_provider.dart';
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
}