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
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pushProvider= new PushNotificationProvider();
    pushProvider.initNotification();

    pushProvider.streamMessage.listen((argument) {
      print('Argument from main: $argument');
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push notification',
      initialRoute: 'home',
      //home: HomePage()
      routes: {
        'home': (BuildContext c) => HomePage(),        
      },
    ); 
  }

}
