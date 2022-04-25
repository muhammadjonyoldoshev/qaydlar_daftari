import 'package:qaydlar_daftari/service/lang_service.dart';
import 'package:qaydlar_daftari/service/locals/enUS.dart';
import 'package:qaydlar_daftari/service/locals/ruRU.dart';
import 'package:qaydlar_daftari/service/locals/uzUZ.dart';

extension ExtString on String {
  String get tr {
    switch(LangService.language){
      case Language.en: return enUS[this] ?? this;
      case Language.ru: return ruRU[this] ?? this;
      case Language.uz: return uzUZ[this] ?? this;
    }
  }

  int get toInt{
    return int.tryParse(this) ?? 0;
  }

  double get toDouble{
    return double.tryParse(this) ?? 0;
 }

 bool get toBool {
    if(this == 'true'){
      return true;
    }else{
      return false;
    }
  }
}