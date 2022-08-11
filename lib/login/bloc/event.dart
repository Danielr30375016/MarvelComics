import 'package:flutter/material.dart';

abstract class EventLogin{}

class EventLoginPress extends EventLogin{
  Map<String, String> credentials;
  EventLoginPress({@required this.credentials});
}

class EventLogoutPress extends EventLogin{
  bool actividad;
  EventLogoutPress({@required this.actividad});
}