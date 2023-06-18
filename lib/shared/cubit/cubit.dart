import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/Cubit/states.dart';
import '../../Network/remote/dio_helper.dart';
import '../../modules/business/business.dart';
import '../../modules/science/science.dart';
import '../../modules/sports/sports.dart';


class Newscubit extends Cubit<NewsState> {
  Newscubit() :super(NewsInitState());

  static Newscubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];
  var i = 0;

  void changeIndex(int index) {
    i = index;

    if (index == 2) {
      getScience();
    }
    if (index == 1) {
      getSports();
    }


    emit(NewsBottomNav());
  }

  List <dynamic> business = [];

  void getBusiness() {
    emit(GetBusinessloadingState());
    if (business.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'business',
            'apiKey': 'f724bea7c1a04f97b9f20dd2b5760b09'
          }).then((value) {
        //print(value.data['articles'][0]['title'].toString());
        business = value.data['articles'];
        emit(GetBusinessSuccessState());
      }).catchError((error) {
        emit(GetBusinessErrorState());
      });
    } else {
      emit(GetBusinessSuccessState());
    }
  }

  List <dynamic> sports = [];

  void getSports() {
    emit(GetSportsloadingState());
    if (sports.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sport',
            'apiKey': 'f724bea7c1a04f97b9f20dd2b5760b09'
          }).then((value) {
        //print(value.data['articles'][0]['title'].toString());
        sports = value.data['articles'];
        emit(GetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetSportsErrorState());
      });
    } else {
      emit(GetSportsSuccessState());
    }
  }

  List <dynamic> science = [];

  void getScience() {
    emit(GetScienceloadingState());
    if (science.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'science',
            'apiKey': 'f724bea7c1a04f97b9f20dd2b5760b09'
          }).then((value) {
        //print(value.data['articles'][0]['title'].toString());
        science = value.data['articles'];
        emit(GetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetScienceErrorState());
      });
    } else {
      emit(GetScienceSuccessState());
    }
  }


  List <dynamic> search = [];

  Future<dynamic> searchText(String value) async{

    emit(GetSearchloadingState());

    //https://newsapi.org/v2/everything?q=apple&apiKey=9e1325cf33214ebdb256e2f019e2d447
    await DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': 'f724bea7c1a04f97b9f20dd2b5760b09'
        }).then((value) {
      search = value.data['articles'];
      emit(GetSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchErrorState());
    });
  }

}

