import 'package:flutter/material.dart';
import 'package:push_notification_app/src/providers/push_notification_provider.dart';

import 'src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

@override
_MyAppState createState()=>_MyAppState();
  
}


class _MyAppState extends State<MyApp>{
  
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final pushProvider= new PushNotificationProvider();
    pushProvider.initNotification();
    pushProvider.streamMessage.listen((data) {
      print('Argument from main: $data');   
      navigatorKey.currentState.pushNamed('home', arguments: data);
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push notification',
      navigatorKey: navigatorKey,
      initialRoute: 'home',
      //home: HomePage()
      routes: {
        'home': (BuildContext c) => HomePage(),
      },
    ); 
  }

}
