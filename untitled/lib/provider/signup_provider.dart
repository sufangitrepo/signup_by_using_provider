
import 'package:flutter/cupertino.dart';

class SignupProvider extends ChangeNotifier{
  String value = 'male';

  void checkMail(Object object){
    value = object as String;
    notifyListeners();
  }
  void checkFemale(Object object){
    value = object as String;
    notifyListeners();
  }



  void setDefaultGender(){
    value = 'male';
    notifyListeners();
  }

  void submitClick(String name , String email , String phone , String password , String confirmPassword){
      print(value);
      print(name );
      print(phone);
      print(password);
      print(confirmPassword);

  }


}