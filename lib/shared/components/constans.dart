//

//base url:https://newsapi.org/
//method(url):v2/top-headlines?
//queries:country=eg&apiKey=87fffd0a3b67430b870a569522d54022

import 'package:dawaey/shared/network/local/cache_helper.dart';

String? token;
bool boardingShown = false;
bool? tokenStatus;
String? userImage;
String? userPassword;

Future<String> getUserToken() async {
  return await CacheHelper.getData(key: token);
}

// void signOut(context){
//   CacheHelper.removeData(key:'token').then((value){
//     if(value){
//       navigateAndFinish(context,LoginScreen(),);
//     }
//   });
// }
void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
