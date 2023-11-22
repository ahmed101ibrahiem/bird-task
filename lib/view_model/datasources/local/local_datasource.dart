import 'package:shared_preferences/shared_preferences.dart';


abstract class TokenLocalDataSource{
  Future<String> getCachedToken();
  Future<void> cacheToken(String token);
}
class TokenLocalDataSourceImpl implements TokenLocalDataSource{
  final SharedPreferences sharedPreferences;
  TokenLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getCachedToken() async {
    final cachedToken= sharedPreferences.getString('token');
    if(cachedToken != null){
      return cachedToken;
    }
    else{
      return '';
    }


  }

  @override
  Future<void> cacheToken(String token) {
    final cacheSharedpref = sharedPreferences.setString('token',
        token);
    return cacheSharedpref;
  }
}