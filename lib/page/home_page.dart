// ignore_for_file: prefer_const_constructors

import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:grz_fluttertexttospeech/main.dart';
import 'package:grz_fluttertexttospeech/page/profile.dart';
import 'package:grz_fluttertexttospeech/utils.dart';

import 'package:grz_fluttertexttospeech/api/speech_api.dart';
import 'package:grz_fluttertexttospeech/widget/substring_highlight.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = 'Press the button and speak';
  bool isListening = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.content_copy),
                onPressed: () async {
                  await FlutterClipboard.copy(text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('✓  Copied to Clipboard')),
                  );
                },
              ),
            ),
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30).copyWith(bottom: 150),
          child: SubstringHighlight(
            text: text,
            terms: Command.all,
            textStyle: TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            textStyleHighlight: TextStyle(
              fontSize: 32.0,
              color: Colors.red,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          endRadius: 75,
          glowColor: Theme.of(context).primaryColor,
          child: FloatingActionButton(
            child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
            tooltip: 'sunxa yasle',
            onPressed: toggleRecording,
          ),
        ),
      );

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);

          if (!isListening) {
            Future.delayed(Duration(seconds: 1), () {
              Utils.scanText(text);
            });
          }
        },
      );
}
