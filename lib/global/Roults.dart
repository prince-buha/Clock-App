
import 'package:clock_app/screen/homepage/clock.dart';

import 'package:flutter/cupertino.dart';

class Routes{
  static String myHome = '/';


  static Map<String,WidgetBuilder> myRoutes = {
    myHome : (context)  =>  const DigitalWatch(),
  };

}