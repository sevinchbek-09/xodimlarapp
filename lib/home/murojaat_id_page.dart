import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';
class MurojaatPage extends StatefulWidget {
  String matn;
  String bino;
  String xona;
  String bulim;
  String tel;
  bool status;
  MurojaatPage(
      {required this.matn,
      required this.bino,
      required this.xona,
      required this.bulim,
      required this.tel,
      required this.status});

  @override
  State<MurojaatPage> createState() => _State();
}

class _State extends State<MurojaatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Murojaat haqida'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Murojaat matni: ${widget.matn}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 7,),
              Text(
                'Bo`lim: ${widget.bulim}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 7,),
              Text(
                'Bino: ${widget.bino}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 7,),
              Text(
                'Xona: ${widget.xona}',
                style: TextStyle(fontSize: 20),
              ),

              Row(
                children: [
                  Text('Telefon raqam',style: TextStyle(fontSize: 20),),
                  TextButton(
                      child: Text(
                        widget.tel,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {

                        final url=Uri(scheme: 'tel',path: '+998${widget.tel}');
                        if (await canLaunchUrl(url)){
                          launcher.launchUrl(url);
                        }



                      }),
                ],
              ),
              SizedBox(height: 7,),

            ]),
      ),
    );
  }
}
