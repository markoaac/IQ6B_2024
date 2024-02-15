class Dog {
  String foto;
  String estatus;

  Dog({required this.foto, required this.estatus});

  factory Dog.getJSON(Map json) {
    return Dog(estatus: json['status'],
     foto: json['message']);
  }
}
