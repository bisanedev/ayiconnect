import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import './routes.gr.dart';

GetIt getIt = GetIt.instance;
void main() {  
  getIt.registerSingleton<AppRouter>(AppRouter());
  /*--- Always PotraitUP ---*/
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(const MyApp()));
  /*--- EOF Always PotraitUP ---*/
  //runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key); 
  @override    
  State<MyApp>createState() => _MyAppState();  
}

class _MyAppState  extends State<MyApp> {  
  
  @override
  void initState() {
    super.initState();   
  }

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();  
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AyiConnect',      
      routerDelegate: AutoRouterDelegate(router),        
      routeInformationParser: router.defaultRouteParser(includePrefixMatches: true),     
      theme: ThemeData(      
        primarySwatch: Colors.cyan,        
        visualDensity: VisualDensity.adaptivePlatformDensity,                  
      ),
    );
  }
  
  @override
  void dispose() {    
    super.dispose();
  }

}