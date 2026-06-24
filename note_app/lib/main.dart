import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'di/service_locator.dart';
import 'providers/note_provider.dart';
import 'ui/note_list_screen.dart';

void main() {
  setupLocator(); // Set up our dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
    Widget build(BuildContext context) {
      return ChangeNotifierProvider(
        create: (context) => NoteProvider()..fetchNotes(), // Create and fetch initial data
  
  //link to cascade notation
        child: MaterialApp(
          title: 'Sqflite Note Saver',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: Brightness.dark,
          ),
        ),
        themeMode: ThemeMode.system,
        home: const NoteListScreen(),
      ),
    );
  }
}