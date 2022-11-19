// ignore_for_file: unnecessary_null_comparison

class TikaValidate {
  static String? emailValidate(String val){
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);
    if (val.isEmpty) {
        return 'Please enter email';
    }else if (!regExp.hasMatch(val)) {
        return 'Email Incorrect';
    }
    return null;
  }

 static String? passwordValidate(String val){
    const pattern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
    final regExp = RegExp(pattern);
    if (val.isEmpty) {
        return 'Please enter your password';
    }else if (!regExp.hasMatch(val)) {
        return 'Password must be minimum eight characters, at least one letter and one number';
    }
    return null;
  }

  static String? phoneValidate(String value){
    const pattern = r'^(?:[+0][1-9])?[0-9]{10,10}$';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
        return 'Please enter your phone number';
    }else if (!regExp.hasMatch(value)) {
        return 'Phone number is not correct';
    }
    return null;
  }

  static String? rePasswordValidate(String value, String password){
    if(value.isEmpty){
      return 'Please re-enter password';
    }else if(value != password){
      return "Password not match";
    }
    return null;
  }


 static String? textBoxValidate(String val){
    if (val.isEmpty) {
        return 'Please enter this field';
    }
    return null;
  }
}