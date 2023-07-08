import 'package:algo_test/screens/home_screen/bloc/home_bloc.dart';
import 'package:algo_test/utils/widget_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _homeBloc,
      builder: (context, state) {
        return BlocListener(
          bloc: _homeBloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          child: Scaffold(
            appBar: AppBar(),
            body: Container(
              color: Colors.white,
              child: ListView.builder(
                scrollDirection:
                Axis.vertical,
                itemCount: _homeBloc.homeModel.data.length,
                padding:
                EdgeInsets.zero,
                itemBuilder:
                    (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: ScreenUtil().setHeight(100),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Image.network(
                            _homeBloc.homeModel.data[i].avatar.toString()),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widgetText('email : ${_homeBloc.homeModel.data[i].email}'),
                            widgetText('first name : ${_homeBloc.homeModel.data[i].firstName}'),
                            widgetText('last name : ${_homeBloc.homeModel.data[i].lastName}'),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
