// ignore_for_file: file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/NewsCubit/States.dart';
import 'package:newsapp/Layout/NewsCubit/cubit.dart';
import 'package:newsapp/Shared/compenents/compenents.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).sport;
          return ConditionalBuilder(
            condition:  list.isNotEmpty,
            builder: (context) {
              
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  
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
