import 'package:qaydlar_daftari/models/menu_model.dart';
import 'package:qaydlar_daftari/service/lang_service.dart';
import 'package:qaydlar_daftari/service/navigation_service.dart';

class MyApp{
  static Map<String, Menu> routeMenu = {};

  MyApp({required Menu home, required Language locale, required Map<String, Menu> routes}){
    routeMenu = routes;
    LangService.language = locale;
    Navigator.initialValue = home;
    _runApp(home);
  }

  void _runApp(Menu menu) async {
    while(true){
      await menu.build();
    }
  }
}