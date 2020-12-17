import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationProvider {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _streamMessageController = StreamController<String>.broadcast();
  Stream<String> get streamMessage => _streamMessageController.stream;

  

  initNotification() async{

    //Permisos para recibir notificaciones
    await _firebaseMessaging.requestNotificationPermissions();
    //Obteniendo el token
    final token = await _firebaseMessaging.getToken();

    print('== FCM TOKEN ==');
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

 //Permiti recibir la notificación aún cuando la aplicación este cerrada
  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  Future<dynamic> onMessage(Map<String,dynamic> message)async{
    print('=====onMessage======');
    //print('message $message');
    final argument = message['data']['name'];
    _streamMessageController.sink.add(argument);
    //print('argument: $argument');
  }

  Future<dynamic> onLaunch(Map<String,dynamic> message)async{
    print('=====onLaunch======');
    //print('message $message');
    final argument = message['data']['name'];
    _streamMessageController.sink.add(argument);
    //print('argument: $argument');
  }

  Future<dynamic> onResume(Map<String,dynamic> message)async{
    print('=====onResume======');
    //print('message $message');
    final argument = message['data']['name'];
    _streamMessageController.sink.add(argument);
    //print('argument: $argument');
  }


  dispose(){
    _streamMessageController?.close();
  }
}
