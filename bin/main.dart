import 'package:qaydlar_daftari/menu/all_notes_menu.dart';
import 'package:qaydlar_daftari/menu/create_note_menu.dart';
import 'package:qaydlar_daftari/menu/edit_note_menu.dart';
import 'package:qaydlar_daftari/menu/home_menu.dart';
import 'package:qaydlar_daftari/menu/select_delete_menu.dart';
import 'package:qaydlar_daftari/menu/view_one_note_menu.dart';
import 'package:qaydlar_daftari/service/lang_service.dart';
import 'package:qaydlar_daftari/service/note_service.dart';

void main() async {

  MyApp(
    home: HomeMenu(),
    locale: await LangService.currentLanguage(),
    routes: {
      // key: value
      // /home_menu: HomeMenu()
      HomeMenu.id: HomeMenu(),
      CreateNoteMenu.id: CreateNoteMenu(),
      AllNotesMenu.id: AllNotesMenu(),
      ViewOneNoteMenu.id: ViewOneNoteMenu(),
      EditNoteMenu.id: EditNoteMenu(),
      SelectDeleteMenu.id: SelectDeleteMenu(),
    },
  );
}
