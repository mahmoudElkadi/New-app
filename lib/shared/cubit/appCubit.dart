import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/Cubit/states.dart';

import '../../Network/local/cache_helper.dart';

class Appcubit extends Cubit<AppState> {
  Appcubit() :super(AppInitState());

  static Appcubit get(context) => BlocProvider.of(context);

  ThemeMode appDark =ThemeMode.dark;

  bool mode=false;

  void changeMode({bool ?isDark}){

    if(isDark != null){
      mode=isDark;
      emit(AppModeState());

    }if(isDark == null){
      print ('ssssss');
      mode=!mode;
      CacheHelper.putData(key: 'mode', value: mode).then((value){
        emit(AppModeState());
      });
    }
  }
}