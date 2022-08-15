import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import '../shared/cupit/cubit.dart';
import '../shared/cupit/states.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit , NewsStates>(
      listener:(context , state){},
      builder:(context, state){
        var list = NewsCubit.get(context).business;
        return articleBuilder (list);
      },
    );

  }
}
