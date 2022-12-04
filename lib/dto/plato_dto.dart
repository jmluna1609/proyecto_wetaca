class PlatoDto {
  final String? nombre;
  final String? descripcion;
  final String? ingredientes;
  final String? categoria;
  final double? precio;

  // Constructor
  PlatoDto(
      {required this.nombre,
      required this.descripcion,
      required this.ingredientes,
      required this.categoria,
      required this.precio});

  factory PlatoDto.fromJson(Map<String, dynamic> json) {
    return PlatoDto(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      ingredientes: json['ingredientes'],
      categoria: json['categoria'],
      precio: json['precio'],
    );
  }
}
