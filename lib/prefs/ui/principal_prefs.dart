import 'package:flutter/material.dart';

class PrincipalPrefs extends StatefulWidget {
  const PrincipalPrefs({Key key}) : super(key: key);

  @override
  State<PrincipalPrefs> createState() => _PrincipalPrefsState();
}

class _PrincipalPrefsState extends State<PrincipalPrefs> {
  @override
  Widget build(BuildContext context) {
    return _bodyPrincipalPrefs(context: context);
  }


  Widget _bodyPrincipalPrefs({BuildContext context}){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Esta es la pagina de prefs", style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}


