import 'package:flutter/material.dart';

abstract class StateComics{}

class StateInit extends StateComics{}

class StateList extends StateComics{
  final List listDatos;
  StateList({@required this.listDatos});
}

class StateWrong extends StateComics{
  final String error;
  StateWrong({@required this.error});
}