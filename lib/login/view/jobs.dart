import 'package:jobs_front/login/view.dart';
import 'package:jobs_front/login/controller.dart';
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
            key: key,
            con: Controller(),
            title: 'login',
            routes: {'/add': (BuildContext context) => const FirstLog()},
            debugShowCheckedModeBanner: false,
            home: const FirstLog());
}
