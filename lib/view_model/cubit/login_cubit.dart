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

  // Future<dynamic> login({  required String email,
  //   required String password,
  // }) async {
  //   emit(LoginLoadingState());
  //   await remoteDataSource.login(email: email,password:password , ).
  //   then((value) {
  //     log('email success');
  //     final mainToken = value.accessToken;
  //
  //     if (kDebugMode) {
  //       print('Success login : ${mainToken}');
  //     }
  //
  //     emit(LoginSuccessState(loginModel: value));
  //     }).catchError((error){
  //       if (error is DioException)
  //       {
  //         String message = "Something went wrong";
  //         if (error.message!.contains("SocketException")) {
  //           message = 'No internet connection';
  //         }
  //         else if (error.message!.contains("Http status error [400]")) {
  //           message = "Email or password is not correct";
  //         }
  //         else if (error.message!.contains("Http status error [403]")) {
  //           message = "This account doesn't exits";
  //         }
  //         print(error.response?.data['message']);
  //         showToast(message: error.response!.data['message'].toString());
  //       }
  //       emit(LoginErrorState(message: error.toString()));
  //       throw error;
  //
  //     });
  //
  // }

  Future<String> getToken() async {
    final String token = await tokenLocalDataSource.getCachedToken();
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
      tokenLocalDataSource.cacheToken(myToken);
      emit(LoginSuccessState(loginModel: data));
    }).catchError((error) {
      emit(LoginErrorState(message: error.toString()));
    });
  }
}
