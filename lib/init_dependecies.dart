
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final serviceLoacator = GetIt.instance;

Future<void> initDependencies() async {
  final firebaseInit = await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "IzaSyBEu_OPJjO1SuRmd0RYpFZlr1muwe0D8uI",
        appId: "1:1001659969527:android:dcfb2553b800e6d70888f2",
        messagingSenderId: "1001659969527",
        projectId: "todoapp-25cfc"),
  );

  serviceLoacator.registerLazySingleton(() => firebaseInit);

}