import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xodimlarapp/main.dart';

import '../home/all_mind_page.dart';

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
            ElevatedButton(
                onPressed: () async {
                  box.write("ism", ism.text);
                  token = (await FirebaseMessaging.instance.getToken())!;
                  final db = FirebaseFirestore.instance;
                  await db
                      .collection('user')
                      .doc(ism.text)
                      .set({"ismi": "${ism.text}", "token": "$token"});

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => AllMindsPage()),
                      (Route<dynamic> route) => false);
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
