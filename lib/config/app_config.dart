class AppConfig {
  //baseurl is set here
  static String baseurl = "http://192.168.1.27:8000/";

  //mediaUrl is set here
  static String mediaUrl = "http://192.168.1.27:8000";

  //noImage is set here
  static String noImage = "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg";

  //key to store data from api function in LoginController in json format used in AppUtils to get accesskey&userid
  static const String loginData = 'logInData';

  //key to check whether the user is already registered  or not and navigate to login page on every other startup since registering.
  static const String status = "status";

  static const String seen = "seen";
}