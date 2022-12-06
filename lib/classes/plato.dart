class Plato {
  String nombre;
  String precio;
  String descripcion;
  String ingredientes;
  String categoria;

  Plato({
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.ingredientes,
    required this.categoria,
  });

  factory Plato.fromJson(Map<String, dynamic> json) {
    return Plato(
        nombre: json['nombre'],
        precio: json['precio'],
        descripcion: json['descripcion'],
        ingredientes: json['ingredientes'],
        categoria: json['categoria']);
  }
  //Object to JSON
  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'precio': precio,
        'descripcion': descripcion,
        'ingredientes': ingredientes,
        'categoria': categoria,
      };
}
