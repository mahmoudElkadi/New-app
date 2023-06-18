import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/search/search.dart';
import '../shared/Cubit/states.dart';
import '../shared/component/component.dart';
import '../shared/cubit/appCubit.dart';
import '../shared/cubit/cubit.dart';


class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,NewsState>(
      listener: (BuildContext context, NewsState state) {  },
      builder: (BuildContext context, NewsState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context,SearchScreen());
              },
                  icon: Icon(Icons.search)
              ),
              IconButton(onPressed: ()
              {
                Appcubit.get(context).changeMode();


              },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: Newscubit.get(context).screens[Newscubit.get(context).i],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:Newscubit.get(context).i,
            onTap: (index){
              Newscubit.get(context).changeIndex(index);
            },

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.business_sharp),
                  label: 'Business'
              ),
              BottomNavigationBarItem(icon: Icon(Icons.sports),
                  label: 'Sports'
              ),
              BottomNavigationBarItem(icon: Icon(Icons.science),
                  label: 'Science'
              ),


            ],

          ),

        );
      },


    );
  }
}
