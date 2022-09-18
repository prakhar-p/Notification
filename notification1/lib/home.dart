import 'package:flutter/material.dart';
import 'package:notification1/second_screen.dart';
import 'ThirdScreen.dart';
import 'notification_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final LocalNotificationService service;
  void initState(){
    service=LocalNotificationService();
    service.intialize();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Channel A"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 300.0,
              color: Colors.redAccent,
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),

                onPressed: () async {
                  listenToNotification();
                  await service.showNotificationWithPayload(
                      id: 0,
                      title: 'Channel A',
                      body: 'Subscribe Channel A',
                      payload: 'You are Successfuly Subscribed to channel A');
                },
                child: Text(
                  "Notification A",
                  style: TextStyle(
                      fontSize: 15.0),
                )),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),

                onPressed: () async {
                  listenToNotification1();
                  await service.showNotificationWithPayload(
                      id: 1,
                      title: 'Channel B',
                      body: 'Subscribe Both Channel A and B',
                      payload: 'you are Successfuly subscribe to Channel A and B');
                },
                child: Text(
                  "Notification B",
                  style: TextStyle(
                      fontSize: 15.0),
                )),
            // TextButton(
            //   onPressed: () {},
            //   child: Text("Notification"),
            //   style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
            // ),
          ],
        ),
      ),
    );
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNoticationListener);

  void onNoticationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => SecondScreen(payload: payload))));
    }
  }
  void listenToNotification1() =>
      service.onNotificationClick.stream.listen(onNoticationListener1);

  void onNoticationListener1(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => ThirdScreen(payload: payload))));
    }
  }
}

