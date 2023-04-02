import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/views/add_task/activities.dart';
import 'package:limpio/views/add_task/edit_activity.dart';
import 'package:limpio/views/edit_room/edit_room.dart';
import 'package:provider/provider.dart';
import 'package:limpio/providers/bottom_nav_bar_provider.dart';
import 'package:limpio/providers/user_provider.dart';
import 'package:limpio/utils/routes.dart';
import 'package:limpio/views/splash/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
    ],
    child: const MyApp(),
  ));
}

// change these to whatever design size in screenutils
int Appwidth = 360;
int Appheight = 690;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //define your own screen size please
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'This is title',
          routes: Routes.routes,
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.background),
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
      // child: Activities(),
    );
  }
}


//
// import 'package:flutter/material.dart';
// import 'package:limpio/services/database_helper.dart';
//
// int Appwidth = 360;
// int Appheight = 690;
//
// // Here we are using a global variable. You can use something like
// // get_it in a production app.
// final dbHelper = DatabaseHelper();
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // initialize the database
//   await dbHelper.init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SQFlite Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   // homepage layout
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('sqflite'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _insert,
//               child: const Text('insert'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _query,
//               child: const Text('query'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _update,
//               child: const Text('update'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _delete,
//               child: const Text('delete'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Button onPressed methods
//
//   void _insert() async {
//     // row to insert
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnName: 'Bob',
//       DatabaseHelper.columnAge: 23
//     };
//     final id = await dbHelper.insert(row);
//     debugPrint('inserted row id: $id');
//   }
//
//   void _query() async {
//     final allRows = await dbHelper.queryAllRows();
//     debugPrint('query all rows:');
//     for (final row in allRows) {
//       debugPrint(row.toString());
//     }
//   }
//
//   void _update() async {
//     // row to update
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnId: 1,
//       DatabaseHelper.columnName: 'Mary',
//       DatabaseHelper.columnAge: 32
//     };
//     final rowsAffected = await dbHelper.update(row);
//     debugPrint('updated $rowsAffected row(s)');
//   }
//
//   void _delete() async {
//     // Assuming that the number of rows is the id for the last row.
//     final id = await dbHelper.queryRowCount();
//     final rowsDeleted = await dbHelper.delete(id);
//     debugPrint('deleted $rowsDeleted row(s): row $id');
//   }
// }