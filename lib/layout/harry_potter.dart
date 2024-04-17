import 'package:HarryPotter/layout/cubit/cubit.dart';
import 'package:HarryPotter/layout/cubit/states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../models/movie.dart';
import '../modules/character.dart';

class BbScreen extends StatelessWidget {
  static const String id = 'mainPage';

  const BbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BbCubit, BbStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("Harry Potter",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontFamily: 'Lora')),
                backgroundColor: Colors.lime,
                centerTitle: true),
            backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      height: 500,
                      width: 300,
                      child: mainScreenBuild(
                          MainScreen(
                            title: "Characters",
                            poster:
                                "https://i.pinimg.com/564x/b4/8b/85/b48b85f199425dcecf33d2d1ff41b851.jpg",
                            route: CharactersScreen.id,
                          ),
                          context)),
                )
              ],
            ),
          );
        });
  }

  Widget mainScreenBuild(MainScreen mainScreen, context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, mainScreen.route);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(3.h),
            topEnd: Radius.circular(3.h),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: mainScreen.poster,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
            placeholder: (context, url) => const Center(
                child: SpinKitWave(
              color: Colors.lime,
              itemCount: 5,
              size: 90,
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(.7),
              height: 4.h,
              width: double.infinity,
              child: Center(
                child: Text(
                  mainScreen.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontFamily: "RobotoMono"),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
