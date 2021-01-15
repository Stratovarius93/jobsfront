import 'package:jobs_front/login/view.dart';
import 'package:jobs_front/login/controller.dart';
import 'package:jobs_front/login/view/authCode.dart';
import 'package:mvc_application/controller.dart';
import 'package:mvc_application/view.dart';

class JobsApp extends AppStatefulWidget {
  JobsApp({Key key, this.rootKey}) : super(key: key);
  final Key rootKey;
  @override
  AppState createView() => Jobs(key: rootKey);
}

class Jobs extends AppState {
  Jobs({Key key})
      : super(
            theme: ThemeData(
              primaryColor: Colors.blue,
              accentColor: Colors.green,
              textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple)),
            ),
            key: key,
            con: Controller(),
            title: 'login',
            routes: {
              '/add': (BuildContext context) => const FirstLog(),
              '/authCode': (BuildContext context) => const AuthCode()
            },
            debugShowCheckedModeBanner: false,
            home: const FirstLog());
}
