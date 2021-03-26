import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Esqueci extends StatefulWidget {
  @override
  _EsqueciState createState() => _EsqueciState();
}

class _EsqueciState extends State<Esqueci> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: 'https://b2cor.agencialink.com.br/login/esqueceu.php',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          );
        }
      ),
      bottomNavigationBar: 
      BottomNavigationBar(
        backgroundColor: Color.fromRGBO(42, 69, 124, 1),
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: IconButton( 
              icon: Icon(Icons.arrow_back, color: Colors.white,), 
              onPressed: (){Navigator.pop(context);}
            ) 
          ),
          BottomNavigationBarItem(
            label: '',
            icon: IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white,), 
              onPressed: (){exit(0);},
            ) 
          ),
        ],
      ),
    );
  }
}