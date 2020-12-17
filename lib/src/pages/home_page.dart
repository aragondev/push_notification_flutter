import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {  

  const HomePage({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final dataPushNotification = ModalRoute.of(context).settings.arguments??'Home Page';  
    return Scaffold(
      appBar: AppBar(
        title: Text('Push notification'), 
        centerTitle: true,       
      ),
      body: Center(
        child: Text(dataPushNotification),
      ),
    );
  }
}