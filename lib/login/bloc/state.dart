import 'package:flutter/material.dart';


abstract class StateLogin{}

class StateInitLogin extends StateLogin{}

class StateInLogin extends StateLogin{
  Map<String, String> credentials;
  StateInLogin({@required this.credentials});
}

class StateErrorLogin extends StateLogin{
  String error;
  StateErrorLogin({@required this.error});
}