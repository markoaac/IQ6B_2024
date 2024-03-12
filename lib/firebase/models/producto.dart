class Producto {
  String? id;
  String nombre;
  double precio;
  int stock;
  String url;

  Producto(
      {this.id,
      required this.nombre,
      required this.precio,
      required this.stock,
      required this.url});

  factory Producto.getFirebase(Map json) {
    return Producto(
        id: json['id'],
        nombre: json['nombre'],
        precio: json['precio'],
        stock: json['stock'],
        url: json['url']);
  }

  factory Producto.getFirebaseId(String idd, Map json) {
    return Producto(
        id: idd,
        nombre: json['nombre'],
        precio: json['precio'],
        stock: json['stock'],
        url: json['url'] ?? "https://cdn-icons-png.flaticon.com/512/2748/2748558.png");
  }

  Map<String, dynamic> toJson() {
    return {'nombre': nombre, 'precio': precio, 'stock': stock, 'url': url};
  }
}
