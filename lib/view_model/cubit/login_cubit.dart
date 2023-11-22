import 'dart:developer';

import 'package:bird_task/core/constants/app_constants.dart';
import 'package:bird_task/model/login_model.dart';
import 'package:bird_task/view_model/datasources/local/local_datasource.dart';
import 'package:bird_task/view_model/datasources/remote/remote_datasource.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/shared/components.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TokenLocalDataSource tokenLocalDataSource;

  LoginCubit({required this.tokenLocalDataSource}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<String> getToken() async {
    final String token = await tokenLocalDataSource.getCachedToken(key: AppConstants.myToken);
    if (kDebugMode) {
      print(token);
    }
    return token;
  }


  Future<void> Login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await DioHelper.postData(url: AppConstants.url, data: {
      "email": email,
      "password": password,
    }).then((value) {
      log('email success');
      final data = LoginModel.fromJson(value.data);
      final myToken = data.accessToken;
      if (kDebugMode) {
        print('Success login : ${myToken}');
      }
      tokenLocalDataSource.cacheToken( token:myToken, key: AppConstants.myToken);
      emit(LoginSuccessState(loginModel: data));
    }).catchError((error) {
      emit(LoginErrorState(message: error.toString()));
    });
  }
}
