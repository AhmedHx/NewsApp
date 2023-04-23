import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/NewsCubit/States.dart';
import 'package:newsapp/Layout/NewsCubit/cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cuubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cuubit.changeTheme();
                },
                icon: cuubit.isDark? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
              ),
            ],
          ),
          body: cuubit.screens[cuubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cuubit.currentindex,
            items: cuubit.bottomitems,
            onTap: (value) {
              cuubit.changeBottomBar(value);
            },
          ),
        );
      },
    );
  }
}
