import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:unidad_1/firebase/provider/globales.dart';
import 'package:unidad_1/firebase/screens/actualizar_page.dart';
import 'package:unidad_1/firebase/screens/agregar_page.dart';
import 'package:unidad_1/firebase/screens/login_page.dart';
import 'package:unidad_1/firebase/screens/productos_screen.dart';
import 'package:unidad_1/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Globales())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
        ),
        title: "Mi primer App",
        //home: const ProductosPage(),
        routes: {
          '/': (context) => const LoginPage(),
          '/inicio': (context) => const ProductosPage(),
          '/agregarProductos': (context) => const AgregarProductosPage(),
          '/actualizarProducto': (context) => const ActualizarProductoPage()
        },
        initialRoute: '/',
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}
