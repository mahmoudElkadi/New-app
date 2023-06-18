import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/Cubit/states.dart';
import '../../shared/component/component.dart';
import '../../shared/cubit/cubit.dart';


class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<Newscubit,NewsState>(
      listener: (context,state){},
      builder: (context,state){
        var list=Newscubit.get(context).search;
        return
          Scaffold(
            appBar: AppBar(
              title: Text(
                  'News App'
              ),
            ),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFormField(controller: searchController, type: TextInputType.text, label: 'Search', prefixIcon: Icons.search, kind: 'Search',
                      onChange: (value)async {
                        print(value);
                        await Newscubit.get(context).searchText(value);
                        print(list);
                      }),
                ),
                Expanded(child: articlerBuilder(list,isSearch: true))
              ],
            ) ,
          );

      },
    );
  }
}
