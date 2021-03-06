import 'dart:io';

import 'package:qaydlar_daftari/service/ext_service.dart';

import '../models/menu_model.dart';
import '../service/io_service.dart';

class SelectDeleteMenu extends Menu {
  static const String id = "/select_delete_menu";
  List<FileSystemEntity>? list;

  SelectDeleteMenu({this.list});

  @override
  Future<void> build() async {
    writeln("select_file".tr);
    List<int> selectedList = [];
    String stopWrite = "";

    while(true) {
      stopWrite = read();
      if(stopWrite == 'save'.tr || selectedList.length >= list!.length) {
        break;
      }
      selectedList.add(int.parse(stopWrite, onError: (error) => 0));
    }

    for(var item in selectedList) {
      if(item - 1 >= 0) {
        await list![item - 1].delete();
      }
    }
    writeln("success_delete_all".tr);
  }

}