import 'package:get_it/get_it.dart';
import 'package:note_app/repository/note_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => NoteRepository());
}