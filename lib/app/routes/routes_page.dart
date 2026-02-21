import 'package:get/get.dart';
import 'package:lifenest/app/feature/auth/screens/LoginPage.dart';
import 'package:lifenest/app/routes/routes_name.dart';

class RoutesPage {


  static final List <GetPage>pages = [

    GetPage(name: RoutesName.login, page: ()=>Loginpage(), transition: Transition.leftToRight),
  ];
}