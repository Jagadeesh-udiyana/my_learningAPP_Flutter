# mylearningapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


JAVA jdk changed from 17 to 11
Installation:
1. Download zip and put in c (Ex: C:\Users\Lenova\flutter) and setup environmental variable paths for bin
2. Make sure to have supported git version,. android studio(need to download some sdk licences) version and java versions form official sites
3. flutter doctor --android-licenses
4. flutter doctor
5. Install flutter extension in vs for extra features
flutter file need to show green mark(Detected by system) then only it will run any command

flutter doctor -v => It will show info about android studio, windows version , chrome , vs to know everything is supporting or not.

1. Install & Setup
flutter doctor            # Check Flutter installation & dependencies
flutter upgrade           # Upgrade Flutter to the latest version
flutter create my_app     # Create a new Flutter project
cd my_app                 # Navigate into the project folder
flutter pub get           # Get project dependencies

2. Running & Building the App
flutter run               # Run the app on a connected device/emulator
flutter run -d chrome     # Run the app on Chrome (for web)
flutter run -d android    # Run on an Android device
flutter run -d ios        # Run on an iOS device (macOS only)

3. Project & Dependency Management
flutter pub get           # Fetch dependencies
flutter pub upgrade       # Upgrade dependencies
flutter pub add package   # Add a package (e.g., flutter pub add http)
flutter pub remove package # Remove a package

4. Debugging & Logs
flutter analyze           # Analyze project for issues
flutter doctor            # Check system setup
flutter logs              # View app logs in real-time
flutter test              # Run tests

5. Hot Reload & Restart
r                         # Hot reload (when the app is running)
R                         # Hot restart (full restart)

6. Build APK/IPA
flutter build apk         # Build APK for Android
flutter build appbundle   # Build Android App Bundle (for Play Store)
flutter build ios         # Build iOS app (requires macOS)
flutter build web         # Build for web

7. Clean & Reset
flutter clean             # Clear build cache

8. Device Management
flutter devices           # List all connected devices/emulators
flutter emulators         # List available emulators
flutter emulators --launch <name>  # Launch a specific emulator

Next Steps
Since you already know Angular, I recommend:

Learning Dart (Flutter's programming language)
Exploring Flutter Widgets (equivalent to Angular components)
Understanding Flutter's State Management (Provider, Riverpod, Bloc, etc.)
Experimenting with UI Design (Flutter is UI-centric)
Would you like any specific Flutter concepts explained in more detail? 

1. Understanding Dart (Equivalent to TypeScript)
Flutter uses Dart, which is similar to TypeScript but without strict types like interface.
void main() {
  print('Hello, Flutter!');
}

var is like let in TypeScript (var name = "John";)
final is like const (immutable)
List is like an array (List<int> numbers = [1, 2, 3];)
Functions are similar (void greet() => print("Hello!");)

2. Flutter Widgets vs Angular Components
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Welcome!')),
    );
  }
}

3. Navigation (Routing in Angular vs Flutter)
MaterialApp(
  routes: {
    '/home': (context) => HomePage(),
  },
  initialRoute: '/home',
);

Navigating:
Navigator.pushNamed(context, '/home');


4. State Management (Like Angular Services)
In Flutter, we use Provider or Bloc:
class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

Register:
ChangeNotifierProvider(create: (context) => Counter()),
Use:
context.watch<Counter>().count

5. Forms & Input Handling
TextEditingController _controller = TextEditingController();

TextField(controller: _controller)

6. API Calls (HttpClient in Angular vs. Http in Flutter)

import 'package:http/http.dart' as http;

final response = await http.get(Uri.parse('https://api.example.com/data'));

*********************
Available commands:

Flutter SDK
  bash-completion   Output command line shell completion setup scripts.
  channel           List or switch Flutter channels.
  config            Configure Flutter settings.
  doctor            Show information about the installed tooling.
  downgrade         Downgrade Flutter to the last active version for the current channel.
  precache          Populate the Flutter tool's cache of binary artifacts.
  upgrade           Upgrade your copy of Flutter.

Project
  analyze           Analyze the project's Dart code.
  assemble          Assemble and build Flutter resources.
  build             Build an executable app or install bundle.
  clean             Delete the build/ and .dart_tool/ directories.
  create            Create a new Flutter project.
  drive             Builds and installs the app, and runs a Dart program that connects to the app, often to run externally facing integration tests, such as    
                    with package:test and package:flutter_driver.
  gen-l10n          Generate localizations for the current project.
  pub               Commands for managing Flutter packages.
  run               Run your Flutter app on an attached device.
  test              Run Flutter unit tests for the current project.

Tools & Devices
  attach            Attach to a running app.
  custom-devices    List, reset, add and delete custom devices.
  devices           List all connected devices.
  emulators         List, launch and create emulators.
  install           Install a Flutter app on an attached device.
  logs              Show log output for running Flutter apps.
  screenshot        Take a screenshot from a connected device.
  symbolize         Symbolize a stack trace from an AOT-compiled Flutter app.

Run "flutter help <command>" for more information about a command.
Run "flutter help -v" for verbose help output, including less commonly used options.

****************
  mainAxisAlignment: MainAxisAlignment.center, => vertically center 
  *******************
  after changing icon need to run below command again then only it will identfy
  flutter pub run flutter_launcher_icons:main
  
  this inside of pubspec.yaml:
  flutter_icons:
  android: true
  ios: true
  image_path: "assets/adaptive_icon.png"  # Replace with your icon path
  adaptive_icon_background: "#ffffff"  # Optional for Android adaptive icons
  adaptive_icon_foreground: "assets/adaptive_icon.png"  # Optional
  
  dependencies:
    flutter_launcher_icons: ^0.14.3
**********
For splash screen:
flutter pub run flutter_native_splash:create 
flutter_native_splash:
  color: "#ffffff"  # Background color
  image: assets/splash.png  # Your splash screen image (Replace with actual image path)
  android: true
  ios: true
  
  
  dependencies:
  flutter:
  flutter_native_splash: ^2.4.5
  
  ******************* for local storage
  final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? loginDataString = prefs.getString('loginData');
      String? domainValidate = prefs.getString('domainValidateList');
	  
  *******************
  body: ContainedTabBarView(
  tabBarProperties: TabBarProperties(),
  views: [SingleChildScrollView(),SingleChildScrollView(),SingleChildScrollView()],
  tabs: [
          Tab(text: 'Leave'),
          Tab(text: 'Manual Punch'),
          Tab(text: 'Permission'),
        ],
  ),
  onChange: (index) => print(index),
  
  *******************
Array methods:
-------------  
🔍 Searching & Filtering
1. indexWhere – Finds the index of the first element that matches a condition.
int index = users.indexWhere((user) => user["guid"] == guid);
  
2. lastIndexWhere – Finds the index of the last element that matches a condition
int index = users.lastIndexWhere((user) => user["guid"] == guid);

3. firstWhere – Gets the first matching element
var user = users.firstWhere((user) => user["guid"] == guid, orElse: () => {});

4. lastWhere – Gets the last matching element.
var user = users.lastWhere((user) => user["guid"] == guid, orElse: () => {});

5. where – Filters elements that match a condition
var filteredUsers = users.where((user) => user["name"] == "John").toList();

🔄 Updating & Modifying
6. map – Transforms each element.
var updatedUsers = users.map((user) {
  if (user["guid"] == guid) user["name"] = "Updated Name";
  return user;
}).toList();

7. forEach – Iterates over each element
users.forEach((user) {
  if (user["guid"] == guid) user["name"] = "Updated Name";
});

🗑️ Removing Elements
8. removeWhere – Removes elements that match a condition.
users.removeWhere((user) => user["guid"] == guid);

9. retainWhere – Keeps only elements that match a condition.
users.retainWhere((user) => user["name"] != "John");

📌 Adding Elements
10.add – Adds an element at the end
users.add({"guid": "789", "name": "New User"});

11. insert – Inserts an element at a specific index.
users.insert(1, {"guid": "111", "name": "Inserted User"});

12. addAll – Adds multiple elements.
users.addAll([
  {"guid": "222", "name": "User A"},
  {"guid": "333", "name": "User B"}
]);

🛠️ Sorting & Reversing
13. sort – Sorts the list
users.sort((a, b) => a["name"].compareTo(b["name"]));

14. reversed – Returns a reversed list.
var reversedUsers = users.reversed.toList();

🔄 Checking Conditions
15. any – Checks if any element satisfies a condition.
bool exists = users.any((user) => user["guid"] == guid);

16. every – Checks if all elements satisfy a condition
bool allHaveGuid = users.every((user) => user.containsKey("guid"));

📏 Length & Checking Empty
17. length – Gets the number of elements
int count = users.length;

18. isEmpty / isNotEmpty – Checks if the list is empty or not.
bool isEmpty = users.isEmpty;
bool isNotEmpty = users.isNotEmpty;

************************
https://chatgpt.com/c/67d2aeee-64ac-8002-9e3d-eb0c34630552

Here’s a recap of the 32 essential Flutter/Dart keywords covered:
✅ var, final, const, late
✅ async, await, Future, setState
✅ ListView.builder, map(), if-else, switch-case
✅ forEach(), Navigator.push(), try-catch
✅ Stream, get-set, late final
✅ ?., ??, ??=, is, as
✅ enum, yield, required, mixin, abstract
✅ factory, extension, typedef, implements
✅ sync*, with

1. var (Variable Declaration)
Used to declare a variable without specifying its type.
void main() {
  var name = "Flutter";  // Dart infers that name is a String
  print(name);
}

2. final & const (Immutable Variables)
final → Variable can be assigned only once at runtime.
const → Compile-time constant (fixed at compile time).

void main() {
  final String appName = "Flutter App"; // Value assigned once
  const int version = 2; // Compile-time constant
  print(appName);
}
Use final for runtime constants (e.g., API URLs), and const for values that never change (e.g., math constants).

3. late (Lazy Initialization)
Used when a variable will be initialized later.
late String greeting;
void main() {
  greeting = "Hello, Flutter!";
  print(greeting);
}
When a variable is initialized after declaration but before usage.

4. async & await (Asynchronous Operations)
async marks a function as asynchronous.
await pauses execution until a future completes.
Future<void> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  print("Data fetched!");
}

void main() {
  fetchData();
  print("Fetching...");
}
When dealing with network requests, database queries, etc.

5. Future (Handles Asynchronous Code)
Represents a value that will be available in the future.
Future<int> getNumber() async {
  return 42;
}

void main() async {
  int result = await getNumber();
  print(result); // 42
}
For async tasks like HTTP requests.

 6. setState (Update UI in StatefulWidget)
Used inside StatefulWidget to update the UI.
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Counter: $counter"),
        ElevatedButton(onPressed: increment, child: Text("Increment"))
      ],
    );
  }
}
When updating UI dynamically.

7. ListView.builder (Efficient Lists)
Used to create lists dynamically.
List<String> items = ["Apple", "Banana", "Cherry"];

ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(items[index]));
  },
);
When displaying large lists dynamically.

 8. map() (Transforming Lists)
Used to iterate over and modify a list.
void main() {
  List<int> numbers = [1, 2, 3];
  List<int> doubled = numbers.map((n) => n * 2).toList();
  print(doubled); // [2, 4, 6]
}
 When converting data in lists.
 
 9. if & else (Conditional Statements)
Used to perform logic-based execution.
void main() {
  int age = 20;
  if (age >= 18) {
    print("You are an adult.");
  } else {
    print("You are a minor.");
  }
}

10. switch & case (Multiple Conditions)
Used for checking multiple conditions.
void main() {
  String fruit = "Apple";
  switch (fruit) {
    case "Apple":
      print("It is an Apple.");
      break;
    case "Banana":
      print("It is a Banana.");
      break;
    default:
      print("Unknown fruit.");
  }
}

11. forEach() (Looping Through Lists)
Used for iterating through a list.
void main() {
  List<String> names = ["Alice", "Bob", "Charlie"];
  names.forEach((name) => print(name));
}

12. Navigator.push() (Screen Navigation)
Used to navigate between screens.
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);

13. try-catch (Exception Handling)
Used to handle errors.
void main() {
  try {
    int result = 10 ~/ 0;
    print(result);
  } catch (e) {
    print("Error: $e");
  }
}

 14. Stream (Handling Continuous Data)
Used for real-time data processing.
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  countStream().listen((number) {
    print(number);
  });
}

🔹 15. get & set (Encapsulation in Classes)
Used to get and set private variables.
class User {
  String _name = "";

  String get name => _name;
  set name(String value) {
    _name = value;
  }
}

void main() {
  User user = User();
  user.name = "John";
  print(user.name);
}

******************