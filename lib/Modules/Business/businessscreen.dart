import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/NewsCubit/States.dart';
import 'package:newsapp/Layout/NewsCubit/cubit.dart';
import 'package:newsapp/Shared/compenents/compenents.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          return Newsbuilder(list);
        });
  }
}
