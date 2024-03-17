import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController ism = TextEditingController();
  String token = '';
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kirish'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: ism,
              decoration: InputDecoration(
                label: Text('Ismingiz'),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(onPressed: (){
              print(token);
              print(ism.text);
            }, child: Text("GET KOTEn")),
            ElevatedButton(
                onPressed: () async {
                  token = (await FirebaseMessaging.instance.getToken())!;

                  print(token);

                },
                child: Text('Kirish')),
            SizedBox(
              height: 10,
            ),
            Text(token!)
          ],
        ),
      ),
    );
  }
}
