

class AppLink{
  //static const String server = "http://10.0.2.2/batna_traveler";
   static const String server = "http://192.168.1.2/batna_traveler";

  static const String test = "$server/test.php";
  // Auth links==============================
  static const String signup = "$server/auth/signup.php";
  static const String signIn = "$server/auth/signin.php";
  //Events  =================================
  static const String eventCreate = "$server/event/creat.php";
  static const String eventRead = "$server/event/read.php";
  static const String eventDelete = "$server/event/delete.php";

  //hotel ====================================================
  static const String hotelCreate = "$server/hotel/creat.php";
  static const String hotelRead = "$server/hotel/read.php";
  static const String hotelDelete = "$server/hotel/delete.php";
  //restaurant ==============================================
  static const String restaurantCreate = "$server/restaurant/creat.php";
  static const String restaurantRead = "$server/restaurant/read.php";
  static const String restaurantDelete = "$server/restaurant/delete.php";
  //users ======================================================
  static const String usersRead = "$server/users/read.php";
  static const String usersDelete = "$server/users/delete.php";
  //category ======================================================
  static const String categoryRead = "$server/category/read.php";

}