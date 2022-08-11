import 'package:flutter/material.dart';

abstract class EventComics {}

class EventSearch extends EventComics{
  final String search;
  EventSearch({@required this.search});
}

