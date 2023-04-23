import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/NewsCubit/States.dart';
import 'package:newsapp/Layout/NewsCubit/cubit.dart';
import 'package:newsapp/Modules/Settings/SettingScreen.dart';
import 'package:newsapp/Shared/compenents/compenents.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController();
    
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFromFiled(
                    control: textEditingController,
                    lable: 'Search',
                    prefix: const Icon(Icons.search_outlined),
                    valid: (value) {
                      if (value?.isEmpty == true) {
                        return "This can't be empty";
                      }
                      return null;
                    },
                    change: (value) {
                      
                      NewsCubit.get(context).getSearch(value.toString());
                      

                      return null;
                    },
                  ),
                ),
                Expanded(child: Newsbuilder(list))
              ],
            ),
          );
        });
  }
}
