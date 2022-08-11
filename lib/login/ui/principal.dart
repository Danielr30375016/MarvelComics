import 'package:flutter/material.dart';
import 'package:marvel/main.dart';
import 'botonMenu.dart';

class Principal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PrincipalMenu();
  }
}

class PrincipalMenu extends StatefulWidget {

  @override
  State<PrincipalMenu> createState() => _PrincipalMenuState();
}

class _PrincipalMenuState extends State<PrincipalMenu> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: _height / 7)),
              BotonMenu(
                  context: context,
                  width: _width / 3,
                  color: Colors.red,
                  text: "Buscar",
                  textColor: Colors.white),
              Padding(padding: EdgeInsets.symmetric(vertical: _height / 30)),
              BotonMenu(
                  context: context,
                  width: _width / 3.2,
                  color: Colors.red,
                  text: "Favoritos",
                  textColor: Colors.white),
              Padding(padding: EdgeInsets.symmetric(vertical: _height / 30)),
              BotonMenu(
                  context: context,
                  width: _width / 4,
                  color: Colors.red,
                  text: "Documentación",
                  textColor: Colors.white),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.symmetric(vertical: _height/4, horizontal: _width/1.2),
                      onPressed: () {
                        _logout();
                      },
                      icon: const Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  _logout(){
    setState(() {
      Navigator.pop(context);
    });
  }
}
