import 'dart:convert';
import 'dart:io';
import 'package:qaydlar_daftari/models/note_model.dart';
import 'package:qaydlar_daftari/service/io_service.dart';
import 'package:qaydlar_daftari/service/ext_service.dart';

class FileService{
  Directory directory = Directory(Directory.current.path + "\\assets\\file");

  Future<void> init() async {
    bool isDerictoryCreated = await directory.exists();
    if(!isDerictoryCreated){
      await directory.create();
    }
  }

  Future<String> createFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if(isFileCreated){
      throw Exception("file_error".tr);
    }
    await file.create();
    return file.path;
  }

  Future<String> writeFile(Note note, String path) async {
    File file = File(path);
    await file.writeAsString(jsonEncode(note.toJson()));
    await file.setLastModified(DateTime.parse(note.time));
    return file.path;
  }

  Future<Note> readFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if(!isFileCreated){
      throw Exception("file not found");
    }

    String result = await file.readAsString();
    Note note = Note.fromJson(jsonDecode(result));
    return note;
  }

  Future<Note> readFileFromPath(String path) async {
    File file = File(path);
    String result = await file.readAsString();
    Note note = Note.fromJson(jsonDecode(result));
    return note;
  }

  Future<String> updateFile(String title) async {
    String path = directory.path + "\\$title.note";
    Note note = await readFile(title);

    writeln("O'zgartirmoqchi bo'lingan note:");
    writeln(note);
    writeln("Yangilanishni kiriting: ");
    String content = "";
    String exit = "";
    while(exit != "save"){
      exit = read();
      if(exit == "save"){
        break;
      }
      content += (exit + "\n");
    }
    note.content = content;
    note.time = DateTime.now().toString();
    return await writeFile(note, path);
  }

  Future<String> updateFileFromPath(String title) async {
    String path = directory.path + "\\$title.note";
    Note note = await readFile(title);


    writeln("previous_note".tr);
    writeln(note);
    writeln("edit_note".tr);
    String content = "";
    String exit = "";
    while(exit != "save".tr) {
      exit = read();
      if(exit == "save".tr) {
        break;
      }
      content += (exit + "\n");
    }

    note.content = content;
    note.time = DateTime.now().toString();

    return await writeFile(note, path);
  }

  Future<void> deleteFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    file.delete();
  }

  Future<void> deleteFileFromPath(String path) async{
    File file = File(path);
    file.delete();
  }

  Future<void> deleteAllFile() async {
    List<FileSystemEntity> list = directory.listSync();
    for(var item in list){
      await item.delete();
    }
  }


}