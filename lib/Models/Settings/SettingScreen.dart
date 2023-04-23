// ignore_for_file: file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/NewsCubit/States.dart';
import 'package:newsapp/Layout/NewsCubit/cubit.dart';
import 'package:newsapp/Shared/compenents/compenents.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! GetBusinessLoadingState,
            builder: (context) {
              var list = NewsCubit.get(context).business;
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var list = NewsCubit.get(context).business;
                  return newsItem(list[index],context);
                },
                separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsetsDirectional.symmetric(
                      vertical: 8, horizontal: 12),
                  child: const Divider(
                    color: Colors.grey,
                  ),
                ),
                itemCount: list.length,
              );
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        });
  }
}
