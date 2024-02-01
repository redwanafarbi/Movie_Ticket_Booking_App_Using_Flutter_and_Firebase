import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userInfo {

  var userName;
  data (String email, String name)async{

    var prefs = await SharedPreferences.getInstance();
    prefs.setString(email, name);

    print(prefs.getString(email));
  }

  getName(String email) async{

    var prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(email);

    print(userName);
    print(userName.runtimeType);

    return userName;
  }


  // late Map<dynamic,dynamic>userInformation;
  //
  // void setNameEmail(String email, String name){
  //   userInformation[email] = name;
  // }
  //
  // String getName(String email){
  //   var name = userInformation[email];
  //   print(name);
  //   print(userInformation.length);
  //   return userInformation[email];
  // }

}