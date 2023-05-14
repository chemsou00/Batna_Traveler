

class AppLink{
  static const String server = "http://10.0.2.2/batna_traveler";

  static const String test = "$server/test.php";

  // Auth links==============================
  
  static const String signup = "$server/auth/signup.php";
  static const String signIn = "$server/auth/signin.php";

  //forget pass =================================

  static const String resetPassword = "$server/auth/forgetpw/resetpassword.php";
  static const String checkEmail = "$server/auth/forgetpw/checkemail.php";




}