import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DocumentationMenuComics extends StatefulWidget {
  const DocumentationMenuComics({Key key}) : super(key: key);

  @override
  State<DocumentationMenuComics> createState() => _DocumentationMenuComicsState();
}

class _DocumentationMenuComicsState extends State<DocumentationMenuComics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          _sendURL();
        },
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        color: const Color.fromRGBO(222, 41, 8, 1.0),
        child: const Text(
          "Go to the Documentation",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  _sendURL(){
    setState((){
      launch("https://developer.marvel.com/");
    });
  }
}

