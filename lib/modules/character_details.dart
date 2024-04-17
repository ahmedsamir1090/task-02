import 'package:HarryPotter/layout/cubit/cubit.dart';
import 'package:HarryPotter/layout/cubit/states.dart';
import 'package:HarryPotter/models/characters.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CharacterDetails extends StatelessWidget {
  CharactersModel charactersModel;

  CharacterDetails(this.charactersModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BbCubit(),
      child: BlocConsumer<BbCubit, BbStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(69, 30, 62, 1),
            appBar: AppBar(
              centerTitle: true,
              title: Text(charactersModel.name ?? '',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: "Lora")),
              backgroundColor: Colors.amberAccent,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                      imageUrl: charactersModel.image ?? '',
                      height: 50.h,
                      width: double.infinity,
                      fit: BoxFit.fill),
                  SizedBox(
                    height: .5.h,
                  ),
                  Center(
                    child: Text(
                      charactersModel.name ?? '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: "RobotoMono"),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.all(5),
                          child: Text("the actor who played the character :",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 7.sp,
                                  fontFamily: "RobotoMono")),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.all(5),
                          child: Text(charactersModel.actor ?? '',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 9.sp,
                                  fontFamily: "RobotoMono")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.all(5),
                          child: Text("Alternate names :",
                              style: TextStyle(
                                  fontSize: 7.sp,
                                  color: Colors.green,
                                  fontFamily: "Lora")),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => Text(
                                charactersModel.alternateNames?[index] ?? '',
                                style: TextStyle(
                                    fontSize: 13.sp, color: Colors.blueGrey)),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 2.h),
                            itemCount:
                                charactersModel.alternateNames?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Species: ${charactersModel.species}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Gender: ${charactersModel.gender ?? ''}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "House: ${charactersModel.house ?? ''}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Date of Birth: ${charactersModel.dateOfBirth ?? ''}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Year of Birth: ${charactersModel.yearOfBirth ?? ''}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Wizard: ${charactersModel.wizard == true ? "Yes" : "No"}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Ancestry: ${charactersModel.ancestry}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Eye Colour: ${charactersModel.eyeColour ?? ''}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Hair Colour: ${charactersModel.hairColour ?? ''}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Wand: ${charactersModel.wand?.wood ?? ''} ${charactersModel.wand?.core ?? ''} ${charactersModel.wand?.length.toString() ?? ''} inches",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Patronus: ${charactersModel.patronus}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Hogwarts Student: ${charactersModel.hogwartsStudent == true ? "Yes" : "No"}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Hogwarts Staff: ${charactersModel.hogwartsStaff == true ? "Yes" : "No"}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Actor: ${charactersModel.actor}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(5),
                    child: Text(
                      "Alive: ${charactersModel.alive == true ? "Yes" : "No"}",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.green,
                        fontFamily: "Lora",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
