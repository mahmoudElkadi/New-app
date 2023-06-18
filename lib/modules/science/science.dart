import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/Cubit/states.dart';
import '../../shared/component/component.dart';
import '../../shared/cubit/cubit.dart';

class ScienceScreen  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,NewsState>(
        listener: (context,NewsState state){},
        builder: (BuildContext context,NewsState state){
          var list=Newscubit.get(context).science;

          return articlerBuilder(list);

        }


    );

  }
}
