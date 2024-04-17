import 'package:HarryPotter/layout/cubit/states.dart';
import 'package:HarryPotter/models/characters.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/endpoints.dart';
import '../../network/remote/dio_helper.dart';

class BbCubit extends Cubit<BbStates> {
  BbCubit() : super(BbInitiState());
  static BbCubit get(context) => BlocProvider.of(context);
  List<CharactersModel> characters = [];

  void getCharactersData() {
    emit(BbCharLoadingState());
    DioHelper.getData(url: Characters).then((value) {
      List<dynamic> data = value.data;

      characters = data.map((item) => CharactersModel.fromJson(item)).toList();
      emit(BbCharSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
      emit(BbCharErrorState());
    });
  }
}
