import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/Cubit/states.dart';
import 'package:news_app/shared/cubit/appCubit.dart';
import 'package:news_app/shared/cubit/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'Network/local/cache_helper.dart';
import 'Network/remote/dio_helper.dart';
import 'layout/home.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  dynamic isDark=CacheHelper.getData(key: 'mode') ;
  print(isDark);


  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {

  final dynamic isDark;

  MyApp(this.isDark);

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MultiBlocProvider(
        providers: [
          BlocProvider(create:(context)=>Newscubit()..getBusiness()..getSports()..getScience()),
          BlocProvider(create: (context)=>Appcubit()..changeMode(isDark: isDark)),
        ],
        child: BlocConsumer<Appcubit,AppState>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(

                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    iconTheme: IconThemeData(
                        color: Colors.black
                    ),
                    backgroundColor: Colors.white10,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white10,
                        statusBarBrightness: Brightness.dark
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation:20,
                    backgroundColor: Colors.white


                ),

                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),


              ),
              darkTheme: ThemeData(

                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    iconTheme: IconThemeData(
                        color: Colors.white
                    ),
                    backgroundColor: HexColor('333739'),
                    toolbarTextStyle:TextStyle(
                        color: Colors.white
                    ) ,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white10,
                        statusBarBrightness: Brightness.dark
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation:20,
                    backgroundColor: HexColor('333739')


                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                ),

                scaffoldBackgroundColor:HexColor('333739'),
              ),
              themeMode: Appcubit.get(context).mode ? ThemeMode.dark :ThemeMode.light,

              home:NewsLayout() ,
            );
          },
        )
    );
  }
}


