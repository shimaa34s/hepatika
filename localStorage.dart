import 'package:get_storage/get_storage.dart';

class LocalStorage{
  //first i will save langState
  void saveLangData(String Language)async{
    await GetStorage().write("language",Language);
  }
//then i will read saved data

Future<String>get languageSelected async{
  return  await GetStorage().read("language");
}
}