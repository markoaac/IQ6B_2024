import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unidad_1/firebase/models/producto.dart';
import 'package:unidad_1/firebase/models/responseAuth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

Future<List<Producto>> getProductos() async {
  CollectionReference coleccion = db.collection("productos");
  QuerySnapshot queryProductos = await coleccion.get();
  return queryProductos.docs
      // .map((e) => Producto.getFirebase(e.data() as Map<String, dynamic>))
      // .toList();
      .map(
          (e) => Producto.getFirebaseId(e.id, e.data() as Map<String, dynamic>))
      .toList();
}

Future<int> agregarProducto(Producto p) async {
  CollectionReference coleccion = db.collection("productos");
  int codigo = 0;
  try {
    await coleccion.add(p.toJson()).then(
        (value) => coleccion.doc(value.id).collection("likes").doc().set({}));

    codigo = 200;
  } catch (e) {
    codigo = 500;
  }
  return codigo;
}

Future<int> actualizarProducto(Producto p) async {
  CollectionReference coleccion = db.collection("productos");
  int codigo = 0;
  try {
    await coleccion.doc(p.id).set(p.toJson());
    codigo = 200;
  } catch (e) {
    codigo = 500;
  }
  return codigo;
}

Future<int> eliminarProducto(String id) async {
  CollectionReference coleccion = db.collection("productos");
  int codigo = 0;
  try {
    await coleccion.doc(id).delete();
    codigo = 200;
  } catch (e) {
    codigo = 500;
  }
  return codigo;
}

Future<ResponseAuth> crearUsuario(String correo, String pwd) async {
  try {
    UserCredential credenciales =
        await auth.createUserWithEmailAndPassword(email: correo, password: pwd);
    return ResponseAuth(codigo: 200,
     mensaje: "Usuario $correo ha sido registrado") ;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      return ResponseAuth(codigo: 500,
     mensaje: "El correo ya ha sido utilizado") ;
    } else {
       return ResponseAuth(codigo: 404,
     mensaje: e.code) ;
    }
  }
}

Future<ResponseAuth> login(String correo, String pwd) async {
  try {
    UserCredential credenciales =
        await auth.signInWithEmailAndPassword(email: correo, password: pwd);
     return ResponseAuth(codigo: 200,
     mensaje: "Bienvenido") ;
  } on FirebaseAuthException catch (e) {
    // if (e.code == 'user-not-found' || e.code == "wrong-password") {
    //   return "Usuario y/o password incorrecto";
    // } else {
    //   return e.code;
    // }
     return ResponseAuth(codigo: 500,
     mensaje: e.code) ;
  }
}


