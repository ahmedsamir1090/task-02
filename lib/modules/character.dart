import 'package:HarryPotter/layout/cubit/cubit.dart';
import 'package:HarryPotter/layout/cubit/states.dart';
import 'package:HarryPotter/models/characters.dart';
import 'package:HarryPotter/modules/character_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class CharactersScreen extends StatelessWidget {
  static const String id = 'characterPage';

  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BbCubit()..getCharactersData(),
      child: BlocConsumer<BbCubit, BbStates>(
          listener: (context, state) {},
          builder: (context, state) {
            // var list = BbCubit.get(context).characters;
            return Scaffold(
              appBar: AppBar(
                  title: Text("Characters",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontFamily: "Lora")),
                  backgroundColor: Colors.lime,
                  centerTitle: true),
              backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
              body: ConditionalBuilder(
                builder: (context) => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 2.5.h, bottom: 2.5.h, left: 1.0.h, right: 1.0.h),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9.w / 8.8.h,
                          mainAxisSpacing: 2.h,
                          crossAxisSpacing: 4.w),

                      itemBuilder: (context, index) =>
                          characterBuild(context, index),
                      // itemCount: list.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: BbCubit.get(context).characters.length,
                    ),
                  ),
                ),
                condition: state is BbCharSuccessState,
                fallback: (context) => const Center(
                    child: SpinKitDoubleBounce(color: Colors.lime)),
              ),
            );
          }),
    );
  }

  Widget characterBuild(context, index) {
    CharactersModel character = BbCubit.get(context).characters[index];

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterDetails(character),
            ));
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsetsDirectional.only(start: 1.h, end: 1.h),
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: character.image ?? '',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
            placeholder: (context, url) => Image.asset(
                'assets/images/loading.gif',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(.5),
              height: 12.h,
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      character.name ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Colors.white,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      character.actor ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Colors.white,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      character.house ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Colors.white,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
