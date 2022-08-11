import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marvel/login/bloc/bloc.dart';
import 'package:marvel/login/bloc/event.dart';
import 'package:marvel/login/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/src/bloc/bloc.dart';
import 'package:marvel/src/bloc/state.dart';
import 'login/ui/principal_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba_marvel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
              lazy: false,
              create: (BuildContext context) => LoginBloc(StateInitLogin())),
          BlocProvider<ListComicsBloc>(
              lazy: false,
              create: (BuildContext context) => ListComicsBloc(StateInit())),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user;
  TextEditingController password;
  String userData = '';
  String passwordData = '';

  @override
  void initState(){
    super.initState();
    user = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _width2 = double.infinity;
    bool isPasswordVisible = true;
    Icon vision = const Icon(Icons.visibility, color: Colors.white);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      body: _bodyMain(width: _width, height: _height, vision: vision),
    );
  }

  Widget _bodyMain({width, height, vision}) {
    double _width = width;
    double _height = height;
    return BlocListener<LoginBloc, StateLogin>(
        listener: (context, state){
          if (state is StateErrorLogin) {
            _showAlert(context: context, error: state.error);

          }
        },
    child: BlocBuilder<LoginBloc, StateLogin>(builder: (context, state) {
      if (state is StateInLogin) {
        user.text = "";
        password.text = '';
        setState(() {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) => PrincipalLogin()));
        });
      }else{
          if(state is StateInitLogin){
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/1200px-Marvel_Logo.svg.png",
                      width: _width),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: _height / 15),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                        hintText: "User", hintStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(
                        color: Colors.white, decoration: TextDecoration.none),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: vision,
                          onPressed: () => setState(() {
                            vision == Icon(Icons.visibility, color: Colors.white)
                                ? vision =
                                Icon(Icons.visibility_off, color: Colors.white)
                                : vision =
                                Icon(Icons.visibility, color: Colors.white);
                          }),
                        )),
                    style: const TextStyle(
                        color: Colors.white, decoration: TextDecoration.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: _height / 10),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      _sendDataLogin();
                      //_sendData();
                    },
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: const Color.fromRGBO(217, 191, 31, 1.0),
                    child: const Text(
                      "Ingresar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      }
      return CircularProgressIndicator();
    }
    ),
    );
  }

  _sendDataLogin() {
    if ((user.text.isNotEmpty) & (password.text.isNotEmpty)) {
      userData = user.text;
      passwordData = password.text;
      Map<String, String> credentials = {
        "user": userData,
        "password": passwordData
      };
      setState(() {
        BlocProvider.of<LoginBloc>(context)
            .add(EventLoginPress(credentials: credentials));
      });
    }
  }

  _showAlert({BuildContext context, String error}) {
    user.text = "";
    password.text = '';
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(error, style: TextStyle(color: Colors.red),)));
  }
}
