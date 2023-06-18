abstract class NewsState{}

class NewsInitState extends NewsState{}

class NewsBottomNav extends NewsState{}

class GetBusinessSuccessState extends NewsState{}
class GetBusinessErrorState extends NewsState{}
class GetBusinessloadingState extends NewsState{}

class ShopInitState extends NewsState{}
class ShopLoginLoadingState extends NewsState{}
class ShopLoginSuccessState extends NewsState{}
class ShopLoginErrorState extends NewsState{
  final String error;
  ShopLoginErrorState(this.error);
}



class GetSportsSuccessState extends NewsState{}
class GetSportsErrorState extends NewsState{}
class GetSportsloadingState extends NewsState{}



class GetScienceSuccessState extends NewsState{}
class GetScienceErrorState extends NewsState{}
class GetScienceloadingState extends NewsState{}
class GetSearchState extends NewsState{}
class GetSearchErrorState extends NewsState{}
class GetSearchloadingState extends NewsState{}


abstract class AppState{}

class AppInitState extends AppState{}
class AppModeState extends AppState{}

