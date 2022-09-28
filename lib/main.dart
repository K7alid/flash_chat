import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/cache_helper.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/register_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

String? uId;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  String route;
  uId = CacheHelper.getData(key: 'uId');
  if (uId != null) {
    route = ChatScreen.id;
  } else {
    route = WelcomeScreen.id;
  }
  runApp(FlashChat(
    route: route,
  ));
}

class FlashChat extends StatelessWidget {
  final String route;

  const FlashChat({required this.route});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: route,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
