import 'package:shared_preferences/shared_preferences.dart';


abstract class TokenLocalDataSource{
  Future<String> getCachedToken({required String key});
  Future<void> cacheToken({required String token,required
  String key});
}
class TokenLocalDataSourceImpl implements TokenLocalDataSource{
  final SharedPreferences sharedPreferences;
  TokenLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getCachedToken({required String key}) async {
    final cachedToken= sharedPreferences.getString(key);
    if(cachedToken != null){
      return cachedToken;
    }
    else{
      return '';
    }


  }

  @override
  Future<void> cacheToken({required String token,required
  String key}) {
    final cacheSharedpref = sharedPreferences.setString(key, token);
    return cacheSharedpref;
  }
}