import 'package:qaydlar_daftari/service/navigation_service.dart';

import '../models/menu_model.dart';
import '../service/file_service.dart';

class EditNoteMenu extends Menu {
  static const String id = "/edit_note_menu";
  String? path;

  EditNoteMenu({this.path});

  @override
  Future<void> build() async {
    FileService fileService = FileService();
    await fileService.updateFileFromPath(path!);
    await Navigator.pop();
  }

}