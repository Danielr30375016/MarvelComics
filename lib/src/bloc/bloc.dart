import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:marvel/src/bloc/event.dart';
import 'package:marvel/src/bloc/state.dart';


class ListComicsBloc extends Bloc<EventComics, StateComics>{
  ListComicsBloc(StateComics initialState) : super(initialState);

  @override
  StateComics get initialState => StateInit();

  @override
  Stream<StateComics> mapEventToState(EventComics event) async*{
    if(event is EventSearch){
      yield* _listOfComics(event: event);
    }
  }

  @override
  Stream<StateComics> _listOfComics({@required event}) async*{
    String aux = event.listDatos;
    List aux2=[];
    if(aux.isNotEmpty){
      aux2.add(aux);
      yield StateList(listDatos: aux2);
    }else{
      yield StateWrong(error: "Error en el envio");
    }
  }
}