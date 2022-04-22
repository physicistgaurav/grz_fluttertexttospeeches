// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("About us"),
          centerTitle: true,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.grey[100],
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  // ignore: deprecated_member_use
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image(
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height / 2.7,
                      fit: BoxFit.cover,
                      image: AssetImage("assets/profbg.jpg"),
                      height: 250,
                    ),
                    Positioned(
                      bottom: -60,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          "assets/prof.jpg",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  title: Center(child: Text("The Matrix")),
                  subtitle: Center(child: Text("Design crew")),
                ),
                ListTile(
                  title: Text(
                    'About the app',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  subtitle: Text(
                    "This is a speech to text app. When you click on the mic icon and speak, with the help of microphone sensor your voice is sesnsed and it is recognized and changed into words. Here in this application, further from just converting from voice to word, we have used some functionalities \n 1. 'Mail' will open the mail \n 2. 'Open' will open the url launcher \n 3. 'Embedded' will open our Satyandra Sir info page",
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
