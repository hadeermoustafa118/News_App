import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cupit/AppCubit/appCubit.dart';
import '../shared/cupit/cubit.dart';
import '../shared/cupit/states.dart';



//GET https://newsapi.org/v2/top-headlines?country=us&apiKey=6a0fa64388a24ae8b326f922d962affd
class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'News App',
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon:const  Icon(Icons.brightness_4_outlined),
                    onPressed: () {
                      AppCubit.get(context).changeModeApp();
                    },
                  ),
                  IconButton(
                    icon:const  Icon(Icons.search),
                    onPressed: () {},
                  ),

                ],
              ),

              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNarBar(index);
                },
                items: cubit.bottomItems,
              ),
            );
          });
  }
}
