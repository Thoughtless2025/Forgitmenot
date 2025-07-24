import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // IMPORTANT: Added for MethodChannel
import 'dart:io'; // Added for Platform check
import 'package:flutter/foundation.dart' show kIsWeb; // IMPORTANT: Added for kIsWeb

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Keeping the browser tab title simple, as our main identifier will be in the app's AppBar.
    return MaterialApp(
      title: 'ForgitMeNot App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // --- ONLY CHANGE IS HERE: UPDATED TO INCLUDE ' V1' ---
      home: const MyHomePage(title: 'ForgitMeNot Home Page V1'),
      // --- END OF ONLY CHANGE ---
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // --- START: New additions for Platform Channel ---
  static const platform = MethodChannel('com.forgitmenot.git_operations');
  String _gitVersion = 'Unknown'; // New state variable

  void _incrementCounter() {
    print('[_incrementCounter] Counter incremented!'); // <--- NEW BASIC PRINT
    setState(() {
      _counter++;
    });
  }

  Future<void> _getGitVersion() async {
    print('[_getGitVersion] Method called.'); // <--- DEBUG PRINT (in browser console now!)
    try {
      // Check if it's NOT web before attempting platform-specific operations
      if (!kIsWeb) {
        if (Platform.isAndroid) { // Only attempt native call on Android
          print('[_getGitVersion] Running on Android platform (non-web).'); // <--- DEBUG PRINT
          final String result = await platform.invokeMethod('getGitVersion');
          setState(() {
            _gitVersion = 'Git Version: $result';
          });
        } else {
          print('[_getGitVersion] Not on Android or Web. Setting default text.'); // <--- DEBUG PRINT
          setState(() {
            _gitVersion = 'Git Version: Not on Android (Run on Emulator/Device)';
          });
        }
      } else {
        print('[_getGitVersion] Running on Web. Setting web-specific text.'); // <--- DEBUG PRINT
        setState(() {
          _gitVersion = 'Git Version: Web (Native call not applicable)';
        });
      }
    } on PlatformException catch (e) {
      print('[_getGitVersion] PlatformException caught: ${e.message}'); // <--- DEBUG PRINT
      setState(() {
        _gitVersion = "Failed to get Git Version: '${e.message}'.";
      });
    }
    print('[_getGitVersion] Method finished. _gitVersion is now: $_gitVersion'); // <--- DEBUG PRINT
  }
  // --- END: New additions for Platform Channel ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // --- START: New addition for Platform Channel ---
            Text( // Display the Git version
              _gitVersion,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // --- END: New addition for Platform Channel ---
          ],
        ),
      ),
      // --- START: Modified Floating Action Button ---
      floatingActionButton: Column( // Use Column to stack buttons vertically
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 10), // Add some spacing between buttons
          ElevatedButton(
            onPressed: _getGitVersion, // <-- STILL CALLING _getGitVersion
            child: const Icon(Icons.code), // Still uses the code icon
          ),
        ],
      ),
      // --- END: Modified Floating Action Button ---
    );
  }
}