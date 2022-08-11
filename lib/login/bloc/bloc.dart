import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:marvel/login/bloc/state.dart';
import 'package:marvel/login/bloc/event.dart';



class LoginBloc extends Bloc<EventLogin, StateLogin>{
  LoginBloc(StateLogin initialState) : super(initialState);

  @override
  StateLogin get initialState => StateInitLogin();
  @override
  Stream<StateLogin> mapEventToState(EventLogin event) async*{
    if(event is EventLoginPress){
        yield* _statusLogin(event);
    }else{
      if(event is EventLogoutPress){
        yield* _statusLogo(actividad: event.actividad);
      }
    }
  }

  Stream<StateLogin> _statusLogin(event) async*{
    Map<String, String> aux = event.credentials;
    Map<String, String> aux2 = {
      'user':"daniel",
      'password':"12345"
    };
    if(aux['user']==aux2['user']){
      if(aux['password']==aux2['password']){
        print("--------Entro---------");
        yield StateInLogin(credentials: aux);
      }
    }
    else{
      print("--------No   Entro---------");
      yield StateErrorLogin(error: "Credenciales incorrectas");
    }
  }
  Stream<StateLogin> _statusLogo({@required actividad}){
    if(actividad == true){

    }
  }
}