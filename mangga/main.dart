import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mangga/model/update_address.dart';
import 'package:mangga/screens/map_screen.dart';
import 'package:mangga/screens/search_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'page_handler.dart';
import 'userdata_management/login_page.dart';
import 'userdata_management/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdateAddress(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PageHandler.id,
        // onGenerateRoute: (settings) {
        //   if (settings.name == PhoneLoginPage.id) {
        //     return MaterialPageRoute(
        //       builder: (context) {
        //         final args = settings.arguments as NameCode;
        //         return PhoneLoginPage(
        //           name: args.name,
        //           code: args.code,
        //         );
        //       },
        //     );
        //   }
        //   assert(false, 'Need to implement ${settings.name}');
        //   return null;
        // },
        // title: 'Navigation with Arguments',
        // home: const LoginPage(),

        routes: {
          PageHandler.id: (context) => PageHandler(),
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          MapScreen.id: (context) => MapScreen(),
          SearchScreen.id: (context) => SearchScreen(),
        },
      ),
    );
  }
}
