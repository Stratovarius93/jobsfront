import 'package:jobs_front/helpers/sharedPreference.dart';
import 'package:jobs_front/login/view.dart';
import 'package:jobs_front/login/controller.dart';
import 'package:jobs_front/login/view/authCode.dart';
import 'package:jobs_front/login/view/register.dart';
import 'package:mvc_application/controller.dart';
import 'package:mvc_application/view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../theme.dart' show mainTheme;

class JobsApp extends AppStatefulWidget {
  JobsApp({Key key, this.rootKey}) : super(key: key);
  final Key rootKey;
  @override
  AppState createView() => Jobs(key: rootKey);
}

Future<String> getTokenData() => UserPreferences().getToken();

class Jobs extends AppState {
  Jobs({Key key})
      : super(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', 'CA'),
              const Locale('es', 'ES'),
              const Locale('fr', 'CA'),
            ],
            theme: mainTheme(),
            key: key,
            con: Controller(),
            title: 'login',
            routes: {
              '/authCode': (BuildContext context) => const AuthCode(),
              '/loginPhoneNumber': (BuildContext context) =>
                  const LoginPhoneNumber(),
              '/register': (BuildContext context) => const Register(),
              '/passwordVerification': (BuildContext context) =>
                  const PasswordVerification(),
              '/home': (BuildContext context) => const Home(),
            },
            debugShowCheckedModeBanner: false,
            home: FutureBuilder(
                future: getTokenData(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else if (snapshot.data == null)
                        return FirstLog();
                      else
                        return Home();
                  }
                }));
}
