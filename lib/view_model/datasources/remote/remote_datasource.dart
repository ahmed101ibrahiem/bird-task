

import 'package:bird_task/core/constants/app_constants.dart';
import 'package:bird_task/model/login_model.dart';

import '../../../core/services/network_service.dart';

abstract class RemoteDataSource {
  Future<LoginModel> login({required String email,required String password});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkService networkService;
  RemoteDataSourceImpl(this.networkService);
  @override
  Future<LoginModel> login({required String email,required String password}) async{
    final response = await networkService.postData(url:AppConstants.url,data: {
      "email": email,
      "password": password
    });

    final LoginModel result = response.data;
    print(result.accessToken.toString());
    return result;
  }
}